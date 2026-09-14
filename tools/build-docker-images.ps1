<#
.SYNOPSIS
    Genera en local las imagenes Docker del producto (frontend, backend y base de datos).

.DESCRIPTION
    Publica cada proyecto y monta el arbol de staging que sirve de contexto a cada build:

        publish/flxCatalog/flxCatalog.Backend    -> flxcatalog-backend
        publish/flxCatalog/flxCatalog.Frontend   -> flxcatalog-frontend
        publish/flxCatalog/db                        -> flxcatalog-db

    UNA sola imagen de base de datos, con los dos catalogos (configuracion <Producto>_IC y
    datos <Producto>_I) en la misma instancia: el producto usa referencias entre catalogos
    con nombres de tres partes, que SQL Server solo resuelve dentro de una misma instancia.

    Los dos proyectos SQL son obligatorios. Un producto que no quiera base de datos de datos
    tiene que quitar el proyecto y ajustar este script, el Dockerfile y el entrypoint.

    Backend y frontend llevan su Dockerfile dentro del publish gracias a los
    <Content Include="Dockerfile" CopyToPublishDirectory="PreserveNewest" /> del csproj.
    La de base de datos no: su Dockerfile/entrypoint se copian aqui desde el repositorio.

.EXAMPLE
    pwsh tools/build-docker-images.ps1

.EXAMPLE
    pwsh tools/build-docker-images.ps1 -Only db -NoBuild
#>
[CmdletBinding()]
param(
    [string]$Tag = 'latest',
    # Prefijo de las imagenes y de los hostnames de la red docker
    [string]$Slug = 'flxcatalog',
    [string]$Configuration = 'Release',
    [ValidateSet('all', 'backend', 'frontend', 'db')]
    [string[]]$Only = @('all'),
    [string]$ConfDbName = 'flxCatalog_IC',
    [string]$DataDbName = 'flxCatalog_I',
    [switch]$NoBuild
)

$ErrorActionPreference = 'Stop'

$productName = 'flxCatalog'
$root = Split-Path -Parent $PSScriptRoot

# Separadores '/' en todo el script, igual que en tools/dev-pipeline.ps1. Funcionan en
# Windows y en Linux, y asi los dos scripts componen exactamente la misma ruta de
# publish/ cuando la etapa 'db' del CI llama a este.
$publishRoot = Join-Path $root "publish/$productName"
$dataProjectDir = Join-Path $root "$productName.Data.Database"

function Invoke-Step {
    param([string]$Title, [scriptblock]$Body)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    # docker/dotnet escriben progreso por stderr. Con ErrorActionPreference='Stop'
    # PowerShell 5.1 lo convierte en error terminante aunque el exit code sea 0,
    # asi que dentro del paso se baja a 'Continue' y se juzga por $LASTEXITCODE.
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try { & $Body } finally { $ErrorActionPreference = $previous }
    if ($LASTEXITCODE -ne 0) { throw "Fallo en: $Title (exit $LASTEXITCODE)" }
}

function Test-Wanted([string]$name) {
    return ($Only -contains 'all') -or ($Only -contains $name)
}

function Set-JsonProperty {
    param($Object, [string]$Name, $Value)
    if ($Object.PSObject.Properties.Name -contains $Name) {
        $Object.$Name = $Value
    }
    else {
        $Object | Add-Member -NotePropertyName $Name -NotePropertyValue $Value
    }
}

# Reescribe el conf/appsettings.json del publish con el que va DENTRO de la imagen:
#   - Sin seccion Kestrel, para que el binde lo fije ASPNETCORE_URLS (8080 en la imagen).
#   - Con Password=change_me, que entrypoint_backend.sh sustituye al arrancar.
# El appsettings.json del repositorio no se toca: conserva su Kestrel de desarrollo.
function Write-ImageAppSettings {
    param(
        [ValidateSet('backend', 'frontend')][string]$Kind,
        [string]$OutDir
    )

    $confDir = Join-Path $OutDir 'conf'
    $confFile = Join-Path $confDir 'appsettings.json'
    if (-not (Test-Path $confFile)) {
        throw "No se encontro $confFile. Publica el proyecto antes (quita -NoBuild)."
    }

    $settings = Get-Content $confFile -Raw | ConvertFrom-Json
    $settings.PSObject.Properties.Remove('Kestrel')

    if ($Kind -eq 'backend') {
        if (-not ($settings.PSObject.Properties.Name -contains 'ConnectionStrings')) {
            Set-JsonProperty $settings 'ConnectionStrings' ([pscustomobject]@{})
        }
        Set-JsonProperty $settings.ConnectionStrings 'ConfConnectionString' "Server=$Slug-db;Integrated Security=false;Initial Catalog=$ConfDbName;User ID=sa;Password=change_me;Encrypt=False;TrustServerCertificate=True"
        Set-JsonProperty $settings.ConnectionStrings 'DataConnectionString' "Server=$Slug-db;Integrated Security=false;Initial Catalog=$DataDbName;User ID=sa;Password=change_me;Encrypt=False;TrustServerCertificate=True"
        Set-JsonProperty $settings 'FrontendEndpoint' "http://$Slug-frontend:8080"
    }
    else {
        Set-JsonProperty $settings 'BackendEndpoint' "http://$Slug-backend:8080/api/backend/"
    }

    # UTF-8 sin BOM: Set-Content -Encoding utf8 en PS 5.1 mete BOM.
    [System.IO.File]::WriteAllText(
        $confFile,
        ($settings | ConvertTo-Json -Depth 100),
        (New-Object System.Text.UTF8Encoding($false)))

    # El .dockerignore ya los excluye del build, pero se borran del publish para que
    # la carpeta refleje exactamente lo que acaba dentro de la imagen.
    Get-ChildItem $confDir -Filter 'appsettings.*.json' -ErrorAction SilentlyContinue | Remove-Item -Force

    Write-Host "conf/appsettings.json de imagen generado para $Kind (sin Kestrel)"
}

