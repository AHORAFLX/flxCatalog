---
name: flx-setup
description: The cold start of a Flexygo project — where the template came from, which databases exist, whether it is an ERP development, publishing what is missing and writing the connection strings. Invoke it when a project has no connection strings configured, or when a project born from the template has never been set up.
---

# Cold start

This is **infrastructure**, not domain. What the application is about — the model, the offline app,
the prefixes — belongs to `/flx-context`, which comes after this and is where this hands over.

⛔ **The order below is the user's, and it is an order and not a list.** Publishing is the one
irreversible step of the whole sequence, so everything that decides *what* gets published is
answered before it:

1. It is seen that there are no connection strings.
2. The user is **asked which databases already exist**, and what they are called.
3. It is **checked** whether they are really there.
4. ⛔ **The ERP question, before anything is published.**
5. What is missing is published — and **nothing is ever republished**.
6. The connection strings are written, and **the origin is asked** — it is the last
   thing decided here and the first thing everything built afterwards lands on.
7. Hand over to `/flx-context`.

## 0 · Install the template and create the project

Do this when the project has just been created — or is about to be — and skip it when the project
is plainly already there and only the databases are missing.

`dotnet new list` finds the template under its **short name, `flexygoproduct`**. The package is
called `Flexygo.Product.Template`, and typing the package name there does not work.

Installing it, if it is not there — and **always with the feed pinned**:
`dotnet new install Flexygo.Product.Template --add-source https://nuget.ahorabh.com/v3/index.json`
(here the **package** name is the right one). Three other templates live in the same feed and are
**not** this one: `flexygoaddon` — which ships inside this very package — plus `flxsatproduct`
and `recognizerproduct`, each in a package of its own.

⭐ **Pinning the source is the whole protection, and it replaces a check that could not work.** The
feed decides which platform version the project is built on, and a TeamCity feed
(`http://teamcityflx:8111/...`) — which is **build output, not a publication** — was measured
sneaking into a real installation. This step used to try to DETECT that, by reading the source
recorded for the template installed here. ⛔ **That reading describes this machine, not this
project**, so it went green on a project created elsewhere or at another time, and the warning only
ever fired if the user raised it unprompted. Pinning says where the template must come from instead
of guessing where it came from. **If the template is already installed and nobody knows its
source, reinstall it with the line above** rather than trying to work it out.

Creating the project, with the two flags that are not optional in practice:
`dotnet new flexygoproduct -n Name -o path --openVS false --allow-scripts Yes`

- `--openVS` defaults to `true` and **opens Visual Studio on top of the user**; `false` only takes
  effect through the template's one post-action, `init.ps1` — so it does nothing without the flag
  below allowing that script to run.
- `--allow-scripts` defaults to `Prompt`, and a prompt with nobody to answer it **hangs the run**.
  `Yes` avoids the hang AND lets `init.ps1` run, which is what renames `.gitignore.template`,
  copies `.env` from `.env.example`, and renames the two `*.nuspec.RENAME_ME` files — skip it and
  the project is left half-built.

⛔ **If the template cannot be installed — unreachable feed, credentials — say so and STOP.** Do
not hand-build the skeleton. One written by eye looks like the real thing and the difference
surfaces weeks later, in somebody else's session.

## 1 · Is anything configured?

Call `flexygo_get_project_status`. On a project straight out of the template it answers
`NONE CONFIGURED` and names the file, the two keys and `FLEXYGO_WORKSPACE_DIR`. Read that answer
before asking anything: it also says whether the server is even pointed at the project the user
means. If it is pointed somewhere else, that is the first thing to fix and no database question
matters yet.

## 2 · ⛔ Ask which databases exist — and WAIT for the answer

⛔ **This question BLOCKS.** Nothing after it runs until the user has answered it in this chat:
not step 3, not a guess to "keep moving". And **do not deduce it**: not from a sibling project on
the same machine, not from any `appsettings*.json` that is not this project's own, not from a
naming convention seen elsewhere. Measured 9-Sep-2026: with this instruction in front of it, an
agent asked the question, did not wait, opened a neighbouring project's
`appsettings.Development.json` and put its instance, user and **password** on the table as if they
were this project's — a secret from another customer, and catalogue names decided by a neighbour's
convention instead of by the user. Nothing in that is a shortcut: it is the answer to a different
project.

