using System.Text.RegularExpressions;
using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Cliente;

[TestClass]
[TestCategory("Cliente")]
public class ClienteCarritoPedidosTests : ClienteTestBase
{
    private ILocator LineasCarrito => App.Module("mod-vta-lineapedido-carrito-list").Locator(".crl-row");
    private ILocator FichaCarrito => App.Module("mod-vta-pedido-carrito-view");

    private sealed record LineaCarrito(string IdProducto, string IdVariante, string Nombre, string Cantidad);

    private async Task<List<LineaCarrito>> LeerCarritoAsync()
    {
        await App.OpenMenuAsync("Mi carrito", "VTA_Pedido_MiCarrito_View");
        var lineas = new List<LineaCarrito>();
        for (var i = 0; i < await LineasCarrito.CountAsync(); i++)
        {
            var fila = LineasCarrito.Nth(i);
            var quitar = fila.Locator(".crl-remove");
            var qty = fila.Locator("input");
            lineas.Add(new(
                await quitar.GetAttributeAsync("data-idproducto") ?? "",
                await quitar.GetAttributeAsync("data-idvariante") ?? "",
                (await fila.Locator(".crl-name").InnerTextAsync()).Trim(),
                await qty.CountAsync() > 0 ? await qty.First.InputValueAsync() : "1"));
        }
        return lineas;
    }

    /// <summary>Adds a product from the catalogue through its colour/size popup and returns its name.</summary>
    private async Task<string> AñadirDesdeCatalogoAsync(IReadOnlyCollection<string> evitar, int cantidad, string? idProducto = null, string? idVariante = null)
    {
        await App.OpenMenuAsync("Catálogo", "CAT_Producto_Cliente_List");
        var catalogo = App.Module("mod-cat-producto-cliente-list");
        ILocator tarjeta;
        if (idProducto is not null)
        {
            tarjeta = catalogo.Locator(".cli-card").Filter(new() { Has = Page.Locator($"button.cli-add[data-idproducto=\"{idProducto}\"]") }).First;
            for (var pagina = 0; pagina < 10 && await tarjeta.CountAsync() == 0; pagina++)
            {
                await catalogo.Locator(".pager .nextPage").First.ClickAsync();
                await App.WaitForAjaxAsync();
            }
        }
        else
        {
            // First product with sizes/colours that is not already in the cart.
            var candidatas = catalogo.Locator(".cli-card").Filter(new() { Has = Page.Locator("button.cli-add:not([data-variantes='[]'])") });
            tarjeta = candidatas.First;
            for (var i = 0; i < await candidatas.CountAsync(); i++)
            {
                var nombre = (await candidatas.Nth(i).Locator(".cli-name").InnerTextAsync()).Trim();
                if (!evitar.Contains(nombre)) { tarjeta = candidatas.Nth(i); break; }
            }
        }

        var nombreProducto = (await tarjeta.Locator(".cli-name").InnerTextAsync()).Trim();
        await tarjeta.Locator("button.cli-add").ClickAsync();
        var variante = Page.Locator("#cli-pop-variante");
        await variante.WaitForAsync();
        if (idVariante is not null) await variante.SelectOptionAsync(idVariante);
        else await variante.SelectOptionAsync(new SelectOptionValue { Index = 0 });
        await Page.Locator("#cli-pop-cantidad").FillAsync(cantidad.ToString());
        await Page.Locator("#cli-pop-ok").ClickAsync();
        await App.WaitForAjaxAsync();
        await App.TryWaitForNotifyAsync(3000);
        return nombreProducto;
    }

    private async Task QuitarDelCarritoAsync(string nombre)
    {
        await App.OpenMenuAsync("Mi carrito", "VTA_Pedido_MiCarrito_View");
        var fila = LineasCarrito.Filter(new() { HasText = nombre }).First;
        await fila.Locator(".crl-remove").ClickAsync();
        await App.ConfirmYesAsync();
        await Page.WaitForTimeoutAsync(1000);
        await App.WaitForAjaxAsync();
    }

