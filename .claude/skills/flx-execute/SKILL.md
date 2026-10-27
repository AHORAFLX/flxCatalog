---
name: flx-execute
description: Executes ONE block of the plan, task by task, leaving a record of each. It does not move on to the next block by itself.
---

# Execute one block

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

## Before typing: ask for what you are going to need

These references are what the model cannot know on its own, and they are asked for **before** the
task, not when something fails. Once per session; from then on you have them read.

| You are going to… | Ask for first |
|---|---|
| Name objects, tables or columns · decide the model | `flexygo_get_conventions` |
| Create properties | `flexygo_get_property_type_guide` |
| Write a template | `flexygo_get_template_syntax_reference` |
| Match a screen to an approved original, and no typed module reproduces it | `flexygo_get_custom_screens_reference` |
| Create modules or compose pages | `flexygo_get_module_composition_guide` |
| Create tables or seed data | `flexygo_get_schema_and_seeding_guide` |
| Build a whole entity | `flexygo_get_entity_anatomy` |
| Write the C# of a DLL process | `flexygo_get_dotnet_process_guide` |

Skipping them does not give you an error: it gives you something that is created without complaint
and looks wrong on screen. Two real cases, both in templates and both invisible to
`flexygo_verify_object` and to `/flx-review`: a `switch` with quotes painted the CSS class quoted
and colourless, and a key `1` against a `bit` column —which arrives as `true`— made five closed
incidents show as open for a whole verification round.

And do not invent tool names: the ones that resolve are those in `tools/list`, in snake_case.

**Every object gets its `tooltip` (= AIDescrip) with the business rules and their SQL condition,
every field with codes its `descriptionInApi`, every process a `processDescrip` the person who runs
it understands, and every fixed-list combo `showValuesInApi: true`** — always, at creation, never a
later pass; `flexygo_get_conventions` says how to write them.

## The block

1. Call `flexygo_can_execute` with the block id. **If it returns an error, stop and explain it.**
   Only pass `force: true` if the user literally wrote `--force`, and always with `reason`.
   A task whose line says `⇠ T-nn` needs that task done first; when one of them was reopened by a
   verification or skipped, the gate holds the block and names it: say which, and that it goes
   back through its own block first.
   When its answer carries the live-view question, ask it before the first task, in the user's
   words, and give their answer back through the same tool's `liveView`: it is asked once per project.
2. Run the block's tasks **in order**, using the MCP tools, **here, in this chat** — never handed
   to a subagent. How to build is written down in `.claude/CLAUDE.md`, under "How to build",
   installed by `flexygo_sync_skills`: one thing at a time, read before you assert, the refusal
   says what to do. A task marked `[P]` is built in its turn like any other.

   **The tasks marked `[main]` stop for the user.** `flexygo_write_plan` marks them itself, and
   they are three kinds. A task that has to confirm, ask or let the user choose — ask, and wait;
   measured 2026-09-17, "do not insert without asking which products and rates to use" was handed
   to a subagent and came back as 24 seeded rows on a criterion it invented. A security grant or
   denial — `flexygo_set_object_security`, `flexygo_set_page_security`,
   `flexygo_set_module_security`, `flexygo_set_navigation_security`,
   `flexygo_set_property_security`, `flexygo_set_process_security`, `flexygo_set_setting` — say
   who gets what before you grant it. And a data seed, whose rows the user has to see before they
   exist. A plan written before the marker existed carries none, and the three kinds still stop.

   **The demo data block** is that third kind. Before the yes, show the user a preview: the target
   database by name, the rows per table with two or three examples of each, the span of dates
   relative to today, and the states of each screen they cover. After it, save the pair with
   `flexygo_demo_data(action: "save", seedSql: "...", removeSql: "...")` and load it with
   `flexygo_demo_data(action: "seed", confirmDatabase: "...")`, naming the same database you showed.
