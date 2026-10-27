<#
.SYNOPSIS
    Arranca, para o dice el estado de las aplicaciones del producto (Backend y Frontend).

.DESCRIPTION
    Esconde las trampas de arrancar el producto a mano, medidas en los bancos de prueba:

      1. Cada aplicacion arranca DESDE SU CARPETA (flxCatalog.Backend, flxCatalog.Frontend):
         leen conf\ relativo al directorio de trabajo, y desde la raiz no encuentran su configuracion.
      2. Con ASPNETCORE_ENVIRONMENT=Development, que es el entorno de una maquina de desarrollo.
      3. En la direccion http que declara su Properties\launchSettings.json, la misma que usa
         Visual Studio, para que el panel de Flexygo y el navegador las encuentren donde siempre.

    Arranca el .exe que deja la compilacion en bin\ (no compila: si no esta, lo dice). Guarda el
    PID y la salida en bin\, que no se versiona, y espera a que la direccion responda. El orden es
    Backend y luego Frontend al arrancar, y el contrario al parar.

    Lo llama el panel de Flexygo (el mod flexygo-panel) desde sus botones, y se puede llamar a mano.
    Compatible con Windows PowerShell 5.1.

.EXAMPLE
    powershell -NoProfile -ExecutionPolicy Bypass -File tools\app.ps1 start

.EXAMPLE
    pwsh tools/app.ps1 stop -App Frontend

.EXAMPLE
    pwsh tools/app.ps1 status
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('start', 'stop', 'status')]
    [string]$Action = 'status',

    [ValidateSet('Backend', 'Frontend', 'all')]
    [string]$App = 'all',

    [int]$TimeoutSeconds = 120
)

$ErrorActionPreference = 'Stop'

$productName = 'flxCatalog'
$root        = Split-Path -Parent $PSScriptRoot

# Only http(s) on this machine, scheme and authority alone: the address goes into a cmd.exe line
# below, and launchSettings.json comes with whatever project was cloned ('&' there runs a command).
function Get-LocalUrl([string]$raw) {
    $uri = $null
    if (-not [Uri]::TryCreate($raw.Trim(), [UriKind]::Absolute, [ref]$uri)) { return $null }
    if ($uri.Scheme -notin 'http', 'https' -or -not $uri.IsLoopback) { return $null }
    $uri.GetLeftPart([UriPartial]::Authority)
}

function Get-AppInfo([string]$name) {
    $dir = Join-Path $root "$productName.$name"
    $settings = Join-Path $dir 'Properties\launchSettings.json'
    $url = $null
    if (Test-Path -LiteralPath $settings) {
        $json = Get-Content -LiteralPath $settings -Raw | ConvertFrom-Json
        if ($json.profiles.http.applicationUrl) { $url = Get-LocalUrl (($json.profiles.http.applicationUrl -split ';')[0]) }
    }
    [pscustomobject]@{
        Name = $name
        Dir  = $dir
        Url  = $url
        Exe  = Join-Path $dir "bin\$productName.$name.exe"
        Pid  = Join-Path $dir 'bin\app-run.pid'
        Log  = Join-Path $dir 'bin\app-run.log'
    }
}

function Test-Answers([string]$url) {
    if (-not $url) { return $false }
    # Una conexion al puerto, y no una peticion web: Invoke-WebRequest de Windows PowerShell 5.1
    # no da por respondida la redireccion al login (302) con la que contesta el Backend.
    $uri = [Uri]$url
    $client = New-Object System.Net.Sockets.TcpClient
    try {
        return $client.ConnectAsync($uri.Host, $uri.Port).Wait(1000) -and $client.Connected
    } catch {
        return $false
    } finally {
        $client.Dispose()
    }
}

function Get-RunningProcess($target) {
    if (Test-Path -LiteralPath $target.Pid) {
        $id = [int](Get-Content -LiteralPath $target.Pid -Raw)
        $p = Get-Process -Id $id -ErrorAction SilentlyContinue
        if ($p) { return $p }
    }
    # Arrancada por otro camino (Visual Studio, a mano): se reconoce por su ejecutable.
    Get-Process -Name "$productName.$($target.Name)" -ErrorAction SilentlyContinue |
        Where-Object { $_.Path -eq $target.Exe } | Select-Object -First 1
}

