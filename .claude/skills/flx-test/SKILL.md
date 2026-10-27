---
name: flx-test
description: Writes the product's own tests for what this development built — a unit test per new process, an interface walk per new screen — runs them green, sees one go red on purpose, and records the run. Invoke it after /flx-verify and before /flx-quality.
---

# Tests that stay with the product

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

`/flx-verify` saw it working once. A test keeps seeing it: it lives in the product's repository, the
CI runs the unit tests before every publication, and the day a change breaks a process or a screen,
it goes red instead of a customer finding out.

⛔ Never write anything under `.flexygo/` by hand: the tools write it. The tests are code of the
product — `{Product}.UnitTest` and `{Product}.InterfaceTest`, next to the Backend — and that you do
write.

## 0 · Read the guide first

`flexygo_get_testing_reference`. It holds what the template ships and the two things broken in it,
what CI runs, the two patterns, and why each test creates its own data. Do not write a test before
reading it.

## 1 · What gets tested — propose it, in the user's words

`flexygo_get_project_status` says whether this phase applies: it asks for it only when the plan
builds processes or screens. The minimum, decided with the user:

- **one unit test per new process** (and per business rule that lives in SQL): the process runs and
  leaves the record the way the user expects;
- **one interface walk per new screen**: it opens without JavaScript errors, its main action works,
  and the effect shows.

Put the list to the user, one line each, in their language and in business terms ("blocking a
customer leaves it blocked", "dragging a launch onto a line creates its order") — and wait for the
yes. They may add one, drop one, or decide this development goes without tests (§5).

## 2 · Make the two projects run

Before writing anything, build both (`dotnet build {Product}.UnitTest`, `dotnet build
{Product}.InterfaceTest`). The guide says how to fix the template's `SetupTest` when it does not
compile, and how to create the InterfaceTest's local settings file. **Ask the user for the password**
and put it only in that local file: it is ignored by git, and a password in a versioned file is a
leak. Read the Frontend's address with `flexygo_get_project_status` or ask for it.

## 3 · Write them

Read the real names before you write a call: the process and its parameters with
`flexygo_get_process_full_config`, the object and its fields with `flexygo_get_object_full_config`,
the page with `flexygo_get_page_full_config`. Start each one from its skeleton:
`flexygo_scaffold_tests` with the task and its process writes the unit test into the product, named
after the task, with the real names; it fails until you write what it checks. **The screens' walks
are usually there already**, in `{Product}.InterfaceTest/walks/`, from `/flx-verify`: reuse them —
the testing reference has their format — and write a walk only for a screen that has none
(`flexygo_scaffold_tests` with its `pageName`). Then:

- each test **creates what it needs and deletes it** in `finally` — never the demo data, never rows
  someone seeded by hand. CI runs against a database with no business rows: a test that reads rows it
  did not create fails there and blocks the publication. A walk on `"data": "demo"` is skipped in CI;
  the one that must run there creates and deletes its own `TEST` rows, `"data": "own"`;
- name each test after the task it covers and what it proves, not after a table:
  `T03_CustomerView_ShowsNameAndEmail`. The task id in the name is what ties the test to the task —
  the server reads it there, and a test without one closes nothing.

## 4 · Run them, and break one

1. `dotnet test {Product}.UnitTest`, and with the application started (the interface walks need it),
   `dotnet test {Product}.InterfaceTest`. All green.
2. **Break one on purpose** — the expected value, or the process switched off — run it, see it red,
   put it back and see it green again. A test nobody has seen fail proves nothing.
3. Check that nothing the tests created is left in the database.

## 5 · Record the run

`flexygo_run_tests` runs them — `project: "unit"`, and `"interface"` with the application started —
and records the run itself: each task whose tests all passed, as passing; each task with a failure, as
red. Nobody writes that result by hand. A red run reopens nothing, and the phase stays open for those
tasks until a run passes. If it answers that the Backend holds a file, ask the user to stop it for
the unit tests.

**The walks count here through `project: "interface"`**: it runs them as tests of the InterfaceTest, each one tied
to the task its file names. A replay with `project: "walks"` records what was SEEN for `/flx-verify`, not a test
run, so it does not close this phase.

If the user decides to go without tests, record their decision with `flexygo_record_decision`
(affects the block) and file it with `flexygo_record_verification`, `kind: "tests"`,
`waivedBy: "D-n"`.

## 6 · What comes next

Say what was tested, how many tests, and that one was seen red. Next step: `/flx-quality`.
