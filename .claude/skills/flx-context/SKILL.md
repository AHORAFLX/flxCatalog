---
name: flx-context
description: Captures this Flexygo project's durable context (domain, prefixes, its own conventions) so the later phases use it. Invoke it before planning anything.
---

# Capture the project context

The user has given context about their project in the command argument.

**You must record it by calling `flexygo_context_capture`.** Do not write files by hand:
`.flexygo/` is written only by this MCP's tools, and the later phases read from there.

## Before Step 0: a project that already has context

⛔ **Read the previous answers first** (`flexygo_recall_decisions`). When they already carry this
project's context — origin, data model, offline app, who uses it, access from outside — pass every
one of them to the capture **as it stands**, skip the origin confirmation of Step 0 and every gate
already answered, and ask only what is missing — never again what is already recorded. The steps
below apply only to what is missing; a project with no context goes through all of them.

## Step 0: confirm the origin this lands on

⛔ **This one is CONFIRMED, not asked again.** `/flx-setup` asked it, in its last step, with the
recommendation that goes with it — **1 · Product** for a product installed at more than one
customer, **2 · Project** for one customer's implantation. Asking here which origin it should be
puts the same question in two places, and two places admit two answers that contradict each other
about one fact.

Everything this server writes lands on the ACTIVE origin, and reads that filter by origin see one
origin's worth of work and never two — so work that lands on the wrong one is invisible to
everything built afterwards, and nothing says so at the time. That is why it is said out loud here
even though it was already settled.

1. Call `flexygo_get_active_origin`. It marks the active one and warns when work already exists on
   another origin, which is the case that matters — two halves that cannot see each other.
2. **Say it back to the user and let them correct it**, in their language:

   > Everything built from here lands on origin *N · name*, which is what was chosen when the
   > project was set up. Is that still right?

3. ⛔ **Do not list the alternatives again unless they say it is wrong.** A confirmation that
   re-opens the choice is the same question wearing different clothes. If they do say it is wrong,
   `flexygo_set_active_origin` with a reason. It refuses while a work is half-built, and that
   refusal is right: report what it answered instead of working around it.
4. ⛔ **If the ACTIVE origin already holds objects, it is not unchosen — do not ask.** The call in
   step 1 answers with the count, and a count above zero IS the answer: the team that built those
   objects chose it. Say which origin it is, how many objects it holds and that it came with the
   project, and offer the correction **without listing the alternatives again** — the same thing
   step 3 does for the normal case. Asking «1 · Product or 2 · Project?» of somebody who has just
   inherited the project invites the one error the rest of this surface works to prevent: answering
   `1 · Product` because it sounds better moves the active origin, and reads filter by origin and
   see one and never two, so the new work stops seeing everything that is already built.
5. ⚠️ **Only when the origin is empty as well** — an older project, or one set up by hand, and
   `flexygo_recall_decisions` returns no cold-start record — is it true that **nobody ever chose
   and there is nothing to read back**. Then ask it here, with the same recommendation `/flx-setup`
   would have made: `1 · Product` for a product, `2 · Project` for one customer's implantation.
   ⚠️ **Why this gate has an exception the data-model one below does not**: whose a database is
   cannot be deduced from a full database, and an origin with work inside answers itself in one
   call. «No cold start of THIS server» and «nobody has chosen» are the same thing only in a
   project where nothing has been built.

⛔ **Origin 0 is never the answer** — not as the one you carry on with, not as the one you move to.
**It is reserved for the system, and that is the whole reason**: it is Flexygo's own origin, not a
place a project's work belongs, which is why `flexygo_set_active_origin` refuses it as a target and
several other tools refuse to run on it at all. That refusal does not cover the other half: if the
ACTIVE origin is already 0, nothing stops you. Say so and get it changed before recording any
context or creating anything. **This is not a confirmation — it is a stop**, whatever `/flx-setup`
left behind.

## The gate: is there an offline app?

⛔ **Ask this before recording anything, and STOP until it is answered.** It is not one more field
of the context: the mobile app is a different product — Ionic paints it, in four screen shapes the
web pages do not have — so finding out AFTER a design has been generated means the design was
generated wrong and gets paid for twice.

Ask it in the user's language, and in this form, which serves a project being born and one that
already runs.

