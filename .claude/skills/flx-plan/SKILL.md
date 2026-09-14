---
name: flx-plan
description: Turns the user's request into a plan of blocks with a task list, using the context already recorded. Invoke it when the user wants to take on a task, an incident or a development.
---

# Plan a piece of work

1. Call `flexygo_create_development` with a short `slug` and the user's **literal request**.

   ⛔ **Unless it is already open, which is the normal case on a project that already has things.**
   `/flx-new-development` opens the work itself — that is where the reconnaissance and the design
   question happen — so arriving from there, the development exists and this call is not made again.
   Check with `flexygo_development_status`: an active development means step 1 is done, and its
   reconnaissance has already been read. Calling anyway earns a refusal for an unfinished
   development, and answering that refusal with an invented `reason` is how a second empty work gets
   created. Ask WHY openly and pass what they answer; if instead you offer motives you wrote and
   they pick one, that is allowed — say so with `reasonSource`, so the record carries whose words
   it holds instead of claiming they are theirs.

   If it returns an error, read it and stop: either `/flx-context` is missing, or the database cannot be
   read. Without a database there is no planning — the plan would come out invented. Have the user
   configure `ConfConnectionString` and `DataConnectionString` and publish the databases before
   going on. It also refuses when another development is unfinished — ask the user for the reason
   and pass it in `reason`; never invent one.
2. Introspect the project with the MCP's read tools **before** proposing anything: objects,
   properties, navigation and tables. Do not assert what you have not looked at.
   Look at `flexygo_get_project_status` too: it says which **origin** what gets created lands in,
   and how many objects each one holds. If the ones that already exist are in an origin other than
   the active one, ask the user before planning anything on top — the two halves will not see each
   other.
   And if you are going to propose a data model, read `flexygo_get_conventions` and
   `flexygo_get_entity_anatomy` first: a plan that proposes something that cannot then be built
   costs more than the time spent reading them. The rest of the references are asked for in
   `/flx-execute`, at the moment of typing.
3. Propose the blocks and tasks to the user **in the chat**, and only write them once approved.
4. Write the plan with **`flexygo_write_plan`**, passing the blocks and their tasks. The `B-n` and
   `T-nn` ids are set by the tool. Mark `parallel: true` on the tasks that can run at the same time
   (different files, no dependencies between them). It refuses to rewrite a standing plan without a
   `reason` — ask the user, never invent one — and refuses outright once any task is done.
5. Every doubt goes on the task it affects, with `clarify` and `clarifyBlocking` according to
   whether it prevents building.
6. In `assumptions` put **only what you take as true without having verified it**. What you have
   checked with the tools is not an assumption: it is a fact, and it goes in the impact or in the
   task that uses it.

## The menu is decided once, and it is decided here

Flexygo paints a menu on its own: every collection flagged to show in it appears there, sorted
alphabetically. A navigation tree of your own is a **second** menu beside that one, not a
replacement for it — so the plan picks one of the two and says which:

- **The plan carries its own navigation tree** → every object creation goes with
  **`showInMenu=false`**. The tree is the menu.
- **The plan carries no tree** → the automatic block by collection IS the menu, the default stands,
  and no tree gets built later to tidy it up.

⛔ **Never both**, and do not leave it to be discovered while building. On a real project:
the tree was built with its seven sections in the order the user had agreed, home first; halfway
through, the duplicated menu was noticed, and the tree was deleted to get rid of it. What survived
was the automatic block — which sorts alphabetically, so the live application now lists the sections
in alphabetical order with home near the bottom. The agreed order was lost as collateral damage of
the workaround. Deciding it here costs one line.

**And the shell has TWO widgets, so decide both.** The top bar (`NavigateId`) and the dark side
panel (`MainNavigateId`) each load a navigation root, and an interface born from the template
points the side panel at the platform's stock "Work Area" root — Admin Work Area, Flexygo Settings,
Help, Default Objects — which paints EMPTY for an application whose objects carry
`showInMenu=false`. Measured 2026-09-10 on a finished development: a top bar with the agreed tree,
and beside it a blank side panel with a search box and nothing under it. Either the panel loads a
root of the application's own, or it goes: `flexygo_update_interface` with `clearMainNavigateId`
removes it entirely (`flexygo_get_app_shell_reference`, measured on screen). A widget nobody will
use is not left in place.

