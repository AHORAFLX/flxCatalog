using FLEXYGO;
using FLEXYGO.Caching;
using FLEXYGO.Configuration.Tokens;
using FLEXYGO.Context;
using FLEXYGO.Data;
using FLEXYGO.Identity;
using FLEXYGO.Interfaces.Embedded;
using FLEXYGO.Objects;
using FLEXYGO.Processing;
using static FLEXYGO.Processing.ProcessManager;
using static FLEXYGO.Utilities.General.Util;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Moq;
using System.Reflection;
using System.Security.Claims;

namespace flxCatalog_UnitTest
{
    public class SetupTest
    {
        public Microsoft.Extensions.DependencyInjection.ServiceProvider Services { get; private set; }
        public ConfToken _conftoken { get; private set; }

        public SetupTest()
        {
            var http = BuildMockHttpContextAccessor();
            var config = LoadConfig();

            var sc = new ServiceCollection();
            sc.AddHttpContextAccessor();
            sc.AddSingleton<IHttpContextAccessor>(http.Object);
            sc.AddSingleton<IConfiguration>(config);
            sc.AddSingleton<IDataProtectionProvider>(_ => DataProtectionProvider.Create("FlexygoProductTests"));
            // Logging: en la aplicacion real lo trae de serie WebApplication.CreateBuilder,
            // pero un ServiceCollection pelado no lo registra. Sin esto no se puede activar
            // Application, cuyo constructor pide un ILogger<Application>.
            sc.AddLogging();
            sc.AddSingleton<IApplication, Application>();
            // Mismo orden que el host real (Program.cs del Backend): IApplicationInfoProvider
            // va justo detras de IApplication, y es dependencia de Current.
            sc.AddSingleton<IApplicationInfoProvider>(_ => new TestApplicationInfoProvider(
                BuildMockServer().Object,
                BuildMockWebHostEnvironment().Object,
                http.Object));
            sc.AddSingleton<ICurrent, Current>();
            sc.AddSingleton<IEmbedded, Embedded>();
            sc.AddMemoryCache();

            Services = sc.BuildServiceProvider();
            FLEXYGO.ServiceProvider.Initialize(Services);

            _conftoken = new ConfToken(
                new FLEXYGO.Data.UserConnectionCollection("ConfConnectionString", "DataConnectionString"),
                "admin"
            );

            if (!MySession.Contains("ConfToken"))
            {
                _conftoken = new ConfToken(new UserConnectionCollection("ConfConnectionString", "DataConnectionString"), "admin");
                FLEXYGO.Web.GlobalVars.SetConfToken(_conftoken);
            }
            else
            {
                _conftoken = (ConfToken)MySession.GetItem("ConfToken");
            }

            RunAfterLoginProcess();
        }

        /// <summary>
        /// A real login runs the "AfterLoginProcess" setting (see Settings table) once per session.
        /// Tests build the ConfToken directly instead of logging in, so it never runs unless we trigger it here.
        /// </summary>
        private void RunAfterLoginProcess()
        {
            var dataConnection = _conftoken.UserSecurity.ConnectionStrings["DataConnectionString"];
            bool alreadyInitialized = dataConnection.SQLContext != null && dataConnection.SQLContext.Count > 0;

            if (alreadyInitialized || !FLEXYGO.Config.AppSettings.ContainsKey("AfterLoginProcess") || IsBlank(FLEXYGO.Config.AppSettings["AfterLoginProcess"].Value))
            {
                return;
            }

            var process = new ProcessManager(FLEXYGO.Config.AppSettings["AfterLoginProcess"].Value, _conftoken);
            var user = new EntityObject("sysUser", $"UserName='{_conftoken.UserSecurity.UserName}'", _conftoken);
            ProcessHelper ret = process.run(user);

            if (!ret.Success)
            {
                throw ret.LastException;
            }
        }