function Write-Status($target) {
    $state = if (Test-Answers $target.Url) { 'up' } else { 'down' }
    Write-Output ("{0,-8} {1,-5} {2}" -f $target.Name, $state, $target.Url)
}

function Start-App($target) {
    if (-not $target.Url) { throw "$($target.Name): no http address on this machine in $($target.Dir)\Properties\launchSettings.json." }
    if (Test-Answers $target.Url) { Write-Output "$($target.Name) already answers at $($target.Url)."; return }
    if (-not (Test-Path -LiteralPath $target.Exe)) {
        throw "$($target.Name): $($target.Exe) does not exist. Build the solution first (dotnet build)."
    }

    # Por WMI y no con Start-Process: Start-Process con salida redirigida hace que la aplicacion
    # herede las tuberias de quien llamo a este script, y quien llamo (el panel, una consola)
    # espera hasta que la aplicacion se cierra. Medido el 22-oct-2026 en LASTMCP.
    $command = "cmd.exe /d /c set ASPNETCORE_ENVIRONMENT=Development&& set ASPNETCORE_URLS=$($target.Url)&& " +
               "`"$($target.Exe)`" > `"$($target.Log)`" 2>&1"
    $created = Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{
        CommandLine = $command; CurrentDirectory = $target.Dir
    }
    if ($created.ReturnValue -ne 0) { throw "$($target.Name) could not be started (Win32_Process.Create $($created.ReturnValue))." }
    # El proceso de la aplicacion tarda en aparecer bajo el cmd que lo lanza: se busca unos segundos.
    # Medido el 23-oct-2026 en la prueba completa: con una sola mirada a los 500 ms se guardaba el pid
    # del cmd, y "stop" dejaba la aplicacion viva en su puerto.
    $p = $null
    for ($i = 0; $i -lt 20 -and -not $p; $i++) {
        Start-Sleep -Milliseconds 500
        $p = Get-CimInstance Win32_Process -Filter "ParentProcessId = $($created.ProcessId)" |
            Where-Object { $_.Name -eq "$productName.$($target.Name).exe" } | Select-Object -First 1
    }
    $appId = if ($p) { $p.ProcessId } else { $created.ProcessId }
    Set-Content -LiteralPath $target.Pid -Value $appId

    $deadline = (Get-Date).AddSeconds($TimeoutSeconds)
    while ((Get-Date) -lt $deadline) {
        if (-not (Get-Process -Id $appId -ErrorAction SilentlyContinue)) {
            $tail = (Get-Content -LiteralPath $target.Log -Tail 15 -ErrorAction SilentlyContinue) -join "`n"
            # La trampa medida en los bancos: el Frontend busca en la cache de NuGet una version del
            # paquete flexygo.frontend que no se ha restaurado en esta maquina.
            $hint = if ($tail -match 'staticwebassets') { " Run 'dotnet restore' in $($target.Dir) and start it again." } else { '' }
            throw "$($target.Name) stopped while starting.$hint Last lines of $($target.Log):`n$tail"
        }
        if (Test-Answers $target.Url) { Write-Output "$($target.Name) up at $($target.Url) (pid $appId)."; return }
        Start-Sleep -Seconds 1
    }
    throw "$($target.Name) did not answer at $($target.Url) within $TimeoutSeconds s; its output is in $($target.Log)."
}

function Stop-App($target) {
    $p = Get-RunningProcess $target
    if (-not $p) { Write-Output "$($target.Name) is not running."; return }
    # El arbol entero (el cmd y la aplicacion), y despues cualquier proceso que siga siendo su ejecutable.
    & taskkill.exe /PID $p.Id /T /F | Out-Null
    Get-Process -Name "$productName.$($target.Name)" -ErrorAction SilentlyContinue |
        Where-Object { $_.Path -eq $target.Exe } | Stop-Process -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $target.Pid -ErrorAction SilentlyContinue
    Write-Output "$($target.Name) stopped (pid $($p.Id))."
}

$names = if ($App -eq 'all') { @('Backend', 'Frontend') } else { @($App) }
if ($Action -eq 'stop') { [array]::Reverse($names) }

foreach ($name in $names) {
    # No $app: PowerShell no distingue mayusculas en los nombres, y ese es el parametro -App.
    $target = Get-AppInfo $name
    switch ($Action) {
        'start'  { Start-App $target }
        'stop'   { Stop-App $target }
        'status' { Write-Status $target }
    }
}
