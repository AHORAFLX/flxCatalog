---
name: flx-new-development
description: Opens a new piece of work inside a Flexygo project that ALREADY has things built, looking at what is there before anything is decided — what is built, what it is called and what it already looks like — and settling whether this work wants a design of its own. Invoke it when the user asks for something new in a project that already runs, before /flx-plan.
---

# A new development on a project that already exists

Two skills sit at this height, and they cover two different starting points:

| Skill | Starting point |
|---|---|
| `/flx-build-product` | a whole application, from the model to the last page |
| **this one** | **a new commission inside a project that already runs** |

⛔ **The third one had nothing until now, and that is the defect this fixes.** Measured 5-Sep-2026
by walking a cold chat into a project holding 48 objects, 66 modules and 32 pages: with no skill at
this height the agent fell through to a bare `/flx-plan`, which asks nothing about design, and it
never once saw the module or page count, nor what the application already looked like.

**Stay thin.** This skill opens the work, puts what already exists in front of the user and settles
one question. It does NOT plan: that is `/flx-plan`, and repeating it here would give the flow two
manuals for the same ground.

## 1 · LOOK BEFORE YOU NAME ANYTHING

`flexygo_recall_decisions`, with no term, **before creating anything**. It reads the project's
memory and sweeps the configuration database without writing a thing, and it answers the two
questions you are about to get wrong by guessing:

- **what things are called here** — the prefixes in use, whether the tables repeat them, and the
  families already built;
- **what has already been agreed**, across every development of this project.

⛔ **Do not propose a slug, a prefix or an entity name before reading this.** Measured 5-Sep-2026:
an agent proposed the prefix `INC_` out of thin air while the project's own memory had said since
28-Aug *"the client has not decided the three-letter prefix yet"* and the database held two
prefixes that disagreed with each other. The answer was there; it had not been asked for.

⚠️ **The decisions come back whole — question AND answer, newest first — so READ THE ANSWERS.**
A headline says what was asked; what governs what you are about to build is what was replied.
Measured 5-Sep-2026: the headline *«how is the logged-in Flexygo user linked to their supplier
record?»* was printed whole, was the same problem as the commission being planned, and was still
not opened — because back then the answer never came. Now it does. Only a project with more
decisions than fit gets a tail of headlines, and only those need a second call with the term.

## 2 · Open the work, and READ what comes back

`flexygo_create_development` with a short `slug` and the user's **literal request**.

⛔ **The answer is not a receipt. It is the reconnaissance, and this is where it gets RECORDED.** It
carries, before anything else, the project's durable memory and a measurement taken against the
configuration database at that moment:

- how many entities, collections, modules and pages the active origin already holds;
- which naming prefixes are in use and whether the tables repeat them;
- the families already built, one line each — what is there to reuse instead of building twice;
- **the seven skin variables the application already wears**, and whether the skin carries CSS of
  its own;
- **any captures of screens Flexygo has already painted, and any screens the client already
  approved**, each with the directory it is filed in, so you can open it with Read. This one
  is read off DISK and is NOT recorded: files come and go, so it is measured fresh every
  time and never written into the project's memory;
- and, when the project's own conventions disagree, a notice saying so.

Read it whole and say it back to the user. If it refuses because there is no recorded context, that
refusal is right: `/flx-context` first, then come back.

⚠️ **It informs, it does not gate.** Nothing refuses anything on the strength of this measurement,
so the only thing between a contradiction and a silent choice is you putting it to the user.

⚠️ **And a fixed rule finds less than somebody looking.** The same cold walk-through found a whole
piece of the platform the user did not know existed, because an agent was searching. This sweep is
not a substitute for reading the project.

## 3 · If the conventions contradict each other, ASK

When the notice appears — two prefixes in use, or tables that disagree about carrying one — put it
to the user before proposing a single name, and record the answer with `flexygo_record_decision`
passing **`affects: development`**, which is what a decision taken before the plan exists hangs off.
The project cannot answer "what do we call things here?" on its own, and choosing in silence is the
failure the measurement exists to prevent.

