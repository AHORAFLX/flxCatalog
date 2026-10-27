using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest;

/// <summary>
/// The two helpers the generated walk runner (FlexygoWalks.cs) expects from the template's Utils,
/// which this project replaced with Infrastructure/. Login goes through FlexygoApp, like every other test.
/// </summary>
internal static class Utils
{
    private static IPlaywright? _playwright;

    public static async Task<IBrowserContext> GetBrowserAsync(string browser, bool headless)
    {
        _playwright ??= await Playwright.CreateAsync();
        var options = new BrowserTypeLaunchOptions { Headless = headless };
        var instance = browser switch
        {
            "firefox" => await _playwright.Firefox.LaunchAsync(options),
            "webkit" => await _playwright.Webkit.LaunchAsync(options),
            "chromium" => await _playwright.Chromium.LaunchAsync(options),
            "edge" or "msedge" => await _playwright.Chromium.LaunchAsync(new() { Headless = headless, Channel = "msedge" }),
            _ => await _playwright.Chromium.LaunchAsync(new() { Headless = headless, Channel = "chrome" }),
        };
        return await instance.NewContextAsync();
    }

    public static Task GoToLogin(IPage page, string url, string user, string password) =>
        new FlexygoApp(page, TestSettings.Current).LoginAsync(new Credentials(user, password));
}
