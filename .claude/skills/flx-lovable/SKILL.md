---
name: flx-lovable
description: Implants into Flexygo a generated project (Lovable or another) the client has already approved — reads the generated project, files its screens as the reference, translates the model and builds each screen to look like it. Invoke it with the path of the downloaded folder, e.g. /flx-lovable G:\MCP\proyecto, or when the user says they bring an approved design.
---

# Implant a project already approved

Someone showed the client a generated application, the client said yes, and now it has to be
recreated in Flexygo. That changes one thing compared with building from scratch: **an original
exists**, and the work is judged by comparing against it, not against whatever anyone finds pretty.

This is **not a separate flow**: it is the usual one —`/flx-plan`, `/flx-discuss`, `/flx-execute`,
`/flx-verify`— with two additions at the start (read the original and file it) and one at the end
(compare against it). Do not write plan files yourself and do not split subagents into batches.

## The rule that governs everything below

This is the user's own rule, decided after watching the first screen built this way:

> **The one that looks like the generated project wins.** You may change everything — overriding
> the styles that are already there, and whatever else it takes for it to look alike.

Resemblance to the approved original is the objective function, so three things change how every
step below is read:

1. **HTML + CSS + JS are a normal route here**, not an exceptional escape hatch. Look at the
   screen, think, and choose.
2. **Typed modules are used where they clearly fit**, not everywhere. Do not force the screen into
   the modular idiom: where the original puts a control somewhere Flexygo would not, the original's
   position wins.
3. **Every screen gets a technique chosen for it**, off the E1–E4 ladder that
   `flexygo_get_custom_screens_reference` carries, and that choice is written into the plan (§7).
   You go DOWN a rung for a **functional** need, never an aesthetic one — the look is reached with
   a template and CSS one rung up, and each rung down is paid for in pager, search, presets and
   offline.

⛔ **What this turns on is the ORIGINAL, not the generator.** It governs equally when the original
is a set of screens the user brings or one drawn by Stitch — those roads run through `/flx-design`
and reach the same comparison. With **no** approved original to match, the modular doctrine still
governs: typed modules are what give filters, pager, security, offline and audit for free, and none
of that is worth throwing away for a taste nobody has approved.

The verdict does not move: `flexygo_record_design_comparison`, row by row (§8). Under this rule
that comparison stops being paperwork — it is the score of the only thing being asked for.

## 0 · The project path

The first thing is **where it is downloaded**. If the user invoked the skill with a path, use it. If
not, ask for it — and tell them exactly which folder you want:

> The unzipped folder that contains `package.json` and `src/`.

The two mistakes that always happen:

- **They give you the parent folder.** That is normal, because inside it are the ZIP and the good
  folder: `G:\MCP\incidencias` contains `incidencias\proyecto`. If the path they give has no `src/`,
  look one level down before giving up, and say which one you used.
- **They give you the `.zip`.** It is not read compressed: ask them to unzip it and give you the
  resulting folder.

Never assume the path or deduce it from a similar-looking name. If it does not turn up, stop and ask.

## 1 · Read the generated project before opening a single file

`flexygo_read_generated_project` with that path. **Before anything else**: in one project,
74 % of the code was template library, and this tool says which 74 % so that you do not read it. It
also returns the design tokens with the colours already converted, the fonts, the assets, and —if the
project brings a schema of its own— **where the real model is**.

Read it whole before deciding anything. What it tells you to read yourself, read yourself: the routes
say what is a list, what is a record card, and which screens Flexygo would not lay out that way.
Those last ones are **not discards**: they are the ones that will need a technique picked for them.

## 2 · Record the context and open the work

**`/flx-context` first**, describing the project. It is not optional and it is not a courtesy step:
without it `flexygo_create_development` refuses —*«No project context has been recorded. Run
/flx-context describing the project before planning.»*— and this step saves the wasted call.

Then `flexygo_create_development` with what is going to be implanted. It is needed now because the
next step needs an active development.

**And then call `flexygo_read_generated_project` once more with `annotateOnly: true`**, so the
project's path gets written onto the work. §1 has to come before this — you read the project to know
what you are opening a development for — so the note cannot be written the first time round, and the
tool says so in its own last line: *«There is no active development, so the generated project's path
is not noted.»* That line arrives at the bottom of a
report thousands of tokens long and is easy to walk past; `annotateOnly` re-emits nothing, so the
second call is cheap.

## 3 · File the approved screens, with the generated project running

Bring the generated project up (`npm install` and its dev command; **there is no `bun`** even if it
ships a `bun.lock`), walk it, and file every approved screen with `flexygo_record_reference`.

