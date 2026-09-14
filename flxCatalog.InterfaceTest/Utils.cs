using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest
{
    public class Utils
    {
        async public static Task<IBrowserContext> GetBrowserAsync(string name = "chrome")
        {
            var playwright = await Playwright.CreateAsync();

            IBrowser browser;
            var options = new BrowserTypeLaunchOptions { Headless = false };


            switch (name)
            {
                case "firefox":
                    browser = await playwright.Firefox.LaunchAsync(options);
                    break;
                case "webkit":
                    browser = await playwright.Webkit.LaunchAsync(options);
                    break;
                case "edge":
                    options.Channel = "msedge";
                    browser = await playwright.Chromium.LaunchAsync(options);
                    break;
                default:
                    options.Channel = "chrome";
                    browser = await playwright.Chromium.LaunchAsync(options);
                    break;
            }

            var context = await browser.NewContextAsync();

            return context;
        }
        async public static Task StartTracing(IBrowserContext context)
        {
            await context.Tracing.StartAsync(new()
            {
                Screenshots = true,
                Snapshots = true,
                Sources = true
            });
        }

        async public static Task GoToLogin(IPage page, string URL, string username, string password)
        {
            await page.GotoAsync(GenerateUrl(URL, "Account", "Login"));
            // Fill #UserName
            await page.Locator("#username").FillAsync(username);
            // Fill #Password
            await page.Locator("#password").FillAsync(password);
            // Click #MainButton
            await page.Locator("#MainButton").ClickAsync();
            Thread.Sleep(2000);
            await page.WaitForURLAsync(GenerateUrl(URL, "Index"));
            await page.WaitForSelectorAsync("header #mainLogo");
            await page.EvaluateAsync("() => flexygo.utils.animationTime=0;");
            await page.EvaluateAsync("() => flexygo.utils.testMode=true;");
        }


        async public static Task SetDeveloperMode(IPage page, OriginId originId = OriginId.None)
        {
            await page.EvaluateAsync("() => flexygo.utils.animationTime=0;");
            await page.EvaluateAsync("() => flexygo.utils.testMode=true;");
            PageWaitForSelectorOptions options = new PageWaitForSelectorOptions { Timeout = 2000 };
            //Accept legal notice
            try
            {

                await page.WaitForSelectorAsync("body > div.lobibox.lobibox-confirm.animated-super-fast.zoomIn > div.lobibox-footer.text-center > button", options);
                await page.Locator("body > div.lobibox.lobibox-confirm.animated-super-fast.zoomIn > div.lobibox-footer.text-center > button").First.ClickAsync();
                Thread.Sleep(2000);
            }
            catch (TimeoutException e)
            {

            }
            await page.WaitForSelectorAsync("#mainMenu");
            // Click on tools
            await page.Locator("#mainMenu li[title='Tools'], #mainMenu li[title='Herramientas']").ClickAsync();
            // Set Developer mode
            try
            {
                await page.Locator("#mainMenu li[title='Develop Mode'], #mainMenu li[title='Modo Desarrollo']").ClickAsync();
            }
            catch
            {
                await page.Locator("#mainMenu li[title='Tools'], #mainMenu li[title='Herramientas']").ClickAsync();
                await page.Locator("#mainMenu li[title='Develop Mode'], #mainMenu li[title='Modo Desarrollo']").ClickAsync();
            }

            if (originId is not OriginId.None)
            {
                await page.WaitForSelectorAsync("#mainMenu flx-user p.develop-only", options);
                await page.Locator("#mainMenu flx-user p.develop-only").ClickAsync();

                await page.WaitForSelectorAsync($"body > #debugBackground #developOriginSelector div[origin=\"{(int)originId}\"]");
                await page.Locator($"body > #debugBackground #developOriginSelector div[origin=\"{(int)originId}\"]").ClickAsync();

                Utils.notify? notify = await GetNotifyContentAsync(page);

                if (notify == null)
                    throw new Exception("Error changing origin");
                else if (notify.title != null && notify.title.ToString().ToLower() != "success")
                    throw new Exception("Error changing origin", new Exception(notify.title, new Exception(notify.message)));

            }
        }

        async public static Task ReloadCache(IPage page)
        {
            await page.WaitForSelectorAsync("#mainMenu");
            // Click on tools
            await page.Locator("#mainMenu li[title='Tools'], #mainMenu li[title='Herramientas']").ClickAsync();
            // Click on reload cache
            await page.Locator("#mainMenu li[title='Reload Cache'], #mainMenu li[title='Actualizar caché']").ClickAsync();
            // Confirm reload
            await page.WaitForSelectorAsync("body > div.lobibox.lobibox-confirm.animated-super-fast.zoomIn > div.lobibox-footer.text-center > button");
            await page.Locator("body > div.lobibox.lobibox-confirm.animated-super-fast.zoomIn > div.lobibox-footer.text-center > button").First.ClickAsync();

            Utils.notify? notify = await GetNotifyContentAsync(page);

            if (notify == null)
                throw new Exception("Error reloading cache");
            else if (notify.title != null && notify.title.ToString().ToLower() != "success")
                throw new Exception("Error reloading cache", new Exception(notify.title, new Exception(notify.message)));
        }
        public static void GetJavascriptErrors(IPage page, IBrowserContext context, List<string> jsErrors)
        {

            page.Console += (_, msg) =>
            {
                if ("error".Equals(msg.Type))
                {
                    jsErrors.Add(msg.Location + ": " + msg.Text);
                }

            };
        }


        public class InterfaceTestException : Exception
        {
            public InterfaceTestException(string? message, Exception? innerException) : base(message, innerException)
            {
            }
        }

        public class notify
        {
            public string? title = default;
            public string? message = default;
        }

        public enum OriginId
        {
            None = -1,
            System = 0,
            Product = 1,
            Project = 2,
            User = 3
        }
        public static async Task<notify?> GetNotifyContentAsync(IPage page, float timeout = 3000)
        {
            try
            {
                string? title = default;
                string? message = default;
                IElementHandle? notify = await page.WaitForSelectorAsync(".lobibox-notify-wrapper.bottom.right .lobibox-notify", new PageWaitForSelectorOptions { Timeout = timeout });

                if (notify == null)
                {

                    return null;
                }
                else
                {

                    title = await notify.QuerySelectorAsync(".lobibox-notify-title").Result.TextContentAsync();
                    message = await notify.QuerySelectorAsync(".lobibox-notify-msg").Result.TextContentAsync();

                    //This is done to avoid capturing the same notification.
                    var notifies = await page.Locator(".lobibox-notify-wrapper.bottom.right .lobibox-notify .lobibox-notify-icon").AllAsync();
                    foreach (var currentNotify in notifies)
                    {
                        await currentNotify.ClickAsync();
                    }
                    await page.WaitForSelectorAsync(".lobibox-notify-wrapper.bottom.right .lobibox-notify .lobibox-notify-icon", new PageWaitForSelectorOptions
                    {
                        State = WaitForSelectorState.Detached
                    });
                }

                return (new notify { title = title, message = message });
            }
            catch (TimeoutException)
            {
                return null;
            }
        }

        private static string GenerateUrl(params string[] paths)
        {
            return Path.Combine(paths).Replace("\\", "/");
        }

    }
}
