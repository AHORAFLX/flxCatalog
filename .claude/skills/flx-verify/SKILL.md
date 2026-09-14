---
name: flx-verify
description: Checks that what was built WORKS on screen, not only that it exists. Brings the application up in a browser, walks the block's pages and leaves a record of every check. Invoke it when closing a block of /flx-execute.
---

# Verify that it works

There are three levels and only the third is noticed by a user:

| Level | Who covers it | What it proves |
|---|---|---|
| It exists | `flexygo_verify_object` | The object is there and has its parts |
| It is coherent | `/flx-review` | What was built matches what was agreed |
| **It works** | **this phase** | It looks right and can be used |

A list can pass the first two while showing raw identifiers, with no clickable row and no menu.
That is only seen by looking at it.

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
process guidance, which carries where mail actually goes.

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

## 1 · Get your bearings and narrow the scope

`flexygo_development_status`, to know which block has just been executed and which entities came out
of it. **Verify that block, not the whole project**: nobody runs a forty-page script.

## 2 · Without data there is no verification

An empty list paints just as nicely as a correct one. If the block's tables are empty, **ask the
user whether to seed test data** — and do not do it without an answer. The rules are in
`flexygo_get_schema_and_seeding_guide`: FK order, 10–20 rows so that lists, filters and paging can
be exercised, and realistic data in the user's language.

If the user says no, verify anyway and **say so in the result**: "with no data, all that is checked
is that the page loads".

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

**One page, one subagent.** Opening a screen dumps the whole accessibility tree, and out of all
that only two things survive the verification: a verdict and a screenshot. Walking six pages in this
thread fills it with DOM nobody will re-read, and by the sixth there is no room left to think.

The same rule as in `/flx-execute` applies: **pass the reference, not the contents.** The subagent
gets the step's URL, the minimums the script asks for that page, and the path where it leaves the
screenshot. Never the whole script.

**One at a time**, not in parallel: there is a single browser, and two subagents driving it at once
tread on each other's tabs.

And what it has to return, which is where this goes wrong when left unsaid: **one verdict per
minimum in the script, and the path of its screenshot.** Not a summary. A subagent that answers
"all correct" without naming what it looked at is worse than not delegating, because it has the
shape of a verification that was done; if it comes back like that, do not take it and ask again,
naming the checks.

You keep what matters: recording each check (§5) and deciding what fails.

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

**And pass it the screenshot in `screenshot`.** It is filed under `screenshots/` next to the work
and cited in `verifications.md`. Without that the screenshot is looked at once and lost, and then
there is no way to prove something was still fine after a later change — which is exactly what was
missing when five closed incidents were painted as open.

Write `check`, `data` and `result` in the user's language: they are what a person reads back.

If you are recreating an approved design, the original's screen goes separately, with
`flexygo_record_reference`: that one is the **before** and it is written once. The ones here are the
**after** and they accumulate. With only one of the two there is history, not comparison.

And then the comparison is made **row by row**, not at a glance:
`flexygo_generate_design_comparison` says which rows there are and what target each one has — ten of
the twelve go to "almost identical", and typography and spacing join them whenever the approved
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
`cause` of ONE already-recorded row and stacks a new entry with the other eleven copied as they
stood; `flexygo_record_design_comparison` is for a fresh pass, not for fixing one row of an old one.

⚠️ **And the twelve rows are ALL visual, so they cannot catch invented logic.** A copy identical
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
screen with one open is **not closed**, whatever the twelve rows said. The failure it
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
that they look the same, they do not, whatever the numbers say.

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
`flexygo_delete_toolbar_button` removes the rest. Nine down to three,
one screen only, no CSS. Trimming a bar this way is `done`; leaving the eight standard buttons on a
screen whose design has one, and writing "platform" next to it, is not.

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

When the pass is over, say how many pages were seen, how many reopened, and
**which command comes next**.

## The closing report — once, on the last block

The whole flow publishes **two artifacts and no more**: the model with its screens when it was
decided, and **the closing report, which is published HERE** — by the `/flx-verify` that closes the
**last** block, when `flexygo_development_status` says every block is executed and this pass leaves
nothing reopened. A verify pass on an earlier block closes in the terminal, like a block does: one
report per block was measured at about eight per product, and eight is how a user learns not to
open any.

What the closing report carries, in this order: the verdict — every block, every page seen, what
reopened along the way and how it was closed again; the comparison against the approved original
where there is one, screen by screen, with what was `raised` and its cause; what
`flexygo_record_missing_capability` recorded; and what is still open, separated from all of it. It
is what the person who commissioned the work reads to decide it is finished, so it is written in
their language and its first line is the verdict. **Publish it and hand them the link**, then say
that `/flx-quality` extends this same report if they want the pass that asks what is missing.

And when a unit of work closes, look at whether the SESSION should close with it: the
seams that are worth offering `/clear` on, and the three lines plus the ready-to-paste
prompt that have to go with the offer, are in `.claude/CLAUDE.md`,
under "Leaving the session". You cannot measure your own context — the seam is what you can see.