**Now, not at the end.** It is the only moment when the generated project is up and at hand; leaving
it for later forces somebody to bring it up again, and with no reference there is no comparison, only
opinions. It is written once and not replaced without a reason: it is the **before**.

**File the ones you are going to implant.** It sounds obvious and it failed: in one pass two
screens were filed —the public front page and the login—, which were exactly the two that had been
decided **not** to implant, and the twelve that were built have no reference at all. Walk the list of
routes you classified and check that each one going to Flexygo has its screenshot.

**Walk it, do not just read it.** The code says what a screen does; only the running screen says what
SHAPE it has, and the shape is what decides the technique. The failure this produces is exactly that: a
grid of cards, read off the code, was implanted as an HTML table. While you are in front of each
screen, note what §5 will need — is a row a card or a table line, how many actions does each card
carry (count them on the screen, not in a snippet), which blocks are edited in place, and how many
decorated boxes the original stacks around the content.

### If you cannot get into the generated project

It happens, and it is a finding, not paperwork: the original may ask for credentials, require
confirming an email, be down, or have an empty database. As soon as you see that **what has to be
copied is behind a login**:

1. **Ask the user for them.** That is the first thing and it almost always solves it.
2. If they do not have them, **ask them for their own screenshots** of the approved screens — the
   client saw them, somebody must be able to show them.
3. If not that either, **say so and leave it written** with `flexygo_record_decision`: that it is
   built without a reference, and why. Do not carry on as if nothing happened: what you build will be
   a translation of the code, not a copy of what was approved, and whoever looks at it in three
   months has a right to know.

And if the original answers but is **empty**, say that too: its screens serve you for the frame
—grid, typography, density, where each block falls— and not for the content. File them anyway, with
that note.

## 4 · Translate the model

Where the model comes from depends on what the project brings, and the report from step 1 tells you:

- **If it brings its own schema** (SQL migrations, Prisma, Drizzle): the model is there. Pass it to
  `FlexygoShowSchema` in `schemaSql` to see it drawn, and translate the types with the equivalence
  table in `flexygo_get_schema_and_seeding_guide`. The DDL wins over any row.
- **If it brings data stitched into a file** (`src/data`, `src/lib`): `flexygo_propose_model` with
  those rows. It will tell you what each field turns into and why, and return as questions whatever
  it cannot decide. It is a proposal: show it to the user, do not take it as settled.

⛔ **If there are no rows, do not invent them.** A proposal over invented data is a proposal over
nothing. Build from the schema and say so.

Also load `flexygo_get_conventions` and `flexygo_get_entity_anatomy` before proposing names: the
model knows SQL, it does not know Flexygo.

## 5 · Split the coverage, and choose a technique per screen

`flexygo_propose_coverage` with the routes you classified. It says which Flexygo artifact has an
original and which does not, and **that decides what can be compared at the end**: an edit the
generated project never had is not a defect, it is a row the verification must not look for.

**Pass it what lives inside a screen too**, with `inside_of`: an export button, a file upload, a
comment thread on the record card. That is where what really did not translate was hiding, and a
coverage that only looks at routes gives as covered what nobody has looked at:

```json
[{"route":"/","type":"list"},
 {"route":"exportar CSV","type":"other","inside_of":"/"}]
```

The route names are the user's — they come from their project and stay as they are written there.

And before discarding something, think about whether it really has no equivalent: a comment thread,
an array of photos or an attachment **do** have a shape in Flexygo — related list, child table,
document manager. The tool will return it to you if it sees it; if you discard it anyway, say why.

Then, screen by screen —and **block by block inside a screen**, because one record page can need
three different rungs— choose the technique. This is where the rule at the top gets applied, and it
is what turns a coverage split into something that can be built:

- **`flexygo_get_custom_screens_reference` carries the ladder**: typed module as it comes; typed
  module with a template of its own and CSS over the top; a SQL-driven module; free HTML with its
  CSS and JS in a plugin. It also carries what each rung costs, how a hand-written block actually
  saves, and the three failures seen on the first real screen. Read it before choosing, not
  after building.
- **Look at the whole catalogue before concluding a shape cannot be done**: `flexygo_get_module_types`
  serves more types than this server creates, and most of what looks impossible is an ordinary list
  with a card-shaped template.
- A screen the modular vocabulary does not describe —a grid of cards, a record page with three
  editable blocks— is **not** an `other` to be dropped. Pass it as **`custom`**, which is the word
  the coverage has for it: it has an original, it gets built to look like it, and it is compared at
  the end like any other row. `other` is only for what will not be built at all.