## Every page the plan builds gets at least one way in

Say, on the task that builds it, **how each page is reached**. One entry point is enough, and any
of these three is one:

- a node in the navigation tree;
- **its own object** — an object page opens from the list or the record it belongs to;
- **a link from another page**: a toolbar button, a link in a template, a module that navigates to it.

⛔ It is **at least ONE**, not "an entry in the menu". A detail page reached from a list is right
as it is and must not grow a menu entry to satisfy this rule. What is wrong is **none**.

A page with no way in is not a page that fails: it saves, it paints, its own navigation works, and
the only way to open it is to type the URL. Measured 2026-09-09: a calendar was planned, built and
filled with real data, and the menu agreed one task earlier had five sections — none of them it.
The plan had not lied; it never promised the calendar an entry. Nothing said so while planning,
nothing said so while building, and it was `flexygo_audit_origin` at review time, with the whole
application standing, that answered "Pages that cannot be reached: 1". Deciding it here costs one
line per page.

## A dashboard or home screen decides where the application opens

If the plan builds a dashboard, a control panel or any home screen, it carries the task that makes
it the page the application opens on — `flexygo_update_interface` with `interfaceName` and
`startupPageName` — or a task that says the startup page stays where it is. `flexygo_write_plan`
refuses a plan with a home screen and no such task. Measured 2026-09-10 on a finished development:
33 tasks, the dashboard built, verified and design-compared, and `Interfaces.StartupPageName`
still NULL — the login landed on the platform's empty control panel and HOME opened a blank page.

## When there is an approved design, the palette is a task

If the development has approved screens filed as reference, the plan carries a task that applies
the seven skin variables with values read off those screens — not off the brief — and it goes
before the first UI block. `flexygo_write_plan` refuses a plan against filed references that has
no such task. The seven variables and the "screen, not the brief" rule are in
`flexygo_get_module_styling_reference`.

## What the approved screens DO, before anything is built

If this development has approved screens filed, `flexygo_write_plan` **refuses a plan that does not
answer for them**: `screenBehaviours`, one entry per behaviour a screen has and cannot show, with
the same four triggers the final comparison uses — a control whose effect is not visible, a
displayed value whose rule is off screen, a state the reference never shows, a navigation with no
destination built.

- `[]` is a valid answer and is written into the plan **as the claim it is**: "I looked for the four
  on every approved screen and found none."
- What you could work out by reading the original's own source is `read-from-source`; what the user
  already answered is `asked-placeholder` or `asked-explained`. **There is no value for invented.**
- What you found and cannot settle is **`needs-user`**, and it takes the `question` you are going to
  put to them. That entry becomes a **blocking** point on the task it names — `/flx-execute` will
  not start that block until `/flx-discuss` closes it with `flexygo_record_decision`.

It is the mirror of the rule at the other end: a screen with an open behaviour is not closed there,
and here it does not start. On Tender: five behaviours sat unanswered from the first pass
to the fourth, and one of them was already answered by an assumption the development had recorded
before a line of it was built.

## Assumptions carry an owner

Each assumption is `{text, affects}` and **`affects` is mandatory**: it says which tasks or which
block rest on it. An assumption that points at nobody cannot be revised later — when execution
disproves it, no one will know what has to be looked at again.

Tasks are numbered `T-01`, `T-02`… **in the order you pass them, across the blocks**. Count
carefully: `flexygo_write_plan` rejects an `affects` naming a task it is not going to create. If an
assumption affects a whole block, name the block: `"B-2"`.

Write the plan in the user's language, correctly and in full — it is a person who is going to read
it. This file instructs you; the plan is theirs.

Never write `plan.md` or any `.flexygo/` file by hand, not even for a touch-up: the grammar is
strict and a wrong format leaves the plan invisible to the checks, with no warning.
When you finish, tell the user the next step is `/flx-discuss` if there are open points, or
`/flx-execute B-1` if there are none.
