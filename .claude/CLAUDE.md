<!-- flexygo-mcp:begin — this block is installed and kept at its latest by the Flexygo MCP server (flexygo_sync_skills). Whatever you write INSIDE it is overwritten on the next sync; write yours below the end marker, where it stays. -->
# Working with Claude on this Flexygo product

## ⚠️ First: if there are no `/flx-` commands, reload the window

If `/flx-setup`, `/flx-context` or any other `/flx-` command answers `Unknown skill`, nothing is
broken and nothing needs reinstalling. Those commands are installed by the `flexygo` MCP server
when it starts, and **this window scanned for them before that happened**. Measured on a project
created that morning, 7-Sep-2026: the fourteen commands had been on disk for 54 seconds when the
session began, all fourteen byte-identical to the source, and the session could not see one of them
— because the scan belongs to the **window**, not to the chat.
**Opening a new chat does not repeat it.**

- **VS Code**: `Ctrl+Shift+P` -> *Developer: Reload Window*.
- **Claude Code CLI**: restart the session.

A tool answering that the commands are "already installed" does not contradict this. They are
installed; this window cannot see them yet. And the reason this warning reaches you at all is that
CLAUDE.md is read when the SESSION starts, which is late enough — one more thing the window's own
scan is not.

If there are no Flexygo tools at all, check that the `flexygo` MCP server is configured for this
folder and actually connected. Without it there is nothing to build with: say so and stop, rather
than improvising with raw SQL. Once it is there, `flexygo_sync_skills` installs the commands, the
constructor agent and this block, and it is safe to run again whenever the server is newer.

## Where you are

This is a **Flexygo application**, and almost nothing in it is written by hand. The screens, the
objects and their properties are rows in a database; the way in is the `flexygo` MCP server. If its
tools are not there, say so and stop — do not fall back on raw SQL or on editing the platform's
files, which is how a project gets damaged in a way nobody notices for weeks.

| What | Where | Who writes it |
|---|---|---|
| The two connection strings | `*.Backend/conf/appsettings.Development.json` | `flexygo_set_connection_strings`, once, in `/flx-setup` |
| Plan, decisions, execution, reviews, project memory | `.flexygo/` | the MCP tools, **never by hand** |
| The commands, the constructor agent and this block of `.claude/CLAUDE.md` | `.claude/skills/`, `.claude/agents/`, `.claude/CLAUDE.md` | `flexygo_sync_skills`, always to the server's latest |
| The design brief that travels to Stitch | `DESIGN.md` | the `design.md` standard: tokens plus prose, and a `Project identity` section. `flexygo_write_design_brief` writes the tokens and that section; Flexygo's own composition grammar is served, never copied in, by `flexygo_get_design_grammar` |
| C# processes | `*.Processes` | you |
| Objects, pages, modules, templates, views, filters | the configuration database | the MCP tools |

`ConfConnectionString` is **Flexygo's own metadata**; `DataConnectionString` is **the application's
tables**. They are different databases and confusing them is what makes a tool write where it must
not. `flexygo_get_connection_strings` says whether they resolved at all, and
`flexygo_get_active_origin` says **where you would be building** — in a freshly created project that
is usually still the platform's origin, and you do not build there.

The base `appsettings.json` beside it stays **empty on purpose**, and there is nothing to copy
across by hand: both halves of a project laid out by the template run under Development — the
Backend and Frontend set it in their own `launchSettings.json`, and `.mcp.json` sets it for this
server — so that is the file that gets read. It would only matter if that `env` block were removed
or the application were started under another environment.

⛔ **A project like this often has two roots** and they hold different halves of the state: an outer
folder carrying `.flexygo/` and `.claude/`, and inside it the product folder carrying `*.Backend`.
Measured on a real consumer on 2026-09-01: the commands were installed at the outer root and these
instructions at the inner one, so a chat opened at the outer root read neither. **The root that
counts is the one holding `*.Backend`.** If what you find does not match the table above, say so
before working — you are probably standing in the other one.

## Where to start