Write the choice where the next step can read it: it goes into the plan (§7), not into your head.

## 6 · The project's styles, in a plugin

The design tokens go into **one named file**, loaded globally, with
`flexygo_register_project_plugin` — not spread across the `cssText` of twenty modules. Read
`flexygo_get_template_syntax_reference` before writing anything visual: the sizes, the state badges
and the contrast minimums are there, and they look nothing like a Tailwind project's.

**And override what is already there.** The permission in the rule at the top is meant literally:
the destination's skin does not get to win an argument with the approved original. Where the skin
beats you on specificity —headers, property toolbars— you beat it back, scoped to the page; where
the original wraps its content in fewer boxes than Flexygo does, you dissolve the extra frame
instead of decorating it. The one thing the permission does not cover is behaviour: nothing that
still has to work gets thrown away to make the screen look alike.

Before writing the CSS itself, `flexygo_get_custom_screens_reference` again: capture the
DESTINATION's baseline first and write only the delta, scope it with
`main.pageContainer[pagename="…"]` and not with a body class, and know the trap that drops your
whole file from the bundle without a word.

## 7 · Plan, discussion and building

`flexygo_write_plan` in blocks (schema → entities → relations and logic → modules and pages →
navigation and startup), with the visible-layer blocks carrying the coverage already classified in
§5 (`flexygo_propose_coverage`), `/flx-discuss` to close the open points, and `/flx-execute` block
by block. No verification block: `flexygo_write_plan` refuses it, and `/flx-verify` is a phase that
runs between plans, not a task — flx-build-product §3 carries the reason. Anything
depending on a user decision goes as a point to clarify, not as a supposition: the first version's
scope is the most expensive of all.

**The screen tasks carry their technique.** Each screen in the plan says which rung it is built on
and why that one, and —when it is a bottom rung— what is being paid for it, so that nobody discovers
the bill during verification. A task that only names the artifact to create has thrown away the
choice made in §5, and the next session will make it again, differently.

A technique is argued in `/flx-discuss`, not in `/flx-execute`. If while building a block the chosen
rung turns out not to reach, change it deliberately and leave the reason with
`flexygo_record_decision` — never quietly settle for a screen that no longer looks like the original.

## 8 · Compare against the original

`/flx-verify` checks that it works on screen. After that, `flexygo_generate_design_comparison` says
which rows have to be compared and `flexygo_record_design_comparison` records the verdict.

It does not accept "it looks similar": every row is `same`, `similar`, `different` or
`not-applicable`, and `not-applicable` **requires a note**. If you have not looked at it, do not
answer it. Pass the count `flexygo_compare_design_measurements` just printed for this screen as `deviations`,
or this pass cannot be subtracted from the next one.

⛔ **On this road all thirteen rows aim at almost identical, `typography` and `spacing` included.**
They aim lower only when the original is a PNG, which has no `font-family` and no comparable pixel
scale; here the original's own source is on disk, so both sides can be measured and "it is a PNG" is
not an available excuse. Over six comparison passes: five deviations, every one of
them CSS of the project plugin and not one a platform ceiling, with `typography` reaching `same` on
one of three screens. Read the Target column of the script; it already knows which road you are on.

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

On THIS road the rule behind a displayed value can be READ — it is in the generated project's own
source, and that is where the three examples of §15 came from. That is a real advantage of this road
over a folder of screenshots, and it is the one place where the three roads are not equal.

This is the measurement of the rule at the top, so it is also where a bottom-rung block declares its
price: the note on that screen's row says what it does not have — no separate list of caveats, which
nobody reads.

⛔ **And a row that is not `same` is closed or raised, never filed as taste.** Try the fix first —
most of what looks like a platform ceiling is a skin variable, a CSS rule, a container type or a
template— and when it genuinely does not close, the note names the **class of cause** (skin,
template, config, platform, scope) and a *platform* one is recorded with
`flexygo_record_missing_capability`. The full rule is in `/flx-verify`; under the rule at the top of
this file it matters more here than anywhere.

Then say what came out `different` and **which command comes next**: a row that is not `same` is
either a defect to fix and verify again, or a decision taken on purpose and written down with
`flexygo_record_decision`. Do not leave the user to work out which of the two it was.

---

Write to the user, and into the records, in their language.

Never write `.flexygo/` by hand and never run SQL outside the MCP tools.
Never generate or migrate data without the user's explicit permission.
And do not touch the generated project: it is the reference, and it gets read.
