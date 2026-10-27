---
name: flx-quality
description: Takes a finished block apart looking for what it is MISSING — the pager the mock never drew, the empty state, the way back — puts the findings to the user and records their decision. Invoke it after /flx-verify and /flx-test, one block at a time.
---

# What is missing, and only the user decides

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

The three gates before this one all measure against something that already exists.

| Gate | Measures against | What it cannot see |
|---|---|---|
| `/flx-review` | the plan | what the plan never said — and no plan says "the list has a pager" |
| the calque, inside `/flx-verify` | the approved original | what the mock never drew |
| `/flx-verify` | that the screen paints and can be used | that it paints something poor perfectly |

**A mock is a still photograph.** No second page, no empty list, no validation error, no denied
permission, no 500 rows. So a block can pass all three and still be missing everything this phase
looks for — and worse, **copying does not merely fail to add function, it REMOVES it**:
`/flx-verify` correctly trims the chrome the mock does not carry, and that is exactly how "Export",
"New" and "Filter" disappear.

⛔ **You fix nothing on your own initiative.** This phase exists so the user sees what we say
**with the option to correct it**. Record, ask, then record their answer.

## 0 · Read the catalogue first

`flexygo_get_quality_reference`. It is the closed list of sixteen entries — fourteen anchored to a
module or a page, plus two anchored to the interface itself — each with the platform evidence that
the function exists, the read that detects its absence, what the absence costs, the mechanism that
fixes it, and **the gate that says when it does not apply**.

⛔ **What is not in the catalogue is not a finding.** It is an idea, and it goes to the user in the
chat — not into `quality.md`. `flexygo_record_quality_finding` refuses an `entry` that is not one
of the sixteen, and that refusal is the point: this phase is a tap, and the catalogue is what
shuts it. An idea earns an entry only with a live case seen on screen and the reference's four
tests answered with file and line.

The reference also carries the two things that most often make a finding wrong:

- **A suppression in the calque's CSS does not prove a loss.** Four sqllist modules had their
  footer hidden and there was no pager under it — their `PagerId` was NULL from the day they were
  created. Read the module before calling anything a loss.
- **`containerId: 'none'` switches things off silently.** It delivers only `.cntBody` and
  `.cntBodyFooter`, so the searcher and a `listheader` pager have nowhere to land. ⚠️ It does NOT
  take the Save button with it, and the reference said it did until it was measured on screen: an
  `flx-edit`'s bar lands in `.cntBodyFooter`, which `none` keeps.

## 0-bis · Walk in as a user BEFORE reading the catalogue

The catalogue is read from configuration, and configuration does not show you what a user sees
first. So the pass starts in the browser, signed in as a user of the application, not as its
builder: what opens after the login, what the shell shows (the side panel, the top bar, what is
under them), and then each screen of the block in turn — one look each. Measured 2026-09-10 on a
finished development: the catalogue-only pass closed the dashboard as "no findings" while the login
landed on the platform's empty control panel, HOME opened nothing and the side panel was a search
box over nothing; nobody had walked in. What that walk turns up is then matched against the
sixteen — the two application-level entries exist for exactly those three — and what fits none
of them goes to the user in the chat as an idea, named, never dropped and never recorded.

## 0-ter · What the user already dismissed is decided

A `dismissed` with the user's reason is a **project decision**, and it holds across developments:
the user who refused the searcher on the catalogue refused it for the portal too. Measured
2026-09-16/17: six `list-no-searcher` dismissed with the reason recorded, and the next day's pass on
another development recorded the same entry `open`, put it to the user as a new gap and applied the
mechanism — and on skin2026 that "fix" was a search box at 0×0.

So before detecting anything, `flexygo_recall_decisions` with no term: its block **Quality findings
the user has already dismissed** lists, per entry, how many anchors, when, the reason and where.
When an entry you detect is in that block:

- it is presented as **that decision applying here unless they say otherwise** — not as a new
  gap, and the mechanism is not offered;
- `flexygo_record_quality_finding` says the same in its answer when you record it `open`, and
  writes it under the table as **Already decided**;
- recording it `fixed` is **refused without a `reason`** in the user's own words, from this pass:
  reversing their decision is theirs to do, never yours.

## 1 · By BLOCK, never by project

Nobody reviews forty screens. Take the block that just closed `/flx-verify`, list its pages and
their modules, and work through them one at a time.

`flexygo_get_page_full_config` gives you a page's modules; `flexygo_get_module_full_config` gives
you the configuration each entry is detected in. Those two reads answer most of the catalogue
without opening a browser: `PagerId`, `Searcher`, `ShowWhenNew`, `ContainerId`, the template id.

### 1-bis · When the block is an OFFLINE app

