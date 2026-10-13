using flxCatalog.InterfaceTest.Infrastructure;

namespace flxCatalog.InterfaceTest.Cliente;

[TestClass]
[TestCategory("Cliente")]
public class ClienteNavegacionTests : ClienteTestBase
{
    [TestMethod]
    public async Task Login_AbreLaPortadaDelCliente()
    {
        Assert.AreEqual(HomeCliente, await App.CurrentPageAsync(), "El cliente debe entrar en su portada.");

        var saludo = App.Module("mod-home-cliente-saludo-html");
        StringAssert.Contains(await saludo.InnerTextAsync(), "Bienvenido");
        StringAssert.Contains(await saludo.InnerTextAsync(), "Tarifa asignada");

        var recientes = App.Module("mod-vta-pedido-home-list");
        Assert.IsTrue(await App.Rows(recientes).CountAsync() > 0, "La portada debe listar los pedidos recientes del cliente.");
    }

    [DataTestMethod]
    [DataRow("Catálogo", "CAT_Producto_Cliente_List")]
    [DataRow("Mi carrito", "VTA_Pedido_MiCarrito_View")]
    [DataRow("Mis pedidos", "VTA_Pedido_List")]
    [DataRow("Mi ficha", "CLI_Cliente_Mi_Ficha_View")]
    [DataRow("Mis favoritos", "CAT_Producto_Cliente_List")]
    [DataRow("Mis documentos", "VTA_MisDocumentos_List")]
    [DataRow("Mis devoluciones", "VTA_Devolucion_List")]
    [DataRow("Mis incidencias", "VTA_Incidencia_List")]
    [DataRow("Mis notificaciones", "COM_MisNotificaciones_List")]
    public async Task MenuCliente_AbreSuPantalla(string menu, string pagina)
    {
        await App.OpenMenuAsync(menu, pagina);
        Assert.AreEqual(pagina, await App.CurrentPageAsync());
        Assert.IsTrue(await App.MainPage.Locator("flx-module").CountAsync() > 0, $"'{menu}' abrió una página sin módulos.");
    }

    [TestMethod]
    public async Task MenuCliente_NoOfreceOpcionesDeAdministracion()
    {
        string[] soloAdmin = ["Productos", "Familias", "Marcas", "Clientes", "Tarifas", "Panel de control", "Datos maestros", "Administración"];
        foreach (var opcion in soloAdmin)
            Assert.AreEqual(0, await App.NavNode(opcion).CountAsync(), $"El menú del cliente no debe ofrecer '{opcion}'.");
    }
}
