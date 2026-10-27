---
name: flx-verify
description: Checks that what was built WORKS on screen, not only that it exists. Brings the application up in a browser, walks the block's pages and leaves a record of every check. Invoke it when closing a block of /flx-execute.
---

# Verify that it works

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

There are three levels and only the third is noticed by a user:

| Level | Who covers it | What it proves |
|---|---|---|
| It exists | `flexygo_verify_object` | The object is there and has its parts |
| It is coherent | `/flx-review` | What was built matches what was agreed |
| **It works** | **this phase** | It looks right and can be used |

A list can pass the first two while showing raw identifiers, with no clickable row and no menu.
That is only seen by looking at it.

⛔ **The screens are looked at through the recorded walks first, every time** — `flexygo_run_tests(project: "walks")`,
writing the walks the block's screens lack with `flexygo_scaffold_tests` before it (§4). They measure, on every
capture, what a look misses: contrast, raw identifiers, broken images, the order of each list. **A handoff prompt
that lists checks to make adds to this, it never replaces it**: measured 25-oct-2026 in full test 2, two verify
passes followed such a list, drove the browser by hand and never replayed a walk — one of them signed a list with a
GUID on screen that the walk would have caught. Do the listed checks AFTER the walks, by hand, for what no walk does.

## 0 · Before looking at anything, bring the Backend up to date

⛔ **The FIRST time this project's application comes up it may show Flexygo's configurator, with
its mail section, instead of the page you came to look at.** It is not a broken application and it
is not a badly built page: a project nobody has configured yet meets the configurator first, and
reporting it as a defect of what you just built is the mistake to avoid.

Measured in the field, both ways, on a project born that same morning:

- With `MailSettings.Configured` at **`false`**, the configurator comes up with its mail section
  in place of the page. Walking it through to the login marks the project configured on its own —
  the flag comes back `true` without anybody editing a file.
- With it at **`true`**, there is no configurator: the browser lands straight on the login.

So **check it before you launch**, in `{project}.Backend/conf/appsettings.Development.json` — the
file the running application reads, because both halves put themselves in `Development` through
their own `launchSettings.json`. If `MailSettings.Configured` is `false`, **set it to `true`** and
you go straight to the login.

Setting it silences nothing and configures no mail: it says the mail settings have been dealt
with. A project that really sends mail has more to do than this — ask the server for its DLL
process guidance, which carries where mail actually goes. A project that DOES send mail gets the
whole block from flexygo_set_mail_settings instead, which leaves `Configured` `true` on its own;
editing the flag by hand is for a project that sends none.

`flexygo_reload_cache` with an entity from the block. **On the way in, without waiting for
something to fail.**

The Backend loads the object definitions into memory at startup and never re-reads them, so
everything created in `/flx-execute` exists in the database and **does not exist for the
application**. It comes out as a 500 with *«The given key was not present in the dictionary»*,
which reads exactly like a badly configured object and is not one.

Without a password the tool only tells you whether the problem is the cache —or whether it is not,
which saves more— and returns the ways out.

**With the user's password it reloads, and that is the way to close the loop yourself.** Ask them
for it in so many words, once, and pass it: the tool signs in the way the browser does, clears the
cache and then measures the same object again, so what it reports afterwards is measured and not
assumed. Measured 2026-09-11 on a bench: an object the Backend answered 500 for came back 200 on
the far side of one call. Do not guess a password and do not try a second one if the first is
refused. If the browser is already open, navigate to the page again afterwards — it caches page
and module definitions of its own.

**When the reload changes nothing it takes a real restart, and you may do it — after asking.** The
tool says so in as many words when the second measurement comes back the same, and a verification
that stops before that proves nothing. Say what you are about to stop and wait for a yes:
the application may be in front of somebody right now, and the machine may be running more than
yours.

⛔ **Aim at it by PORT, or by the executable's full path. Never by a name pattern.**
An agent asked to restart ran a kill on `*dotnet*` and reached across the entire
machine — while the application it was actually after does not run as `dotnet.exe` at all. It runs
as `{project}.Backend.exe`, under its own name, so the pattern missed its target and hit everything
else. Told the ports instead, the same agent found the two right processes and stopped only those.

Find them the way that cannot be wrong:

```powershell
Get-NetTCPConnection -LocalPort 7210,7211 -State Listen |
  Select-Object LocalPort, OwningProcess
```

Reloading on the way in costs two calls. Not doing it cost a whole verification round, and before
that 128 views and 17 properties created to fix something that was fine.

### Whoever starts it stops it

Starting the Backend or the Frontend to verify is not free: leaving either one running past the
end of the phase is how the next "Run" fails with the port already in use, the reason sitting in a
log nobody reads.

1. **Before starting the Backend or the Frontend, measure who holds the port.**
   `Get-NetTCPConnection -LocalPort {port} -State Listen | Select-Object OwningProcess`, then
   `Get-Process -Id {OwningProcess}`. If something already answers, the person started it: leave
   it running, use it, and say so at the end — "the application was already running when I
   arrived; I left it as it was." Do not rely on memory for this: measure it, every time.