The same sixteen questions, different reads — a device screen is a row with no module under it, so
none of the web detections above can be run. The reference's §5-bis is the map: **seven entries keep
a reading on the device and nine do not**, each for a reason read in the device's own components,
and every entry says which under **On the device**.

- The anchor is the **screen**: `anchorKind: 'page'` with the `PageName` of the offline page. The
  two application-level entries keep their own anchor even here — `anchorKind: 'interface'` — since
  they are a property of the interface, not of one screen.
- The read is `flexygo_get_offline_app`, once for the whole app: its PAGES line carries per screen
  the four yes/no facts the device detections need — `search bar WITHOUT filter`, `no empty text`,
  `no navigation`, `no 'new' button`. The body and where each button leads are read with
  `flexygo_get_offline_page`, one call per screen that needs it.
- The nine that do not apply are **not recorded** — not `open`, not `dismissed`, and not
  `not-applicable` either: that status is for an entry that HAS a reading here and whose gate does
  not hold, and an entry with no reading on the device is not a finding there.
- ⛔ `showSearchBar: true` on its own paints nothing: the device needs `sqlSearchFilter` too, and a
  query with `UNION ALL`, a CTE or a subquery has to be wrapped before the filter can be injected.
  The `list-no-searcher` entry carries the rule that worked on all three screens of the first pass.

### 1-ter · When the block is SECURITY

The roles are the ones `/flx-context` recorded in the project memory's `**Roles:**` line — the same
line that gates `security-no-rows`: with `several`, that entry applies even when only the platform's
own roles exist.

