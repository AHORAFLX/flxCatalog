using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Cliente;

[TestClass]
[TestCategory("Cliente")]
public class ClientePostventaTests : ClienteTestBase
{
    private async Task AbrirPedidoEntregadoAsync()
    {
        await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
        await App.OpenRowAsync(App.Module("mod-vta-pedido-list"), "Entregado");
        await App.WaitForPageAsync("VTA_Pedido_Cliente_View");
    }

    private async Task SolicitarDevolucionAsync(string cantidad, string motivo)
    {
        await AbrirPedidoEntregadoAsync();
        await App.Module("mod-vta-lineapedido-detalle-list").Locator("flx-navbutton[processname=\"pVTA_SolicitarDevolucion\"]").First.ClickAsync();
        await App.WaitForAjaxAsync();
        await App.FillAsync(App.Dialog, "Cantidad", cantidad);
        await App.FillAsync(App.Dialog, "Motivo", motivo);
        await App.FillAsync(App.Dialog, "Comentario", "Generado por los tests de interfaz.");
        await App.RunProcessAsync("Solicitar devolución");
    }

    private async Task CancelarDesdeSuFichaAsync(string listado, string pagina, string modulo, string texto, string vista, string moduloVista)
    {
        await App.OpenMenuAsync(listado, pagina);
        await App.OpenRowAsync(App.Module(modulo), texto);
        await App.WaitForPageAsync(vista);
        var aviso = await App.RunHeaderProcessAsync(App.Module(moduloVista), "Cancelar");
        Assert.IsTrue(aviso is null || aviso.IsSuccess, $"Cancelar falló: {aviso?.Text}");
        await App.OpenMenuAsync(listado, pagina);
        await Assertions.Expect(App.Rows(App.Module(modulo)).Filter(new() { HasText = texto }).First).ToContainTextAsync("Cancelada");
    }

    /// <summary>A client cannot delete what it asked for; the administrator removes the test's record.</summary>
    private Task BorrarComoAdminAsync(string menu, string pagina, string modulo, string texto) =>
        AsAdminAsync(async admin =>
        {
            await admin.OpenMenuAsync(menu, pagina);
            if (await admin.Rows(admin.Module(modulo)).Filter(new() { HasText = texto }).CountAsync() > 0)
                await admin.DeleteRowAsync(admin.Module(modulo), texto);
        });

    [TestMethod]
    public async Task Devolucion_SeSolicitaDesdeUnaLineaDelPedido_YElClienteLaCancela()
    {
        var motivo = UniqueTag();
        try
        {
            await SolicitarDevolucionAsync("1", motivo);
            var aviso = await App.TryWaitForNotifyAsync();
            Assert.IsTrue(aviso is null || aviso.IsSuccess, $"Solicitar devolución falló: {aviso?.Text}");
            await Assertions.Expect(Page.Locator(".ui-dialog:visible")).ToHaveCountAsync(0);

            await App.OpenMenuAsync("Mis devoluciones", "VTA_Devolucion_List");
            var fila = App.Rows(App.Module("mod-vta-devolucion-list")).Filter(new() { HasText = motivo }).First;
            await Assertions.Expect(fila).ToContainTextAsync("Solicitada");

            await CancelarDesdeSuFichaAsync("Mis devoluciones", "VTA_Devolucion_List", "mod-vta-devolucion-list", motivo,
                "VTA_Devolucion_View", "mod-vta-devolucion-view");
        }
        finally
        {
            await BorrarComoAdminAsync("Devoluciones", "VTA_Devolucion_List", "mod-vta-devolucion-list", motivo);
        }
    }

    [TestMethod]
    public async Task Devolucion_ConMasUnidadesDeLasCompradas_SeRechazaSinCrearNada()
    {
        ExpectError("Failed to load resource|HTTP 500|/api/");
        var motivo = UniqueTag();
        try
        {
            await SolicitarDevolucionAsync("999", motivo);

            var aviso = await App.WaitForNotifyAsync();
            Assert.IsFalse(aviso.IsSuccess, "Una devolución de 999 unidades no debería aceptarse.");
            if (await Page.Locator(".ui-dialog:visible").CountAsync() > 0) await App.CloseDialogAsync();

            await App.OpenMenuAsync("Mis devoluciones", "VTA_Devolucion_List");
            await Assertions.Expect(App.Rows(App.Module("mod-vta-devolucion-list")).Filter(new() { HasText = motivo })).ToHaveCountAsync(0);
        }
        finally
        {
            await BorrarComoAdminAsync("Devoluciones", "VTA_Devolucion_List", "mod-vta-devolucion-list", motivo);
        }
    }

