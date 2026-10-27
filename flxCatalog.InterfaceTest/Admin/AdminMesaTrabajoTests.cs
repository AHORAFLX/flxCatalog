using flxCatalog.InterfaceTest.Infrastructure;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Admin;

/// <summary>
/// The work desk's boards are jQuery UI sortables: dragging a card to another lane is the platform's
/// own save of the card's state. Proves the move survives a reload, and always puts the card back.
/// </summary>
[TestClass]
[TestCategory("Admin")]
public class AdminMesaTrabajoTests : AdminTestBase
{
    private const string Solicitada = "CB6E0913-0A81-4C7B-BC78-925F53FCF836";
    private const string EnRevision = "9D2EF704-F145-4596-9D74-B228D341F07F";

    private ILocator Tablero => App.MainPage.Locator("[modulename=\"mod-vta-mesa-devoluciones-kanban\"]:visible").First;

    private ILocator Carril(string estado) => Tablero.Locator($"div.kanban-div[column-id=\"{estado}\"]");

    private async Task AbrirDevolucionesAsync()
    {
        await App.OpenMenuAsync("Mesa de trabajo", "VTA_MesaTrabajo_Page");
        await App.MainPage.GetByText("Devoluciones", new() { Exact = true }).First.ClickAsync();
        await App.WaitForAjaxAsync();
        await Assertions.Expect(Tablero.Locator("li.kanban-card").First).ToBeVisibleAsync();
    }

    private async Task ArrastrarAsync(string cardId, string estado)
    {
        var tarjeta = Tablero.Locator($"li.kanban-card[card-id=\"{cardId}\"]");
        var destino = Carril(estado).Locator("ul.kanban-container");
        var t = (await tarjeta.BoundingBoxAsync())!;
        var d = (await destino.BoundingBoxAsync())!;
        await Page.Mouse.MoveAsync(t.X + t.Width / 2, t.Y + 12);
        await Page.Mouse.DownAsync();
        await Page.Mouse.MoveAsync(t.X + t.Width / 2 + 8, t.Y + 20, new() { Steps = 5 });
        await Page.Mouse.MoveAsync(d.X + d.Width / 2, d.Y + 30, new() { Steps = 25 });
        await Page.Mouse.UpAsync();
        await App.WaitForAjaxAsync();
    }

    [TestMethod]
    public async Task ArrastrarUnaDevolucion_GuardaSuNuevoEstado()
    {
        await AbrirDevolucionesAsync();
        var cardId = await Carril(Solicitada).Locator("li.kanban-card").First.GetAttributeAsync("card-id");
        Assert.IsFalse(string.IsNullOrEmpty(cardId), "No hay ninguna devolución solicitada que mover.");

        try
        {
            await ArrastrarAsync(cardId!, EnRevision);
            await AbrirDevolucionesAsync();
            await Assertions.Expect(Carril(EnRevision).Locator($"li.kanban-card[card-id=\"{cardId}\"]")).ToHaveCountAsync(1);
        }
        finally
        {
            await AbrirDevolucionesAsync();
            if (await Carril(EnRevision).Locator($"li.kanban-card[card-id=\"{cardId}\"]").CountAsync() > 0)
                await ArrastrarAsync(cardId!, Solicitada);
        }

        await AbrirDevolucionesAsync();
        await Assertions.Expect(Carril(Solicitada).Locator($"li.kanban-card[card-id=\"{cardId}\"]")).ToHaveCountAsync(1);
    }
}
