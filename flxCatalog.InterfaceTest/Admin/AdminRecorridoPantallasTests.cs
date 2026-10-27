using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

/// <summary>
/// Walks every back-office screen: each list opens with rows, and its first row opens the record
/// page it is meant to. Leaves a full-height capture of each screen under .playwright-mcp/ so the
/// verification has something to look at besides a green tick.
/// </summary>
[TestClass]
[TestCategory("Admin")]
[TestCategory("Recorrido")]
public class AdminRecorridoPantallasTests : AdminTestBase
{
    [DataTestMethod]
    [DataRow("CAT_Producto_List", "CAT_Producto_View")]
    [DataRow("CAT_Familia_List", "CAT_Familia_View")]
    [DataRow("CAT_Marca_List", "CAT_Marca_View")]
    [DataRow("CAT_Color_List", "CAT_Color_View")]
    [DataRow("CAT_Talla_List", "CAT_Talla_View")]
    [DataRow("CLI_Cliente_List", "CLI_Cliente_View")]
    [DataRow("VTA_Pedido_List", "VTA_Pedido_View")]
    [DataRow("VTA_Devolucion_List", "VTA_Devolucion_View")]
    [DataRow("VTA_Incidencia_List", "VTA_Incidencia_View")]
    [DataRow("VTA_Tarifa_List", "VTA_Tarifa_View")]
    [DataRow("VTA_EstadoPedido_List", "VTA_EstadoPedido_View")]
    [DataRow("VTA_EstadoDevolucion_List", "VTA_EstadoDevolucion_View")]
    [DataRow("VTA_EstadoIncidencia_List", "VTA_EstadoIncidencia_View")]
    [DataRow("VTA_TipoIncidencia_List", "VTA_TipoIncidencia_View")]
    public async Task Lista_TieneFilas_YSuFilaAbreLaFicha(string lista, string ficha)
    {
        await App.NavigateAsync(lista);
        await App.WaitForPageAsync(lista);
        var modulo = App.MainPage.Locator("flx-module:has(.row-line flx-navbutton)").First;
        Assert.IsTrue(await App.Rows(modulo).CountAsync() > 0, $"'{lista}' no muestra ninguna fila.");
        await CapturarAsync(lista);

        await App.OpenRowAsync(modulo);
        await App.WaitForPageAsync(ficha);
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{ficha}' abrió sin módulos.");
        await CapturarAsync(ficha);
    }

    [DataTestMethod]
    [DataRow("VTA_Dashboard_Page")]
    [DataRow("VTA_MesaTrabajo_Page")]
    [DataRow("HOME")]
    public async Task Pantalla_SeAbreConSusModulos(string pagina)
    {
        await App.NavigateAsync(pagina);
        await App.WaitForPageAsync(pagina);
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{pagina}' abrió sin módulos.");
        await CapturarAsync(pagina);
    }

    [DataTestMethod]
    [DataRow("Incidencias", "mod-vta-mesa-incidencias-kanban")]
    [DataRow("Pedidos", "mod-vta-mesa-pedidos-kanban")]
    [DataRow("Devoluciones", "mod-vta-mesa-devoluciones-kanban")]
    public async Task MesaDeTrabajo_CadaPestañaPintaSusTarjetas(string pestaña, string modulo)
    {
        await App.OpenMenuAsync("Mesa de trabajo", "VTA_MesaTrabajo_Page");
        await App.MainPage.GetByText(pestaña, new() { Exact = true }).First.ClickAsync();
        await App.WaitForAjaxAsync();
        // Every card of the three boards names its order (PED-xxxx).
        // Inside the tab container the board is not wrapped in a flx-module, so look it up by name alone.
        await Assertions.Expect(App.MainPage.Locator($"[modulename=\"{modulo}\"]:visible").First).ToContainTextAsync("PED-");
        await CapturarAsync($"VTA_MesaTrabajo_Page-{pestaña}");
    }

    private Task CapturarAsync(string nombre) => CaptureScreenAsync($"verify-admin-{nombre}");
}