⛔ **ONE AT A TIME, and never as a table or a form.** Questions 2, 3 and 4 only exist if 1 was
answered yes, so putting all four in front of somebody at once asks three questions that may not
apply and turns a conversation into a questionnaire. Measured 2026-09-03 on a cold walk-through:
with the four listed together, the whole gate came back as a single block the user had to unpick.
Ask 1; wait; and only then, if the answer was yes, ask 2, 3 and 4.

1. **Is this application going to have an offline app?** Not "is it offline": somebody whose online
   application is already built and approved has to be able to answer too, and adding the app later
   must not mean redoing what is online.
2. **Only if yes — where does the approved MOBILE original come from?** A mobile design of their
   own, the mobile part of their generator project if it has one, or Stitch drawing it.
3. **Only if yes — WHICH SECTIONS are the offline app?** When the original is a generator project or
   a folder of screens, the offline part is a subset of it and only the user knows which subset: ask
   them to name the sections, by the names they use. When there is no such original, nothing has to
   be named — those screens get derived from the model when the app's own development is opened.
   ⚠️ **Record the answer; do not act on it now.** The mobile screens are not drawn in this phase
   on either answer — see the two bullets below.
4. **Only if yes — is it being built now, or later?** "Later" is a real and common answer: the
   online application ships first and the app follows. Record which one it is. Building it now and
   leaving it for later are different plans, and the difference has to be a decision and not a
   discovery halfway through.
   ⛔ **This answer is what picks the recorded value, and it must reach the LABEL.** `yes` only when
   the app is being built now; **`planned`** when it is coming later and nothing of it exists yet;
   `no` when there is none. Writing `yes` for an app that is merely foreseen states in the present
   tense that the product ships one, and a session six months from now reads the label and goes
   looking for an app nobody has built — the nuance left in the free text is precisely what the
   later phases do not read.

⛔ **When the whole thing is being built from scratch, the app is a SECOND DEVELOPMENT, not a later
phase of this one** — and prefer it that way rather than carrying both halves in one. Three reasons,
all of them things the surface already enforces:

- `flexygo_create_development` refuses while another development is unfinished, so one at a time is
  the shape it expects: the online one closes — reviewed and verified — and the app opens its own
  with its own slug.
- The mobile original is a DIFFERENT original, which is the whole point of question 2. Two originals
  want two `reference/` folders and two row-by-row comparisons, not one file mixing desktop rows with
  mobile ones.
- `flexygo_write_plan` refuses a plan that does not cover the screens filed in its development. File
  web and mobile screens together and the first plan has to cover everything at once, which forces
  exactly the all-in-one-go this separation avoids.

⚠️ **"Later" is not "ignore it".** It still gets recorded here and now, because knowing an app is
coming changes decisions in the online build. What "later" changes is where it gets built, not
whether it was accounted for. And the second development starts from the model the first one built:
its plan does not re-create the schema.

⚠️ **So say back what the answer changed, or question 4 reads as decoration.** Both answers end in a
second development, and somebody who says "now" and then watches the web get planned first is owed
the reason. Measured 2026-09-03 on a cold walk-through: answering "now" produced nothing an agent
did differently from "later", and nothing in this file said what should. The difference is small and
real, and it is said out loud:

- **"Now"** — the app's development opens **as soon as the online one closes**, reviewed and
  verified, and it is planned for: the web work is not stretched to make room for it, it is finished
  first and the app follows immediately.
- **"Later"** — the app is recorded and its development opens when the user says so. Knowing it is
  coming still changes decisions in the online build, which is why the answer is taken now.

⛔ **And on BOTH answers, nothing mobile is drawn here.** The offline design is asked for in the
app's OWN phase, when its development is opened, with its own three ways and its own recorded
origin. This used to say that a "now" answer put the MOBILE screens in the same batch as the web
ones, and that contradicted the paragraph directly above it: the app is a second development
precisely so the two halves are not carried at once, and drawing its screens with the web batch
carries them at once by another door. What "now" changes is WHEN that development opens, never
whether its screens ride along with the web ones.

⛔ **All of these are asked, never inferred.** Whether an application will have an app is not
readable from anything: not from the domain, not from the tables, not from a generator project. A
project that merely reflows — responsive utilities, a drawer, a sidebar that collapses — is a web
page on a phone, and it does NOT count as a mobile original. If it is not clear, ask. Making sure
beats improvising, and this is the user's own rule.

## The other gate: is the data model OURS, or the customer's?

