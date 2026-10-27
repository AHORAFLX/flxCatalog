// flexygo walk runner v1 — written by flexygo_scaffold_tests. The walks are walks/*.walk.json; this file replays them.
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using flxCatalog.InterfaceTest;
using Microsoft.Extensions.Configuration;
using Microsoft.Playwright;

namespace flxCatalog_InterfaceTest
{
    [TestClass]
    public class FlexygoWalks
    {
        private static string Root => Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), "..", "..", ".."));
        private static string WalksDir => Path.Combine(Root, "walks");

        private static readonly IConfiguration Config = new ConfigurationBuilder()
            .SetBasePath(Root)
            .AddJsonFile("appsettings.json", true, true)
            .AddJsonFile("appsettings.local.json", true, true)
            .Build();

        private static bool IsCi =>
            new[] { "CI", "TF_BUILD", "TEAMCITY_VERSION", "GITHUB_ACTIONS" }.Any(v => !string.IsNullOrEmpty(Environment.GetEnvironmentVariable(v)));

        public static IEnumerable<object[]> All()
        {
            var only = (Environment.GetEnvironmentVariable("FLEXYGO_WALKS") ?? "")
                .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
            var files = Directory.Exists(WalksDir)
                ? Directory.GetFiles(WalksDir, "*.walk.json").Select(Path.GetFileName).OfType<string>()
                    .Where(f => only.Length == 0 || only.Any(o => f.Contains(o, StringComparison.OrdinalIgnoreCase)))
                    .OrderBy(f => f, StringComparer.Ordinal).ToList()
                : new List<string>();
            if (files.Count == 0) files.Add("(no walk)");
            return files.Select(f => new object[] { f });
        }

        public static string NameOf(MethodInfo method, object[] data) => (string)data[0];

        [TestMethod]
        [DynamicData(nameof(All), DynamicDataSourceType.Method, DynamicDataDisplayName = nameof(NameOf))]
        public async Task Walk(string file)
        {
            if (file == "(no walk)") Assert.Inconclusive("There is no walks/*.walk.json to replay.");

            var text = File.ReadAllText(Path.Combine(WalksDir, file));
            var walk = JsonNode.Parse(text)!.AsObject();
            var name = file[..^".walk.json".Length];
            var outDir = Path.Combine(WalksDir, "results", name);
            if (Directory.Exists(outDir)) Directory.Delete(outDir, true);
            Directory.CreateDirectory(outDir);

            var shots = new JsonArray();
            var result = new JsonObject
            {
                ["walk"] = file,
                ["hash"] = Hash(text),
                ["at"] = DateTime.Now.ToString("o"),
                ["status"] = "running",
                ["shots"] = shots,
            };
            void Save(string status, string? error = null)
            {
                result["status"] = status;
                if (error is not null) result["error"] = error;
                File.WriteAllText(Path.Combine(outDir, "result.json"), result.ToJsonString(new JsonSerializerOptions { WriteIndented = true }));
            }

            if ((string?)walk["data"] == "demo" && IsCi)
            {
                Save("skipped");
                Assert.Inconclusive($"{file} reads the demo data, which a CI database does not have.");
            }

            var step = 0;
            var kind = "login";
            bool changed = false, fresh = false;
            IPage? page = null;
            var errors = new List<string>();
            void OnError(object? _, string message) => errors.Add(message);
            try
            {
                page = await PageFor((string?)walk["as"]);
                kind = "home";
                await page.GotoAsync(Config["url"]!.TrimEnd('/') + "/");
                await page.WaitForLoadStateAsync(LoadState.NetworkIdle);
                await page.EvaluateAsync("() => { flexygo.utils.animationTime = 0; flexygo.utils.testMode = true; }");
                page.PageError += OnError;

                await Steps(page, walk["steps"]!.AsArray(), true);
            }
            catch (Exception ex) when (ex is not UnitTestAssertException)
            {
                // What the screen showed when it failed, then the walk's own cleanup: a walk on its own
                // TEST rows that fails halfway must not leave them behind.
                var after = "";
                if (page is not null && step > 0)
                {
                    try
                    {
                        await page.ScreenshotAsync(new() { Path = Path.Combine(outDir, "failure.png") });
                        result["failurePath"] = $"walks/results/{name}/failure.png";
                    }
                    catch (PlaywrightException) { }
                    if (walk["cleanup"] is JsonArray cleanup && cleanup.Count > 0)
                    {
                        try { await Steps(page, cleanup, false); after = " Its cleanup ran."; }
                        catch (Exception c) { after = $" Its cleanup FAILED too ({c.Message.Split('\n')[0]}): what it created may be left."; }
                    }
                }
                // Before the first step it is the application or the login that failed, not the walk;
                // and a todo is a walk nobody has written yet.
                Save(step == 0 ? "blocked" : kind == "todo" ? "todo" : "failed", $"step {step} ({kind}): {ex.Message.Split('\n')[0]}{after}");
                Assert.Fail($"{file} failed at step {step} ({kind}): {ex.Message}{after}");
            }
            finally
            {
                if (page is not null) page.PageError -= OnError;
            }

            if (changed)
            {
                Save("changed");
                Assert.Fail($"{file}: a capture differs from its accepted baseline beyond its threshold — see walks/results/{name}.");
            }
            if (fresh)
            {
                Save("new");
                Assert.Inconclusive($"{file}: a capture has no accepted baseline yet — look at walks/results/{name} and accept it.");
            }
            Save("passed");

            // The walk's steps, or its cleanup (which counts no step and takes no capture of its own).
            async Task Steps(IPage page, JsonArray list, bool main)
            {
                foreach (var node in list)
                {
                    var s = node!.AsObject();
                    var current = s.First().Key;
                    if (main) { step++; kind = current; }
                    var value = s[current];
                    switch (current)
                    {
                        case "menu":
                            var nodeId = (string?)s["node"];
                            if (nodeId is not null && await page.Locator($"[data-flx-node='{nodeId}']").CountAsync() > 0)
                            {
                                await page.Locator($"[data-flx-node='{nodeId}'] >> visible=true").First.ClickAsync();
                                break;
                            }
                            var path = value is JsonArray titles ? titles.Select(t => (string)t!).ToList() : new List<string> { (string)value! };
                            // A parent is clicked only to open it: when what comes after it already shows, a click would fold it.
                            for (var p = 0; p < path.Count; p++)
                            {
                                if (p < path.Count - 1 && await MenuEntry(page, path[p + 1]).CountAsync() > 0) continue;
                                await MenuEntry(page, path[p]).First.ClickAsync();
                            }
                            break;
                        case "url":
                            await page.GotoAsync(Config["url"]!.TrimEnd('/') + "/" + ((string)value!).TrimStart('/'));
                            break;
                        case "module":
                            await page.Locator($"flx-module[modulename='{(string)value!}'] >> visible=true").First.WaitForAsync(new() { Timeout = 20000 });
                            break;
                        case "click":
                            await page.Locator($"{(string)value!} >> visible=true").First.ClickAsync();
                            break;
                        case "clickText":
                            await page.Locator($"text={(string)value!} >> visible=true").First.ClickAsync();
                            break;
                        case "fill":
                            var field = page.Locator($"[property='{(string)value!["property"]!}'] >> visible=true").First
                                .Locator("input, textarea, select").First;
                            var fieldValue = value!["value"]!.ToString();
                            if (await field.EvaluateAsync<string>("e => e.tagName") == "SELECT") await field.SelectOptionAsync(fieldValue);
                            else await field.FillAsync(fieldValue);
                            break;
                        case "press":
                            await page.Keyboard.PressAsync((string)value!);
                            break;
                        case "confirm":
                            await page.Locator(".lobibox-confirm .lobibox-btn-yes >> visible=true").First.ClickAsync();
                            break;
                        case "drag":
                            await page.Locator($"{(string)value!["from"]!} >> visible=true").First
                                .DragToAsync(page.Locator($"{(string)value!["to"]!} >> visible=true").First);
                            await page.WaitForLoadStateAsync(LoadState.NetworkIdle);
                            break;
                        case "order":
                            await Order(page, (string)value!["items"]!, (string?)value["by"] ?? "asc");
                            break;
                        case "count":
                            await Count(page, (string)value!["selector"]!, (int?)value["min"], (int?)value["max"]);
                            break;
                        case "text":
                            await page.Locator($"text={(string)value!} >> visible=true").First.WaitForAsync(new() { Timeout = 10000 });
                            break;
                        case "noText":
                            await page.WaitForLoadStateAsync(LoadState.NetworkIdle);
                            if (await page.Locator($"text={(string)value!} >> visible=true").CountAsync() > 0)
                                throw new InvalidOperationException($"'{(string)value!}' is on screen and should not be.");
                            break;
                        case "wait":
                            await page.WaitForTimeoutAsync((int)value!);
                            break;
                        case "todo":
                            throw new InvalidOperationException("TODO: " + (string)value!);
                        case "shot":
                            var (over, isNew) = await Shot(page.Context, page, name, outDir, value!, shots,
                                Texts(walk["volatile"]), Texts(walk["allow"]));
                            changed |= over;
                            fresh |= isNew;
                            break;
                        default:
                            throw new InvalidOperationException($"the runner does not know the step '{current}'.");
                    }
                    if (main && errors.Count > 0) throw new InvalidOperationException("JavaScript error: " + string.Join(" | ", errors));
                }
            }
        }

        /// <summary>One browser session per user, logged in once and reused by every walk of the run.</summary>
        private static readonly Dictionary<string, IPage> Sessions = new();

        private static async Task<IPage> PageFor(string? user)
        {
            var key = user ?? "";
            if (Sessions.TryGetValue(key, out var open)) return open;

            var password = user is null ? Config["pass"] : Config[$"users:{user}"];
            if (password is null)
                throw new InvalidOperationException(user is null
                    ? "appsettings.local.json has no 'pass'."
                    : $"appsettings.local.json has no 'users:{user}' with that user's password.");
            // Visible when the verify pass asks for it, so the user watches; hidden in CI.
            var headed = Environment.GetEnvironmentVariable("FLEXYGO_WALKS_HEADED") == "1";
            var context = await Utils.GetBrowserAsync(Config["browser"] ?? "chrome", IsCi || (!headed && Config["headless"] == "true"));
            var page = await context.NewPageAsync();
            await page.SetViewportSizeAsync(1440, 900);
            await Utils.GoToLogin(page, Config["url"]!, user ?? Config["user"]!, password);
            try { await page.Locator(".lobibox-confirm .lobibox-btn-yes >> visible=true").First.ClickAsync(new() { Timeout = 2000 }); }
            catch (TimeoutException) { }
            Sessions[key] = page;
            return page;
        }

        [ClassCleanup]
        public static void CloseSessions()
        {
            foreach (var page in Sessions.Values)
            {
                page.Context.CloseAsync().GetAwaiter().GetResult();
                page.Context.Browser?.CloseAsync().GetAwaiter().GetResult();
            }
            Sessions.Clear();
        }

        private static ILocator MenuEntry(IPage page, string title) =>
            page.Locator($".navTextSpan:text-is('{title.Replace("'", "\\'")}') >> visible=true");

        /// <summary>The field each row is sorted by, read on screen, in the order the view says.</summary>
        private static async Task Order(IPage page, string items, string by)
        {
            await page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            // The module paints before its rows do: wait for the first one.
            try { await page.Locator($"{items} >> visible=true").First.WaitForAsync(new() { Timeout = 10000 }); }
            catch (TimeoutException) { }
            var texts = (await page.Locator($"{items} >> visible=true").AllInnerTextsAsync()).Select(t => t.Trim()).ToList();
            if (texts.Count < 2) throw new InvalidOperationException($"'{items}' shows {texts.Count} row(s): nothing to put in order.");
            var culture = System.Globalization.CultureInfo.GetCultureInfo("es-ES").CompareInfo;
            for (var i = 1; i < texts.Count; i++)
            {
                var cmp = culture.Compare(texts[i - 1], texts[i], System.Globalization.CompareOptions.IgnoreCase | System.Globalization.CompareOptions.IgnoreNonSpace);
                if (by == "desc" ? cmp < 0 : cmp > 0)
                    throw new InvalidOperationException($"'{items}' is not in {by} order: «{texts[i - 1]}» comes before «{texts[i]}».");
            }
        }

        private static async Task Count(IPage page, string selector, int? min, int? max)
        {
            var rows = page.Locator($"{selector} >> visible=true");
            var n = 0;
            for (var i = 0; i < 40; i++)
            {
                n = await rows.CountAsync();
                if ((min is null || n >= min) && (max is null || n <= max)) return;
                await page.WaitForTimeoutAsync(250);
            }
            throw new InvalidOperationException($"'{selector}' shows {n}, expected {(min is null ? "" : $"at least {min}")}{(min is not null && max is not null ? " and " : "")}{(max is null ? "" : $"at most {max}")}.");
        }

        private static string[] Texts(JsonNode? node) =>
            (node as JsonArray)?.Select(m => (string)m!).ToArray() ?? Array.Empty<string>();

        private static async Task<(bool Over, bool New)> Shot(IBrowserContext context, IPage page, string walk, string outDir, JsonNode value, JsonArray shots,
            string[] walkVolatile, string[] allow)
        {
            var shot = value as JsonObject;
            var name = shot is null ? (string)value! : (string)shot["name"]!;
            var masks = Texts(shot?["mask"]);
            var volatileParts = walkVolatile.Concat(Texts(shot?["volatile"])).ToArray();
            var maxDiff = (double?)shot?["maxDiff"] ?? 0.005;

            // Settled: two captures in a row alike, so a fade or a loading bar is not taken for a change.
            await page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            var options = new PageScreenshotOptions { Mask = masks.Select(m => page.Locator(m)).ToArray() };
            var png = await page.ScreenshotAsync(options);
            for (var i = 0; i < 8; i++)
            {
                await page.WaitForTimeoutAsync(250);
                var again = await page.ScreenshotAsync(options);
                if (again.AsSpan().SequenceEqual(png)) break;
                png = again;
            }
            var dom = await page.EvaluateAsync<string>(DomScript, masks);
            File.WriteAllBytes(Path.Combine(outDir, name + ".png"), png);
            File.WriteAllText(Path.Combine(outDir, name + ".txt"), dom);

            var entry = new JsonObject { ["name"] = name, ["path"] = $"walks/results/{walk}/{name}.png" };
            shots.Add(entry);

            // Measured on every capture, baseline or not: what a look at a screenshot lets slip.
            var findings = (await page.EvaluateAsync<string[]>(ChecksScript, masks))
                .Where(f => !allow.Any(a => System.Text.RegularExpressions.Regex.IsMatch(f, a))).ToArray();
            if (findings.Length > 0)
            {
                entry["findings"] = new JsonArray(findings.Select(f => (JsonNode)f!).ToArray());
                // One of each kind first: twenty contrast lines must not hide the raw identifier behind them.
                var shown = findings.GroupBy(f => f.Split(' ')[0]).Select(g => g.First())
                    .Concat(findings).Distinct().Take(6);
                throw new InvalidOperationException($"the screen fails its checks ({findings.Length}): {string.Join("; ", shown)}");
            }
            var basePng = Path.Combine(WalksDir, "baseline", walk, name + ".png");
            if (!File.Exists(basePng))
            {
                entry["baseline"] = false;
                return (false, true);
            }

            entry["baseline"] = true;
            var scratch = await context.NewPageAsync();
            var diff = await scratch.EvaluateAsync<JsonElement>(DiffScript, new
            {
                a = Convert.ToBase64String(File.ReadAllBytes(basePng)),
                b = Convert.ToBase64String(png),
                tol = 0.1,
            });
            await scratch.CloseAsync();
            var ratio = diff.GetProperty("ratio").GetDouble();
            var baseTxt = Path.Combine(WalksDir, "baseline", walk, name + ".txt");
            var (changes, longer, first) = File.Exists(baseTxt) ? TextChanges(File.ReadAllText(baseTxt), dom, volatileParts) : (0, 0, null);
            entry["diff"] = Math.Round(ratio, 5);
            entry["domDiff"] = longer == 0 ? 0 : Math.Round((double)changes / longer, 5);
            entry["textChanges"] = changes;
            if (first is not null) entry["firstChange"] = first;
            // Pixels get a tolerance; the text does not: one value that changed is a change.
            var over = ratio > maxDiff || changes > 0;
            entry["over"] = over;
            if (diff.GetProperty("diff").ValueKind == JsonValueKind.String)
            {
                File.WriteAllBytes(Path.Combine(outDir, name + ".diff.png"), Convert.FromBase64String(diff.GetProperty("diff").GetString()!));
                entry["diffPath"] = $"walks/results/{walk}/{name}.diff.png";
            }
            return (over, false);
        }

        /// <summary>
        /// Lines changed between the two texts, IN ORDER (a list that loses its order changed), after the
        /// parts declared volatile are blanked; the longer count; and the first line that differs.
        /// </summary>
        private static (int Changes, int Longer, string? First) TextChanges(string before, string after, string[] volatileParts)
        {
            string[] Lines(string t) => t.Split('\n').Select(l => volatileParts.Aggregate(l.Trim(),
                (acc, p) => System.Text.RegularExpressions.Regex.Replace(acc, p, "…"))).Where(l => l.Length > 0).ToArray();
            var a = Lines(before);
            var b = Lines(after);
            var lcs = new int[a.Length + 1, b.Length + 1];
            for (var i = a.Length - 1; i >= 0; i--)
                for (var j = b.Length - 1; j >= 0; j--)
                    lcs[i, j] = a[i] == b[j] ? lcs[i + 1, j + 1] + 1 : Math.Max(lcs[i + 1, j], lcs[i, j + 1]);
            var changes = a.Length + b.Length - 2 * lcs[0, 0];
            var k = 0;
            while (k < a.Length && k < b.Length && a[k] == b[k]) k++;
            var first = changes == 0 ? null : $"{(k < a.Length ? a[k] : "(nothing)")} → {(k < b.Length ? b[k] : "(nothing)")}";
            return (changes, Math.Max(a.Length, b.Length), first);
        }

        private static string Hash(string text) =>
            Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(text.Replace("\r\n", "\n")))).ToLowerInvariant()[..16];

        private const string DomScript = @"masks => {
            const top = [...document.querySelectorAll('flx-module')]
                .filter(m => m.offsetParent !== null && !m.parentElement.closest('flx-module'));
            return top.map(m => {
                let t = m.innerText || '';
                // A Playwright-only selector (:has-text) masks the capture; here it is not CSS, so it is skipped.
                masks.forEach(s => { try { m.querySelectorAll(s).forEach(e => { if (e.innerText) t = t.split(e.innerText).join(''); }); } catch (e) { } });
                return '# ' + (m.getAttribute('modulename') || '') + '\n' + t;
            }).join('\n');
        }";

        // In the modules only, so the platform's own chrome (a licence watermark) is not this product's finding.
        // The contrast is the one the interface test plan has measured since 2026-08-26, with the text's alpha laid on its background.
        private const string ChecksScript = @"masks => {
            const mods = [...document.querySelectorAll('flx-module')].filter(m => m.offsetParent !== null && !m.parentElement.closest('flx-module'));
            const masked = el => masks.some(s => { try { return el.closest(s); } catch (e) { return false; } });
            const out = [];
            const chan = v => (v /= 255) <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
            const lum = c => 0.2126 * chan(c[0]) + 0.7152 * chan(c[1]) + 0.0722 * chan(c[2]);
            const cx = document.createElement('canvas').getContext('2d');
            const srgb = s => {
                const m = /^rgba?\((.+)\)$/.exec(s);
                if (m) { const p = m[1].split(/[\s,\/]+/).filter(Boolean).map(Number); return p.length < 3 ? null : [p[0], p[1], p[2], isNaN(p[3]) ? 1 : p[3]]; }
                if (s === 'transparent') return [0, 0, 0, 0];
                cx.fillStyle = '#000'; cx.fillStyle = s; const x = cx.fillStyle; cx.fillStyle = '#fff'; cx.fillStyle = s;
                if (x !== cx.fillStyle || !/^#[0-9a-f]{6}$/i.test(x)) return null;
                return [1, 3, 5].map(i => parseInt(x.substr(i, 2), 16)).concat(1);
            };
            const bgOf = el => { for (let n = el; n; n = n.parentElement) { const c = srgb(getComputedStyle(n).backgroundColor); if (!c) return null; if (c[3] > 0) return c; } return [255, 255, 255, 1]; };
            const over = (f, b) => f[3] >= 1 ? f : [0, 1, 2].map(i => f[i] * f[3] + b[i] * (1 - f[3]));
            const ratio = (a, b) => { const [x, y] = [lum(a), lum(b)].sort((p, q) => q - p); return (x + 0.05) / (y + 0.05); };
            for (const mod of mods) {
                const name = mod.getAttribute('modulename') || '';
                mod.querySelectorAll('*').forEach(el => {
                    if (masked(el) || el.offsetParent === null) return;
                    const cs = getComputedStyle(el);
                    if (cs.visibility === 'hidden' || parseFloat(cs.opacity) === 0) return;
                    const txt = [...el.childNodes].filter(n => n.nodeType === 3 && n.textContent.trim()).map(n => n.textContent.trim()).join(' ');
                    if (!txt) return;
                    const size = parseFloat(cs.fontSize), large = size >= 24 || (size >= 18.66 && parseInt(cs.fontWeight) >= 700);
                    const fg = srgb(cs.color), bg = bgOf(el);
                    if (!fg || !bg) return;
                    const r = ratio(over(fg, bg), bg);
                    if (r < (large ? 3 : 4.5)) out.push('contrast ' + r.toFixed(2) + ':1 on «' + txt.slice(0, 40) + '» in ' + name);
                });
                const text = mod.innerText || '';
                const guid = /\b[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\b/i.exec(text);
                if (guid) out.push('raw identifier ' + guid[0] + ' on screen in ' + name);
                for (const raw of ['/Date(', '{' + '{', 'undefined', 'NaN']) if (text.includes(raw)) out.push('raw value «' + raw + '» on screen in ' + name);
                mod.querySelectorAll('img').forEach(i => { if (i.complete && i.naturalWidth === 0 && !masked(i)) out.push('broken image ' + (i.currentSrc || i.src) + ' in ' + name); });
            }
            const d = document.documentElement;
            if (d.scrollWidth > d.clientWidth + 1) out.push('the page scrolls sideways (' + d.scrollWidth + 'px in ' + d.clientWidth + 'px)');
            return [...new Set(out)];
        }";

        private const string DiffScript = @"async ({ a, b, tol }) => {
            const load = s => new Promise((ok, ko) => { const i = new Image(); i.onload = () => ok(i); i.onerror = ko; i.src = 'data:image/png;base64,' + s; });
            const [x, y] = await Promise.all([load(a), load(b)]);
            if (x.width !== y.width || x.height !== y.height) return { ratio: 1, diff: null };
            const canvas = () => { const c = document.createElement('canvas'); c.width = x.width; c.height = x.height; return c.getContext('2d'); };
            const ga = canvas(), gb = canvas(), gd = canvas();
            ga.drawImage(x, 0, 0); gb.drawImage(y, 0, 0);
            const da = ga.getImageData(0, 0, x.width, x.height).data, db = gb.getImageData(0, 0, x.width, x.height).data;
            const out = gd.createImageData(x.width, x.height);
            let n = 0;
            for (let i = 0; i < da.length; i += 4) {
                const d = Math.max(Math.abs(da[i] - db[i]), Math.abs(da[i + 1] - db[i + 1]), Math.abs(da[i + 2] - db[i + 2])) / 255;
                if (d > tol) { n++; out.data[i] = 255; out.data[i + 3] = 255; }
                else { const g = (db[i] + db[i + 1] + db[i + 2]) / 3; out.data[i] = out.data[i + 1] = out.data[i + 2] = g; out.data[i + 3] = 60; }
            }
            gd.putImageData(out, 0, 0);
            return { ratio: n / (x.width * x.height), diff: n ? gd.canvas.toDataURL('image/png').split(',')[1] : null };
        }";
    }
}
