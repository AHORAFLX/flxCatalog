using FLEXYGO.Objects;
using FLEXYGO.Web;

namespace flxCatalog.UnitTest
{
    /// <summary>
    /// Basic integration tests for flxCatalog's own business objects, following the pattern shown
    /// in the platform's own example (a real <see cref="ConfToken"/>, no mocked database): each
    /// test loads a real <see cref="EntityObject"/> through the live ConfConnectionString /
    /// DataConnectionString and checks it resolves and is viewable by the admin ConfToken the
    /// fixture builds.
    ///
    /// The WHERE filters are anchored on values pSeed_ResetDemoData always produces, even though
    /// it randomizes almost everything else on every reset:
    /// - REF-2001 / PED-1001: the first generated product/order (its running "seq" always starts
    ///   at 1, so the number always exists, even though WHICH product or client ends up as #1
    ///   changes every run).
    /// - E391566D-5E36-4C0E-A74D-CF48EDB2C09F: the demo client's IdCliente is hardcoded in the
    ///   seed script on purpose (the 'cliente' and 'admin' logins are wired to it) and survives
    ///   every reset unchanged.
    /// </summary>
    [Collection("Flexygo Test Collection")]
    public class CatalogEntityIntegrationTests
    {
        [Fact(DisplayName = "Given a ConfToken When loading a product by its seeded reference Then can view?")]
        public void GivenConfToken_WhenLoadProducto_ThenCanView()
        {
            // Given
            var ct = GlobalVars.ConfToken;

            // When
            var obj = new EntityObject("CAT_Producto", "Productos.Referencia='REF-2001'", ct);

            // Then
            Assert.True(obj.CanView);
            Assert.Equal("CAT_Producto", obj.Name);
        }

        [Fact(DisplayName = "Given a ConfToken When loading the fixed demo client Then can view?")]
        public void GivenConfToken_WhenLoadClienteDemo_ThenCanView()
        {
            // Given
            var ct = GlobalVars.ConfToken;

            // When
            var obj = new EntityObject("CLI_Cliente", "Clientes.IdCliente='E391566D-5E36-4C0E-A74D-CF48EDB2C09F'", ct);

            // Then
            Assert.True(obj.CanView);
            Assert.Equal("CLI_Cliente", obj.Name);
        }

        [Fact(DisplayName = "Given a ConfToken When loading an order by its seeded number Then can view?")]
        public void GivenConfToken_WhenLoadPedido_ThenCanView()
        {
            // Given
            var ct = GlobalVars.ConfToken;

            // When
            var obj = new EntityObject("VTA_Pedido", "Pedidos.Numero='PED-1001'", ct);

            // Then
            Assert.True(obj.CanView);
            Assert.Equal("VTA_Pedido", obj.Name);
        }
    }
}
