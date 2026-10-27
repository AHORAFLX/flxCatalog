using System.Text.RegularExpressions;
using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Cliente;

[TestClass]
[TestCategory("Cliente")]
public class ClienteCatalogoTests : ClienteTestBase
{
    private ILocator Catalogo => App.Module("mod-cat-producto-cliente-list");
    private ILocator Tarjetas => Catalogo.Locator(".cli-card");

    private async Task AbrirCatalogoAsync() => await App.OpenMenuAsync("Catálogo", "CAT_Producto_Cliente_List");

    [TestMethod]
    public async Task Catalogo_MuestraProductosConFotoPrecioYPaginacion()
    {
        await AbrirCatalogoAsync();

        var total = int.Parse(await Catalogo.Locator(".pager .numRows").First.InnerTextAsync());
        Assert.IsTrue(total > 0, "El catálogo no muestra el total de productos.");

        var tarjetas = await Tarjetas.CountAsync();
        Assert.AreEqual(Math.Min(total, 50), tarjetas, "La primera página debe mostrar 50 productos (o todos si hay menos).");

        var primera = Tarjetas.First;
        StringAssert.Matches(await primera.Locator(".cli-price").InnerTextAsync(), new Regex(@"\d+,\d{2}\s*€"));
        StringAssert.Contains(await primera.Locator("img.cli-photo").GetAttributeAsync("src") ?? "", "/images/productos/");
        Assert.IsTrue(await primera.Locator("button.cli-add").IsVisibleAsync(), "Cada producto debe poder añadirse al carrito.");
        Assert.IsTrue(await primera.Locator("button.cli-fav").IsVisibleAsync(), "Cada producto debe poder marcarse como favorito.");
    }

    [TestMethod]
    public async Task FichaDeProducto_SeAbreEnVentanaConSusReseñas()
    {
        await AbrirCatalogoAsync();
        var nombre = await Tarjetas.First.Locator(".cli-name").InnerTextAsync();

        await Tarjetas.First.Locator("flx-navbutton.cli-open > *").First.ClickAsync();
        await App.WaitForAjaxAsync();

        var ficha = App.Dialog;
        StringAssert.Contains(await ficha.InnerTextAsync(), nombre.Trim());
        var reseñas = ficha.Locator(".catrev-box");
        await Assertions.Expect(reseñas).ToBeVisibleAsync();
        await Assertions.Expect(reseñas.Locator(".catrev-loading")).ToHaveCountAsync(0);
        StringAssert.Matches(await reseñas.Locator(".catrev-badge").InnerTextAsync(), new Regex(@"reseña|\d,\d"));
    }

    [TestMethod]
    public async Task Buscador_EncuentraUnProductoYAbreSuFicha()
    {
        await AbrirCatalogoAsync();
        var nombre = (await Tarjetas.First.Locator(".cli-name").InnerTextAsync()).Trim();

        var resultados = await App.GlobalSearchAsync(nombre);
        await resultados.First.ClickAsync();
        await App.WaitForAjaxAsync();

        Assert.AreEqual("syspage-view-default", await App.CurrentPageAsync());
        StringAssert.Contains(await App.MainPage.InnerTextAsync(), nombre);
    }

    [TestMethod]
    public async Task Favoritos_SeMarcanDesdeElCatalogoYSeQuitanDesdeMisFavoritos()
    {
        await AbrirCatalogoAsync();
        // Pin the card by product id: a filter on "not yet a favourite" would move to another card after the click.
        var idProducto = await Tarjetas.Locator("button.cli-fav:not(.cli-fav-on)").First.GetAttributeAsync("data-idproducto");
        var tarjeta = Tarjetas.Filter(new() { Has = Page.Locator($"button.cli-fav[data-idproducto=\"{idProducto}\"]") }).First;
        var nombre = (await tarjeta.Locator(".cli-name").InnerTextAsync()).Trim();

        await tarjeta.Locator("button.cli-fav").ClickAsync();
        await Assertions.Expect(tarjeta.Locator("button.cli-fav")).ToHaveTextAsync("★");
        await App.WaitForAjaxAsync();

        try
        {
            await App.OpenMenuAsync("Mis favoritos", "CAT_Producto_Cliente_List");
            var favorito = Tarjetas.Filter(new() { HasText = nombre });
            await Assertions.Expect(favorito).ToHaveCountAsync(1);
            var totalFavoritos = await Tarjetas.CountAsync();
            Assert.IsTrue(totalFavoritos < 50, "Mis favoritos debe mostrar solo los favoritos, no el catálogo entero.");

            await favorito.Locator("button.cli-fav").ClickAsync();
            await Assertions.Expect(favorito.Locator("button.cli-fav")).ToHaveTextAsync("☆");
            await App.WaitForAjaxAsync();
        }
        finally
        {
            await App.OpenMenuAsync("Mis favoritos", "CAT_Producto_Cliente_List");
        }

        await Assertions.Expect(Tarjetas.Filter(new() { HasText = nombre })).ToHaveCountAsync(0);
    }

