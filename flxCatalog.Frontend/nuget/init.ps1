param($installPath, $toolsPath, $package, $project)
if (-not $project) {
    Write-Host "Contexto de proyecto no disponible. Saliendo."
    return
}

# Obtener la ruta del proyecto
$projectPath = $project.Properties.Item("FullPath").Value
Write-Host "Ruta del proyecto detectada: $projectPath"

# Definir las rutas de origen y destino para copiar archivos
$sourcePath = Join-Path $installPath "contentFiles\any\any\wwwroot"
$wwwrootPath = Join-Path $projectPath "wwwroot"
Write-Host "Copiando archivos desde: $sourcePath"
Write-Host "Hacia: $wwwrootPath"

# Obtener todos los archivos desde el sourcePath y mantener la estructura de carpetas
Get-ChildItem -Path $sourcePath -Recurse | ForEach-Object {
    # Definir la ruta de destino, manteniendo la estructura de carpetas
    $targetFile = Join-Path $wwwrootPath $_.FullName.Substring($sourcePath.Length)

    # Crear las carpetas de destino si no existen
    $targetDir = Split-Path $targetFile -Parent
    if (!(Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force
    }

    # Copiar el archivo al destino
    Copy-Item -Path $_.FullName -Destination $targetFile -Force
}

Write-Host "Copia completada."

$appSettingsPath = Join-Path $projectPath "conf\appsettings.json"
$sourceAppSettingsPath = Join-Path $installPath "contentFiles\any\any\conf\appsettings.json"

Write-Host $appSettingsPath
Write-Host $sourceAppSettingsPath


if (Test-Path $sourceAppSettingsPath) {
    $newSettings = Get-Content -Path $sourceAppSettingsPath -Raw | ConvertFrom-Json
    $existingSettings = @{}

    if (Test-Path $appSettingsPath) {
        $existingSettings = Get-Content -Path $appSettingsPath -Raw | ConvertFrom-Json
        Write-Host "Cargando appsettings.json existente..."
    } else {
        Write-Host "No existe appsettings.json en el proyecto, se creará uno nuevo."
    }

    # Función para añadir claves nuevas recursivamente
    function Add-NewJsonKeysOnly($target, $source) {
        foreach ($key in $source.PSObject.Properties.Name) {
            if (-not ($target.PSObject.Properties.Name -contains $key)) {
                $target | Add-Member -MemberType NoteProperty -Name $key -Value $source.$key
            } elseif (
                $target.$key -is [System.Management.Automation.PSCustomObject] -and 
                $source.$key -is [System.Management.Automation.PSCustomObject]
            ) {
                Add-NewJsonKeysOnly -target $target.$key -source $source.$key
            }
        }
    }

    Add-NewJsonKeysOnly -target $existingSettings -source $newSettings

    # Guardar el JSON
    $existingSettings | ConvertTo-Json -Depth 100 | Set-Content -Path $appSettingsPath -Encoding UTF8
    Write-Host "'appsettings.json' actualizado solo con nuevas claves del NuGet."
} else {
    Write-Host "No se encontró 'appsettings.json' en el NuGet para fusionar."
}
