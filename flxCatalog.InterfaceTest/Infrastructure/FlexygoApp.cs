using System.Text.RegularExpressions;
using Microsoft.Playwright;

namespace flxCatalog.InterfaceTest.Infrastructure;

public sealed record Notify(string Kind, string Text)
{
    public bool IsSuccess => Kind == "success";
    public bool IsError => Kind == "error";
}

/// <summary>
/// Page object for the Flexygo 2026 shell. Every selector here was measured on the running
/// application: the main page is main.realMain[pagename], a module is flx-module[modulename], a
/// list row is .row-line holding an flx-navbutton (which paints 0x0, so its first child is what
/// gets clicked), a process opens a jQuery-UI dialog (position: fixed, so only :visible finds it),
/// and loading is over when jQuery has no request in flight.
/// </summary>
public sealed class FlexygoApp(IPage page, TestSettings settings)
{
    public IPage Page { get; } = page;

    public ILocator MainPage => Page.Locator("main.realMain.pageContainer");
    public ILocator Dialog => Page.Locator(".ui-dialog:visible").Last;

    // ---------- session ----------

    public async Task LoginAsync(Credentials credentials)
    {
        await Page.GotoAsync($"{settings.Url}/Account/Login");
        await Page.Locator("#username").FillAsync(credentials.User);
        await Page.Locator("#password").FillAsync(credentials.Password);
        await Page.Locator("#MainButton").ClickAsync();
        await Page.WaitForURLAsync(new Regex(@"/Index", RegexOptions.IgnoreCase));
        await Page.Locator("#mainNav").WaitForAsync(new() { State = WaitForSelectorState.Attached });
        await Page.Locator("main.realMain.pageContainer[pagename]").WaitForAsync(new() { State = WaitForSelectorState.Attached });
        await Page.EvaluateAsync("() => { flexygo.utils.animationTime = 0; flexygo.utils.testMode = true; }");
        await WaitForAjaxAsync();
        await AcceptPrivacyNoticeAsync();
        await DeclineTourInvitationAsync();
    }

