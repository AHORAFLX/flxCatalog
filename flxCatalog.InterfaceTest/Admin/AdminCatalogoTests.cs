using System.Text.RegularExpressions;
using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

[TestClass]
[TestCategory("Admin")]
public class AdminCatalogoTests : AdminTestBase
{
    private ILocator FichaProducto => App.Module("mod-cat-producto-view");

    /// <summary>Opens a product's back-office card through the global search (by reference or name).</summary>
    private async Task AbrirProductoAsync(string texto, string? fila = null)
    {
        var resultados = await App.GlobalSearchAsync(texto, fila);
        await resultados.First.ClickAsync();
        await App.WaitForPageAsync("CAT_Producto_View");
    }

    /// <summary>A product with variants cannot be deleted; its variants go first, then the product.</summary>
    private async Task BorrarProductoAbiertoAsync()
    {
        var variantes = App.Module("mod-cat-variante-list-producto");
        for (var i = 0; i < 50 && await variantes.Locator("button[data-type=\"objectmenu\"]").CountAsync() > 0; i++)
        {
            await variantes.Locator("button[data-type=\"objectmenu\"]").First.ClickAsync();
            await App.WaitForAjaxAsync();
            await Page.Locator("li:visible > span[onclick*='deleteModule']").Last.ClickAsync();
            await App.ConfirmYesAsync();
            await App.WaitForNotifyAsync();
        }
        await App.DeleteCurrentRecordAsync(FichaProducto);
    }

    [TestMethod]
    public async Task Productos_ListadoYFichaConVariantesYAcciones()
    {
        await App.OpenMenuAsync("Productos", "CAT_Producto_List");
        var lista = App.Module("mod-cat-producto-list");
        Assert.AreEqual(50, await App.Rows(lista).CountAsync(), "El listado de productos pagina de 50 en 50.");

        // No todas las familias tienen variantes (solo ROPA/CALZADO): el listado no garantiza
        // ningún orden concreto, así que se busca entre las primeras filas hasta dar con un
        // producto que sí las tenga, en vez de asumir que la primera fila es una de ellas.
        var conVariantes = false;
        for (var i = 0; i < 10 && !conVariantes; i++)
        {
            await App.OpenMenuAsync("Productos", "CAT_Producto_List");
            await App.Rows(App.Module("mod-cat-producto-list")).Nth(i).Locator("flx-navbutton > *").First.ClickAsync();
            await App.WaitForPageAsync("CAT_Producto_View");
            conVariantes = await App.Rows(App.Module("mod-cat-variante-list-producto")).CountAsync() > 0;
        }
        Assert.IsTrue(conVariantes, "Ningún producto entre los primeros diez muestra variantes.");

        StringAssert.Matches(FlexygoApp.Clean(await FichaProducto.InnerTextAsync()), new Regex(@"REF-\d+"));
        foreach (var accion in new[] { "Editar", "Duplicar", "Archivar" })
            await Assertions.Expect(App.HeaderButton(FichaProducto, accion)).ToBeVisibleAsync();
    }

    [TestMethod]
    public async Task Producto_AltaArchivadoYBorrado()
    {
        var referencia = UniqueTag();
        await App.OpenMenuAsync("Productos", "CAT_Producto_List");
        await App.HeaderButton(App.Module("mod-cat-producto-list"), "Nuevo").ClickAsync();
        await App.WaitForAjaxAsync();

        var form = App.EditForm;
        await App.FillAsync(form, "Referencia", referencia);
        await App.FillAsync(form, "Nombre", $"Producto {referencia}");
        await App.ChooseAsync(form, "IdFamilia", "Botas");
        await App.ChooseAsync(form, "IdMarca", "Norden");
        await App.FillAsync(form, "PrecioBase", "10");
        await App.FillAsync(form, "Stock", "5");
        await App.SaveAsync();
        var guardado = await App.TryWaitForNotifyAsync();
        Assert.IsTrue(guardado is null || guardado.IsSuccess, $"El producto no se guardó: {guardado?.Text}");

        await AbrirProductoAsync(referencia);
        try
        {
            StringAssert.Contains(await FichaProducto.InnerTextAsync(), "Activo");
            var archivado = await App.RunHeaderProcessAsync(FichaProducto, "Archivar");
            Assert.IsTrue(archivado is null || archivado.IsSuccess, $"Archivar falló: {archivado?.Text}");
            await App.WaitForAjaxAsync();
            await Assertions.Expect(FichaProducto).ToContainTextAsync("Inactivo");
        }
        finally
        {
            await BorrarProductoAbiertoAsync();
        }
    }