## 4 · The design question, with the palette already on the table

⛔ **Ask it, and ask it once — and THIS is the once, in a project that already has things in it.**
`/flx-context` makes the same offer only when the active origin is EMPTY and defers to here
otherwise, for the reason you are about to use: this is the only place that can put the palette the
application already wears on the table and say out loud what repainting it would cost. Everything
else in the flow reads the answer.

⚠️ **If a generic version of it was already answered earlier in the session, do not put it again as
if nothing had been said.** Say back what they answered, then show the palette and the repaint
consequence and ask only whether that changes it. A question asked twice admits two answers that
contradict each other about one fact.

The reconnaissance has just told you what the application wears, so **the question is not "what
colour is your application?"** — that answer is already in front of you — but:

> **Does this work want a design of its own? Your application already uses this palette: if we draw
> something new, does it go the same way?**

Show the seven values as they came back. Three answers, and each one goes somewhere different.

### A · A new design, homogeneous with what is there

The palette read in step 2 IS the identity: pass it to `flexygo_write_design_brief`
(`primaryColor`, `palette`, `lookSource`) so the brief that travels to the generator already
carries what the application wears, instead of asking the user to recite it.

**The skin says the colours and nothing else.** Composition, density and how the modules actually
look on screen are not in any column, so somebody has to have LOOKED at a real screen before this
work is judged homogeneous with it — and there are two ways to do that, cheap one first.

⭐ **Check the captures already filed FIRST.** Step 2's answer names, when there are any, the
screens Flexygo has already painted and the screens the client already approved, each with a
directory — open it with `Read`. No restart, no password, no browser, and they already arrived in
the response you just read. Pass `lookSource: 'filed'` when this is what the identity is built on.

**Bring the application up and look at it only when there is nothing filed for the screen you
need, or when what is filed predates the last thing you built.**

⛔ Do not write a procedure for that here: `/flx-verify` section 0 already carries the whole
machine, and every piece of it is there because of an accident that already happened — the cache
reload on the way in, asking before restarting anything, aiming at processes by port or by the
executable's full path and never by a name pattern, and the browser VISIBLE and never headless.
Follow it as written, and pass
`lookSource: 'live'` for an identity built on what came from it.

Then `/flx-design`, which draws the screens and waits for the user to approve them.

### B · A new design, free of what is there

⛔ **Say the consequence out loud BEFORE they choose, because it is not local to this work.** The
palette is installation-wide: one set of rows per skin, never one per origin, and
`flexygo_set_skin_variable` filters by skin alone. **There is no skin per development.** So a new
palette applied to the seven variables repaints every page already built.

Two roads, and the user picks — it is their call, not yours:

- **Repaint everything.** The new design governs and the existing screens change with it. Honest
  when the whole application is being restyled; expensive when it is not, because pages nobody
  reviewed change on their own.
- **Keep the skin as it is.** The new work differs in composition and layout, not in colour. The
  design gets drawn against the palette that is already there.

Record which one with `flexygo_record_decision` — `affects: development`, since there is no plan
yet — naming the consequence they accepted. Then `/flx-design`.

### C · No design at all

Nothing is drawn, and no row-by-row comparison is run at the end: there is no original to compare
against. **But what the project already breathes still governs the new work** — it was measured in
step 2 and written into `project.md`, so the new modules and pages match what is there instead of
inventing a second look.

Go straight to `/flx-plan` — and file where the design came from as `origin: installed`, which is
this branch's answer and not `briefing`. See the filing below.

⛔ **C is something the user CHOOSES. It is never where you land because Stitch went quiet.** A
silent Stitch is a supplier nobody has wired yet, and that is almost always one missing key — the
rung below says how to tell and what to do about it. Falling through to here from a failed
`list_projects`, without saying so and without offering to fix it, is how a development gets built
with no design at all while a five-minute setup was the only thing in the way.