⛔ **This one is READ BACK, not asked cold** — `/flx-setup` already asked it, and it asked it in
the only place where the answer still costs nothing: in front of publishing. Recording the answer
twice would admit two answers that contradict each other about one fact.

1. Call `flexygo_recall_decisions`. When the cold start has been through, its answer opens with
   **what `/flx-setup` recorded** — a `**Data model:**` line saying `own` or `existing`.
2. **Say it back to the user and let them correct it**, in their language. It is durable memory and
   they are the ones who will read it in six months:

   > When the project was set up it was recorded that the data model is *ours to build* / *the
   > customer's, already in place*. Is that still right?

3. ⚠️ **If there is no cold-start record — an older project, or one set up by hand — ask it
   outright**, and this is the wording:

   > Is the main data model ours to build, or does it belong to a system that is already there — an
   > ERP, the customer's own database?

⛔ **It cannot be inferred either way.** Not from the domain, not from the tables, and above all
**not from the `DataConnectionString` pointing at a database that is already full**: a full database
is just as likely to be our own work from last year.

⛔ **And the two choices the user reads are worded in THEIR terms, never in tool names.** The block
below is for you, not for them: it names the tools each answer switches on and off, and a tool name
in the choice itself asks somebody to decide with a word they have never seen. They know whose
database it is; nothing else here is theirs to know. Say it as the consequence they can picture: on
one answer **we create the tables ourselves**; on the other **the database is not ours, nothing is
ever created in it, and the changes travel as scripts the application applies by itself**.

What the answer changes, and it changes an entire block of the build:

- **Ours** — everything as usual. Tables are created with `flexygo_execute_ddl` against
  `DataConnectionString`, the model is taken into the data project with
  `flexygo_script_data_structure`, and SSDT publishes it.
- **The customer's** — ⛔ **nothing is created in that database directly. Nothing at all.** Not a
  table, not a column, not an index, not a row of seed data: `flexygo_execute_ddl` and
  `flexygo_execute_dml` are off the table there. The **only** route is
  `flexygo_register_deployment_script`, because a registered script is the one thing that **runs
  itself** on every installation and leaves a mark saying it ran.
  `flexygo_list_deployment_scripts` reads that mark back.
  ⛔ **The write tools refuse an ERP database on their own** (`flexygo_execute_ddl`,
  `flexygo_execute_dml`, `flexygo_alter_column_type`, `flexygo_rename_column`,
  `flexygo_script_data_structure`) — a hard refusal that does not depend on the agent remembering
  to withhold it — **with one toll, not an exception**: a statement whose every touched object
  carries **the prefix the project declared below** (`Pers_` when none was declared; at the start of
  the name or after a first word, as in `vPers_` or `pFRUTI_` — what it creates, alters, drops or
  writes, puts an index or a trigger on, or points a foreign key at; reads may name any ERP table),
  or only adds, changes or drops columns carrying it in one of the ERP's own `Conf_` tables, runs,
  during development, and its acknowledgement says where the result has to end up: whatever those
  objects end up as ships through `flexygo_register_deployment_script`, idempotent. One ERP object
  in the statement and the refusal names it and the two ways through. For anything else the user wants to try on
  that database directly, the route is theirs to take, not this server's: start the application
  and let its own script jobs create it, then work with what they created.
  Whoever starts it stops it — see `/flx-verify`, "Whoever starts it stops it": measure the port
  before starting, stop what you started when the phase ends, and say what was left running.

### Only with the customer's model: which prefix does the project write with?

⛔ **Asked only when the model is the customer's, and asked — never filled in.** Inside an ERP, what
this project creates carries a prefix, and the write tools only let through what carries it:

> What prefix do the tables, views and procedures this project creates inside the ERP carry? For
> one customer's own implementation it is usually `Pers_`; a product sold to several customers
> carries its own, such as `FRUTI_`.

⛔ **A product never writes with `Pers_`.** `Pers_` is the ERP's prefix for ONE customer's own
customizations, and a product installed in many ERPs must not touch them — its prefix replaces
`Pers_`, it does not add to it. Measured on a real product: with `Pers_` as the only prefix the
implanter could not write its own objects and went around this server with another connector, and
its scripts lost track of where they had run.

The answer is a letter, two to nine more letters or digits, and the underscore: `Pers_`, `FRUTI_`.
It is recorded as the `erpPrefix` of the call below; with the project's own model there is none.