        private static IConfiguration LoadConfig()
        {
            // Busca appsettings.json en ../conf (como en tu estructura actual)
            var baseDir = System.IO.Directory.GetCurrentDirectory();
            var full = System.IO.Path.GetFullPath("../conf/", baseDir);

            if (!System.IO.File.Exists(System.IO.Path.Combine(full, "appsettings.json")))
            {
                // Si no se encuentra, busca en el directorio del Backend
                full = baseDir.Substring(0, baseDir.LastIndexOf(".UnitTest")) + ".Backend/conf/";
            }

            // appsettings.json se deja vacío a propósito (.claude/CLAUDE.md): las cadenas de
            // conexión reales están en appsettings.Development.json, que Backend/Frontend cargan
            // vía ASPNETCORE_ENVIRONMENT en su propio host — aquí no hay host, así que hay que
            // pedirlo explícitamente o el ConfToken se construye con la cadena de conexión vacía.
            return new ConfigurationBuilder()
                .SetBasePath(full)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile("appsettings.Development.json", optional: true, reloadOnChange: true)
                .AddJsonFile("appsettings.local.json", optional: true, reloadOnChange: true)
                .Build();
        }

        private static Mock<IHttpContextAccessor> BuildMockHttpContextAccessor()
        {
            var httpContextAccessor = new Mock<IHttpContextAccessor>();
            var httpContext = new Mock<HttpContext>();
            var httpRequest = new Mock<HttpRequest>();
            var httpResponse = new Mock<HttpResponse>();
            var connection = new Mock<ConnectionInfo>();
            var claimsPrincipal = new Mock<ClaimsPrincipal>();
            var identity = new Mock<ClaimsIdentity>();
            var headers = new HeaderDictionary
            {
                { "user-agent", "Chrome" }
            };
            var responseHeaders = new HeaderDictionary();
            var trailers = new HeaderDictionary();

            // Setup Request
            httpRequest.Setup(x => x.Headers).Returns(headers);
            httpRequest.Setup(x => x.Scheme).Returns("http");
            httpRequest.Setup(x => x.Host).Returns(new HostString("localhost"));
            httpRequest.Setup(x => x.PathBase).Returns("/test");
            httpRequest.Setup(x => x.Path).Returns("/api");

            // Setup Connection
            connection.Setup(x => x.RemoteIpAddress).Returns(System.Net.IPAddress.Parse("127.0.0.1"));

            // Setup Claims
            var claims = new List<Claim>
            {
                new Claim(CustomClaimTypes.Name, "admin"),
                new Claim(CustomClaimTypes.NameIdentifier, "1"),
                new Claim("CultureId", "en-gb")
            };

            // Setup ClaimsPrincipal and Identity
            identity.Setup(x => x.IsAuthenticated).Returns(true);
            identity.Setup(x => x.Name).Returns("admin");
            identity.Setup(x => x.Claims).Returns(claims);
            identity.Setup(x => x.FindFirst(CustomClaimTypes.Name)).Returns(new Claim(CustomClaimTypes.Name, "admin"));
            identity.Setup(x => x.FindFirst(CustomClaimTypes.NameIdentifier)).Returns(new Claim(CustomClaimTypes.NameIdentifier, "1"));
            identity.Setup(x => x.FindFirst("CultureId")).Returns(new Claim("CultureId", "en-gb"));

            claimsPrincipal.Setup(x => x.Identity).Returns(identity.Object);
            claimsPrincipal.Setup(x => x.Claims).Returns(claims);
            claimsPrincipal.Setup(x => x.FindFirst(It.IsAny<string>())).Returns((string type) =>
            {
                return claims.FirstOrDefault(c => c.Type == type);
            });
            claimsPrincipal.Setup(x => x.FindFirst(CustomClaimTypes.Name)).Returns(new Claim(CustomClaimTypes.Name, "admin"));
            claimsPrincipal.Setup(x => x.FindFirst(CustomClaimTypes.NameIdentifier)).Returns(new Claim(CustomClaimTypes.NameIdentifier, "1"));
            claimsPrincipal.Setup(x => x.FindFirst("CultureId")).Returns(new Claim("CultureId", "en-gb"));

            // Setup HttpContext
            httpContext.Setup(x => x.Request).Returns(httpRequest.Object);
            httpContext.Setup(x => x.Response).Returns(httpResponse.Object);
            httpContext.Setup(x => x.Connection).Returns(connection.Object);
            httpContext.Setup(x => x.User).Returns(claimsPrincipal.Object);

            // Assign HttpContext to IHttpContextAccessor
            httpContextAccessor.Setup(x => x.HttpContext).Returns(httpContext.Object);

            return httpContextAccessor;
        }