⛔ **Before anything else, ask the `flexygo` server what project and databases it thinks it is
talking to, and read the answer with your own eyes.** A workspace setting from outside this project
can point the server somewhere else entirely without a single visible error; a session that skipped
this once found itself talking to a customer's live database instead of this project's own.

**Then `/flx-context`**, and it will say what comes next. The commands are a chain and each one
gates the one after it, so do not skip ahead; if it is not obvious which phase this project is in,
ask for the status instead of guessing.

`DESIGN.md`, at the root, is this project's design brief. Its tokens are the normative values and
travel to the design tool literally; the prose says how to apply them; and its last section,
**Project identity**, is where whatever the user decides about this product's look is written —
palette, typeface, rules. It outranks every guideline above it and every future development on this
product keeps it. A new project is born with the palette declared undecided and that section
declared empty; the server writes them in when the user decides, and touches nothing else in the
file. It does **not** carry Flexygo's composition grammar — what a screen is assembled from, what
each page shape costs, the hard limits — which the server serves fresh instead of copying in.

## Model routing: the main chat decides, the subagent builds

| Work | Where it runs |
|---|---|
| Deciding — context, plan, scope, the decisions before the schema, what a deviation means | The main chat |
| Building a block that is already planned — tables, objects, properties, views, filters, templates, modules, pages | The `flexygo-constructor` subagent, which declares `model: sonnet` |
| Looking at a screen — browser, screenshot, contrast, what a person will actually see | One subagent per page, as `/flx-verify` sets out |
| Answering the user, and writing into `.flexygo/` | The main chat, in the user's language |

**Why it is written down instead of assumed.** Measured over August 2026 across two large
repositories: **~98% of the messages ran on the frontier model**, and a whole consumer project
recorded **6 delegations** in the entire month. The building work was specified — there was a plan,
a block and a list of tasks — and the chat that was supposed to be deciding did it anyway. That
costs money, and it costs something scarcer: every table dump and every tool result a subagent
reads would otherwise land in the conversation that has to keep the whole plan in its head.

## Delegating a block

- `/flx-execute B-n` runs one block. The tasks marked `[P]` carry no dependency between them, and
  those are the ones worth splitting between subagents.
- Hand the subagent **the block id and the path of the plan, never the plan's contents**. It reads
  what it needs; pasting it in spends the context twice.
- The subagent calls `flexygo_record_execution` for each task it finishes. Without that call the
  task does not count and the next block will not start.
- What comes back is what got built and what did not — and, when something failed, **the literal
  message of the tool that refused**, not a summary of it.

## Coming back to the main chat

**A block closes with a summary in the terminal, not with a published artifact.** The verdict
first, then what was built as a table, the expected failures named as expected, what was resolved
along the way and what is still open — the shape is in `/flx-execute`, and this line is here because
that skill is only in front of you while the command runs and the summary is the last thing you
write. What was resolved and what is open go into the `result` of `flexygo_record_execution`
before they go into the summary: `execution.md` is what the next pass reads. The whole flow
publishes **two artifacts, not one per block**: the model with its screens when it is decided
(`/flx-design`, or `/flx-discuss` when there was no design), and the closing report from the last
`/flx-verify`, which `/flx-quality` extends. The decision the block needs stays in the terminal,
where the user is.

Escalate rather than insist, and say what you were doing when you stopped:

- A tool refused, and repeating the call would change nothing in it. The refusal is usually the
  feature: what is missing is in its message.
- An assumption turned out to be false. `flexygo_revise_assumption` before closing the block, and
  then look again at the tasks it says were resting on it.
- The work needs a decision the plan does not cover — scope, which entities are master, whether
  data gets seeded. Those are the user's, and they get recorded with `flexygo_record_decision`.
- What was built is no longer there — a republish, a manual delete. `flexygo_unmark_task`, and say
  so.

## The phases are not blocks