⚠️ **Why `/flx-setup` asks it and this phase only confirms it.** Measured on a real pass: the
question lived here, well worded, and it was reached minutes **after** both databases had already
been published. `flexygo_execute_ddl` changes only the database it is pointed at right now, and
**that change does not travel** — but by the time this phase runs, the expensive half of the
decision (what got published) is already spent. So the question moved in front of the irreversible
step and what is left here is the confirmation, which is the part that has to survive the session.

⚠️ **Nothing else about the product changes.** Objects, properties, modules, pages and navigation
are built the same way on either answer. What the answer decides is how the schema — and only the
schema — gets to the customer.

## The third gate: who uses it?

⛔ **Asked once per project, like the offline app, and STOP until it is answered.** Security in
Flexygo is written to TAKE AWAY: a role with no row sees and does everything, and no screen says so.
So the plan has to know who uses the application before it builds anything, or every new page ships
open to everybody. Measured on a real ERP project: no role of its own, and no phase of the flow had
ever asked.

⛔ **ONE question at a time**, in the user's language and in their words:

1. **Does everybody who signs in see and do the same, or are there kinds of users with different
   access?** — for example the sales team and the warehouse, or the office and the field.
2. **Only if there are several — for each one: what is it called, and what does it see and do?** One
   line per kind of user, in the user's own words: *Sales: sees the orders and the customers, and
   edits the customers*. Two or more; one alone is the first answer, not this one.
3. **Is there any screen that opens without signing in?** — a public page, a form anyone can fill.
4. **Will anyone use it from outside — an AI assistant, another system?** With a yes, the flow does
   not end at `/flx-quality`: `/flx-api` comes after it, and proposes what of the built goes out and
   for whom. With a no, nothing is exposed and that phase never runs.

⛔ **Asked, never inferred.** Not from the domain, and **not from the roles the platform lists**:
every Flexygo project ships its own roles, so counting them says nothing about who will use THIS
application.

⚠️ **Say back what the answer changes**, or it reads as decoration: with several kinds of users,
every plan that builds something carries who sees what, and `/flx-verify` signs in with **one test
user per role** — each one takes a seat of the licence, and that is asked when the time comes, never
worked around. With screens that open without signing in, the plan carries that too: a public screen
is granted on four levels at once, and the one left out paints it half open with no error.

⚠️ **A project that already has context and never answered this** — the plan refuses until the
roles are recorded, and the status sends a finished development back here for the fourth question.
The rule before Step 0 applies: the previous answers pass as they stand, and this is the only
question asked.

Steps:

1. Call `flexygo_context_capture` with **six** arguments: `description` (the text the user gave,
   carrying every detail of the answers — which mobile original, which sections, now or later,
   any customer conventions), plus `dataModel`, `offlineApp`, `roles`, `publicScreens` and
   `externalAccess`, the closed-vocabulary answers to the three gates above. `dataModel` is `own`
   or `existing`; `offlineApp` is `yes` (being built now),
   `planned` (foreseen, nothing of it built yet) or `no`; `roles` is `single`, or one line
   `Name: what they see and do` per kind of user, two or more; `publicScreens` and
   `externalAccess` are `yes` or `no`. All are REQUIRED parameters —
   there is no default and no "not sure" value, on purpose: none of the answers can be inferred,
   only asked. For example, for one kind of user, no public screen and nobody from outside:
   `flexygo_context_capture(description: '…', dataModel: 'own', offlineApp: 'no', roles: 'single', publicScreens: 'no', externalAccess: 'no')`.
   With several, `roles` carries one line per role instead of `single`, each one *Name, colon, what
   they see and do*. **With `dataModel: 'existing'` a seventh argument is REQUIRED**, `erpPrefix`,
   the prefix asked above:
   `flexygo_context_capture(description: '…', dataModel: 'existing', erpPrefix: 'FRUTI_', offlineApp: 'no', roles: 'single', publicScreens: 'no', externalAccess: 'no')`.
   With `own` it is left out, and passing it is refused. If the user writes in English, add
   `language: 'en'`; Spanish is the default. The server writes `ONBOARDING.md` in that language.
2. **The gates are enforced by the tool's own schema, not by your memory.** `flexygo_context_capture`
   cannot be called at all without them — the call is rejected before it reaches the file, and a
   value outside the vocabulary is rejected too, with a message naming the valid ones and saying why
   it cannot be deduced. The answers are written into `project.md` as labelled lines
   (`**Data model:** …`, `**ERP prefix:** …` with the customer's model, `**Offline app:** …`,
   `**Roles:** …`, `**Public screens:** …`, `**External access:** …`), above the
   free-text description, so this is not one paragraph among others: the later phases
   read the label back directly instead of parsing prose.