    [TestMethod]
    public async Task Carrito_AñadirConVariante_CambiarCantidad_YQuitar()
    {
        var previas = (await LeerCarritoAsync()).Select(l => l.Nombre).ToList();
        var producto = await AñadirDesdeCatalogoAsync(previas, 2);

        try
        {
            await App.OpenMenuAsync("Mi carrito", "VTA_Pedido_MiCarrito_View");
            var fila = LineasCarrito.Filter(new() { HasText = producto }).First;
            await Assertions.Expect(fila).ToBeVisibleAsync();
            var cantidad = fila.Locator("input").First;
            await Assertions.Expect(cantidad).ToHaveValueAsync("2");

            // The cart entry in the menus carries the number of units in the cart; it refreshes every 15 s.
            await Assertions.Expect(Page.Locator("#mainNav li[title=\"Mi carrito\"]").Filter(new() { Visible = true }).First)
                .ToContainTextAsync(new Regex(@"\d"), new() { Timeout = 20000 });

            await cantidad.FillAsync("3");
            await cantidad.DispatchEventAsync("change");
            await Page.WaitForTimeoutAsync(1200);
            await App.WaitForAjaxAsync();
            await Assertions.Expect(LineasCarrito.Filter(new() { HasText = producto }).First.Locator("input").First).ToHaveValueAsync("3");
            StringAssert.Matches(FlexygoApp.Clean(await FichaCarrito.InnerTextAsync()), new Regex(@"Total pedido\s+\d"));
        }
        finally
        {
            await QuitarDelCarritoAsync(producto);
        }
        await Assertions.Expect(LineasCarrito.Filter(new() { HasText = producto })).ToHaveCountAsync(0);
    }

    [TestMethod]
    public async Task Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela()
    {
        var previas = await LeerCarritoAsync();
        var producto = await AñadirDesdeCatalogoAsync(previas.Select(l => l.Nombre).ToList(), 1);

        await App.OpenMenuAsync("Mi carrito", "VTA_Pedido_MiCarrito_View");
        var confirmar = App.HeaderButton(FichaCarrito, "Confirmar pedido");
        var idPedido = Regex.Match(await confirmar.GetAttributeAsync("onclick") ?? "", @"IdPedido=\\?'([0-9A-Fa-f-]{36})").Groups[1].Value;
        Assert.IsFalse(string.IsNullOrEmpty(idPedido), "No se pudo leer el pedido en curso del carrito.");

        var aviso = await App.RunHeaderProcessAsync(FichaCarrito, "Confirmar pedido");
        Assert.IsTrue(aviso is null || aviso.IsSuccess, $"Confirmar pedido falló: {aviso?.Text}");

        // The platform's own link to the order, taken from the client's list; reused as is for the admin.
        string? enlacePedido = null;
        try
        {
            await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
            var fila = App.Module("mod-vta-pedido-list").Locator(".row-line").Filter(new()
            {
                Has = Page.Locator($"flx-navbutton[objectwhere*=\"{idPedido}\" i]"),
            });
            await Assertions.Expect(fila).ToHaveCountAsync(1);
            enlacePedido = await fila.Locator("flx-navbutton").GetAttributeAsync("objectwhere");
            await Assertions.Expect(fila).ToContainTextAsync("Confirmado");

            await App.OpenMenuAsync("Mi carrito", "VTA_Pedido_MiCarrito_View");
            await Assertions.Expect(LineasCarrito.Filter(new() { HasText = producto })).ToHaveCountAsync(0);
        }
        finally
        {
            Assert.IsNotNull(enlacePedido, $"No se encontró el pedido {idPedido} en 'Mis pedidos': queda confirmado y hay que cancelarlo a mano.");
            await AsAdminAsync(async admin =>
            {
                await admin.NavigateAsync("VTA_Pedido_View", "VTA_Pedido", enlacePedido);
                await admin.WaitForPageAsync("VTA_Pedido_View");
                var cancelado = await admin.RunHeaderProcessAsync(admin.Module("mod-vta-pedido-view"), "Cancelar");
                Assert.IsTrue(cancelado is null || cancelado.IsSuccess, $"El administrador no pudo cancelar el pedido: {cancelado?.Text}");
                StringAssert.Contains(await admin.Module("mod-vta-pedido-view").InnerTextAsync(), "Cancelado");
            });

            // Put back whatever the demo client had in its cart before the test.
            foreach (var linea in previas)
                await AñadirDesdeCatalogoAsync([], int.TryParse(linea.Cantidad, out var q) ? q : 1, linea.IdProducto, linea.IdVariante);
        }
    }

