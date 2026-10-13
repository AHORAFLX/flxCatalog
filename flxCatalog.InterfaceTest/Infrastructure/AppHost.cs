using System.Diagnostics;
using System.Net.Http;

namespace flxCatalog.InterfaceTest.Infrastructure;

/// <summary>
/// Starts the Backend and Frontend for the run, so `dotnet test` alone is enough — nobody has to
/// start the application by hand first. An app that already answers at its configured URL is left
/// alone (matched by URL, never by process name: see .claude/CLAUDE.md on why "dotnet.exe" is not
/// a safe match); only what THIS run started gets stopped again in <see cref="StopStarted"/>.
/// Mirrors exactly how a person runs it by hand: ASPNETCORE_ENVIRONMENT=Development (the platform's
/// own static files, including jQuery, only mount in Development), the built DLL under bin/, and
/// the working directory on the project root — the "conf/appsettings.Development.json" the apps
/// read is resolved from there, not from the DLL's own folder.
/// </summary>
internal static class AppHost
{
    private const int StartupTimeoutSeconds = 90;
    private const int MaxLogLines = 200;

    private sealed class StartedApp(string label, Process process)
    {
        public string Label { get; } = label;
        public Process Process { get; } = process;
        public List<string> Log { get; } = [];
    }

    private static readonly List<StartedApp> _started = [];

    public static async Task EnsureRunningAsync()
    {
        var settings = TestSettings.Current;
        var root = FindRepoRoot();

        var backend = await StartIfNeededAsync("Backend", Path.Combine(root, "flxCatalog.Backend"), settings.BackendUrl);
        var frontend = await StartIfNeededAsync("Frontend", Path.Combine(root, "flxCatalog.Frontend"), settings.Url);

        await Task.WhenAll(
            WaitUntilUpAsync("Backend", settings.BackendUrl, backend),
            WaitUntilUpAsync("Frontend", settings.Url, frontend));
    }

    /// <summary>Stops only the processes this run started — never one that was already running.</summary>
    public static void StopStarted()
    {
        foreach (var app in _started)
        {
            try
            {
                if (!app.Process.HasExited) app.Process.Kill(entireProcessTree: true);
            }
            catch
            {
                // Best-effort: the test run is ending either way.
            }
        }
        _started.Clear();
    }

    private static async Task<StartedApp?> StartIfNeededAsync(string label, string projectDir, string url)
    {
        if (await IsUpAsync(url))
            return null; // already running — somebody else's, or a previous manual start; leave it be.

        var dll = FindOrBuildDll(label, projectDir);

        var psi = new ProcessStartInfo
        {
            FileName = "dotnet",
            Arguments = $"\"{dll}\"",
            WorkingDirectory = projectDir,
            UseShellExecute = false,
            CreateNoWindow = true,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
        };
        psi.Environment["ASPNETCORE_ENVIRONMENT"] = "Development";

        var process = Process.Start(psi)
            ?? throw new InvalidOperationException($"No se pudo arrancar {label} ({dll}).");
        var started = new StartedApp(label, process);

        // Drain stdout/stderr as they arrive: an unread pipe fills up and hangs the child process.
        // Kept capped and in memory only to help diagnose a startup timeout, never printed otherwise.
        void Capture(object _, DataReceivedEventArgs e)
        {
            if (e.Data is null) return;
            lock (started.Log)
            {
                started.Log.Add(e.Data);
                if (started.Log.Count > MaxLogLines) started.Log.RemoveAt(0);
            }
        }
        process.OutputDataReceived += Capture;
        process.ErrorDataReceived += Capture;
        process.BeginOutputReadLine();
        process.BeginErrorReadLine();

        _started.Add(started);
        return started;
    }

    private static string FindOrBuildDll(string label, string projectDir)
    {
        var projectName = Path.GetFileName(projectDir);
        var dll = FindDll(projectDir, projectName);
        if (dll is not null) return dll;

        var csproj = Path.Combine(projectDir, $"{projectName}.csproj");
        using var build = Process.Start(new ProcessStartInfo
        {
            FileName = "dotnet",
            Arguments = $"build \"{csproj}\" -c Debug",
            WorkingDirectory = projectDir,
            UseShellExecute = false,
        }) ?? throw new InvalidOperationException($"No se pudo lanzar 'dotnet build' para {label}.");
        build.WaitForExit();
        if (build.ExitCode != 0)
            throw new InvalidOperationException(
                $"{label} no está compilado y 'dotnet build {csproj}' terminó con código {build.ExitCode}. " +
                "Compílalo a mano y vuelve a lanzar los tests.");

        return FindDll(projectDir, projectName)
            ?? throw new InvalidOperationException(
                $"{label} se compiló pero no se encuentra {projectName}.dll bajo {Path.Combine(projectDir, "bin")}.");
    }

    private static string? FindDll(string projectDir, string projectName)
    {
        var binDir = Path.Combine(projectDir, "bin");
        if (!Directory.Exists(binDir)) return null;
        return Directory.EnumerateFiles(binDir, $"{projectName}.dll", SearchOption.AllDirectories)
            .OrderByDescending(File.GetLastWriteTimeUtc)
            .FirstOrDefault();
    }

    private static async Task WaitUntilUpAsync(string label, string url, StartedApp? started)
    {
        var deadline = DateTime.UtcNow.AddSeconds(StartupTimeoutSeconds);
        while (DateTime.UtcNow < deadline)
        {
            if (await IsUpAsync(url)) return;
            if (started is not null && started.Process.HasExited)
                throw new InvalidOperationException(
                    $"{label} terminó solo (código {started.Process.ExitCode}) antes de responder en {url}.\n" +
                    string.Join('\n', SnapshotLog(started)));
            await Task.Delay(500);
        }

        throw new InvalidOperationException(
            $"{label} no respondió en {url} tras {StartupTimeoutSeconds} s." +
            (started is null ? "" : "\n" + string.Join('\n', SnapshotLog(started))));
    }

    private static List<string> SnapshotLog(StartedApp app)
    {
        lock (app.Log) return [.. app.Log];
    }

    private static async Task<bool> IsUpAsync(string url)
    {
        try
        {
            using var http = new HttpClient { Timeout = TimeSpan.FromSeconds(3) };
            using var response = await http.GetAsync(url);
            return true; // any HTTP response (even 404/500) means the port is up and serving.
        }
        catch
        {
            return false;
        }
    }

    private static string FindRepoRoot()
    {
        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            if (Directory.Exists(Path.Combine(dir.FullName, "flxCatalog.Backend")) &&
                Directory.Exists(Path.Combine(dir.FullName, "flxCatalog.Frontend")))
                return dir.FullName;
            dir = dir.Parent;
        }
        throw new InvalidOperationException(
            "No se encuentra la raíz del repositorio (con flxCatalog.Backend y flxCatalog.Frontend) " +
            $"subiendo desde {AppContext.BaseDirectory}.");
    }
}
