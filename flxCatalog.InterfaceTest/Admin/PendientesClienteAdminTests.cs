using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

/// <summary>
/// The tasks of the 'pendientes-cliente-admin' development, one test each, named after the task so
/// the run is recorded against it.
/// </summary>
[TestClass]
[TestCategory("Admin")]
public class PendientesClienteAdminTests : AdminTestBase
{
    private static readonly string[] MenuRetiradoAdmin = { "Solicitudes de contacto" };
    private static readonly string[] MenuRetiradoCliente = { "Contacto", "Solicita una demostración" };

    [TestMethod]
    public Task T01_ContactoYDemostracion_NoQuedaNadaEnElMenuDelAdministrador() => SinMenuAdminAsync();

    [TestMethod]
    public async Task T03_ContactoYDemostracion_NoQuedaNadaEnNingunMenu()
    {
        await SinMenuAdminAsync();
        await AsClienteAsync(async cliente =>
        {
            foreach (var opcion in MenuRetiradoCliente)
                Assert.AreEqual(0, await cliente.NavNode(opcion).CountAsync(), $"El menú del cliente aún ofrece '{opcion}'.");
        });
    }

    [TestMethod]
    public async Task T06_TrasElBorrado_LasPantallasDelAdministradorSiguenAbriendo()
    {
        foreach (var (menu, pagina) in new[] { ("Pedidos", "VTA_Pedido_List"), ("Clientes", "CLI_Cliente_List"), ("Productos", "CAT_Producto_List") })
        {
            await App.OpenMenuAsync(menu, pagina);
            Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{menu}' abrió sin módulos.");
        }
    }

    [TestMethod]
    public async Task T11_MesaDeTrabajo_SusTresPestañasPintanTarjetas()
    {
        await App.OpenMenuAsync("Mesa de trabajo", "VTA_MesaTrabajo_Page");
        foreach (var (pestaña, modulo) in new[] { ("Incidencias", "mod-vta-mesa-incidencias-kanban"), ("Pedidos", "mod-vta-mesa-pedidos-kanban"), ("Devoluciones", "mod-vta-mesa-devoluciones-kanban") })
        {
            await App.MainPage.GetByText(pestaña, new() { Exact = true }).First.ClickAsync();
            await App.WaitForAjaxAsync();
            await Assertions.Expect(App.MainPage.Locator($"[modulename=\"{modulo}\"]:visible").First).ToContainTextAsync("PED-");
        }
    }

    [TestMethod]
    public async Task T15_Dashboard_EsElInicioYMuestraIndicadoresYGraficos()
    {
        Assert.AreEqual("VTA_Dashboard_Page", await App.CurrentPageAsync(), "El administrador debe entrar en el dashboard.");
        var kpis = FlexygoApp.Clean(await App.Module("mod-dash-kpis-easyinfo").InnerTextAsync());
        foreach (var kpi in new[] { "Ventas del año", "Pedidos pendientes", "Incidencias abiertas" })
            StringAssert.Contains(kpis, kpi);
        foreach (var grafico in new[] { "mod-dash-top-vendidos-echart", "mod-dash-top-clientes-echart" })
            await Assertions.Expect(App.Module(grafico).Locator("canvas, svg").First).ToBeVisibleAsync();
    }

    private async Task SinMenuAdminAsync()
    {
        foreach (var opcion in MenuRetiradoAdmin)
            Assert.AreEqual(0, await App.NavNode(opcion).CountAsync(), $"El menú de administración aún ofrece '{opcion}'.");
    }
}