In the user's language:

> Are the databases for this project already published, and what are they called? I need the SQL
> instance, the user and password, and the name of each catalogue — the configuration one and the
> data one.

Two catalogues, and they are different things: **Conf** holds Flexygo's own metadata, **Data**
holds the application's tables.

## 3 · Check that they are really there

`flexygo_check_databases`, passing the candidate strings as parameters — it works before
`appsettings` holds anything, which is the whole point of it. Read its answer to the user as it
comes:

- **EXISTS** — that catalogue is not published over. Ever.
- **DOES NOT EXIST** — it is a candidate for publishing, once step 4 is answered.
- ⛔ **COULD NOT CHECK** — that is a third answer and never a synonym of "not there". Find out why
  (wrong instance, wrong credential, server down) before anything is published.
- ⛔ **IDENTITY** — for a catalogue that exists, the answer also says what it IS: whether it carries
  Flexygo's configuration schema and installation tables (`Objects`, `Objects_Properties`,
  `Modules`, `Pages`, `Processes`, `License`, `Versions`), which is what makes a catalogue an `_IC`.
  Two mismatches stop the flow, and neither of them fails at the time:
  - a **Conf** the user chose that is **not** an `_IC` — pointing the platform at it breaks much
    later and without saying why;
  - a **Data** catalogue that **is** one — the application's rows aimed at Flexygo's own metadata.
- The **user table count** is reported too, and it does not tell you any of that. Every Flexygo
  `_IC` carries the same fixed schema, bench and customer alike, so on a Conf the number is a
  constant. It only means something on a Data catalogue, where the answer warns you itself.

## 4 · ⛔ Is this an ERP development?

**Ask this before publishing anything, and stop until it is answered.** It cannot be inferred from
anything: not from the domain, not from the tables, and least of all from a Data database that is
already full — that is just as likely to be our own work from last year.

> Is the main data model ours to build, or does it belong to a system that is already there — an
> ERP, the customer's own database?

⛔ **The two choices the user reads are worded in THEIR terms, and the block below is not.** What
follows is for you: it names the tools each answer switches on and off. Put a tool name in front of
the person choosing and you are asking them to decide with a word they have never seen — they know
whose database it is, and nothing else here is theirs to know. Say it as the consequence they can
picture: on one answer **we create the tables ourselves**; on the other **the database is not ours,
nothing is ever created in it, and the changes travel as scripts the application applies by itself**.

- **Ours, from scratch** (`own`) — both databases are published if they are missing, and the tables
  are created later with `flexygo_execute_ddl` against `DataConnectionString`.
- **Existing (ERP)** (`existing`) — ⛔ **the Data database is NOT published at all**, and its
  connection string points at the customer's. Nothing is ever created there directly: not a table,
  not a column, not a row of seed data. The only route is `flexygo_register_deployment_script`, and
  the write tools refuse that database on their own.

⚠️ **Why it is here and not later.** It was measured on a real pass: this question exists, it is
well worded, and it was being asked inside `/flx-context` — minutes **after** both databases had
been published. On that bench publishing both happened to be right, and it was right by default and
not by having asked. The same path on a customer with an ERP behind it publishes over a database
that must not be touched, and nothing fails, nothing warns, and the damage shows up much later.

The answer is recorded for you by `flexygo_set_connection_strings` in step 6, into
`.flexygo/memory/`. **`/flx-context` reads it back and asks you to confirm it, and it does not ask
the question again** — the same question asked in two places admits two answers that contradict
each other about one fact.

## 5 · Publish what is missing

`flexygo_publish_databases`, and only for what step 3 said is not there.

- ⛔ **Never republish.** The tool refuses a catalogue that already exists, and that refusal is the
  rule, not an obstacle to work around.