    [TestMethod]
    public async Task Producto_DuplicarCreaUnaCopiaDesactivada()
    {
        await App.OpenMenuAsync("Productos", "CAT_Producto_List");
        await App.OpenRowAsync(App.Module("mod-cat-producto-list"));
        await App.WaitForPageAsync("CAT_Producto_View");
        var referencia = Regex.Match(FlexygoApp.Clean(await FichaProducto.InnerTextAsync()), @"REF-\d+").Value;

        var aviso = await App.RunHeaderProcessAsync(FichaProducto, "Duplicar");
        Assert.IsNotNull(aviso);
        var copia = $"{referencia}-COPIA";
        try
        {
            StringAssert.Contains(aviso.Text, $"Producto duplicado como {copia}");
            await AbrirProductoAsync(copia, "(copia)");
            var ficha = FlexygoApp.Clean(await FichaProducto.InnerTextAsync());
            StringAssert.Contains(ficha, copia);
            StringAssert.Contains(ficha, "(copia)");
            StringAssert.Contains(ficha, "Inactivo");
        }
        finally
        {
            if (!FlexygoApp.Clean(await FichaProducto.InnerTextAsync()).Contains(copia))
                await AbrirProductoAsync(copia, "(copia)");
            await BorrarProductoAbiertoAsync();
        }
    }

    [DataTestMethod]
    [DataRow("Familias", "CAT_Familia_List", "mod-cat-familia-list", "Orden")]
    [DataRow("Marcas", "CAT_Marca_List", "mod-cat-marca-list", null)]
    public async Task Maestro_AltaYBorrado(string menu, string pagina, string modulo, string? orden)
    {
        var nombre = $"Maestro {UniqueTag()}";
        await App.OpenMenuAsync(menu, pagina);
        await App.HeaderButton(App.Module(modulo), "Nuevo").ClickAsync();
        await App.WaitForAjaxAsync();
        await App.FillAsync(App.EditForm, "Nombre", nombre);
        if (orden is not null) await App.FillAsync(App.EditForm, orden, "999");
        await App.SaveAsync();
        var guardado = await App.TryWaitForNotifyAsync();
        Assert.IsTrue(guardado is null || guardado.IsSuccess, $"No se guardó: {guardado?.Text}");

        await App.OpenMenuAsync(menu, pagina);
        var lista = App.Module(modulo);
        await Assertions.Expect(lista.Locator(".cntBody")).ToContainTextAsync(nombre);
        await App.DeleteRowAsync(lista, nombre);
        await App.OpenMenuAsync(menu, pagina);
        await Assertions.Expect(App.Module(modulo).Locator(".cntBody")).Not.ToContainTextAsync(nombre);
    }

    [DataTestMethod]
    [DataRow("Familias", "CAT_Familia_List", "mod-cat-familia-list", "CAT_Familia_View", "mod-cat-producto-list-familia")]
    [DataRow("Marcas", "CAT_Marca_List", "mod-cat-marca-list", "CAT_Marca_View", "mod-cat-producto-list-marca")]
    public async Task Maestro_SuFichaListaSusProductos(string menu, string pagina, string modulo, string vista, string productos)
    {
        await App.OpenMenuAsync(menu, pagina);
        var filas = App.Rows(App.Module(modulo));
        // The first entry that actually has products (a parent family may hold none directly, and
        // today the demo data puts every product under a single brand).
        for (var i = 0; i < await filas.CountAsync(); i++)
        {
            await filas.Nth(i).Locator("flx-navbutton > *").First.ClickAsync();
            await App.WaitForPageAsync(vista);
            if (await App.Rows(App.Module(productos)).CountAsync() > 0) return;
            await App.OpenMenuAsync(menu, pagina);
            filas = App.Rows(App.Module(modulo));
        }
        Assert.Fail($"Ninguna entrada de {menu} muestra productos en su ficha.");
    }
}