    [TestMethod]
    public async Task Comparador_ComparaLosProductosSeleccionados()
    {
        await AbrirCatalogoAsync();
        var nombres = new List<string>();
        for (var i = 0; i < 2; i++)
        {
            var tarjeta = Tarjetas.Nth(i);
            nombres.Add((await tarjeta.Locator(".cli-name").InnerTextAsync()).Trim());
            await tarjeta.Locator("input.cli-cmp-chk").CheckAsync();
        }

        await Page.EvaluateAsync("() => cliCompareGo()");
        await App.WaitForPageAsync("CAT_Producto_Comparador_List");

        var tabla = App.Module("mod-comparador-productos-html");
        await Assertions.Expect(tabla.Locator(".cmp-col")).ToHaveCountAsync(2);
        foreach (var n in nombres) StringAssert.Contains(await tabla.InnerTextAsync(), n);

        await Page.EvaluateAsync("() => cliCompareClear()");
    }

    [TestMethod]
    public async Task Reseña_ProductoNoComprado_ExplicaPorQueNoSePuedeEscribir()
    {
        await AbrirCatalogoAsync();
        // Walk the catalogue until a product the client has never bought turns up.
        for (var i = 0; i < 10; i++)
        {
            await Tarjetas.Nth(i).Locator("flx-navbutton.cli-open > *").First.ClickAsync();
            await App.WaitForAjaxAsync();
            var formulario = App.Dialog.Locator(".catrev-form");
            await Assertions.Expect(formulario).Not.ToBeEmptyAsync();
            if (await formulario.Locator(".catrev-form-locked").CountAsync() > 0)
            {
                StringAssert.Contains(await formulario.InnerTextAsync(), "Solo puedes escribir una reseña de un producto que hayas comprado");
                Assert.AreEqual(0, await formulario.Locator(".catrev-submit").CountAsync());
                return;
            }
            await App.CloseDialogAsync();
        }
        Assert.Inconclusive("Los 10 primeros productos del catálogo ya los ha comprado el cliente demo.");
    }

    [TestMethod]
    public async Task Reseña_ProductoComprado_SePublicaYApareceEnLaLista()
    {
        // A product the client really bought: the first line of a delivered order (other tests leave
        // drafts and cancelled orders at the top of the list, some of them with no lines at all).
        await App.OpenMenuAsync("Mis pedidos", "VTA_Pedido_List");
        await App.OpenRowByTextAsync(App.Module("mod-vta-pedido-list"), "Entregado");
        await App.WaitForPageAsync("VTA_Pedido_Cliente_View");
        var producto = (await App.Module("mod-vta-lineapedido-detalle-list").Locator(".crd-row .crd-name").First.InnerTextAsync()).Trim();

        var resultados = await App.GlobalSearchAsync(producto);
        await resultados.First.ClickAsync();
        await App.WaitForAjaxAsync();

        var caja = App.MainPage.Locator(".catrev-box");
        var formulario = caja.Locator(".catrev-form");
        await Assertions.Expect(formulario.Locator(".catrev-submit")).ToBeVisibleAsync();

        var texto = $"Opinión automática {UniqueTag()}";
        await formulario.Locator(".catrev-star-pick[data-value=\"4\"]").ClickAsync();
        await formulario.Locator("textarea.catrev-textarea").FillAsync(texto);
        await formulario.Locator(".catrev-submit").ClickAsync();
        await App.WaitForAjaxAsync();

        try
        {
            await Assertions.Expect(caja.Locator(".catrev-list")).ToContainTextAsync(texto);
        }
        finally
        {
            // The client cannot delete a review; the administrator removes it from the product's comments.
            await AsAdminAsync(async admin =>
            {
                await admin.OpenPageAsync("list", "COM_Comentarios");
                await admin.DeleteRowAsync(admin.Module("sysmod-list-generic"), texto);
            });
        }
    }
}
