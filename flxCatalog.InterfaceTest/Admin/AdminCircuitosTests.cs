using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

/// <summary>
/// Complete create / modify / delete circuits of the back office. The create-and-delete halves of
/// these also exist in AdminCatalogoTests, AdminClientesTests and AdminVentasTests; what none of
/// them covered was the modification, which is what these add (and check by reading it back).
/// </summary>
[TestClass]
[TestCategory("Admin")]
public class AdminCircuitosTests : AdminTestBase
{
    [TestMethod]
    public async Task Articulo_AltaModificacionYBorrado()
    {
        var referencia = UniqueTag();
        var ficha = App.Module("mod-cat-producto-view");

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
        Assert.IsTrue(guardado is null || guardado.IsSuccess, $"El artículo no se guardó: {guardado?.Text}");

        var resultados = await App.GlobalSearchAsync(referencia);
        await resultados.First.ClickAsync();
        await App.WaitForPageAsync("CAT_Producto_View");
        try
        {
            await App.EditRecordAsync(ficha, async f =>
            {
                await App.FillAsync(f, "Nombre", $"Producto {referencia} editado");
                await App.FillAsync(f, "PrecioBase", "12");
            });

            // Read it back from a fresh search, not from the form that was just typed in.
            var otra = await App.GlobalSearchAsync(referencia, "editado");
            await otra.First.ClickAsync();
            await App.WaitForPageAsync("CAT_Producto_View");
            await Assertions.Expect(ficha).ToContainTextAsync($"Producto {referencia} editado");
        }
        finally
        {
            await App.DeleteCurrentRecordAsync(ficha);
        }
    }

    [TestMethod]
    public async Task Cliente_AltaModificacionYBorrado()
    {
        var codigo = UniqueTag();
        var razonSocial = $"Cliente {codigo} S.L.";
        var modificada = $"Cliente {codigo} Mod S.L.";
        var lista = App.Module("mod-cli-cliente-list");
        var textoParaBorrar = razonSocial;

        await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
        await App.HeaderButton(lista, "Nuevo").ClickAsync();
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

        try
        {
            await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
            await App.OpenRowByTextAsync(lista, razonSocial);
            await App.WaitForPageAsync("CLI_Cliente_View");
            var ficha = App.Module("mod-cli-cliente-view");
            await App.EditRecordAsync(ficha, async f =>
            {
                await App.FillAsync(f, "RazonSocial", modificada);
                await App.FillAsync(f, "Email", "modificado@example.com");
            });
            textoParaBorrar = modificada;

            await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
            await App.OpenRowByTextAsync(lista, modificada);
            await App.WaitForPageAsync("CLI_Cliente_View");
            await Assertions.Expect(App.Module("mod-cli-cliente-view")).ToContainTextAsync(modificada);
            await Assertions.Expect(App.Module("mod-cli-cliente-view")).ToContainTextAsync("modificado@example.com");
        }
        finally
        {
            await App.OpenMenuAsync("Clientes", "CLI_Cliente_List");
            await App.DeleteRowAsync(lista, textoParaBorrar);
        }
    }

    [TestMethod]
    public async Task Tarifa_AltaModificacionYBorrado()
    {
        var nombre = $"Tarifa {UniqueTag()}";
        var modificada = $"{nombre} Mod";
        var lista = App.Module("mod-vta-tarifa-list");
        var textoParaBorrar = nombre;

        await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
        await App.HeaderButton(lista, "Nuevo").ClickAsync();
        await App.WaitForAjaxAsync();
        await App.FillAsync(App.EditForm, "Nombre", nombre);
        await App.SaveAsync();
        var guardado = await App.TryWaitForNotifyAsync();
        Assert.IsTrue(guardado is null || guardado.IsSuccess, $"La tarifa no se guardó: {guardado?.Text}");

        try
        {
            await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
            await App.OpenRowByTextAsync(lista, nombre);
            await App.WaitForPageAsync("VTA_Tarifa_View");
            await App.EditRecordAsync(App.Module("mod-vta-tarifa-view"), f => App.FillAsync(f, "Nombre", modificada));
            textoParaBorrar = modificada;

            await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
            await Assertions.Expect(lista.Locator(".cntBody")).ToContainTextAsync(modificada);
        }
        finally
        {
            await App.OpenMenuAsync("Tarifas", "VTA_Tarifa_List");
            await App.DeleteRowAsync(lista, textoParaBorrar);
        }
    }
}
