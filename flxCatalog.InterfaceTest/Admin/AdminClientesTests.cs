using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

[TestClass]
[TestCategory("Admin")]
public class AdminClientesTests : AdminTestBase
{
    [TestMethod]
    public async Task Clientes_ListadoYFichaConPedidosYArticulosMasComprados()
    {
        await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
        var lista = App.Module("mod-cli-cliente-list");
        Assert.AreEqual(50, await App.Rows(lista).CountAsync(), "El listado de clientes pagina de 50 en 50.");
        await Assertions.Expect(App.Rows(lista).First).ToContainTextAsync(new System.Text.RegularExpressions.Regex(@"CLI-\d+"));

        await App.OpenRowAsync(lista);
        await App.WaitForPageAsync("CLI_Cliente_View");
        var ficha = App.Module("mod-cli-cliente-view");
        await Assertions.Expect(App.HeaderButton(ficha, "Editar")).ToBeVisibleAsync();
        foreach (var campo in new[] { "CIF", "Tarifa" })
            await Assertions.Expect(ficha).ToContainTextAsync(campo);
        await Assertions.Expect(App.Module("mod-vta-pedido-list-cliente")).ToBeVisibleAsync();
        await Assertions.Expect(App.Module("mod-cli-cliente-top-productos-echart").Locator("canvas, svg").First).ToBeVisibleAsync();
    }

    [TestMethod]
    public async Task Cliente_AltaYBorrado()
    {
        var codigo = UniqueTag();
        var razonSocial = $"Cliente {codigo} S.L.";
        await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
        await App.HeaderButton(App.Module("mod-cli-cliente-list"), "Nuevo").ClickAsync();
        await App.WaitForAjaxAsync();

        var form = App.EditForm;
        await App.FillAsync(form, "RazonSocial", razonSocial);
        await App.FillAsync(form, "CodigoCliente", codigo);
        await App.FillAsync(form, "CifNif", "B00000000");
        await App.ChooseAsync(form, "IdTarifa", "Público");
        await App.FillAsync(form, "Email", "pruebas@example.com");
        await App.SaveAsync();
        var guardado = await App.TryWaitForNotifyAsync();
        Assert.IsTrue(guardado is null || guardado.IsSuccess, $"El cliente no se guardó: {guardado?.Text}");

        // After saving, the form stays open on the record it just created: it now reads back what
        // was typed and offers "Eliminar", which a new, unsaved form does not.
        var formulario = App.Module("sysmod-edit-generic");
        await Assertions.Expect(App.Field(App.EditForm, "RazonSocial")).ToHaveValueAsync(razonSocial);
        await Assertions.Expect(App.Field(App.EditForm, "CodigoCliente")).ToHaveValueAsync(codigo);
        await App.DeleteCurrentRecordAsync(formulario);
    }
}