3. Sum up for the user what has been recorded — **naming the origin it will all land on**.
4. **Then offer to design, before sending anyone to `/flx-plan`.** See below; it is not optional.

## ⛔ Offer `/flx-design` before `/flx-plan`

⛔ **Made HERE only when the ACTIVE ORIGIN IS EMPTY, and made ONCE in the whole flow.** Step 0 has
already counted it. **If the origin holds objects, do not ask it here**: `/flx-new-development` §4
asks the same question with the seven skin variables the application already wears on the table and
with the consequence said out loud — a new palette repaints every page already built. That is the
same question better asked, and asking it twice admits two answers that contradict each other about
one fact, which is exactly what step 0 forbids for the origin. Say in one line that the design
question comes with `/flx-new-development`, that it is where the answer gets recorded, and go there.

**On an empty origin, ask in the user's language, and let them decide:**

> The screens can be designed before building them — `/flx-design` draws them, you approve them,
> and what gets built is what you approved. Or we go straight to `/flx-plan` and build with the
> platform's own look. Which do you prefer?

Three answers, and all three are fine: **design first**, **build now and design later**, or **no
drawn design at all** — record which one with `flexygo_record_decision` (`affects: development`),
because months from now the absence of a design has to read as a decision rather than an oversight.

### If a design is being drawn: where does the original come from — and these three are ORDERED

⛔ **This is the WEB surface, and only it.** The offline app's original is a different original with
a different answer, and it is asked when the app's own development is opened.

⛔ **Ask it HERE.** Which road the original comes by does not change the content of a phase — it
changes the COMMAND the user enters by, `/flx-design` or `/flx-lovable` — and until now that fork
was written only inside `/flx-design`, where it is read by somebody who has already chosen. Every
project passes through this phase, so on an empty origin this is the one place the question reaches
everybody.

Put them to the user in this order. They are **not** equivalent, and offering them flat is how the
best one gets skipped by somebody who was holding it:

1. ⭐ **There already is an approved original** — screenshots, an HTML, a PDF, a link to a demo the
   client said yes to, a folder generated by Lovable or another generator, a Stitch drawn earlier.
   **The best road whenever it exists**, and not because it is the cheapest: it is what the client
   has already approved, so there is nothing left to get approved. ⛔ **It is not a fallback and not
   a degradation** — it is how most approved designs actually arrive. **Ask for the PATH in the same
   breath**: a "yes" with nowhere to look is not an answer, and if the files are still in the
   generator or in a zip, they get downloaded first. A generated project goes to `/flx-lovable`,
   which also reads its model and its tokens; loose screens go to `/flx-design` as the original.
2. **There is none, and it gets drawn now with Stitch** — **the one to recommend when there is
   nothing**, because it is the only one of the three that ends with something the user can look at
   and approve. `/flx-design` carries the whole road, the setup included when Stitch is not wired.
3. **There is none and Stitch is not wanted** — the agreed brief plus the platform's own look
   wearing the client's brand. **Last by result**, and a real road the user may choose: what it
   lacks is not effort, it is anything drawn to approve against. ⛔ **It goes to `/flx-design` as
   well, the same as the other two**, and there it is the `briefing` road: the brief gets recorded
   with `flexygo_write_design_brief`, the client's brand goes on the skin's seven variables, and no
   row-by-row comparison is run because there is no original to compare against. **Name the command
   out loud**, because a road described without one reads as "then there is nothing to draw", and
   the next thing the flow names after this phase is `/flx-plan`.

⚠️ **What is ordered is the CHOICE, never the work.** `/flx-design` opens by saying the roads are
all first class, and that stays true: once an original EXISTS, what governs is that there is one and
never which road it came by — from filing it onwards every step is identical. The order here is for
somebody standing in front of the three with none of them picked yet.

### Then file where it came from, in one call