3. After **each** task call `flexygo_record_execution` with the `taskId`, the tool used and the
   result. Without that call the task does not count as done and the next block will not start.
   **Never write a password in the result** (not the example users' either): `execution.md`
   travels with the product. Say "with the password the user gave"; the server masks one if it
   slips in.
4. If a task fails: transient error (timeout, deadlock) → one retry; logical error (duplicate,
   missing FK, invalid parameter) → record the failure with `ok: false` and **stop**.

#### The toolbar is part of the design

When the task created a module that carries a toolbar (view, list, edit, editlist) AND the screen
has an approved reference, settle the bar against it before recording the task done — not later,
in `/flx-verify`, as a repair:

1. List the buttons the reference shows.
2. Read the bar the module was born with, with `flexygo_list_toolbar_buttons`.
3. **If the design shows its own buttons**, leave exactly those with `flexygo_set_toolbar_buttons`.
   A design button that maps to a platform one keeps the platform's: "Duplicate" is the platform's
   copy; "Edit" is the edit page; an action of its own is a process button.
4. **If the design shows NO toolbar**, remove it with the module's own update tool: clear
   `toolbarName` with `clearToolbarName: true` — view, list, edit and editlist modules all take it.
   - **If the module also sits on another page** (the update's warning names them, and
     `flexygo_get_module_full_config` lists them), do not clear its toolbar — that page loses its
     buttons too; create a module of its own for this page and place that one instead.
5. **Record what was removed, in the execution note.** The buttons taken away are function the
   user no longer has — say so once, there, not as a reason to keep them.

The standard bar stays only when the reference shows one, or there is no reference.

## Closing a block: a summary in the terminal, and the record in `execution.md`

⛔ **A block does NOT close with a published artifact.** It used to: measured over one web
development and its mobile companion, the rule produced **about eight reports** between them, and a
user who receives eight learns not to open any — so the one that mattered arrived in the same pile
as the six that did not. The whole flow publishes **two artifacts and no more**: one when the data
model is decided, with the Stitch screens when there are any (`/flx-design` step 7, or `/flx-discuss`
when there was no design), and one at the end, published by the last `/flx-verify` and extended by
`/flx-quality` if it runs. A block is neither of those moments.

What the block closes with is a **summary in the terminal**, short enough to be read where it
lands, in this order and nothing else:

- **The verdict first.** How many tasks, how many passed, what failed, and whether the next block
  can start. If a person reads one line, it is this one.
- **What was built, as a table.** One row per artifact with the columns that let them check it
  against the plan — for entities: object, collection, how many properties, whose child it is.
- **The `verify_object` line per artifact**, and the expected failures named as expected. A FAIL
  that is out of the block's scope ("Pages: list / view", when pages come in a later block) reads
  as a defect unless it is said not to be.
- **What was resolved during the block and how.** An ordering that had to be worked around, a
  property closed in two steps because its parent object did not exist yet.
- **What is left open**, separated from the above. A non-blocking warning is not a closed item.

⛔ **The deviations travel in the record, not in the summary.** The last two items are the
material the next pass harvests, and when the block report went away the only place left for them
is `execution.md` — which is what the `result` of `flexygo_record_execution` writes. So the `result`
of the task that met a deviation SAYS it: not "object created" but what had to be worked around,
what was closed in two steps and why, what is still open on it. An assumption that fell goes
through `flexygo_revise_assumption`, a choice the user made through `flexygo_record_decision`, a
tool that does not exist through `flexygo_record_missing_capability` — those already had a home.
**Write the summary FROM `execution.md`, not from memory**: if a deviation is in the summary and
not in the record, the record is what is wrong, and it is the record the next pass reads.

⛔ **What does NOT go in the summary: the decision.** If the block needs the user to choose
something, ask it in the terminal where they are, with the summary as the evidence behind it —
and record the answer with `flexygo_record_decision` before building on it.

## If there is no tool for what the task needs

**Stop. Do not write around it.** The ways round it are all patches — a row written by hand, SQL
against the configuration database (which `flexygo_execute_dml` refuses anyway), a label painted
with CSS `content:`, an `!important` fired at the platform's chrome from a rule with no page or
module scope. They leave no trace the next phase can read, they fall the day the skin or the
platform changes, and they read as closed when they are not: a "New machine"
label delivered as `::after { content: … }` over the platform's own button text was declared done,
and every screen reader, translation pass and skin still saw the original. What to do instead, in
this order:

1. **Look for it properly first.** `tools/list` and the reference the task names. "It exists and I
   did not find it" is a different defect from "it does not exist", and the record has to say which.
2. **Record it with `flexygo_record_missing_capability`**, saying which of the two it is, what was
   tried and what the server answered. A gap nobody can count is a gap nobody will ever fix; a
   workaround left inside somebody's project is the most expensive kind.
3. **Tell the user, record the task with `ok: false`, and leave the block open on it.** Whether
   they want a placeholder for now or the real thing later is their decision, not a default. If
   they decide it is not getting built AT ALL, that is different from a gap: skip the task with
   `flexygo_record_decision(taskId: …)` instead of leaving it pending — `flexygo_unmark_task`
   reopens it if that changes.

`flexygo_register_project_plugin` names the two CSS shapes of a patch in its response when it sees
them; that warning is the same rule as this section, at the moment the file is written.

## If you find out an assumption was false

Call `flexygo_revise_assumption` **before closing the block**, with the assumption id (`"S-1"`,
`"S-2"`… you see them in `flexygo_development_status`), the corrected text and the `reason`. An
assumption that execution has refuted is worse than not having one: the later phases read it as
fact and never check it again. A real example: the plan said "there is no navigation" and the
verification task found 159 nodes; nobody corrected the plan.

The tool answers with **which tasks rested on that assumption**. Look at them again before carrying
on: those are the ones that may have been built on something false.

## If what was built disappears

When you find that what a task created is no longer there —a database republish, a manual delete, a
rollback— call `flexygo_unmark_task` with the `taskId` and the `reason`. It returns the checkbox to
pending and records it in `execution.md`. A plan that still says "done" about something that was
deleted sends the next block to build on nothing.

Everything you write into the plan and the records —task results, reasons, corrected assumptions—
goes in the user's language. This file instructs you; those artifacts are read by them.

Never write `.flexygo/` by hand and never run SQL outside the MCP tools.
When the block is finished, tell the user which block comes next and wait for them to ask for it.

And when a unit of work closes, look at whether the SESSION should close with it: the
seams that are worth offering `/clear` on, and the three lines plus the ready-to-paste
prompt that have to go with the offer, are in `.claude/CLAUDE.md`,
under "Leaving the session". You cannot measure your own context — the seam is what you can see.