        private static Mock<IServer> BuildMockServer()
        {
            // ApplicationInfoProvider decide Hosting mirando DOTNET_RUNNING_IN_CONTAINER y,
            // si no esta puesta, el nombre del tipo del IServer (Kestrel o IIS). El proxy de
            // Moq no coincide con ninguno de los dos nombres, asi que Hosting cae en el valor
            // por defecto del enum HostingEnvironment { IIS, Kestrel, Docker }: IIS, porque el
            // enum no tiene miembro neutro (no es que "no corra bajo ningun host web"). Esto
            // no revienta porque ningun test lee InstanceData: en la rama IIS esa propiedad
            // evalua PoolId e InstanceId, que llaman a HttpContext.GetServerVariable(...)
            // sobre este mock, cuyo Features nunca se stubea, asi que lanzaria una excepcion.
            // Ojo, esto varia segun la plataforma: bajo docker:dind de GitLab el job corre
            // dentro de un contenedor y DOTNET_RUNNING_IN_CONTAINER probablemente vale "true",
            // con lo que Hosting cae en Docker; en un runner de GitHub cae en IIS como aqui.
            var server = new Mock<IServer>();
            server.Setup(x => x.Features).Returns(new FeatureCollection());

            return server;
        }

        private static Mock<IWebHostEnvironment> BuildMockWebHostEnvironment()
        {
            // El directorio de trabajo del runner de tests hace de raiz de contenido. El
            // wwwroot no existe en el proyecto de tests, asi que su proveedor de ficheros
            // es el nulo en lugar de uno fisico, que reventaria sobre una ruta inexistente.
            var contentRoot = System.IO.Directory.GetCurrentDirectory();

            var environment = new Mock<IWebHostEnvironment>();
            environment.Setup(x => x.EnvironmentName).Returns("Test");
            environment.Setup(x => x.ApplicationName).Returns(typeof(SetupTest).Assembly.GetName().Name!);
            environment.Setup(x => x.ContentRootPath).Returns(contentRoot);
            environment.Setup(x => x.ContentRootFileProvider).Returns(new PhysicalFileProvider(contentRoot));
            environment.Setup(x => x.WebRootPath).Returns(System.IO.Path.Combine(contentRoot, "wwwroot"));
            environment.Setup(x => x.WebRootFileProvider).Returns(new NullFileProvider());

            return environment;
        }
    }

    /// <summary>
    /// Proveedor de informacion de aplicacion para el arnes de pruebas.
    /// </summary>
    /// <remarks>
    /// A proposito NO se registra el BackendInfoProvider de produccion: resuelve
    /// CurrentDatabaseVersion con una consulta SQL en vivo y ata VersionAssembly al
    /// ensamblado del Backend. Ninguna de las dos cosas pinta en un test unitario, asi
    /// que aqui se hereda de ApplicationInfoProvider y solo se concretan los dos miembros
    /// abstractos.
    /// </remarks>
    public sealed class TestApplicationInfoProvider : ApplicationInfoProvider
    {
        public TestApplicationInfoProvider(IServer server, IWebHostEnvironment webHostEnvironment, IHttpContextAccessor httpContextAccessor)
            : base(server, webHostEnvironment, httpContextAccessor)
        {
        }

        /// <summary>Ensamblado del que se lee la version: el de los propios tests.</summary>
        public override Assembly? VersionAssembly => typeof(TestApplicationInfoProvider).Assembly;

        /// <summary>El arnes hace de host del Backend, luego el contexto es BACK.</summary>
        public override FLEXYGO.Models.Shared.ApplicationContext Context => FLEXYGO.Models.Shared.ApplicationContext.BACK;
    }

    /// <summary>
    /// Colección de xUnit para compartir el fixture (una sola inicialización).
    /// </summary>
    [Xunit.CollectionDefinition("Flexygo Test Collection")]
    public class FlexygoTestCollection : Xunit.ICollectionFixture<SetupTest> { }
}
