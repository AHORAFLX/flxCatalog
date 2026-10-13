using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Infrastructure;

/// <summary>One Playwright instance and one browser for the whole run; each test gets its own context.</summary>
[TestClass]
public static class BrowserFixture
{
    private static IPlaywright? _playwright;
    private static IBrowser? _browser;

    public static IBrowser Browser => _browser ?? throw new InvalidOperationException("El navegador no se ha iniciado.");

    [AssemblyInitialize]
    public static async Task StartAsync(TestContext _)
    {
        var settings = TestSettings.Current;

        // So `dotnet test` alone is enough: starts whichever of Backend/Frontend isn't already
        // answering at its configured URL, and leaves an already-running one untouched.
        await AppHost.EnsureRunningAsync();

        // chrome/msedge use the browser already installed on the machine; the rest need Playwright's own.
        if (settings.Browser is "chromium" or "firefox" or "webkit")
        {
            var exit = Microsoft.Playwright.Program.Main(["install", settings.Browser]);
            if (exit != 0) throw new InvalidOperationException($"playwright install {settings.Browser} terminó con código {exit}");
        }

        _playwright = await Playwright.CreateAsync();
        var options = new BrowserTypeLaunchOptions { Headless = settings.Headless, SlowMo = settings.SlowMo };
        _browser = settings.Browser switch
        {
            "firefox" => await _playwright.Firefox.LaunchAsync(options),
            "webkit" => await _playwright.Webkit.LaunchAsync(options),
            "edge" or "msedge" => await _playwright.Chromium.LaunchAsync(Channel(options, "msedge")),
            "chromium" => await _playwright.Chromium.LaunchAsync(options),
            _ => await _playwright.Chromium.LaunchAsync(Channel(options, "chrome")),
        };
    }

    private static BrowserTypeLaunchOptions Channel(BrowserTypeLaunchOptions o, string channel)
    {
        o.Channel = channel;
        return o;
    }

    [AssemblyCleanup]
    public static async Task StopAsync()
    {
        if (_browser is not null) await _browser.CloseAsync();
        _playwright?.Dispose();
        AppHost.StopStarted();
    }
}