    [TestMethod]
    public async Task PeticionYaTramitada_NoSePuedeCancelar()
    {
        ExpectError("Failed to load resource|HTTP 500|/api/");
        // A return past 'Solicitada', or else an incident past 'Abierta': the button shows, the server refuses.
        var casos = new[]
        {
            (menu: "Mis devoluciones", pagina: "VTA_Devolucion_List", modulo: "mod-vta-devolucion-list", inicial: "Solicitada", vista: "VTA_Devolucion_View", moduloVista: "mod-vta-devolucion-view"),
            (menu: "Mis incidencias", pagina: "VTA_Incidencia_List", modulo: "mod-vta-incidencia-list", inicial: "Abierta", vista: "VTA_Incidencia_View", moduloVista: "mod-vta-incidencia-view"),
        };
        foreach (var c in casos)
        {
            await App.OpenMenuAsync(c.menu, c.pagina);
            // Judge by the state badge only: a description may well say "caja abierta".
            var badgeTramitada = Page.Locator("[class^='flx-state']").Filter(new() { HasNotTextRegex = new System.Text.RegularExpressions.Regex($"^\\s*({c.inicial}|Cancelada)\\s*$") });
            var tramitada = App.Rows(App.Module(c.modulo)).Filter(new() { Has = badgeTramitada });
            if (await tramitada.CountAsync() == 0) continue;

            var estado = FlexygoApp.Clean(await tramitada.First.Locator("[class^=flx-state]").Last.InnerTextAsync());
            await tramitada.First.Locator("flx-navbutton > *").First.ClickAsync();
            await App.WaitForPageAsync(c.vista);
            var ficha = App.Module(c.moduloVista);
            // Either the button is not offered at all, or pressing it is refused by the server.
            if (await ficha.Locator(".cntHeader button[data-original-title=\"Cancelar\"]").CountAsync() > 0)
            {
                var aviso = await App.RunHeaderProcessAsync(ficha, "Cancelar");
                Assert.IsNotNull(aviso, "Cancelar algo ya tramitado debería avisar del rechazo.");
                Assert.IsFalse(aviso.IsSuccess, $"Se canceló una petición en estado '{estado}': {aviso.Text}");
            }
            StringAssert.Contains(await ficha.InnerTextAsync(), estado);
            return;
        }
        Assert.Inconclusive("El cliente demo no tiene ninguna devolución ni incidencia ya tramitada.");
    }

    [TestMethod]
    public async Task Incidencia_SeAbreDesdeUnPedido_YElClienteLaCancela()
    {
        var descripcion = $"Prueba {UniqueTag()}";
        try
        {
            await AbrirPedidoEntregadoAsync();
            var aviso = await App.RunHeaderProcessAsync(App.Module("mod-vta-pedido-cliente-view"), "Abrir incidencia", async dialogo =>
            {
                await dialogo.Locator("[property=\"IdTipo\"] select").SelectOptionAsync(new SelectOptionValue { Index = 1 });
                await App.FillAsync(dialogo, "Descripcion", descripcion);
            });
            Assert.IsTrue(aviso is null || aviso.IsSuccess, $"Abrir incidencia falló: {aviso?.Text}");

            await App.OpenMenuAsync("Mis incidencias", "VTA_Incidencia_List");
            var fila = App.Rows(App.Module("mod-vta-incidencia-list")).Filter(new() { HasText = descripcion }).First;
            await Assertions.Expect(fila).ToContainTextAsync("Abierta");

            await CancelarDesdeSuFichaAsync("Mis incidencias", "VTA_Incidencia_List", "mod-vta-incidencia-list", descripcion,
                "VTA_Incidencia_View", "mod-vta-incidencia-view");
        }
        finally
        {
            await BorrarComoAdminAsync("Incidencias", "VTA_Incidencia_List", "mod-vta-incidencia-list", descripcion);
        }
    }

    [TestMethod]
    public async Task Seguridad_ElClienteNoPuedeDarDeAltaUnaDevolucionDirectamente()
    {
        ExpectError("credentials|Failed to load resource|HTTP 500");
        // The list offers no "Nuevo" button...
        await App.OpenMenuAsync("Mis devoluciones", "VTA_Devolucion_List");
        Assert.AreEqual(0, await App.Module("mod-vta-devolucion-list").Locator(".cntHeader button[data-type=\"new\"]").CountAsync());

        // ...and the server refuses the insert even when it is attempted through the API.
        var insertado = await Page.EvaluateAsync<bool>("() => { const e = new flexygo.obj.Entity('VTA_Devolucion'); e.read(); return !!e.insert(); }");
        Assert.IsFalse(insertado, "El servidor aceptó un alta directa de devolución hecha por el cliente.");
        var aviso = await App.WaitForNotifyAsync();
        StringAssert.Contains(aviso.Text, "Not enough credentials for insert");
    }

    [TestMethod]
    public async Task Seguridad_ElClienteNoPuedeDarDeAltaUnaIncidenciaDirectamente()
    {
        ExpectError("credentials|Failed to load resource|HTTP 500");
        await App.OpenMenuAsync("Mis incidencias", "VTA_Incidencia_List");
        Assert.AreEqual(0, await App.Module("mod-vta-incidencia-list").Locator(".cntHeader button[data-type=\"new\"]").CountAsync());

        var insertado = await Page.EvaluateAsync<bool>("() => { const e = new flexygo.obj.Entity('VTA_Incidencia'); e.read(); return !!e.insert(); }");
        Assert.IsFalse(insertado, "El servidor aceptó un alta directa de incidencia hecha por el cliente.");
        StringAssert.Contains((await App.WaitForNotifyAsync()).Text, "Not enough credentials for insert");
    }
}