2. **If the agent started it, the agent stops it** when the phase ends or the user closes the
   conversation — by the process id measured at start, or by the executable's full path, ⛔
   NEVER by a name pattern — and says so in the closing message: "I stopped the application I
   started on 7310/7311."
3. **The Playwright browser the agent opened is closed the same way**, at the end of the phase.
4. **The closing of every phase says what was left running**, in one line, so the person who
   presses "Run" next is never surprised by a port in use.

## 0-bis · Let the database tell you what to look for

`flexygo_verify_object` on each entity of the block, **before opening anything**. It is quick, it
needs no browser, and two of its checks now catch on paper exactly what slips past on screen:

- **[9] columns with no property.** A process can write a value nobody can ever see, and every call
  answers success. A nightly job filled a table that had no screen at all.
- **[10] values that reach the screen raw.** A combo printed bare shows the stored number instead of
  the label; a date with no formatter shows `/Date(1771027200000)/`; and a VIEW that aliases a
  foreign key to the name of the value it points at makes a perfectly written template print a
  number. All three were on screen in a run that was signed PASS.
- **[11] identifier-shaped translate keys.** `{{translate|UsoAcumulado}}` paints that literal
  identifier whenever no translation row exists — the platform's culture sweep never opens the
  template HTML to find it. A DEFECT, same family as [10]: the fix is to rewrite the key as the
  natural text the user should read, e.g. `{{translate|Uso acumulado}}`.

Take its warnings with you as the list of things to confirm with your own eyes. A verification that
starts from a blank page has to notice these; one that starts from here only has to check them.

⚠️ It is not a substitute for looking. It reads the configuration database and cannot tell you
whether the screen paints, whether the rows open, or whether the combo drops down.

## 1 · Work on everything done and not verified

`flexygo_development_status` says `X of Y done task(s) verified` and, under **Done and NOT
verified**, one line per task with the tools it was built with. **That list is the scope, whatever
block each task is in** — not only the block just executed. Measured on a real project: 18 of 30
done tasks were never seen working, because only the last block ever got verified, and the schema,
the masters, the editable list and every procedure were among them.

A task counts as verified when a check that **passes** names it in `affects`, recorded on or after
its last execution: one redone later has to be seen again. A check on the block (`B-2`) covers none
of its tasks — name each one. Where a single check proves two tasks, name both: a procedure that is
only launched from a screen is verified by the check that runs it from that screen, `affects: "T-15,
T-16"`.

What verifying means depends on what was built — read it off the tools on each line:

| Built with | Verified by |
|---|---|
| a process or a procedure (`flexygo_create_process`, a DDL procedure) | running it, then checking in the data the change it says it made |
| an editable list (`flexygo_create_edit_list_module`) | editing a row, saving, reopening: the new value is there |
| a master — an object with its list and its card | creating, editing and deleting a test record, with the user's yes (§4-bis) |
| schema only (`flexygo_execute_ddl` on tables) | a query of its columns and constraints; no capture |
| a kanban (`flexygo_create_kanban_module`) | dragging a test card to another column, then reading its row: the state changed, and a move the rules forbid leaves it as it was |
| a dashboard (indicators, charts) | each figure against a query of its table, and each indicator that opens a list opens it with that many rows |
| an HTML module with actions | pressing each action and seeing what it does, in the data or on the screen |
| a report (`flexygo_create_report`) | `flexygo_render_report` on a real record, and opening what it produced |
| a job (`flexygo_create_job`) | running it, then reading `flexygo_get_job_log` and the data it changes |
| a webhook (`flexygo_create_webhook`) | triggering the change it listens to, and seeing the call arrive |
| an outgoing webhook (`flexygo_set_outgoing_webhook`) | one save that makes the change and one that does not: exactly one call arrives |
| a planner, scheduler or timeline | creating or moving an entry on screen, then reading its row |
| a module event (`flexygo_create_module_event`) | firing it and seeing the module it targets repaint |
| any other screen (lists, views) | the screen, with its capture (§4) |
| roles, profiles and access rules | signing in as the user they constrain (§4-ter) |

The only exit for a task that is not verified is **the user's decision**: ask them, record it with
`flexygo_record_decision` naming the task or its block, and file the task with
`flexygo_record_verification` passing that decision's `D-n` in `waivedBy`. A decision about the
design or the development does not waive a procedure, and the server refuses it.

⛔ **This phase is not closed while the Done and NOT verified list has a line.** The next block will
not start over it either: the gate refuses it unless the user forces it with a reason.

Nobody runs a forty-page script: with a long list, go by block, one at a time, and record as you go.

## 2 · Without data there is no verification

An empty list paints just as nicely as a correct one. If the block's tables are empty and the
project keeps a demo pair under `demo/` (the plan's last block saved it), **offer to seed it again**
— a reset, which also brings every date up to today — naming the target database, and only after
the user's yes run `flexygo_demo_data(action: "seed", confirmDatabase: "...")` with that name. With
no pair, ask the user whether to seed and follow `flexygo_get_schema_and_seeding_guide`: the demo
data is a pair saved with `flexygo_demo_data`, never loose rows.

If the user says no, or the plan went without demo data by their decision, verify anyway and **say
so in the result**: "with no data, all that is checked is that the page loads".

## 3 · Ask for the script

`flexygo_generate_interface_test_plan` with the frontend's base URL (ask for it if you do not know
it) and `objects` with the block's entities. It returns the steps and, per page, the visual minimums
to look at.