# Copia al contexto de build todos los dacpacs del bin/<Configuration> de un proyecto SQL:
# el propio, los heredados y master.dacpac. Van juntos porque sqlpackage los resuelve desde
# la misma carpeta con IncludeCompositeObjects=True.
function Copy-Dacpacs {
    param([string]$ProjectDir, [string]$Destination)

    $binDir = Join-Path $ProjectDir "bin/$Configuration"
    $dacpacs = @(Get-ChildItem -Path $binDir -Filter '*.dacpac' -ErrorAction SilentlyContinue)
    if ($dacpacs.Count -eq 0) {
        throw "No se encontro ningun dacpac en $binDir. Compila el proyecto SQL antes (quita -NoBuild)."
    }
    $dacpacs | Copy-Item -Destination $Destination -Force
}

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw "No se encontro 'docker' en el PATH."
}

# ---------------------------------------------------------------- Backend ---
if (Test-Wanted 'backend') {
    $out = Join-Path $publishRoot "$productName.Backend"
    if (-not $NoBuild) {
        Invoke-Step "dotnet publish $productName.Backend" {
            dotnet publish (Join-Path $root "$productName.Backend/$productName.Backend.csproj") -c $Configuration -o $out
        }
    }
    Write-ImageAppSettings -Kind backend -OutDir $out
    Invoke-Step "docker build $Slug-backend:$Tag" {
        docker build -t "$Slug-backend:$Tag" $out
    }
}

# --------------------------------------------------------------- Frontend ---
if (Test-Wanted 'frontend') {
    $out = Join-Path $publishRoot "$productName.Frontend"
    if (-not $NoBuild) {
        Invoke-Step "dotnet publish $productName.Frontend" {
            dotnet publish (Join-Path $root "$productName.Frontend/$productName.Frontend.csproj") -c $Configuration -o $out
        }
    }
    Write-ImageAppSettings -Kind frontend -OutDir $out
    Invoke-Step "docker build $Slug-frontend:$Tag" {
        docker build -t "$Slug-frontend:$Tag" $out
    }
}

# ----------------- base de datos (_IC + _I, en la misma instancia) ---
if (Test-Wanted 'db') {
    $confProjectDir = Join-Path $root "$productName.Conf.Database"
    $ctx = Join-Path $publishRoot 'db'

    if (-not $NoBuild) {
        Invoke-Step "dotnet build $productName.Conf.Database" {
            dotnet build (Join-Path $confProjectDir "$productName.Conf.Database.sqlproj") -c $Configuration -p:NetCoreBuild=true
        }
        Invoke-Step "dotnet build $productName.Data.Database" {
            dotnet build (Join-Path $dataProjectDir "$productName.Data.Database.sqlproj") -c $Configuration -p:NetCoreBuild=true
        }
    }

    Write-Host ""
    Write-Host "=== staging contexto db ===" -ForegroundColor Cyan
    if (Test-Path $ctx) { Remove-Item $ctx -Recurse -Force }
    New-Item -ItemType Directory -Path $ctx -Force | Out-Null

    Copy-Dacpacs -ProjectDir $confProjectDir -Destination $ctx
    Copy-Dacpacs -ProjectDir $dataProjectDir -Destination $ctx

    Copy-Item (Join-Path $confProjectDir 'Dockerfile') -Destination $ctx -Force
    Copy-Item (Join-Path $confProjectDir 'entrypoint_db.sh') -Destination $ctx -Force

    Invoke-Step "docker build $Slug-db:$Tag" {
        docker build -t "$Slug-db:$Tag" --build-arg "DBNAME=$ConfDbName" --build-arg "DATA_DBNAME=$DataDbName" --build-arg "CONF_DACPAC=$productName.Conf.Database.dacpac" --build-arg "DATA_DACPAC=$productName.Data.Database.dacpac" $ctx
    }
}

Write-Host ""
Write-Host "Imagenes generadas con tag '$Tag'. Arranca con: docker compose up -d" -ForegroundColor Green
