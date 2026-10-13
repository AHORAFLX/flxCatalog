using System.Text.RegularExpressions;
using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

[TestClass]
[TestCategory("Admin")]
public class AdminVentasTests : AdminTestBase
{
    [TestMethod]
    public async Task Pedidos_ElAdministradorVeLosDeTodosLosClientes()
    {
        await App.OpenMenuAsync("Pedidos", "VTA_Pedido_List");
        var filas = App.Rows(App.Module("mod-vta-pedido-list"));
        Assert.AreEqual(50, await filas.CountAsync(), "El listado de pedidos pagina de 50 en 50.");
        Assert.IsTrue(await App.Module("mod-vta-pedido-list").Locator(".cntHeader button[data-type=\"new\"]").CountAsync() > 0,
            "El administrador puede dar de alta pedidos.");

        var clientes = new HashSet<string>();
        for (var i = 0; i < 20; i++)
            clientes.Add((await filas.Nth(i).Locator("flx-navbutton > *").Nth(1).InnerTextAsync()).Trim());
        Assert.IsTrue(clientes.Count > 1, "El administrador debe ver pedidos de varios clientes, no de uno solo.");
    }

    [TestMethod]
    public async Task Pedido_FichaConLineasInformacionFiscalYProcesos()
    {
        await App.OpenMenuAsync("Pedidos", "VTA_Pedido_List");
        await App.OpenRowAsync(App.Module("mod-vta-pedido-list"));
        await App.WaitForPageAsync("VTA_Pedido_View");

        var ficha = App.Module("mod-vta-pedido-view");
        StringAssert.Matches(FlexygoApp.Clean(await ficha.InnerTextAsync()), new Regex(@"(PED|CARR)-\d+"));
        foreach (var accion in new[] { "Editar", "Confirmar", "Cancelar", "Generar PDF" })
            await Assertions.Expect(App.HeaderButton(ficha, accion)).ToBeVisibleAsync();
        await Assertions.Expect(App.Module("mod-vta-lineapedido-list-pedido")).ToBeVisibleAsync();
        await Assertions.Expect(App.Module("mod-vta-pedido-fiscal-sqllist")).ToContainTextAsync("CIF/NIF");
    }

    [TestMethod]
    public async Task Pedido_GenerarPdfDescargaElDocumento()
    {
        await App.OpenMenuAsync("Pedidos", "VTA_Pedido_List");
        await App.OpenRowAsync(App.Module("mod-vta-pedido-list"));
        await App.WaitForPageAsync("VTA_Pedido_View");
        var ficha = App.Module("mod-vta-pedido-view");
        var numero = Regex.Match(FlexygoApp.Clean(await ficha.InnerTextAsync()), @"(PED|CARR)-\d+").Value;

        var descarga = await Page.RunAndWaitForDownloadAsync(async () =>
        {
            await App.HeaderButton(ficha, "Generar PDF").ClickAsync();
            if (await Page.Locator(".lobibox-confirm .lobibox-btn-yes").IsVisibleAsync()) await App.ConfirmYesAsync();
        }, new() { Timeout = 30000 });

        StringAssert.EndsWith(descarga.SuggestedFilename, ".pdf");
        StringAssert.Contains(descarga.SuggestedFilename, numero);
        var cabecera = new byte[4];
        await using (var f = File.OpenRead(await descarga.PathAsync())) await f.ReadExactlyAsync(cabecera);
        Assert.AreEqual("%PDF", System.Text.Encoding.ASCII.GetString(cabecera));
    }

    [TestMethod]
    public async Task Tarifa_FichaConSusPreciosYAltaBorrado()
    {
        // The base tariff ("Público") has no prices of its own: find one that does.
        var conPrecios = false;
        await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
        var total = await App.Rows(App.Module("mod-vta-tarifa-list")).CountAsync();
        for (var i = 0; i < total && !conPrecios; i++)
        {
            await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
            await App.Rows(App.Module("mod-vta-tarifa-list")).Nth(i).Locator("flx-navbutton > *").First.ClickAsync();
            await App.WaitForPageAsync("VTA_Tarifa_View");
            // Price rows are plain rows (they open nothing): count the data rows, not the header.
            conPrecios = await App.Module("mod-vta-preciotarifa-list-tarifa").Locator(".cntBody .row-line:not(.bold)").CountAsync() > 0;
        }
        Assert.IsTrue(conPrecios, "Ninguna tarifa lista precios por producto.");

        var nombre = $"Tarifa {UniqueTag()}";
        await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
        await App.HeaderButton(App.Module("mod-vta-tarifa-list"), "Nuevo").ClickAsync();
        await App.WaitForAjaxAsync();
        await App.FillAsync(App.EditForm, "Nombre", nombre);
        await App.SaveAsync();
        await App.TryWaitForNotifyAsync();

        await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
        await Assertions.Expect(App.Module("mod-vta-tarifa-list").Locator(".cntBody")).ToContainTextAsync(nombre);
        await App.DeleteRowAsync(App.Module("mod-vta-tarifa-list"), nombre);
    }

    [DataTestMethod]
    [DataRow("Devoluciones", "VTA_Devolucion_List", "mod-vta-devolucion-list", "VTA_Devolucion_View", "mod-vta-devolucion-view")]
    [DataRow("Incidencias", "VTA_Incidencia_List", "mod-vta-incidencia-list", "VTA_Incidencia_View", "mod-vta-incidencia-view")]
    public async Task Postventa_ElAdministradorVeTodasYAbreSuFicha(string menu, string pagina, string modulo, string vista, string moduloVista)
    {
        int delCliente = 0;
        await AsClienteAsync(async cliente =>
        {
            await cliente.OpenMenuAsync($"Mis {menu.ToLowerInvariant()}", pagina);
            delCliente = await cliente.Rows(cliente.Module(modulo)).CountAsync();
        });

        await App.OpenMenuAsync(menu, pagina);
        var todas = await App.Rows(App.Module(modulo)).CountAsync();
        Assert.IsTrue(todas > delCliente, $"El administrador ve {todas} y el cliente demo {delCliente}: debería ver las de todos.");

        await App.OpenRowAsync(App.Module(modulo));
        await App.WaitForPageAsync(vista);
        await Assertions.Expect(App.HeaderButton(App.Module(moduloVista), "Editar")).ToBeVisibleAsync();
    }
}
