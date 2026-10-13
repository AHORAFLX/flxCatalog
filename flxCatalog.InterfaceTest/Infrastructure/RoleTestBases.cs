namespace flxCatalog.InterfaceTest.Infrastructure;

/// <summary>Every test of the client portal starts signed in as the demo client, on its home page.</summary>
public abstract class ClienteTestBase : InterfaceTestBase
{
    public const string HomeCliente = "d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86";

    [TestInitialize]
    public Task LoginClienteAsync() => App.LoginAsync(Settings.Cliente);

    /// <summary>The business name of the signed-in client, read off "Mi ficha" (the demo reset may rename it).</summary>
    protected async Task<string> LeerNombreClienteAsync()
    {
        await App.OpenMenuAsync("Mi ficha", "CLI_Cliente_Mi_Ficha_View");
        var ficha = FlexygoApp.Clean(await App.Module("mod-cli-cliente-mi-ficha-view").Locator(".cntBody").InnerTextAsync());
        var nombre = System.Text.RegularExpressions.Regex.Match(ficha, @"^(.+?)\s+CLI-\d+").Groups[1].Value.Trim();
        Assert.IsFalse(string.IsNullOrEmpty(nombre), "No se pudo leer el nombre del cliente en Mi ficha.");
        return nombre;
    }
}

/// <summary>Every back-office test starts signed in as the administrator, on the control panel.</summary>
public abstract class AdminTestBase : InterfaceTestBase
{
    [TestInitialize]
    public Task LoginAdminAsync() => App.LoginAsync(Settings.Admin);
}
