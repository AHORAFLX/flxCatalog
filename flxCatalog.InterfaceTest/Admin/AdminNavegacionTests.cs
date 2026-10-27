using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

[TestClass]
[TestCategory("Admin")]
public class AdminNavegacionTests : AdminTestBase
{
    [TestMethod]
    public async Task Login_AbreElDashboardConSusIndicadores()
    {
        Assert.AreEqual("VTA_Dashboard_Page", await App.CurrentPageAsync(), "El administrador debe entrar en el dashboard.");

        var kpis = FlexygoApp.Clean(await App.Module("mod-dash-kpis-easyinfo").InnerTextAsync());
        foreach (var kpi in new[] { "Ventas del año", "Ventas del mes", "Pedidos pendientes", "Incidencias abiertas", "Devoluciones solicitadas" })
            StringAssert.Contains(kpis, kpi);

        foreach (var grafico in new[] { "mod-dash-top-vendidos-echart", "mod-dash-top-devueltos-echart", "mod-dash-top-clientes-echart", "mod-dash-clientes-problemas-echart" })
            await Assertions.Expect(App.Module(grafico).Locator("canvas, svg").First).ToBeVisibleAsync();
    }

    [DataTestMethod]
    [DataRow("Mesa de trabajo", "VTA_MesaTrabajo_Page")]
    [DataRow("Devoluciones", "VTA_Devolucion_List")]
    [DataRow("Incidencias", "VTA_Incidencia_List")]
    [DataRow("Pedidos", "VTA_Pedido_List")]
    [DataRow("Clientes", "CLI_Cliente_List")]
    [DataRow("Tarifas", "VTA_Tarifa_List")]
    [DataRow("Productos", "CAT_Producto_List")]
    [DataRow("Familias", "CAT_Familia_List")]
    [DataRow("Marcas", "CAT_Marca_List")]
    [DataRow("Colores", "CAT_Color_List")]
    [DataRow("Tallas", "CAT_Talla_List")]
    [DataRow("Estados de pedido", "VTA_EstadoPedido_List")]
    [DataRow("Estados de devolución", "VTA_EstadoDevolucion_List")]
    [DataRow("Estados de incidencia", "VTA_EstadoIncidencia_List")]
    [DataRow("Tipos de incidencia", "VTA_TipoIncidencia_List")]
    [DataRow("Dashboard", "VTA_Dashboard_Page")]
    public async Task MenuAdministrador_AbreSuPantalla(string menu, string pagina)
    {
        if (menu == "Dashboard") await App.OpenMenuAsync("Productos", "CAT_Producto_List");
        await App.OpenMenuAsync(menu, pagina);
        Assert.AreEqual(pagina, await App.CurrentPageAsync());
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{menu}' abrió una página sin módulos.");
    }

    [TestMethod]
    public async Task MenuAdministrador_NoMuestraElMenuDelCliente()
    {
        foreach (var opcion in new[] { "Mi carrito", "Mi ficha", "Mis favoritos", "Mis documentos" })
            Assert.AreEqual(0, await App.NavNode(opcion).CountAsync(), $"El menú de administración no debe ofrecer '{opcion}'.");
    }
}