⚠️ **From about four entities up, pass `detail: "index"`.** The two measurement scripts are
identical letter for letter under every page, so the full plan grows with the entity count and
nothing else: measured 7-Sep-2026, seven entities came back at 2.153 lines / 110.296 characters and
went over the response limit of the session that asked for it — which had to read it off disk.
Index mode writes the two scripts once at the top and keeps every step and every minimum. A plan
that does not arrive verifies nothing.

The **password is not in the script and must not be**: ask the user for it at the moment of typing
it, and do not repeat it back.

## 4 · Run it and actually look

⛔ **With the browser VISIBLE, never headless.** The user watches the verification happen — that is
half of what makes it worth anything to them, and a run nobody saw is a claim they have to take on
trust. If the browser tooling starts headless, say so and stop rather than verifying blind: a
screenshot filed afterwards proves the page rendered, not that anybody looked at it.

⛔ **No browser tooling in this session at all?** The browser is the `playwright` server in the
project's `.mcp.json`, installed by `flexygo_sync_skills` — it needs Node.js and Google Chrome on
the machine, and the sync's report names what is missing. Call the sync, read its report, tell the
user what to install if anything, and have them reload the window — `Ctrl+Shift+P` → *Developer:
Reload Window* — then continue in the new window. Never "verify" by reading the code or the
configuration instead: that is the existence level, not this one.

**Replay the recorded walks first; look by hand only at what they hand back.** Each screen the
block built has a walk — `flexygo_scaffold_tests` writes it with the task and its `pageName`, and
with `flowStep` one per step of the business flow in `ONBOARDING.md`, whose actions you write once.
**A screen with no walk gets one now, without asking**: a walk writes only test files into the
InterfaceTest, never a row of data, so "do not create data" does not stand in its way. Say which
walks you added. `flexygo_run_tests(project: "walks")` replays them all in one browser and one
process, and records them itself:

- a walk that passes against its accepted baseline is recorded as seen working, capture included —
  do not open that screen again;
- a walk that fails is recorded red, which reopens its task;
- a capture with no baseline yet, or one that changed (past the pixel tolerance, or any line of its
  text), comes back to you with its path, the first line that changed and the difference painted red.
  **Open it and look at it** with the script's minimums in hand, and check every line the hand-back
  lists after «Before accepting» — above all **the order of each list**: a list sorted by the wrong
  column reads perfectly well, and a first look accepted one sorted by phone instead of by name. Add
  an `order` step on the field each list sorts by, so the next replays check it on their own. Right →
  `flexygo_run_tests(accept: "<walk>")` makes it the baseline and records the look. Wrong → it fails:
  record it with `ok: false` (§5).

Each capture is also measured — contrast at rest, raw identifiers, broken images, sideways scroll —
and a finding fails the walk. **The walks do not measure** the contrast on hover, the other theme, a
text in the wrong language or the 768 px layout: the first look at a capture does, with the script.
And **a walk that only looks is not the use round of §4-bis**: the block's main actions get walks that
do them on TEST data and check their effect.

⛔ **Never accept a capture you have not opened.** The accept is the record that somebody looked;
an accept without a look is the twelve passes with no capture this phase was built against.

Drive the browser by hand, in this thread, only for what no walk covers — the first look at a
capture, a contrast to measure, an action no walk does. Read the module's DOM, not the whole page's
tree, and one page at a time.

On each page, check against the minimums the script brings — do not stop at "it loaded". What slips
through most:

- raw identifiers where there should be labels (a LEFT JOIN missing in the view),
- rows that do not open the record card (the `flx-navbutton` is missing),
- empty combos (the combo query is wrong),
- indicators at zero with data seeded (the aggregate does not add up).

Take a screenshot of every page: it is the proof of what you saw.

⚠️ **Wait for the skin to be applied before shooting.** The project's stylesheet arrives after the
first paint, so a screenshot taken as soon as it loads catches the screen unstyled and looks like a
failure that does not exist — on the dashboard, the second screenshot came out fine
without touching anything. If a screen comes out plain, repeat the screenshot before calling it
broken.

⚠️ **`fullPage: true` does NOT capture a Flexygo page.** The page scrolls inside `div#mainContent`,
not the document, so a "full page" shot comes out exactly the viewport — measured 2026-09-10: every
full-page capture of a dashboard pass was 1440×900 with the list cut, and nobody had checked the
pixels. To capture the whole screen, read `document.querySelector('#mainContent').scrollHeight`,
resize the viewport to that height plus the top bar (about 50px) and shoot; check the image size
afterwards.

## 4-bis · Ask to use it, not only to look at it

Everything up to here proves the screen is right. It does not prove the application WORKS: a form
can paint every field and refuse to save, a process can sit in a toolbar and do nothing.

**So propose one round of real use, name what you are going to touch, and wait for a yes.** Not a
sweep — one object and one process, chosen from the block:

> «To finish, I would create a test record on **{object}**, edit a field, run **{process}** on it
> and delete it. That writes to the data database of {project}. Shall I?»

If they say yes:

- **Create** from the list's New button. Every required field, saved. It has to come back with the
  record on screen — not a dialog that closes with nothing written.
- **Edit** one field and save. Reopen the record: the new value has to be there, not the old one.
- **Run the process** from its button. Read what it answers, then check the CHANGE it claims to have
  made, in the data. A process that says «executed with success» and changed nothing is the most
  expensive thing this phase can catch.
- **Delete** what you created. Leave nothing behind.

Record each of the four with `flexygo_record_verification` like any other check, with what you
typed in `data`.

If they say no, say so in the result: "the screens were checked, the application was not used".
Those are different claims and only one of them was made.

⛔ **Never seed or delete anything the user did not agree to**, and never touch a record you did not
create. The point is to prove the thing works, not to leave a mark on somebody's data.

## 4-ter · When the block is SECURITY: verify as the user it constrains

A block that grants or denies — roles, profiles, page, object, navigation or process security — has
nothing new to paint, and walking its screens as the builder proves nothing: `admin` sees
everything. Measured 2026-09-17 on catMCP (`seguridad-comercial`): the one thing that found the real
fault — the role landed on «not enough credentials» because the shared interface forced a startup
page the block had just denied — was signing in as the user the block constrains.

So the check is functional, with **a test user per role the block touches**. **The roles are the
ones `/flx-context` recorded** — the `**Roles:**` line of the project memory, with what each one sees
and does in the user's own words: that line is what each role is checked against, and a role it names
that does not exist yet in the application is a finding, not a role to skip.

- **Create it**, named so it can be found and removed later (`comercial.test`):
  `flexygo_create_user(userName, email, roleName, password, profileName)`. Ask before creating it —
  it is a user in the customer's application. ⛔ **The licence is never worked around, under no
  circumstances.** The platform counts users against its licence at sign-in and this server cannot
  read that cap: if the test user is refused at the login, stop and put it to the user — use an
  existing user of that role, or let them free a seat — and never lock, delete or alter anybody, and
  never touch anything that belongs to the licence, to make room.
- **Sign in as them, in a clean session**: `flexygo_reload_cache` after the security changes, log
  out, log in — the platform caches security per session, so a stale one shows the old rules.
- **What they must reach**: every page, menu entry, object and process the block allows — open it,
  capture it. **What they must not**: every one the block denies — try it from the menu AND by its
  address, and it has to refuse, not paint. A denial that only hides the menu entry is half a denial.
- **Open a row of every list that role can reach**, and the capture is of the page that opened,
  not of the list. A row that navigates by TYPE goes through `Environment.FindPage`, and when the
  page meant is denied to the role it falls through to ANY page of that type the role can view —
  the platform's generic detail included — with no error anywhere. Measured 2026-09-18 on
  portal-clientes: `flx-cat-producto-cliente-list` opened `CAT_Producto_View` by type, T-15 had
  just denied it to `cliente`, and T-18 captured the list and never clicked. Put the page that
  opened, by its name, in `data`; a generic page or one the block did not build for that role is
  `list-row-target-denied` in `/flx-quality`, not a pass.
- **The landing.** What they see right after the login. The interface's startup page outranks the
  profile's, and a denied startup page is exactly the fault measured above.
- **Change the role and repeat**: `flexygo_update_user(userName, roleName)` to the other role,
  reload the cache, sign in again — what was denied is now reachable and the other way round. One
  switch proves the security follows the role, not the user.

Record each as a check: `flexygo_record_verification(affects, check, data, result, screenshot)`
with the user and the role in `data` («comercial.test, role comercial») and «reachable»/«refused» in
`result`. The two interface-level entries of the quality catalogue — `app-opens-on-nothing`,
`shell-widget-paints-nothing` — are checked here **per role**, signed in as that role, never once as
`admin`.

At the end ask whether the test user stays or goes; `flexygo_delete_user(userName)` removes it.
Never delete a user you did not create.

## 5 · Record it, check by check

**For every check, `flexygo_record_verification`** with `affects` (the task or the block), `check`,
`data` and `result`. `data` is mandatory on purpose: without saying what it was checked against,
nobody can repeat it or argue with it.

⛔ **A measured check is recorded with its MEASUREMENT, not with a tick.** The legibility script in
the plan returns ratios; `data` carries those numbers, per theme, and `result` says which of them
fall short. Writing "contrast: correct" is not a shorter way of saying the same thing — it is what
gets written when the script was never run, and the two are indistinguishable afterwards.

One agent reported "Contrast: ✓ Yes" on six pages having
never executed the script once; the browser tooling left no trace of it. Another did run it, and
still signed PASS with a raw identifier and a `/Date(…)/` on screen — both visible in the screenshot
it attached as proof. **The screenshot is evidence, so look at it before citing it**: a verdict that
contradicts its own attachment is the failure this whole phase exists to prevent.

