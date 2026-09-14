<#
.SYNOPSIS
    Levanta la imagen de base de datos del producto y ejecuta los tests unitarios contra ella.

.DESCRIPTION
    Esta es la UNICA parte del pipeline que no vive en el YAML, y por un motivo concreto:
    no es una lista de comandos, es una secuencia imperativa con limpieza obligatoria.
    Arranca el contenedor, espera a su healthcheck, escribe un appsettings.local.json
    apuntando a el, corre los tests, y en un 'finally' borra el fichero y tira el
    contenedor TAMBIEN cuando los tests fallan, cuando el contenedor no llega a arrancar
    y cuando se agota el tiempo de espera del healthcheck. En YAML eso se convierte en un
    bloque de shell embebido, duplicado en los dos ficheros de pipeline.

    El resto de etapas (restore, publish, db, pack, push) son comandos sueltos y viven
    inline en .github/workflows/flxCatalog.yml y en .gitlab-ci.yml, que es donde se
    leen mejor.

    Variables de entorno:
        SQL_PASSWORD  Contrasena de 'sa' del contenedor de BBDD. Si falta se usa
                      '-CHANGE_me1234', que funciona pero no deberia usarse.
        SQL_HOST      Host donde queda publicado el 1433 del contenedor de BBDD.
                      Por defecto 'localhost', que es lo correcto cuando el demonio de
                      docker es el de la propia maquina (local y GitHub Actions).
                      Bajo docker:dind (GitLab) hay que ponerlo al alias del servicio,
                      'docker': el puerto se publica alli, no en el contenedor del job.
        SQL_PORT      Puerto del host donde se publica el 1433 del contenedor. Por
                      defecto 1433. Utilizalo si el 1433 ya esta ocupado en tu maquina
                      (por ejemplo por un SQL Server local): pon SQL_PORT a un puerto
                      libre y el script publica y conecta contra ese en vez del 1433.

.EXAMPLE
    pwsh tools/run-tests-with-db.ps1 -Version 1.0.42.1

.EXAMPLE
    # En Windows sin PowerShell 7. El script es compatible con Windows PowerShell 5.1.
    powershell -NoProfile -ExecutionPolicy Bypass -File tools\run-tests-with-db.ps1 -Version 1.0.42.1
#>
[CmdletBinding()]
param(
    # No es [Parameter(Mandatory)] a proposito: en un shell no interactivo eso puede
    # quedarse esperando en el prompt. Se valida a mano y se falla con un mensaje util.
    [string]$Version,

    [string]$Configuration = 'Release'
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Version)) {
    throw "Falta -Version. Ejemplo: -Version 1.0.42.1 (es el tag de la imagen de BBDD que construye la etapa 'db')."
}

$productName = 'flxCatalog'
$slug        = 'flxcatalog'
$confDbName  = 'flxCatalog_IC'
$dataDbName  = 'flxCatalog_I'

$root = Split-Path -Parent $PSScriptRoot

function Invoke-Step {
    param([string]$Title, [scriptblock]$Body)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    # dotnet/docker escriben progreso por stderr. Con ErrorActionPreference='Stop'
    # PowerShell lo convierte en error terminante aunque el exit code sea 0, asi que
    # dentro del paso se baja a 'Continue' y se juzga por $LASTEXITCODE.
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try { & $Body } finally { $ErrorActionPreference = $previous }
    if ($LASTEXITCODE -ne 0) { throw "Fallo en: $Title (exit $LASTEXITCODE)" }
}

$password   = if ($env:SQL_PASSWORD) { $env:SQL_PASSWORD } else { '-CHANGE_me1234' }
# Ver la cabecera: 'localhost' vale en local y en GitHub; bajo dind hay que apuntar al
# alias del servicio docker.
$sqlHost    = if ($env:SQL_HOST) { $env:SQL_HOST } else { 'localhost' }
# Ver la cabecera: por defecto 1433, cambialo si ese puerto ya esta ocupado en el host.
$sqlPort    = if ($env:SQL_PORT) { $env:SQL_PORT } else { '1433' }
$contenedor = "$slug-ci-db"
$imagen     = "$slug-db:$Version"
$localJson  = Join-Path $root "$productName.Backend/conf/appsettings.local.json"

# Restos de una ejecucion anterior interrumpida.
$previous = $ErrorActionPreference
$ErrorActionPreference = 'Continue'
docker rm -f $contenedor 2>&1 | Out-Null
$ErrorActionPreference = $previous
$global:LASTEXITCODE = 0

try {
    # El 'docker run' va DENTRO del try: si falla despues de haber creado el contenedor
    # (el caso tipico es el 1433 ya ocupado) el contenedor queda creado y solo el
    # 'finally' lo tira. Sacarlo de aqui deja contenedores huerfanos.
    Invoke-Step "arrancar $contenedor" {
        docker run -d --name $contenedor `
            -e "ACCEPT_EULA=Y" `
            -e "MSSQL_SA_PASSWORD=$password" `
            -p "$sqlPort`:1433" `
            $imagen
    }

    # La imagen trae HEALTHCHECK con start-period 60s, interval 10s y 12 reintentos.
    Write-Host "Esperando a que $contenedor este healthy..." -NoNewline
    $limite = (Get-Date).AddMinutes(6)
    do {
        Start-Sleep -Seconds 5
        Write-Host "." -NoNewline
        $estado = (docker inspect --format '{{.State.Health.Status}}' $contenedor 2>$null)
        if ((Get-Date) -gt $limite) {
            docker logs $contenedor
            throw "La base de datos no llego a 'healthy' en 6 minutos (estado: $estado)."
        }
    } while ($estado -ne 'healthy')
    Write-Host " listo."

    # Overlay de configuracion solo para los tests. Nunca se publica: el .csproj del
    # Backend excluye conf/**/*.local.*
    $cadena = "Server=$sqlHost,$sqlPort;Integrated Security=false;User ID=sa;Password=$password;Encrypt=False;TrustServerCertificate=True"
    $config = @{
        ConnectionStrings = @{
            ConfConnectionString = "$cadena;Initial Catalog=$confDbName"
            DataConnectionString = "$cadena;Initial Catalog=$dataDbName"
        }
    }
    $config | ConvertTo-Json -Depth 5 | Set-Content -Path $localJson -Encoding UTF8
    Write-Host "Escrito $localJson"

    Invoke-Step "dotnet test $productName.UnitTest" {
        dotnet test (Join-Path $root "$productName.UnitTest/$productName.UnitTest.csproj") `
            -c $Configuration `
            --logger "trx;LogFileName=unittest.trx" `
            --results-directory (Join-Path $root 'publish/testresults')
    }
}
finally {
    # Se ejecuta en los tres caminos de fallo: tests en rojo, arranque fallido y timeout
    # del healthcheck.
    if (Test-Path $localJson) {
        Remove-Item $localJson -Force
        Write-Host "Borrado $localJson"
    }
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    docker rm -f $contenedor 2>&1 | Out-Null
    $ErrorActionPreference = $previous
    $global:LASTEXITCODE = 0
}
