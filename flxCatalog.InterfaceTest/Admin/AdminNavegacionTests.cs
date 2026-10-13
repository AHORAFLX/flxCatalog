using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

[TestClass]
[TestCategory("Admin")]
public class AdminNavegacionTests : AdminTestBase
{
    [TestMethod]
    public async Task Login_AbreElPanelDeControlConSusIndicadores()
    {
        Assert.AreEqual("HOME", await App.CurrentPageAsync(), "El administrador debe entrar en el panel de control.");

        var kpis = FlexygoApp.Clean(await App.Module("mod-home-kpis-easyinfo").InnerTextAsync());
        foreach (var kpi in new[] { "Ventas hoy", "Pedidos hoy", "Pedidos pendientes", "Clientes activos" })
            StringAssert.Contains(kpis, kpi);

        foreach (var grafico in new[] { "mod-home-ventas-mes-chart", "mod-home-ventas-familia-chart" })
            await Assertions.Expect(App.Module(grafico).Locator("canvas, svg").First).ToBeVisibleAsync();

        Assert.IsTrue(await App.Rows(App.Module("mod-vta-pedido-recent-list")).CountAsync() > 0, "El panel debe listar pedidos recientes.");
    }

    [DataTestMethod]
    [DataRow("Catálogo", "CAT_Producto_Cliente_List")]
    [DataRow("Devoluciones", "VTA_Devolucion_List")]
    [DataRow("Incidencias", "VTA_Incidencia_List")]
    [DataRow("Pedidos", "VTA_Pedido_List")]
    [DataRow("Clientes", "CLI_Cliente_List")]
    [DataRow("Tarifas", "VTA_Tarifa_List")]
    [DataRow("Productos", "CAT_Producto_List")]
    [DataRow("Familias", "CAT_Familia_List")]
    [DataRow("Marcas", "CAT_Marca_List")]
    [DataRow("Panel de control", "HOME")]
    public async Task MenuAdministrador_AbreSuPantalla(string menu, string pagina)
    {
        if (menu == "Panel de control") await App.OpenMenuAsync("Productos", "CAT_Producto_List");
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