**And pass it the screenshot in `screenshot`.** Save it with a `filename` under `.playwright-mcp/`
(never the project root) and hand it to `flexygo_record_verification` in `screenshot` — the server
moves it into `screenshots/verify/` and cites it in `verifications.md`; a capture left anywhere else
is not on record. Without that the screenshot is looked at once and lost, and then there is no way
to prove something was still fine after a later change — which is exactly what was missing when
five closed incidents were painted as open.

Write `check`, `data` and `result` in the user's language: they are what a person reads back.

If you are recreating an approved design, the original's screen goes separately, with
`flexygo_record_reference`: that one is the **before** and it is written once. The ones here are the
**after** and they accumulate. With only one of the two there is history, not comparison.

And then the comparison is made **row by row**, not at a glance:
`flexygo_generate_design_comparison` says which rows there are and what target each one has — eleven of
the thirteen go to "almost identical", and typography and spacing join them whenever the approved
original's own source is on disk. Those two drop to "recognisable" only against a PNG, which can
supply neither a font-family nor a comparable pixel scale; the script you are handed already says
which of the two cases this work is in, so read the Target column rather than assuming — and
`flexygo_record_design_comparison` records the verdict. It does not accept "it looks similar": all
of them must be answered, and one that falls short has to say what differs. "The badges fail, they
come out grey" is useful next week; "it looks similar" is not useful even today.
Pass the count `flexygo_compare_design_measurements` just printed for this screen as `deviations` —
without it, this pass and the next one cannot be subtracted to answer "did it improve".

⛔ **If a row turns out to have been judged wrong, or gets closed later, amend it — do not
re-measure the whole screen.** `flexygo_amend_design_row` corrects the `verdict`, `note`, `fix` or
`cause` of ONE already-recorded row and stacks a new entry with the other twelve copied as they
stood; `flexygo_record_design_comparison` is for a fresh pass, not for fixing one row of an old one.
Closing a parked row is one call: `fix: done` alone drops the `cause` the raise carried, and the
acknowledgement says which.

⚠️ **And the thirteen rows are ALL visual, so they cannot catch invented logic.** A copy identical
to the pixel whose rules were made up scores 11 `same` / 1 `similar` / 0 `different`. That is why
`flexygo_record_design_comparison` also requires `behaviours`: what this screen does that the screen
itself cannot show you — a control whose effect is not visible, a value whose rule is off screen, a
state the original can be in, a navigation with no destination built. Do NOT invent any of them: ask
the user whether they want a **placeholder** for now or would rather **explain** it, and record which
of the two was chosen. `[]` is a valid answer and is recorded as the claim it is.
⛔ **And if you find one you cannot settle by reading anything, do not drop it: declare it
`needs-user`.** That is the fourth resolution, and it is the state half of a real bank is actually
in — some of what a screen does cannot be worked out from any reference and only the user knows it.
It is not the cheap exit: it takes the `question` you are going to put to them, written out, and a
screen with one open is **not closed**, whatever the thirteen rows said. The failure it
exists against is seven findings deleted for want of a box to put them in, and one screen signing
"None declared" over two its own report had left explicitly open.
`flexygo_get_custom_screens_reference` §15 has the triggers and three worked examples.

And `evidence`, one line per screen: WHICH reference, and over WHICH record or state of the data
the copy was measured. A record card compared over an empty record, or over a different one than the
approved capture shows, weakens every row at once — and without this field nothing records that it
did. On the generated-project road the `palette` row also has to carry a **colour** in its note: the
hex measured on the built screen and the token hex it was compared against. Without one the tool
refuses and hands back the original's tokens — the value is the list, not the refusal.
`flexygo_get_custom_screens_reference` §17.

Whatever you only say in the chat is lost when the session closes, and the finding goes with it.

### 5-bis · Close it or raise it — there is no third exit

A visible difference from the approved original ends in exactly one of two places:

- **Closed.** Try the fix before writing the difference down. Almost everything that reads like a
  platform ceiling is not one: the sidebar and the accent colour are skin variables
  (`flexygo_set_skin_variable`), the pager's "Showing 1-16 of 16" is a CSS rule away
  (`flexygo_set_skin_css`), the box header is a container type — `containerId: 'noheader'` hides the
  header bar and keeps the toolbar, `'none'` removes header, window icons and toolbar and leaves the
  bare body — a list module went from 548 px to 432 px and its 7 window icons to
  0, the list still painting — and a relative date, a computed figure or an icon chosen per row type
  is a template.