The plan holds what gets **built**. `/flx-review` and `/flx-verify` run between plans, each with
its own command and its own gate, and `flexygo_write_plan` refuses a block that impersonates one.
Measured three times: a plan that ended in a block called «Verification» got its tasks ticked, the
run announced everything verified, and `verifications.md` was empty — no browser, no screenshot,
no verdict.

## Running it, and stopping it before you build

To look at a screen the application has to be **running**. To build or publish, it has to be
**stopped**. The second half is the one that costs an afternoon:

- The Backend runs as **`{Project}.Backend.exe`**, under its own name. `Get-Process dotnet` reports
  the machine clean while it is up — match on the process name or the module path, never on
  `dotnet.exe`, or you will conclude it is stopped when it is not.
- While it runs it holds a lock on the PostSharp build DLLs, so building `*.Processes` fails with
  `Access to the path ... is denied`. That reads like a defect in the code and is not one.
- **When you check that a build succeeded, grep for `ERROR al compilar` and not only for
  `error CS`.** This failure carries no CS code, so a filter looking for one reports a green build
  while the previous DLL is still what runs.
- **Run the Backend with `ASPNETCORE_ENVIRONMENT=Development`, or the screen comes back naked.**
  The platform's own static files — including jQuery — ship as NuGet packages and are only mounted
  through the static web assets manifest in Development. In Production the page loads with no
  styling, no scripts and a login that does not work, and nothing in the response says why.

## CSS on top of a Flexygo screen

- **`1rem` is 10px here, not 16.** Flexygo sets `html { font-size: 10px }`. A token copied straight
  from a Tailwind/shadcn design — `--radius: 0.5rem` meaning 8px there — lands at 5px here, silently:
  it renders, just wrong, and nothing points at the unit.
- **A project plugin does not beat the platform on a custom property the platform also defines.**
  Layout rules win by load order alone, but a `:root` token the skin redeclares needs `!important` on
  the plugin's own declaration to survive — the platform's copy loads after the bundle.
- **Some of the skin's own layout padding is declared `!important`** (module bodies, side-menu
  entries). A plugin rule for the same property needs `!important` too, or it loses outright — and it
  needs a tight scope as well, for example `main.pageContainer[pagename^="XXX_"]`, because a plugin
  is global to the installation (the server's design grammar says so, and why) and an unscoped fix
  reaches every other application on it, not just this one.
- **A module's CSS belongs in the registered project plugin, never in the module's `Header` field** —
  `Header` is markup, not a style sheet. Ask the server for its module-styling guidance and its
  template-syntax guidance; both explain this in detail.

## Leaving the session: say when to open a fresh chat, and hand the prompt over

This work comes in long sessions, and the user should never have to work out where to restart.
Every phase already ends by naming the command that follows. **When the session itself should end,
say that too — and write the prompt for the next one.**

**You cannot measure your own context, so do not pretend to.** "This is getting long" is not
observable from in here, and a rule phrased that way never fires. What is observable is the **seam**.
Offer the switch when one of these happens:

- a block of `/flx-execute` finished and the next one would start from a clean sheet;
- `/flx-review` or `/flx-verify` finished — a verification reads screenshots, the most expensive
  thing a session does;
- the conversation pivots to a different development, a different origin, or a phase other than the
  one this session opened on;
- a `/flx-design` batch landed and its screens were approved;
- the user says the chat feels slow or that you are repeating yourself. Take them at their word.

Offer it whole, or it does not help. Three lines, then the prompt:

- **where to open it** — the folder the new chat starts in, which is the one holding `*.Backend`
  unless the work lives in another repository;
- **what has to be running or stopped first** — the application up to look at a screen, down before
  any build or publish;
- **the prompt itself, ready to paste and self-contained.** The new chat knows nothing but this
  file and the project: name the development, the block or phase due, what "done" looks like, and
  remind it to end its own session the same way.

Say it as an offer and not as an instruction. `/clear` throws the conversation away and only the
user decides when. If they would rather carry on, carry on.
<!-- flexygo-mcp:end -->

## Our conventions

*Whatever this team decides about this product goes here, and it stays: the server never writes below its own block.*