⛔ **`flexygo_record_design_origin(surface: 'web', origin: 'reference', pointer: 'G:/tender-ui')`** —
`origin` is a closed vocabulary of four: `reference`, `stitch`, `briefing` — one per road above —
and `installed`, which this phase never offers because it belongs to a project that already runs:
there the approved original is the installation itself, and it is filed from `/flx-new-development`
§4. The `pointer` says where to look: the folder of the screens or of the generated project, the
Stitch project id with its design system, `DESIGN.md only` when the brief is all there is, or —
on `installed` — the installation itself, said in one line with what it holds.

⭐ **A pointer, never a copy.** The proof of what was approved has its own place — it is filed screen
by screen with `flexygo_record_reference` once a development is open. Copying the folder here is
dead weight that also goes stale.

⚠️ It is a file of its own, `.flexygo/memory/design.md`, and not a field of the capture above: that
call is made once, in this phase, and its gates are mandatory parameters — while the offline
surface's answer arrives months later. A required parameter cannot carry an answer that does not
exist yet. `flexygo_recall_decisions` reads the entries back, which is how the session that
finally takes on the app learns what the web half was built from.

⛔ **The first answer for a surface is the project's, wherever it is given** — one entry per
surface, reused by every development that opens afterwards. That covers `/flx-new-development` §4
too, on a project that already runs: a development is open there already, and the answer still
lands here because the project has not answered for this surface yet. Only a SECOND answer for the
same surface, given while a development is active, becomes THAT development's own (typically
`installed`, when it adds no new screen), in its own `developments/{slug}/design.md` — and that
answer never reaches back here or governs a sibling development — see `/flx-plan`'s own paragraph
on this.

⛔ **On a virgin project this offer is here because nothing else makes it.** Measured 7-Sep-2026 on
one: `flexygo_get_project_status` announces «Phase (1/10) context → /flx-context» (then «1/7», later «1/8» and «1/9») and
the ten phases are context, plan, discuss, execute, review, verify, test, quality, help and — for a product
used from outside — api: **`/flx-design` is none of them**, and `/flx-plan` does not name it either. An entire application was built that way — 16
entities, ~115 calls, the whole lane walked to `/flx-quality` — **without anybody offering to design
anything**, and the root `DESIGN.md` the template ships (24.262 characters, written to feed exactly
that phase) was never opened.

⛔ **What used to stand here reasoned that `/flx-new-development` is for a project that already has
things, so a project born from the template stays off that road altogether. That is FALSE.** The two
halves are not exclusive: a project that has run for a year still started as a template, and one
born this morning starts having things in it the moment somebody builds. Measured 8-Sep-2026 on a
project with 34 objects, 52 modules and 20 pages and a `.flexygo/` created minutes earlier — it goes
through **both**. That reasoning is what kept this phase holding on to a question it cannot ask as
well as the next one can.

⚠️ **And the server's block does not always say «Next step: /flx-plan» — it asks the database, and
either answer is right.** With an empty active origin it says `/flx-plan`; with objects in it,
`/flx-new-development`, because that is «a new commission inside a project that already runs, so
what comes first is looking at what is there». Design is not one of the ten phases on either
answer and the count stays at ten: it is the step before planning for whoever wants their screens
drawn. Say that plainly if the user asks.

⚠️ **And if the project has a `DESIGN.md` at its root, say so when you offer.** It is the brief the
template wrote for this, and it is the difference between offering an abstraction and offering
something the user can see already exists.

Record it in the user's words and in their language: this is their project's memory, and they are
the ones who will read it back.

**What goes here and what does not.** This is the project's **durable** memory: the domain, the
three-letter prefix, the client's conventions, what must not be touched. The description of the
commission in hand does **not** go here, it goes in the development — and confusing the two has
already happened: in a real project the memory ended up holding the last commission's description,
with its origin path and its tables, instead of the project's facts.

The tool **does not overwrite**: it adds a dated entry and keeps what was there. When two entries
contradict each other, the most recent one wins. If the answer tells you there are several entries
already, look at it: it may be filling up with commissions.

Do not propose a data model, entities or modules. This phase only records.

## The newcomer's page: how the business flows

Recording the context creates `ONBOARDING.md` at the project's root: the page whoever joins the
project reads first. The server keeps the block between its two `flexygo:generated` markers and
never touches anything else; the rest is written by people. Fill **How the business flows** now,
with the user and in their words: the steps of the business in order (receive, produce, ship…), the
process that moves each step on, and who does it, plus the Mermaid `flowchart` that draws it. It
cannot be deduced from the tables, which is why it is asked. Write only outside the markers. **The
main screens** and **Where to start** wait until there is something built to point at.
