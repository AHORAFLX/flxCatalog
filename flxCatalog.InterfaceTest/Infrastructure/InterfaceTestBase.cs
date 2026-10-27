using System.Text.RegularExpressions;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Infrastructure;

/// <summary>
/// Fresh browser context per test, with tracing, a screenshot on failure and a record of every
/// JavaScript error, uncaught exception and failed server call. A test that passes its own
/// assertions still fails if the page logged errors along the way — unless the test declared
/// them expected with <see cref="ExpectError"/>.
/// </summary>
public abstract class InterfaceTestBase
{
    public TestContext TestContext { get; set; } = null!;

    protected TestSettings Settings => TestSettings.Current;
    protected IBrowserContext Context { get; private set; } = null!;
    protected IPage Page { get; private set; } = null!;
    protected FlexygoApp App { get; private set; } = null!;

    private readonly List<string> _errors = [];
    private readonly List<Regex> _expected = [];

    private static readonly string ArtifactsDir =
        Path.Combine(AppContext.BaseDirectory, "TestResults", DateTime.Now.ToString("yyyyMMdd-HHmmss"));

    [TestInitialize]
    public async Task BaseInitializeAsync()
    {
        Context = await BrowserFixture.Browser.NewContextAsync(new()
        {
            ViewportSize = new() { Width = 1600, Height = 1300 },
            Locale = "es-ES",
            AcceptDownloads = true,
        });
        Context.SetDefaultTimeout(Settings.TimeoutMs);
        await Context.Tracing.StartAsync(new() { Screenshots = true, Snapshots = true, Sources = true });

        Page = await Context.NewPageAsync();
        // Leaving an unsaved form asks "¿Desea realmente cerrar esta página?" with a native confirm;
        // Playwright dismisses those by default, which would cancel the navigation.
        Page.Dialog += async (_, dialog) => await dialog.AcceptAsync();
        Page.Console += (_, msg) =>
        {
            if (msg.Type == "error") Record($"console: {msg.Text} @ {msg.Location}");
        };
        Page.PageError += (_, err) => Record($"excepción JS: {err}");
        Page.Response += (_, r) =>
        {
            if (r.Status >= 500 && r.Url.Contains("/api/", StringComparison.OrdinalIgnoreCase))
                Record($"HTTP {r.Status} {r.Request.Method} {r.Url}");
        };

        App = new FlexygoApp(Page, Settings);
    }

    [TestCleanup]
    public async Task BaseCleanupAsync()
    {
        var failed = TestContext.CurrentTestOutcome != UnitTestOutcome.Passed;
        var unexpected = _errors.Where(e => !_expected.Any(x => x.IsMatch(e))).Distinct().ToList();
        var keepArtifacts = failed || unexpected.Count > 0;

        try
        {
            if (keepArtifacts)
            {
                Directory.CreateDirectory(ArtifactsDir);
                var name = TestContext.TestName ?? "test";
                var png = Path.Combine(ArtifactsDir, $"{name}.png");
                try { await Page.ScreenshotAsync(new() { Path = png, FullPage = true }); TestContext.AddResultFile(png); } catch { }
                var zip = Path.Combine(ArtifactsDir, $"{name}.trace.zip");
                await Context.Tracing.StopAsync(new() { Path = zip });
                TestContext.AddResultFile(zip);
                TestContext.WriteLine($"Traza: {zip}  (npx playwright show-trace \"{zip}\")");
            }
            else
            {
                await Context.Tracing.StopAsync();
            }
        }
        finally
        {
            await Context.CloseAsync();
        }

        if (!failed && unexpected.Count > 0)
            Assert.Fail("La página registró errores durante el test:\n - " + string.Join("\n - ", unexpected));
    }

    /// <summary>
    /// Runs <paramref name="action"/> in a second, independent session signed in as
    /// <paramref name="who"/> — for a check or a clean-up another role has to do.
    /// </summary>
    protected async Task AsAsync(Credentials who, Func<FlexygoApp, Task> action)
    {
        var ctx = await BrowserFixture.Browser.NewContextAsync(new() { ViewportSize = new() { Width = 1600, Height = 1300 }, Locale = "es-ES" });
        ctx.SetDefaultTimeout(Settings.TimeoutMs);
        try
        {
            var page = await ctx.NewPageAsync();
            page.Dialog += async (_, dialog) => await dialog.AcceptAsync();
            var app = new FlexygoApp(page, Settings);
            await app.LoginAsync(who);
            await action(app);
        }
        finally
        {
            await ctx.CloseAsync();
        }
    }

    protected Task AsAdminAsync(Func<FlexygoApp, Task> action) => AsAsync(Settings.Admin, action);
    protected Task AsClienteAsync(Func<FlexygoApp, Task> action) => AsAsync(Settings.Cliente, action);

    private static readonly string CapturesDir = Path.GetFullPath(
        Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", ".playwright-mcp"));

    /// <summary>
    /// Leaves a capture of the whole screen under .playwright-mcp/ for the verification record.
    /// The page scrolls inside #mainContent, so a "full page" shot is only the viewport: grow it first.
    /// </summary>
    protected async Task CaptureScreenAsync(string name)
    {
        await Page.WaitForTimeoutAsync(800); // the skin and the charts paint after the last ajax call
        var height = await Page.EvaluateAsync<int>("() => (document.querySelector('#mainContent')?.scrollHeight ?? 1200) + 60");
        await Page.SetViewportSizeAsync(1600, Math.Clamp(height, 900, 6000));
        Directory.CreateDirectory(CapturesDir);
        await Page.ScreenshotAsync(new() { Path = Path.Combine(CapturesDir, $"{name}.png") });
        await Page.SetViewportSizeAsync(1600, 1300);
    }

    /// <summary>Declares an error the test provokes on purpose (a refused action, a denied page).</summary>
    protected void ExpectError(string pattern) => _expected.Add(new Regex(pattern, RegexOptions.IgnoreCase));

    private void Record(string error)
    {
        lock (_errors) _errors.Add(error);
    }

    /// <summary>
    /// Unique, recognisable tag for data a test creates, so a leftover is easy to spot. Short on
    /// purpose: the lists cut long texts with "..." and a row must still be findable by it.
    /// </summary>
    protected static string UniqueTag() => $"ZZ{DateTime.Now:HHmmss}{Random.Shared.Next(10, 99)}";
}