    /// <summary>
    /// The welcome tours of the administrator and the client invite on their own the first time, and
    /// every test starts a clean browser, so the invitation's overlay would sit over every click.
    /// </summary>
    private async Task DeclineTourInvitationAsync()
    {
        var notNow = Page.Locator(".driver-popover:visible button:has-text(\"Ahora no\")").First;
        try { await notNow.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 3000 }); }
        catch (TimeoutException) { return; }
        await notNow.ClickAsync();
        await Page.Locator(".driver-overlay").WaitForAsync(new() { State = WaitForSelectorState.Detached });
    }

    /// <summary>
    /// Since 10.0.0-beta.137 the platform asks every user, once, to accept its data-collection
    /// notice in a modal that blocks every click behind it until it is accepted.
    /// </summary>
    private async Task AcceptPrivacyNoticeAsync()
    {
        var accept = Page.Locator(".lobibox:visible button:has-text(\"Aceptar\")").First;
        try { await accept.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 3000 }); }
        catch (TimeoutException) { return; }
        await accept.ClickAsync();
        await Page.Locator(".lobibox-backdrop").WaitForAsync(new() { State = WaitForSelectorState.Detached });
    }

    /// <summary>Flexygo loads everything through jQuery; the page is settled when nothing is in flight twice in a row.</summary>
    public async Task WaitForAjaxAsync()
    {
        for (var i = 0; i < 2; i++)
        {
            await Page.WaitForFunctionAsync("() => window.jQuery && jQuery.active === 0", null, new() { Timeout = settings.TimeoutMs * 2 });
            await Page.WaitForTimeoutAsync(250);
        }
    }

    // ---------- navigation ----------

    /// <summary>Clicks a node of the side menu, opening its group first if it is nested and collapsed.</summary>
    public async Task OpenMenuAsync(string title, string? expectedPage = null)
    {
        // The same entry can hang from the side menu and the top bar ("Mi carrito"): take the one on screen.
        var nodes = Page.Locator($"#mainNav li[title=\"{title}\"]");
        var visible = nodes.Filter(new() { Visible = true });
        var node = await visible.CountAsync() > 0 ? visible.First : nodes.First;
        if (!await node.IsVisibleAsync())
        {
            var groups = await node.EvaluateAsync<string[]>(
                "n => { const t=[]; let p=n.parentElement.closest('li[title]'); while(p){ t.unshift(p.getAttribute('title')); p=p.parentElement.closest('li[title]'); } return t; }");
            foreach (var g in groups)
            {
                var group = Page.Locator($"#mainNav li[title=\"{g}\"]").First;
                if (await group.IsVisibleAsync()) await group.Locator("> *").First.ClickAsync();
            }
        }
        await node.Locator("> *").First.ClickAsync();
        if (expectedPage is not null) await WaitForPageAsync(expectedPage);
        else await WaitForAjaxAsync();
    }

    public async Task WaitForPageAsync(string pageName)
    {
        await Page.Locator($"main.realMain.pageContainer[pagename=\"{pageName}\"]").WaitForAsync(new() { State = WaitForSelectorState.Attached });
        await WaitForAjaxAsync();
    }

    public Task<string?> CurrentPageAsync() => MainPage.GetAttributeAsync("pagename");

    public async Task NavigateAsync(string pageName, string objectName = "", string objectWhere = "")
    {
        await Page.EvaluateAsync("a => flexygo.nav.openPageName(a[0], a[1], a[2], null, 'current', false, $('body'))",
            new[] { pageName, objectName, objectWhere });
        await WaitForAjaxAsync();
    }

    public async Task OpenPageAsync(string pageTypeId, string objectName, string objectWhere = "")
    {
        await Page.EvaluateAsync("a => flexygo.nav.openPage(a[0], a[1], a[2], null, 'current', false, $('body'))",
            new[] { pageTypeId, objectName, objectWhere });
        await WaitForAjaxAsync();
    }

    public ILocator NavNode(string title) => Page.Locator($"#mainNav li[title=\"{title}\"]");

    // ---------- modules and lists ----------

    public ILocator Module(string moduleName) => Page.Locator($"flx-module[modulename=\"{moduleName}\"]").First;

    public ILocator Rows(ILocator module) => module.Locator(".cntBody .row-line:has(flx-navbutton)");

    /// <summary>Clicks the first row of the list (optionally the first holding <paramref name="text"/>).</summary>
    public async Task OpenRowAsync(ILocator module, string? text = null)
    {
        var rows = Rows(module);
        if (text is not null) rows = rows.Filter(new() { HasText = text });
        await rows.First.Locator("flx-navbutton > *").First.ClickAsync();
        await WaitForAjaxAsync();
    }

    public ILocator HeaderButton(ILocator module, string text) =>
        module.Locator($".cntHeader button[data-original-title=\"{text}\"]")
            .Or(module.Locator(".cntHeader button").Filter(new() { HasText = text })).First;

    /// <summary>Opens the module's "Más opciones" menu and picks the entry with the given data-type (delete, new...).</summary>
    public async Task ClickMoreOptionAsync(ILocator module, string dataType)
    {
        await module.Locator(".cntHeader button[data-type=\"text\"]").First.ClickAsync();
        await Page.Locator($"[data-type=\"{dataType}\"]:visible").Last.ClickAsync();
    }

    public async Task DeleteCurrentRecordAsync(ILocator module)
    {
        await ClickMoreOptionAsync(module, "delete");
        await ConfirmYesAsync();
        var notify = await WaitForNotifyAsync();
        Assert.IsTrue(notify.IsSuccess, $"El borrado no se confirmó: {notify.Text}");
    }

    // ---------- dialogs, processes, notifications ----------

    public async Task ConfirmYesAsync()
    {
        await Page.Locator(".lobibox-confirm .lobibox-btn-yes").First.ClickAsync();
        await WaitForAjaxAsync();
    }

    /// <summary>Waits for the next toast, reads it and closes every toast on screen.</summary>
    public async Task<Notify> WaitForNotifyAsync(float? timeout = null)
    {
        var toast = Page.Locator(".lobibox-notify").Last;
        await toast.WaitForAsync(new() { Timeout = timeout ?? settings.TimeoutMs });
        var cls = await toast.GetAttributeAsync("class") ?? "";
        var kind = Regex.Match(cls, @"lobibox-notify-(success|error|warning|info)").Groups[1].Value;
        var text = Regex.Replace(await toast.InnerTextAsync(), @"\s+", " ").Trim(' ', '×');
        await Page.EvaluateAsync("() => document.querySelectorAll('.lobibox-notify').forEach(n => n.remove())");
        return new Notify(kind, text);
    }

    /// <summary>Waits for a toast, but returns null instead of failing when none appears.</summary>
    public async Task<Notify?> TryWaitForNotifyAsync(float timeout = 5000)
    {
        try { return await WaitForNotifyAsync(timeout); }
        catch (TimeoutException) { return null; }
    }

    public ILocator Field(ILocator scope, string property) =>
        scope.Locator($"[property=\"{property}\"]").Locator("input:visible, textarea:visible").First;

    public Task FillAsync(ILocator scope, string property, string value) => Field(scope, property).FillAsync(value);

    /// <summary>flx-dbcombo: type into its search box, then pick the matching entry of ul.comboOptions.</summary>
    public async Task ChooseAsync(ILocator scope, string property, string text)
    {
        var combo = scope.Locator($"[property=\"{property}\"]").First;
        var box = combo.Locator("input[type=\"search\"]").First;
        await box.ClickAsync();
        await box.PressSequentiallyAsync(text, new() { Delay = 40 });
        await WaitForAjaxAsync();
        await combo.Locator("ul.comboOptions li").Filter(new() { HasText = text }).First.ClickAsync();
        await WaitForAjaxAsync();
    }

    public async Task SelectAsync(ILocator scope, string property, string label)
    {
        await scope.Locator($"[property=\"{property}\"] select").First.SelectOptionAsync(new SelectOptionValue { Label = label });
    }

    public async Task RunProcessAsync(string? buttonText = null)
    {
        var button = Dialog.Locator("button[data-type=\"runprocess\"]");
        if (buttonText is not null) button = button.Filter(new() { HasText = buttonText });
        await button.First.ClickAsync();
        await AcceptConfirmationIfAnyAsync();
    }

    /// <summary>A process with a ConfirmText asks "¿Confirmas...?" after its button is pressed; accept it.</summary>
    private async Task AcceptConfirmationIfAnyAsync()
    {
        var yes = Page.Locator(".lobibox-confirm .lobibox-btn-yes");
        try { await yes.First.WaitForAsync(new() { Timeout = 2500 }); }
        catch (TimeoutException) { await WaitForAjaxAsync(); return; }
        await yes.First.ClickAsync();
        await WaitForAjaxAsync();
    }

    /// <summary>
    /// Clicks a process button in a module header and finishes whatever it opens: its parameters
    /// dialog (run it), a confirmation (accept it), or nothing. Returns the toast it ends with.
    /// </summary>
    public async Task<Notify?> RunHeaderProcessAsync(ILocator module, string text, Func<ILocator, Task>? fillParams = null)
    {
        await HeaderButton(module, text).ClickAsync();
        await AcceptConfirmationIfAnyAsync();
        var run = Page.Locator(".ui-dialog:visible button[data-type=\"runprocess\"]");
        if (await run.CountAsync() > 0)
        {
            if (fillParams is not null) await fillParams(Dialog);
            await run.First.ClickAsync();
            await AcceptConfirmationIfAnyAsync();
        }
        return await TryWaitForNotifyAsync(8000);
    }

    /// <summary>
    /// Deletes the list row holding <paramref name="rowText"/> through its own row menu, the way a
    /// user does. No filter is ever built from test data: the row is found by what it shows.
    /// A freshly-created record has no guaranteed position in an unsorted, paginated list, so this
    /// pages forward (up to the pager's own page count) until the row turns up.
    /// </summary>
    public async Task DeleteRowAsync(ILocator module, string rowText)
    {
        // Each template names its rows its own way (.row-line, .solc-row, .com-comment-row...).
        var rowSelector = ".cntBody .row-line, .cntBody [class$='-row'], .cntBody [class*='-row ']";
        var row = module.Locator(rowSelector)
            .Filter(new() { HasText = rowText })
            .Filter(new() { Has = Page.Locator("button[data-type=\"objectmenu\"]") }).Last;

        var pageButtons = module.Locator(".pager .pBtn");
        for (var i = 0; await row.CountAsync() == 0 && i < await pageButtons.CountAsync(); i++)
        {
            await pageButtons.Nth(i).ClickAsync();
            await WaitForAjaxAsync();
        }

        await row.Locator("button[data-type=\"objectmenu\"]").ClickAsync();
        await WaitForAjaxAsync();
        await Page.Locator("li:visible > span[onclick*='deleteModule']").Last.ClickAsync();
        await ConfirmYesAsync();
        var notify = await WaitForNotifyAsync();
        Assert.IsTrue(notify.IsSuccess, $"No se pudo borrar '{rowText}': {notify.Text}");
    }

    public async Task CloseDialogAsync()
    {
        await Dialog.Locator(".ui-dialog-titlebar-close").ClickAsync();
        await WaitForAjaxAsync();
    }

    // ---------- edit forms ----------

    public ILocator EditForm => MainPage.Locator("flx-edit").First;

    public async Task SaveAsync()
    {
        await MainPage.Locator("button[data-type=\"save\"]").First.ClickAsync();
        await WaitForAjaxAsync();
    }

    /// <summary>The edit form currently on screen, whether it opened in the page or in a dialog.</summary>
    public ILocator VisibleEditForm => Page.Locator("flx-edit:visible").Last;

    /// <summary>
    /// From a record card: presses "Editar", lets <paramref name="change"/> alter the form, saves it
    /// and asserts the save did not come back as an error.
    /// </summary>
    public async Task EditRecordAsync(ILocator card, Func<ILocator, Task> change)
    {
        await HeaderButton(card, "Editar").ClickAsync();
        await WaitForAjaxAsync();
        var form = VisibleEditForm;
        await form.WaitForAsync();
        await change(form);
        await Page.Locator("button[data-type=\"save\"]:visible").Last.ClickAsync();
        await WaitForAjaxAsync();
        var notify = await TryWaitForNotifyAsync();
        Assert.IsTrue(notify is null || notify.IsSuccess, $"La modificación no se guardó: {notify?.Text}");
    }

    /// <summary>Opens the list row holding <paramref name="text"/>, paging forward until it turns up.</summary>
    public async Task OpenRowByTextAsync(ILocator module, string text)
    {
        var row = Rows(module).Filter(new() { HasText = text });
        var pageButtons = module.Locator(".pager .pBtn");
        for (var i = 0; await row.CountAsync() == 0 && i < await pageButtons.CountAsync(); i++)
        {
            await pageButtons.Nth(i).ClickAsync();
            await WaitForAjaxAsync();
        }
        await row.First.Locator("flx-navbutton > *").First.ClickAsync();
        await WaitForAjaxAsync();
    }

    // ---------- global search ----------

    /// <summary>
    /// Searches from the top bar. A result row shows the record's name, not what matched, so when
    /// searching by reference pass the text the row will actually show in <paramref name="rowText"/>.
    /// </summary>
    public async Task<ILocator> GlobalSearchAsync(string text, string? rowText = null)
    {
        await Page.Locator("#mainMenu li[title=\"Buscar\"]").First.ClickAsync();
        var box = Page.Locator("#flx-search-form input.search-box").First;
        // The palette opens with an animation: typed too early, the text is lost and Enter picks
        // the first scope ("Buscar en Producto…") instead of searching.
        await box.WaitForAsync();
        await Page.WaitForTimeoutAsync(500);
        await box.FillAsync(text);
        await Assertions.Expect(box).ToHaveValueAsync(text);
        await box.PressAsync("Enter");
        await WaitForAjaxAsync();
        var rows = Page.Locator(".flx-palette .flx-pal-row").Filter(new() { HasText = rowText ?? text });
        await rows.First.WaitForAsync();
        return rows;
    }

    public static string Clean(string s) => Regex.Replace(s, @"\s+", " ").Trim();
}