A block that only grants or denies has no new screen to anchor. Its anchor is the **interface**
(`anchorKind: 'interface'`), and the two entries that live there — `app-opens-on-nothing`,
`shell-widget-paints-nothing` — are checked **per role**, signed in as the test user `/flx-verify`
§4-ter created for that role, never once as `admin`: what a denied startup page shows is exactly
`app-opens-on-nothing`, and `admin` never sees it. An entry whose gate holds for that role (the
startup page is set and reachable; the navigation root serves the role's own nodes) is recorded
`not-applicable` with the gate and the value read as `reason` — one row per entry, never `[]`.
⛔ The licence is never worked around: a test user the login refuses goes back to the user, never
around the cap.

A security block also owns one module-anchored entry: `list-row-target-denied`, on every list the
roles it constrains can reach. It is read **per role**, signed in as that role: open a row and read
which page opened — `/flx-verify` §4-ter already did, and its record names the page. A row that
lands on the platform's generic detail, or on a page the block did not build for that role, is the
finding, anchored to the list MODULE; a row that opens the role's own page is `not-applicable`
with the page name as `reason`.

### 1-quater · The connectable product is checked on every object of the block

For every object this block built or touched, call `flexygo_verify_object` and read its AI-metadata
check: whether the object carries a description a connector could read, whether its
fields with codes and its fixed-list combos do, whether its linked process descriptions are
written for the person who runs them (not jargon, at most 200 characters), whether its processes'
parameters are described, and whether a field or view description only repeats a name. Put whatever it
reports as WARN or FAIL to the user like any other finding — what is missing, and the tool named
on that line that fills it. **This one is never gated on whether the WebAPI is switched on**: in a
development environment it normally is not, so that flag is no signal to wait for — filling these
fields is a cost the agent pays so the user does not have to. It is not one of the sixteen
catalogue entries above and is not recorded through `flexygo_record_quality_finding`:
`flexygo_verify_object`'s own report is the record.

## 2 · Detect, and detect without judgement

For each module, walk only the entries its type can carry — the reference groups them by type, and
nine module types carry **zero** entries on purpose because nobody has measured a live case on
them. Then, for each entry that fires, **apply its gate before writing anything down**. A gate is
not a formality: `list-no-inline-edit` is deliberately narrow, and outside its conditions editing on
a separate page is the correct design and there is no finding at all.

What goes in each column of the row:

- **`found`** — what was SEEN and the read that showed it. `PagerId` empty with `PageSize=50`, not
  "the list looks limited".
- **`mechanism`** — the tool and the parameter. `flexygo_update_object_list_module(pagerId:
  'syspager-listfooter')`. A finding with no mechanism is a complaint, and that is true of one the
  user dismisses too: what they refused has to stay legible a year from now.

## 3 · Record them `open`, and then ask

`flexygo_record_quality_finding` once per module, page or interface, with the array of everything
you found on it. Anchor it to the **module, the page or the interface** — the last one only for
`app-opens-on-nothing` and `shell-widget-paints-nothing`, which are a property of the interface
itself — and never to a plan task: the tool refuses a plan id, because almost no finding
corresponds to a task, the plan did not write the pager either.

An `open` finding keeps that anchor **NOT CLOSED**, which is what stops this phase ending in a
list nobody acted on.

Save a capture backing a finding with a `filename` under `.playwright-mcp/` (never the project
root) and hand it to `flexygo_record_quality_finding` in `screenshot` — the server moves it into
`screenshots/quality/`; a capture left anywhere else is not on record.

⛔ **Never write `.flexygo/` by hand.** The tool writes `quality.md` in the shape the next pass
reads back — a table edited by hand loses the history, and the reopening check goes quiet without
saying so.

Then put them to the user, in their language, in one message per block: what is missing, what it
costs them, what it would take to fix. Short. They are deciding, not reading a report.

## 4 · Record what they answered

A second call on the same anchor, with the same entries and their final status:

| Status | When | What it needs |
|---|---|---|
| `fixed` | you applied the mechanism | say which call closed it, in `found`; on an entry the user dismissed before, `reason` in their words; on `list-no-searcher` with the searcher switched on, the capture of the visible box in `screenshot` — on skin2026 the flag alone paints a box at 0×0 |
| `dismissed` | the user decided it stays | `reason`, **in their own words** |
| `not-applicable` | you checked the entry and its gate says it does not apply here | `reason`: the gate, with the value you read |
| `raised` | it was not closed | `cause`: skin, template, config, platform, scope |

A `platform` cause also goes to `flexygo_record_missing_capability` — an elevation nobody can count
is one nobody will ever fix.

An anchor where every entry you looked at came up not applicable is recorded the same way — one
`not-applicable` row per entry, never `[]`: the tool refuses an empty array because it reads
exactly like a screen nobody looked at.

⛔ **A finding a previous pass closed cannot come back as `open`.** The tool detects it and the
anchor stays NOT CLOSED: confirming a closure is done by repeating the closure, not by omitting it.

## 5 · Fixing what the user approved

Whatever they said yes to is built the ordinary way — the same tools, on the same artifacts — and
then **verified again**. A pager that was added and never looked at is a finding that moved, not
one that closed. If the fix is big enough to be work rather than a parameter, it is a task, and a
task goes through `/flx-plan` and `/flx-execute` like any other.

## 5-bis · A screen drawn outside `/flx-design` is filed

If fixing a finding — or anything else in this phase — generates or regenerates a screen with
Stitch, it is filed **at that moment** with `flexygo_record_reference` in the development it belongs
to, capture first and HTML second, exactly as `/flx-design` files its own. Recording the redesign with
`flexygo_record_incident` does not replace the filing: a screen that lives only in an incident entry
compares against nothing. Measured 2026-09-16, a redesigned list was recorded as an incident and never
filed, and the page built from it was checked against the old reference.

## 6 · Closing the block

The block is closed when every anchor in it comes back **CLOSED on the findings** — every row
`fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or
`raised` with its class of cause.

**On the last block, answer what went wrong while building — before saying what comes next.** One
`flexygo_record_incident` for each thing that failed along the way, with what came back word for
word in `literal`; or one with `status: 'none-found'` if truly nothing did. Without that answer the
status never reports the development as finished, and it sends you back here.

Then say what comes next: the next block's `/flx-quality`, or, if this was the last one,
`/flx-help` when the development built screens — the help of each one for whoever uses it — and
after it `/flx-api` if the project is used from outside (its context says so, and
`flexygo_get_project_status` names it). The development is not complete until those are recorded.

**On the last block, extend the closing report — never publish a second one.** The last
`/flx-verify` published the development's closing report; the findings of this phase, with what the
user decided about each and what got built from it, go **into that same artifact, updated in
place**, as a section after the verdict. The whole flow publishes two artifacts — the model when it
was decided, and the closing report — and this phase owns neither: it adds to the second. A block
that is not the last one closes in the terminal.

⛔ **The file behind the artifact goes to the session's scratchpad, never into the project.**
Publishing, and republishing, takes an `.html` on disk first: write it in the scratchpad directory
the session names — or the OS temp directory when it names none — and nowhere else. Measured
2026-09-18 on flxCatalog: the closing report was written as `scratchpad_report.html` at the ROOT of
the customer's repository, beside the `.sln`, and stayed there among their own files. The link is
the deliverable, not the file: put it in the closing message and say the user can reopen it any time
from their artifacts gallery (`/artifacts` in Claude Code); the file can go.
`flexygo_get_project_status` names any `.html` or `.md` at the project root that cites a `/flx-`
command as a report left behind — ask the user before removing one.

⭐ **The link stays filed**: the last `/flx-verify` filed it with `flexygo_record_report_link(url:
<the link>, kind: closing)`, and updating the artifact in place keeps the URL. Only if publishing
handed you a NEW link, file it again with the same call — it replaces the old one and says so.
