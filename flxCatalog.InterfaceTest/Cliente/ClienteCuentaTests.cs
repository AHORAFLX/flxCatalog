using System.Text.RegularExpressions;
using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Cliente;

[TestClass]
[TestCategory("Cliente")]
public class ClienteCuentaTests : ClienteTestBase
{
    [TestMethod]
    public async Task MiFicha_MuestraLosDatosDelClienteConectado()
    {
        var tarifaPortada = Regex.Match(FlexygoApp.Clean(await App.Module("mod-home-cliente-saludo-html").InnerTextAsync()),
            @"Tarifa asignada:\s*(\S+)").Groups[1].Value;

        await App.OpenMenuAsync("Mi ficha", "CLI_Cliente_Mi_Ficha_View");
        var ficha = FlexygoApp.Clean(await App.Module("mod-cli-cliente-mi-ficha-view").InnerTextAsync());

        StringAssert.Matches(ficha, new Regex(@"CLI-2101"), "El login 'cliente' está enlazado al cliente demo #1 (CLI-2101).");
        foreach (var campo in new[] { "CIF/NIF", "Email", "Teléfono", "Dirección fiscal", "Tarifa" })
            StringAssert.Contains(ficha, campo);
        StringAssert.Contains(ficha, tarifaPortada, "La tarifa de la ficha debe coincidir con la que anuncia la portada.");
        Assert.AreEqual(0, await App.Module("mod-cli-cliente-mi-ficha-view").Locator(".cntHeader button[data-type=\"edit\"]").CountAsync(),
            "El cliente no edita su ficha desde aquí.");
    }

    [TestMethod]
    public async Task MisDocumentos_MuestraSusDocumentosYSuTarifa_SinListarPedidos()
    {
        await App.OpenMenuAsync("Mis documentos", "VTA_MisDocumentos_List");

        Assert.AreEqual(0, await App.MainPage.Locator("flx-module[modulename=\"mod-vta-pedido-list-documentos\"]").CountAsync(),
            "'Mis documentos' ya no debe listar pedidos.");
        var documentos = App.Module("mod-vta-pedido-documentos-cliente-sqllist");
        await Assertions.Expect(documentos).ToBeVisibleAsync();
        var filas = await documentos.Locator(".doc-row").CountAsync();
        if (filas == 0) await Assertions.Expect(documentos).ToContainTextAsync("Aún no tienes documentos");
        else await Assertions.Expect(documentos.Locator(".doc-row a.doc-download").First).ToHaveAttributeAsync("href", new Regex(".+"));

        var tarifa = App.Module("mod-vta-tarifa-list-documentos");
        Assert.AreEqual(1, await App.Rows(tarifa).CountAsync(), "El cliente debe ver exactamente su tarifa.");
    }

    [TestMethod]
    public async Task MisNotificaciones_ListaLosAvisosYAbreUno()
    {
        await App.OpenMenuAsync("Mis notificaciones", "COM_MisNotificaciones_List");
        var lista = App.Module("mod-com-misnotificaciones-list");
        var aviso = lista.Locator("flx-navbutton > *").First;
        await Assertions.Expect(aviso).ToBeVisibleAsync();
        var titulo = FlexygoApp.Clean(await lista.Locator("flx-navbutton").First.InnerTextAsync());
        StringAssert.Matches(titulo, new Regex("Pedido|Devoluci|Incidencia", RegexOptions.IgnoreCase));

        await aviso.ClickAsync();
        await App.WaitForAjaxAsync();
        Assert.AreNotEqual("COM_MisNotificaciones_List", await App.CurrentPageAsync(), "Pulsar un aviso debe llevar a lo que avisa.");
    }

    [DataTestMethod]
    [DataRow("CLI_Cliente_List")]
    [DataRow("CAT_Producto_List")]
    [DataRow("VTA_Tarifa_List")]
    public async Task Seguridad_ElClienteNoAbrePantallasDeAdministracion(string pagina)
    {
        ExpectError("credentials|Failed to load resource|HTTP 500");
        var antes = await App.CurrentPageAsync();
        await App.NavigateAsync(pagina);
        Assert.AreNotEqual(pagina, await App.CurrentPageAsync(), $"El cliente pudo abrir '{pagina}'.");
        Assert.AreEqual(antes, await App.CurrentPageAsync());
    }

    [TestMethod]
    public async Task Seguridad_ElClienteNoVeElPanelDeControlDelNegocio()
    {
        ExpectError("credentials|Failed to load resource|HTTP 500");
        await App.NavigateAsync("HOME");
        var abierto = await App.CurrentPageAsync() == "HOME";
        var indicadores = abierto ? FlexygoApp.Clean(await App.Module("mod-home-kpis-easyinfo").InnerTextAsync()) : "";
        Assert.IsFalse(abierto,
            "El cliente abre el panel de control de administración (página HOME) y ve los indicadores de todo el negocio: " +
            $"'{indicadores}'. Falta quitar el permiso de ver la página HOME al rol cliente.");
    }

    [TestMethod]
    public async Task Seguridad_ElClienteNoVeElPedidoDeOtroCliente()
    {
        ExpectError("credentials|Failed to load resource|HTTP 500|Error");
        var yo = await LeerNombreClienteAsync();
        string? ajeno = null;
        string? numero = null;
        await AsAdminAsync(async admin =>
        {
            await admin.OpenMenuAsync("Pedidos", "VTA_Pedido_List");
            // Take the platform's own link to an order that belongs to someone else.
            var filas = admin.Rows(admin.Module("mod-vta-pedido-list"));
            var fila = filas.Filter(new() { HasNotText = yo }).First;
            ajeno = await fila.Locator("flx-navbutton").GetAttributeAsync("objectwhere");
            numero = (await fila.Locator("flx-navbutton > *").First.InnerTextAsync()).Trim();
        });
        Assert.IsNotNull(ajeno);

        await App.Page.EvaluateAsync("w => flexygo.nav.openPageName('VTA_Pedido_Cliente_View', 'VTA_Pedido', w, null, 'current', false, $('body'))", ajeno);
        await App.WaitForAjaxAsync();
        var visible = await App.MainPage.InnerTextAsync();
        Assert.IsFalse(visible.Contains(numero!), $"El cliente pudo ver el pedido {numero} de otro cliente.");
    }
}
