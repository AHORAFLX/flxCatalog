using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Cliente;

/// <summary>
/// Walks every screen of the client portal from its own menu, opens a record from each list the
/// client has, and leaves a full-height capture of each one under .playwright-mcp/.
/// </summary>
[TestClass]
[TestCategory("Cliente")]
[TestCategory("Recorrido")]
public class ClienteRecorridoPantallasTests : ClienteTestBase
{
    [TestMethod]
    public async Task Portada_SeAbreAlEntrar()
    {
        Assert.AreEqual(HomeCliente, await App.CurrentPageAsync(), "El cliente debe entrar en su portada.");
        await CaptureScreenAsync("verify-cliente-HomeCliente");
    }

    [DataTestMethod]
    [DataRow("Catálogo", "CAT_Producto_Cliente_List", "Catalogo")]
    [DataRow("Mis favoritos", "CAT_Producto_Cliente_List", "Favoritos")]
    [DataRow("Mi carrito", "VTA_Pedido_MiCarrito_View", "MiCarrito")]
    [DataRow("Mi ficha", "CLI_Cliente_Mi_Ficha_View", "MiFicha")]
    [DataRow("Mis documentos", "VTA_MisDocumentos_List", "MisDocumentos")]
    [DataRow("Mis notificaciones", "COM_MisNotificaciones_List", "MisNotificaciones")]
    public async Task Menu_AbreSuPantalla(string menu, string pagina, string captura)
    {
        await App.OpenMenuAsync(menu, pagina);
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{menu}' abrió una página sin módulos.");
        await CaptureScreenAsync($"verify-cliente-{captura}");
    }

    [DataTestMethod]
    [DataRow("Mis pedidos", "VTA_Pedido_List", "VTA_Pedido_Cliente_View", "MisPedidos")]
    [DataRow("Mis devoluciones", "VTA_Devolucion_List", null, "MisDevoluciones")]
    [DataRow("Mis incidencias", "VTA_Incidencia_List", null, "MisIncidencias")]
    public async Task Lista_TieneFilas_YSuFilaAbreElRegistro(string menu, string lista, string? ficha, string captura)
    {
        await App.OpenMenuAsync(menu, lista);
        var modulo = App.MainPage.Locator("flx-module:has(.row-line flx-navbutton)").First;
        if (await modulo.CountAsync() == 0)
        {
            // The demo client may have none (the post-sale tests create theirs and remove them): then the
            // screen owes it a readable empty state, not a blank box.
            StringAssert.Matches(await App.MainPage.InnerTextAsync(), new System.Text.RegularExpressions.Regex("No hay|todavía|aún", System.Text.RegularExpressions.RegexOptions.IgnoreCase));
            await CaptureScreenAsync($"verify-cliente-{captura}");
            return;
        }
        await CaptureScreenAsync($"verify-cliente-{captura}");

        await App.OpenRowAsync(modulo);
        if (ficha is not null) await App.WaitForPageAsync(ficha);
        var abierto = await App.CurrentPageAsync();
        Assert.AreNotEqual(lista, abierto, $"La fila de '{menu}' no abrió el registro.");
        await CaptureScreenAsync($"verify-cliente-{captura}-{abierto}");
    }

    /// <summary>Pages of the portal no menu entry points at any more; they still have to open cleanly by name.</summary>
    [DataTestMethod]
    [DataRow("CAT_Favorito_Cliente_List")]
    [DataRow("CLI_Cliente_Mi_Ficha_List")]
    public async Task PaginaSinMenu_SeAbrePorNombre(string pagina)
    {
        await App.NavigateAsync(pagina);
        await App.WaitForPageAsync(pagina);
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{pagina}' abrió sin módulos.");
        await CaptureScreenAsync($"verify-cliente-{pagina}");
    }

    [TestMethod]
    public async Task FichaDeProducto_YComparador()
    {
        await App.OpenMenuAsync("Catálogo", "CAT_Producto_Cliente_List");
        var tarjetas = App.MainPage.Locator(".cli-card");

        await tarjetas.First.Locator("flx-navbutton.cli-open > *").First.ClickAsync();
        await App.WaitForAjaxAsync();
        await Assertions.Expect(App.Dialog.Locator(".catrev-box")).ToBeVisibleAsync();
        await Page.WaitForTimeoutAsync(800);
        await Page.ScreenshotAsync(new() { Path = Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", ".playwright-mcp", "verify-cliente-FichaProducto.png") });
        await App.CloseDialogAsync();

        for (var i = 0; i < 2; i++) await tarjetas.Nth(i).Locator("input.cli-cmp-chk").CheckAsync();
        await Page.EvaluateAsync("() => cliCompareGo()");
        await App.WaitForPageAsync("CAT_Producto_Comparador_List");
        await CaptureScreenAsync("verify-cliente-Comparador");
        await Page.EvaluateAsync("() => cliCompareClear()");
    }
}
