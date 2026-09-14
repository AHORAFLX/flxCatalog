<#
.SYNOPSIS
    Atajo local: encadena restore, publish, db, test y pack en una sola llamada.

.DESCRIPTION
    ES COMODIDAD, NO LA FUENTE DE VERDAD. Quien manda es el YAML del pipeline
    (.github/workflows/flxCatalog.yml y .gitlab-ci.yml). Si este script y el YAML
    dicen cosas distintas, el equivocado es este script.

    La regla que mantiene esto sano: aqui NO vive logica. Esto solo encadena comandos de
    una linea, los mismos que estan inline en los dos YAML. En cuanto algo necesita mas
    que eso, se saca a un script propio que llamen tambien los YAML, como
    tools/run-tests-with-db.ps1.

    Dos diferencias deliberadas con el CI:

      1. NO toca la configuracion de NuGet. El CI anade el origen de DevExpress al
         nuget.config del checkout, que es efimero y se tira al acabar el job; en tu
         maquina ese fichero esta versionado. Aqui se usa tu NuGet.Config de usuario tal
         cual, que es el que ya necesitas para compilar flexygo.
      2. No hay 'push'. No se publica desde una maquina de desarrollo.

    Igual que en el CI, los tests BLOQUEAN: si fallan, no se llega al paso de pack.

.EXAMPLE
    pwsh tools/dev-pipeline.ps1

.EXAMPLE
    # En Windows sin PowerShell 7. El script es compatible con Windows PowerShell 5.1.
    powershell -NoProfile -ExecutionPolicy Bypass -File tools\dev-pipeline.ps1 -Version 1.0.42.1
#>
[CmdletBinding()]
param(
    [string]$Version = '1.0.0.1'
)

$ErrorActionPreference = 'Stop'

$productName = 'flxCatalog'
$root        = Split-Path -Parent $PSScriptRoot
$publishRoot = Join-Path $root "publish/$productName"
$nugetOut    = Join-Path $root 'publish/nuget'

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

# --- restore ----------------------------------------------------------------
Invoke-Step "dotnet restore" {
    dotnet restore (Join-Path $root "$productName.sln")
}

# --- publish ----------------------------------------------------------------
foreach ($proyecto in @('Frontend', 'Backend')) {
    Invoke-Step "dotnet publish $productName.$proyecto" {
        dotnet publish (Join-Path $root "$productName.$proyecto/$productName.$proyecto.csproj") `
            -c Release `
            -o (Join-Path $publishRoot "$productName.$proyecto") `
            "/p:Version=$Version" "/p:FileVersion=$Version" "/p:InformationalVersion=$Version"
    }
}

# --- db ---------------------------------------------------------------------
# 'Release' literal, NO configurable: los nuspecs de BBDD leen bin\Release\*.dacpac a
# fuego, asi que compilar en Debug produciria un paquete vacio.
foreach ($sql in @('Conf', 'Data')) {
    Invoke-Step "dotnet build $productName.$sql.Database" {
        dotnet build (Join-Path $root "$productName.$sql.Database/$productName.$sql.Database.sqlproj") `
            -c Release -p:NetCoreBuild=true "/p:DacVersion=$Version"
    }
}
Invoke-Step "imagen de base de datos" {
    # -NoBuild: los .sqlproj se acaban de compilar arriba con la DacVersion correcta.
    # -Configuration Release explicito: build-docker-images.ps1 busca los dacpacs en
    # bin/<Configuration> y depender de su valor por defecto es fragil.
    & (Join-Path $PSScriptRoot 'build-docker-images.ps1') -Only db -NoBuild -Tag $Version -Configuration Release
}

# --- test -------------------------------------------------------------------
& (Join-Path $PSScriptRoot 'run-tests-with-db.ps1') -Version $Version

# --- pack -------------------------------------------------------------------
if (Test-Path $nugetOut) { Remove-Item $nugetOut -Recurse -Force }

# Mismo orden y mismos nuspecs que los dos YAML. El de Library vive en la carpeta del
# Backend, no en una suya.
$nuspecs = @(
    "$productName.Frontend/$productName.Frontend.nuspec"
    "$productName.Backend/$productName.Library.nuspec"
    "$productName.Backend/$productName.Backend.nuspec"
    "$productName.Conf.Database/$productName.Conf.Database.nuspec"
    "$productName.Data.Database/$productName.Data.Database.nuspec"
)

foreach ($rel in $nuspecs) {
    $nuspec = Join-Path $root $rel
    if (-not (Test-Path $nuspec)) {
        throw "No existe el nuspec '$nuspec'. Recuerda que init.ps1 renombra los .nuspec.RENAME_ME al crear el producto."
    }
    Invoke-Step "dotnet pack $(Split-Path -Leaf $nuspec)" {
        dotnet pack (Join-Path $PSScriptRoot 'pack.csproj') `
            "-p:NuspecFile=$nuspec" `
            "-p:NuspecBasePath=$(Split-Path -Parent $nuspec)" `
            "-p:NuspecProperties=version=$Version" `
            -o $nugetOut
    }
}

Write-Host ""
Write-Host "NuGets generados en $nugetOut" -ForegroundColor Green
Get-ChildItem $nugetOut -Filter *.nupkg | ForEach-Object { Write-Host "  $($_.Name)" }