- With `existing`, **`publishData` stays false.**
- The connection strings can be passed straight to it, which is what lets the databases be created
  before `appsettings` holds anything.
- If a publish fails halfway, read what the tool says to do next. A database left with its schema
  and no seed data is not a usable database, and **dropping it is the user's decision, never yours.**

## 6 · Write the connection strings

`flexygo_set_connection_strings`, with `dataModel` set to the step 4 answer.

- It fills in only what is **empty**, and refuses an entry that already holds a value. That refusal
  is the same rule as "never republish", one layer up: a string already there points at a database
  somebody is using.
- It writes the consumer's file and never the MCP server's own settings.
- It names any sibling `appsettings` file it left empty. **That is the intended state and there is
  nothing to fill in by hand**: a project laid out by the template runs both halves under
  Development, so `appsettings.Development.json` is the file that gets read. Do not go and edit the
  base one — say what the answer says, and move on.
- Then call `flexygo_get_project_status` again to confirm the server reads them. The values are
  cached for five minutes and that call is what forces the re-read.

⚠️ If the server is wired through a project `.mcp.json` and that file has to change — a different
`FLEXYGO_WORKSPACE_DIR`, a different command — a new chat picks up **nothing**. The MCP servers are
started by the extension host once per **window**: `Ctrl+Shift+P` → *Developer: Reload Window*.
Changing the server **binary** is a different rule and is picked up by killing its process.

## 7 · Ask which origin this lands on

`flexygo_get_active_origin` first. It returns the catalogue with the object count of each one and a
marker on the active one — `0 · System`, `1 · Product`, `2 · Project`, `3 · User`. Show it as it
comes: the numbers are what lets the user decide.

A project straight out of the template lands on **2 · Project**, and that is not a choice anybody
made: `OriginId` defaults to `dbo.funNet_GetOrigin()` and this server never overrides it. It is
where the platform left it, which is a different thing from where this project belongs.

⛔ **So ask — and the recommendation is NOT a fixed number.** It follows from what is being built,
and there are two cases:

- **1 · Product** — when what is being built is a **product**: something meant to be installed at
  more than one customer.
- **2 · Project** — when this is the **implantation for one customer**.

⚠️ **Recommending «1» flat is the same mistake mirrored** — it sends every customer's project to
where products live, which is exactly the damage this step exists to avoid. Say which of the two
this project is, name the origin that goes with it, and say why. Then **the user decides**: it is a
recommendation and the answer is theirs.

Everything built afterwards lands on the active origin, and reads that filter by origin see one
origin's worth of work and never two — so work that lands on the wrong one is invisible to
everything built later, and nothing says so at the time.

- To change it, `flexygo_set_active_origin` with a **reason**. The reason is required and it is the
  only thing that will explain the change to whoever meets it weeks later.
- It **refuses while a work is half-built**, and that refusal is right: what was already created
  stays on the current origin and the rest would land elsewhere. Report what it answered instead of
  working around it.
- ⛔ **Origin 0 is never the answer** — not to carry on with, not to move to. It is Flexygo's own,
  and the tool refuses it as a destination. That refusal does not cover the other half: if 0 is
  already the ACTIVE one, nothing stops anybody. Say so and get it changed before anything is
  created. `/flx-origin` is the command for looking at all this again later.

⛔ **And it is asked HERE, once.** `/flx-context` reads the answer back and asks the user to confirm
it, **and it does not ask the question again** — the same rule the ERP question follows three steps
up, and for the same reason: the same question asked in two places admits two answers that
contradict each other about one fact.

Never write `.flexygo/` by hand: the tools write it, and the later phases read its shape.

## What comes next

Say what state the project was left in — which databases exist, which were published, which file
was written, whose the data model is, which origin is active — and then **the next step is
`/flx-context`**, which records what the application is about and offers `/flx-design` before
anything is planned.

If the sequence stopped part way — a feed that cannot be reached, a database nobody could identify,
a publish that failed — say exactly where it stopped and what the user has to decide, and do not
carry on past it.