- **Raised**, with its cause named — and the cause is a **field**, not a sentence
  inside the note. A row declared `fix: raised` carries `cause`: **skin**, **template**, **config**,
  **platform** or **scope**, and the tool refuses the raise without one, because that word is what
  tells the next person whether another attempt is worth making.

  ⛔ **And a raise closes the row only when somebody other than you has agreed to it.** Two shapes,
  and no third:

  - cause **platform** — the platform has no road for it. Record it with
    `flexygo_record_missing_capability` FIRST and put the `area` you gave it there into the row's
    `gap`: the tool checks that name against the gaps actually on disk and refuses one that was
    never written. An elevation nobody can count is one nobody will ever fix — on the Tender
    calque, of its three real platform ceilings exactly one had ever been recorded, and that one
    for a different facet than the one holding the screen down.
  - cause **skin**, **template**, **config** or **scope** — the difference is OURS, and then the
    row needs a **`decision`**: ask the user, record what they answer with
    `flexygo_record_decision`, and put the `D-n` it hands back into the row. Without it the row does
    not close, because the only other honest answer is to go and fix it with the mechanism its
    "Where it is fixed" column names.

  ⛔ **And the question you put to the user is honest about the cost, or the decision it
  produces is yours and not theirs.** Measured 2026-09-10 on a finished development: the approved
  original showed a brand side panel with the business nodes in it; the row's own "Where it is
  fixed" column said it is ONE call (`flexygo_update_interface`, `mainNavigateId` plus
  `clearNavigateId`); the pass asked the user whether to "keep the generic menu (recommended)"
  because a sidebar was "real work, not essential", the user said keep, and the row closed as
  `raised: scope` with a D-n. Not one call to the mechanism was ever made. Three rules, none
  negotiable: (1) before asking, DO what the mechanism column names when it is one call, and ask
  whether to keep it — not whether to do it; (2) never recommend the less faithful option on cost
  grounds — the cost is what the row says, not what you guess; (3) a `scope` raise is for what the
  model or the plan lacks, never for what a tool does in one call. A screenshot beside the
  reference goes with the question, so the user decides on what they see.

  ⛔ **Why a class of cause stopped being enough.** It was the toll put on raising so it would not
  inherit the traffic `similar` used to carry — and a word costs nothing next to a fix. Measured on
  the first development this rule ever met, closed 23/23 with all six screens compared and every
  comparison honestly measured: **64 of 64 differing rows raised and not one fixed**, three screens
  without a single `same`, and only 10 of the 64 were the platform — against 29 `scope`, 15
  `template`, 9 `config` and 1 `skin`. Several notes named the exact fix they were parking
  ("it would go away with `containerId 'noheader'` on those three"). **The toll that cannot be paid
  by writing is somebody else's answer.**

### When a screen is CLOSED — and why reaching the target is not it

⛔ **`same` is not a number that matched — it is a tile, a row, a header that LOOKS the same,
and it is closed with the two captures side by side.** Measured 2026-09-10: a KPI tile was styled
on the wrong element (the `h5` inside `.flx-easyinfo`, which is already the card), the probe read
24 px / 1 px / 8 px there, the reference said 24 / 1 / 8, and `spacing` and `density` closed as
`same` over a card drawn inside another card. Before closing a visual row as `same`, take the
screenshot of the built screen and put it beside the reference; if you cannot say in one sentence
that they look the same, they do not, whatever the numbers say. **And since 2026-09-11 the tool
checks that, instead of taking your word for it**: a `same` verdict makes `evidence` name the two
files, the one filed under `reference/` and the one filed under `screenshots/`, or the call is
refused.

⛔ **The KPI tile is its own row, `kpi-tile`, measured on `.flx-easyinfo` as a whole — never its
`<h5>`.** That is exactly the failure above: `record-card` is the ficha of a record, not the box
around a number, and had been answered `not-applicable` ("it is a dashboard") while nothing asked
about the tile itself.

⛔ **A screen is closed when every row is one of three things, and there is no fourth:** `same`,
`not-applicable` with the reason it does not apply, or `fix: raised` **with its backing** — the
`gap` when the cause is platform, the `decision` when it is ours. Anything else comes back in the
response by name, under **NOT CLOSED**, with the reason it is not final.

⚠️ And the closure gate reads this at the end too, not just the recorder: a development whose screens
were all compared still does not close while any row falls short with nothing behind it. It names
them screen by screen and row by row.

**A `similar` is never final**, whichever bar its row aims at. Every row of the table names a
mechanism in its "Where it is fixed" column, so `similar` says that mechanism was not tried. The two
rows that aim at *recognisable* aim there because of what a **PNG can evidence** — that is a
statement about the measurement, never a licence to leave a difference standing.

**And repeating the same table does not close anything.** Two identical passes measure that the
MEASUREMENT has settled, which is worth knowing and is not a verdict about the screen; repetition
counts only on rows that are already final, and anywhere else it *is* the finding — the same
difference, seen twice, acted on neither time. The tool names those rows back to you.

**And it is why this rule exists.** The Tender calque was declared finished
by two consecutive passes with nothing built between them — over a matrix of 5 `same` · 21 `similar`
· 7 `different` · 3 n/a on 36 rows. Checked again, the differences behind those 21 were
plugin CSS, a module container or a trimmable toolbar: roads this server already has tools for, and
every one of them named in that row's own "Where it is fixed" column.

⛔ **"A decision of style" is not a closure.** It is what gets written when nothing was attempted,
and it is indistinguishable afterwards from a difference that was actually studied. Three real ones
from the first pass, all three closable with a template and none of them tried: a revisions figure
that read "3,100 - 2,000 ≥ 300 h" where the original said "1025h · +25h exceso", relative dates
(Today/Yesterday) against absolute ones, and one icon for every kind of machine. All three were
archived as taste.