### Then file where the design came from, in one call

⛔ **`flexygo_record_design_origin(surface: 'web', origin: 'installed', pointer: 'the production
installation itself - 20 pages, 52 modules; no folder to point at')`** — one entry per surface, and
it is what a session months from now reads to learn what this half was built from. `origin` is a
closed vocabulary of four:

- ⭐ **`installed`** — **the usual answer here, and the one branch C takes.** There IS an approved
  original and it is not a file: it is the installation that has been running, approved by use,
  which is the firmest approval there is. The `pointer` is not a folder — name the installation and
  what it holds. It does **not** route to `/flx-design`: there is nothing to draw and no row-by-row
  comparison to run. The modules the new work has to match are read with `flexygo_get_module_body`.
- **`reference`** — an approved original that exists as files: screens, an HTML, a PDF, a folder
  generated by Lovable or another generator. This is branch A or B when the user brings one.
- **`stitch`** — there was none and it is being drawn now.
- **`briefing`** — no original and no Stitch: the agreed brief plus **the platform's own look**.

⚠️ **`briefing` is the wrong answer in a project that already runs, and it is the tempting one.**
What it means is that the look comes from the platform, and here it does not: it comes from the skin
the application already wears. Filing branch C as `briefing` records something false about the look,
and filing it as `reference` sends the next reader hunting for a folder that does not exist.

## 5 · The order is the same one a project from zero gets

⛔ **Do not invent a different sequence because the project has things in it.** The ladder is the
one `/flx-build-product` section 0 already walks, in this order, and it is the same for everybody:

1. **A folder generated by Lovable or another generator** — `/flx-lovable` with the path.
2. **Their own screens** — screenshots, an HTML, a PDF, a link to something approved.
3. **Neither** — Google Stitch draws them, in `/flx-design`.
4. **And when there is genuinely nothing** — no screens, no Stitch — the brief plus the platform's
   own look wearing the client's brand.

⛔ **"I do not have Stitch set up" is rung 3, not rung 4, and reading it as rung 4 costs the user a
whole design.** Rung 4 is for a Stitch that is wired and still will not answer. A Stitch that was
never given its key is a short setup, done **once and never again** — and its symptom is built to
be misread: the client's indicator goes **green** with no key at all, because `initialize` and
`tools/list` answer with no credential and only a `tools/call` is ever authenticated, so the
failure arrives as an immediate `Incompatible auth server`, which looks like an OAuth problem and
is not one.

**Do not decide this on the user's behalf.** Say which of the two it is, say the fix is short, and
offer to walk them through it — `/flx-design` step 4 carries the whole recipe, the exact
`claude mcp add` line and its two traps, why a classic `AIzaSy...` key answers 401 exactly like an
unresolved `${STITCH_API_KEY}`, and that **the window has to be reloaded afterwards**
(`Ctrl+Shift+P` → *Developer: Reload Window*) — a new chat is NOT enough, because the MCP servers
are started once per window. Rung 4 stays where it is, for when they would rather not, or when
Stitch is genuinely down.

What changes between a project from zero and this one is **not the order**. It is the material: on
a new project there is nothing to be homogeneous with, and here there is — so the looking happens
before the brief is written, not after.

## What you do not do

- You do not plan. When the question above is answered, hand over: `/flx-design` if a design is
  being drawn, `/flx-plan` if it is not. **`/flx-plan` does not open the development again** — this
  skill already did, and `flexygo_create_development` refuses a second unfinished one.
- You do not write `.flexygo/` by hand.
- You do not change the active origin on your own initiative.
- You do not apply a palette here. Applying the seven variables is a task of the plan, and
  `flexygo_get_module_styling_reference` says where the values come from.

Talk to the user in their language throughout, and when this ends say which command comes next.
