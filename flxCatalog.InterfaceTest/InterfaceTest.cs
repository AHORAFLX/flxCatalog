using flxCatalog.InterfaceTest;
using Microsoft.Extensions.Configuration;

namespace flxCatalog_InterfaceTest
{
    [TestClass]
    public class InterfaceTest
    {
        IConfiguration config;

        public InterfaceTest()
        {
            string path = "..\\..\\..\\";
            string fullPath = System.IO.Path.GetFullPath(path, System.IO.Directory.GetCurrentDirectory());
            config = new ConfigurationBuilder().SetBasePath(fullPath).AddJsonFile("appsettings.json", true, true).AddJsonFile("appsettings.local.json", true, true).Build();


            var exitCode = Microsoft.Playwright.Program.Main(new[] { "install" });
            if (exitCode != 0)
            {
                throw new Exception($"Playwright exited with code {exitCode}");
            }
        }


        [TestMethod]
        public async Task BasicInterfaceTest()
        {
            try
            {
                string testFilterName = "BasicInterfaceTest";
                var context = await Utils.GetBrowserAsync(config["browser"].ToString());
                await Utils.StartTracing(context);

                List<string> jsErrors = new List<string>();

                try
                {

                    //Open new page
                    var Page = await context.NewPageAsync();
                    Utils.GetJavascriptErrors(Page, context, jsErrors);

                    //Go to login
                    await Utils.GoToLogin(Page, config["url"], config["user"].ToString(), config["pass"].ToString());

                    //Set developer mode
                    await Utils.SetDeveloperMode(Page);

                    //Reload cache process
                    await Utils.ReloadCache(Page);

                    await context.Tracing.StopAsync();
                }
                catch
                {
                    //For opening the trace file use this command.
                    // ./bin/Debug/net6.0/playwright.ps1 show-trace ./InterfaceTest_flx/bin/Debug/net6.0/tracing/FiltersTest.zip
                    await context.Tracing.StopAsync(new()
                    {
                        Path = "./tracing/BasicInterfaceTest.zip"
                    });

                    throw;
                }


                if (jsErrors.Count > 0)
                {
                    throw new Exception(String.Join(".\n", jsErrors.ToArray()));
                }


            }
            catch
            {
                throw;
            }
        }
    }
}