⚠️ The rule cuts both ways: raising something is **not** a way of getting out of trying. A note that
names *platform* on something a skin variable fixes is worse than no note, because it teaches the
next reader that the ceiling is lower than it is — which is exactly how the pager came to be
believed impossible.

⛔ **Reaching a row's target is not a closure either — the pager measured that too.** A note is not
only written on a row that falls short: the pager row (`toolbar-and-actions`, since promoted to
almost identical by K-37 — the lesson below is about notes, not about which target a row carries)
was already `similar` against its `recognisable` target at the time, so it passed, and the note
that said "closeable but of global scope, not touched because this row's target is only
'recognisable'" was never read — nothing lists a row that already meets its target.
`flexygo_record_design_comparison` now reads that note as a difference you saw and asks for `fix`
(`done`, `raised` or `none`): leave it out and the row comes
back as **seen and not closed**, on the same screen and in the same response, instead of going
quiet inside a row that passed. "The row only has to be recognisable" answers what the row needs to
reach its target; it does not answer what happens to a difference already named in its note — those
are two different questions, and treating the first as an answer to the second is what parked the
pager one `flexygo_set_skin_css` rule away from closed.

⛔ **`fix: none` over a note that names a difference is not honest either — the guardian cannot see
it, but you can.** `flexygo_record_design_comparison` prints every `none` declared over a non-empty
note under its own heading, *declared as nothing-to-close* — it does **not** park them by itself,
because prose is not something a tool can judge: a note that is a pure measurement (typography and
spacing, K-27) is a correctly-declared `none`, and a note that names a visible difference under a
`none` is not. Read each one. One whose note names a difference counts as a **parked row** when a
pass is judged (criterion 5 of the protocol's §5), even though the printed list alone did not park
it — the correction is of READING, the same one K-24 needed for the pager note.

What IS mechanical: a `none` (or an omitted `fix`) on a row the **last previous comparison of the
same screen** declared `raised` is a degradation, and the tool parks that one itself, labelled as
such, no reading required — `design.md` is this service's own fixed format, so re-checking the last
table for the same screen is re-reading our own output, not prose. `raised → done` and
`raised → raised` are not degradations.

### What counts as the MECHANISM behind `done`

`done` means the difference closed by the road the row's **"Where it is fixed"** column names —
a template, a skin variable or skin CSS acting in its own layer, a toolbar tool, a translation key.

**Not `done`**, however convincing the screenshot: visible text injected with CSS (`content:`),
`!important` or a specificity war fought against a platform rule, and the DOM edited by any means
outside the tool the mechanism names. Those are patches. They are invisible to a screen reader,
they skip `{{translate|…}}` entirely, and they fall the moment the skin changes underneath them —
declare them `raised` with their cause instead, and when the cause is a missing tool, also
`flexygo_record_missing_capability`: that is how K-30 should have surfaced inside its own pass
instead of being patched over.

**A real case:** a "New machine" label on the standard New button, delivered as
`::after { content: "New machine" }` over the platform's own text, verified with
`getComputedStyle` and declared `done`. It read as closed and was a patch — the button's real label
never changed, so anything reading the DOM (a screen reader, a translation pass, a different skin)
still sees the platform's original text.

**The boundary, said aloud, because "used CSS" is not the test.** `color-mix()` on a badge's
background to fix a contrast ratio IS the mechanism — colour belongs to the CSS layer, that is
exactly where the fix for a colour problem lives. The sin is not reaching for CSS; it is injecting
*content* that was not there, or fighting the platform for a property it already owns.

**Styling on top of a standard module is ALWAYS inside the mechanism.** A standard list, a standard
view, the module box, the toolbar row — putting the design's colours, spacing and type on them is
what the skin and the plugin are for, and none of it is a patch. Say "the platform owns this" only
about something measured to have no road, and measure by trying the road, not by reading the
component for a flag it has no reason to carry.

**And before calling a piece of chrome a ceiling, remember what a toolbar is.** The nine buttons a
list paints are not the component's: they are rows of the toolbar it was given, and the bar comes
down to whatever the design has — `flexygo_add_toolbar_button` clones the shared bar into one this
origin owns, `flexygo_list_toolbar_buttons` re-reads the ButtonIds the clone reissued, and
`flexygo_set_toolbar_buttons` keeps the ones the design has and removes the rest in one call
(`flexygo_delete_toolbar_button` for a single one). Nine down to three,
one screen only, no CSS. Trimming a bar this way is `done`; leaving the eight standard buttons on a
screen whose design has one, and writing "platform" next to it, is not. This should already have
been settled when the module was built — see `/flx-execute`, "The toolbar is part of the design";
finding it open here is a repair, not the first pass.

### A fix that re-homes artifacts is not closed until the old ones are gone

A page moved to a new place in the tree is not "fixed" while the old links to it still exist — that
is how a duplicated menu happens: five nodes created under the new parent, five left under the old
one, both live, both visible. `done` on a re-homing fix requires both halves: the superseded
originals retired, **and** the gap record (`.flexygo/memory/gaps.md`) updated to say so — a gap
still marked "not resolved" after the artifacts moved is the record lying about work that was done.

And verifying a navigation fix means looking at **every** navigation root, not only the one the fix
touched — the duplicate menu was visible in the very screenshot a verification signed off as
"correct after the fix", because the check looked at the panel the fix built and never re-checked
the bar the fix was supposed to empty.

## 6 · Do not fix what fails on your own

Tell the user what fails and propose the fix. If the failure contradicts what was agreed, it is
also a review finding: `flexygo_record_review`. If it proves an assumption in the plan was false,
`flexygo_revise_assumption`.

Never write `.flexygo/` by hand and never seed data without the user's explicit permission.

When the pass is over, say how it went and what comes next: `/flx-execute` if any task went back to pending, the next block if there is one, and if everything passed, say that too — a verification that ends without a verdict reads like one that was left half done.

## The verdict reopens the task

`flexygo_record_verification` carries **`ok`**. Set it to `false` when something does not work on
screen, and the task goes back **to pending** by itself, with the reason in `execution.md`.

**Say it out loud when it happens.** The tool answers which tasks reopened; that answer is for the
user, not just for you. Tell them which ones went back and that the way to close them again is
`/flx-execute`, which redoes the task and records the fix, followed by verifying once more. A task
that reopens in silence leaves a plan that quietly stops being finished, and the person who has to
decide never hears about it.

That is what makes "finished" mean "it has been seen working" and not "the agent said it did it".
The opposite already happened: two defects —a `switch` with quotes and a key `1` against a `bit`
column— left five closed incidents painted as open, and both `flexygo_verify_object` and the review
passed them.

### The third verdict: it fails, and it is not this block's

A verify pass finds defects older than the block — the list row that never opened the record, a
page with no filters, a state painted white on white — and neither exit fits: `ok: false` reopens a
task that did nothing wrong, and an incident record is read by no gate of the plan. Record it as a
verification with **`outsideBlock`** saying where it comes from:

```
flexygo_record_verification(affects: "B-2", check: "the orders row opens the record",
  data: "12 orders, user admin", result: "it does not, the row has no action",
  screenshot: "orders-row.png", ok: false, outsideBlock: "built in B-1, not touched by B-2")
```

`ok` has to be `false` — a defect passes nothing — and **nothing reopens**: the task in `affects`
is the one you were verifying when you found it, not the one that caused it. The entry is filed
under its own verdict, and `flexygo_development_status` lists every one of them. Propose a home to
the user: a task in the next block (`flexygo_amend_plan_block`, with the entry as its origin), a
quality finding (`flexygo_record_quality_finding`) when it is an absence the catalogue names, or the
user's decision to leave it (`flexygo_record_decision`). Tell the user which one you propose; never
pick on your own. The server does not track which home each one got, and the closure does not check
it: the closing report says it, one by one.

When the pass is over, say how many pages were seen, how many reopened, how many defects were
filed outside the block, and **which command comes next**.

## The closing report — once, on the last block

The whole flow publishes **two artifacts and no more**: the model with its screens when it was
decided, and **the closing report, which is published HERE** — by the `/flx-verify` that closes the
**last** block, when `flexygo_development_status` says every block is executed and this pass leaves
nothing reopened. A verify pass on an earlier block closes in the terminal, like a block does: one
report per block was measured at about eight per product, and eight is how a user learns not to
open any.

What the closing report carries, in this order: the verdict — every block, every page seen, what
reopened along the way and how it was closed again; the comparison against the approved original
where there is one, screen by screen, with what was `raised` and its cause; **the defects filed
outside the block**, under their own heading, each with the home it was given or marked as still
without one; what `flexygo_record_missing_capability` recorded; and what is still open, separated
from all of it. It
is what the person who commissioned the work reads to decide it is finished, so it is written in
their language and its first line is the verdict. **Publish it and hand them the link**, then say
that `/flx-quality` extends this same report if they want the pass that asks what is missing. When
the development built processes or screens, the next step is `/flx-test`: the product's own tests
for them, before `/flx-quality`.

⛔ **The file behind the artifact goes to the session's scratchpad, never into the project.**
Publishing, and republishing, takes an `.html` on disk first: write it in the scratchpad directory
the session names — or the OS temp directory when it names none — and nowhere else. Measured
2026-09-18 on flxCatalog: the closing report was written as `scratchpad_report.html` at the ROOT of
the customer's repository, beside the `.sln`, and stayed there among their own files. The link is
the deliverable, not the file: put it in the closing message and say the user can reopen it any time
from their artifacts gallery (`/artifacts` in Claude Code); the file can go.
`flexygo_get_project_status` names any `.html` or `.md` at the project root that cites a `/flx-`
command as a report left behind — ask the user before removing one.

⭐ **File the link before the closing message**: `flexygo_record_report_link(url: <the link the
publish returned>, kind: closing)`. The gallery does not say which project a report belongs to;
`.flexygo/` does, and `flexygo_development_status` shows it from then on.

And when a unit of work closes, look at whether the SESSION should close with it: the
seams that are worth offering `/clear` on, and the three lines plus the ready-to-paste
prompt that have to go with the offer, are in `.claude/CLAUDE.md`,
under "Leaving the session". You cannot measure your own context — the seam is what you can see.