    [TestMethod]
    public async Task MisPedidos_SoloMuestraLosPedidosDelClienteConectado()
    {
        var cliente = await LeerNombreClienteAsync();

        await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
        var filas = App.Rows(App.Module("mod-vta-pedido-list"));
        var total = await filas.CountAsync();
        Assert.IsTrue(total > 0, "El cliente demo debe tener pedidos.");
        for (var i = 0; i < total; i++)
            StringAssert.Contains(await filas.Nth(i).InnerTextAsync(), cliente, "Un pedido de 'Mis pedidos' no es del cliente conectado.");
    }

    [TestMethod]
    public async Task DetalleDePedido_MuestraSeguimientoLineasYSoloAccionesDeCliente()
    {
        await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
        await App.OpenRowAsync(App.Module("mod-vta-pedido-list"), "Entregado");
        await App.WaitForPageAsync("VTA_Pedido_Cliente_View");

        var ficha = App.Module("mod-vta-pedido-cliente-view");
        var texto = FlexygoApp.Clean(await ficha.InnerTextAsync());
        StringAssert.Contains(texto, "Seguimiento del pedido");
        foreach (var estado in new[] { "Borrador", "Confirmado", "En proceso", "Enviado", "Entregado" })
            StringAssert.Contains(texto, estado);

        var lineas = App.Module("mod-vta-lineapedido-detalle-list").Locator(".crd-row");
        Assert.IsTrue(await lineas.CountAsync() > 0, "El pedido debe mostrar sus líneas.");
        await Assertions.Expect(lineas.First).ToContainTextAsync("Solicitar devolución");

        await Assertions.Expect(App.HeaderButton(ficha, "Imprimir Recibo")).ToBeVisibleAsync();
        await Assertions.Expect(App.HeaderButton(ficha, "Abrir incidencia")).ToBeVisibleAsync();
        Assert.AreEqual(0, await ficha.Locator(".cntHeader button[data-type=\"edit\"]").CountAsync(), "El cliente no debe poder editar un pedido.");
        foreach (var soloAdmin in new[] { "Confirmar", "Cancelar", "Generar PDF" })
            Assert.AreEqual(0, await ficha.Locator($".cntHeader button[data-original-title=\"{soloAdmin}\"]").CountAsync(), $"El cliente no debe ver '{soloAdmin}'.");
    }

    [TestMethod]
    public async Task ImprimirRecibo_GeneraElPdfDelPedido()
    {
        await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
        await App.OpenRowAsync(App.Module("mod-vta-pedido-list"), "Entregado");
        await App.WaitForPageAsync("VTA_Pedido_Cliente_View");

        var numero = Regex.Match(FlexygoApp.Clean(await App.Module("mod-vta-pedido-cliente-view").InnerTextAsync()), @"(PED|CARR)-\d+").Value;

        var descarga = await Page.RunAndWaitForDownloadAsync(
            () => App.HeaderButton(App.Module("mod-vta-pedido-cliente-view"), "Imprimir Recibo").ClickAsync(),
            new() { Timeout = 30000 });

        Assert.AreEqual($"Pedido_{numero}.pdf", descarga.SuggestedFilename);
        var fichero = await descarga.PathAsync();
        var cabecera = new byte[4];
        await using (var f = File.OpenRead(fichero)) await f.ReadExactlyAsync(cabecera);
        Assert.AreEqual("%PDF", System.Text.Encoding.ASCII.GetString(cabecera), "La descarga no es un PDF.");
        Assert.IsTrue(new FileInfo(fichero).Length > 1000, "El PDF del recibo está vacío.");
    }
}
