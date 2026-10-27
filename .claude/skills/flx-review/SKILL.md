---
name: flx-review
description: Checks what was agreed against what was actually built and points out the deviations. It does not check that it works — that is /flx-verify.
---

# Review what was built against what was agreed

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

1. Call `flexygo_development_status` to get your bearings.
2. Read `.flexygo/developments/<slug>/plan.md` and `decisions.md`: that is what was agreed. Read
   `.flexygo/memory/quick-changes.md` too, if it exists: the minor changes built through `/flx-fast`
   outside any plan. One under this development's slug was asked for on its own — compare it with
   what it says was asked, never with the plan, and do not record it as a deviation.
3. Call `flexygo_audit_origin`. Look for what a build report cannot see: two objects on the same
   table, an object with no properties, a page that cannot be opened. All three break the
   application without raising an error, and all three pass with every MCP call green.
   **A defect is a deviation**, even when it contradicts nothing in the plan: put it in the table
   of step 6. Its warnings also cover what an AI assistant reads of the whole application — the
   application description, process descriptions in jargon or too long, visible process
   parameters with no description, views described by their own name: put them to the user as
   findings, with the tool each warning names.
4. **Read each audit finding whole, and never write one down as "undetermined" without trying.**
   A broken reference says which catalogue the missing name was looked for in and whose the rows
   are: origin 0 came with the platform's own install and is not your work, your own origin means
   this build made it and it is yours to repoint or clear. If after that it still cannot be
   decided, the audit is naming a table this server has no tool to read — record that with
   `flexygo_record_missing_capability`, giving the table and the column, and THEN write the row as
   undetermined. An undetermined finding nobody records is a loop left open: it happened, and the
   gap it came from was never counted.
5. Introspect the real state with the MCP tools: objects, properties, tables, modules.
6. Show the user a three-column table: **agreed · found · deviation**.
7. **Call `flexygo_record_review` for every row of that table**, with `affects` (the task or block
   it refers to), `agreed`, `found` and `deviation`. If there is no deviation, say so: `"None"`.
   Whatever you only say in the chat is lost when the session closes, and the finding goes with it
   — it already happened with a `CreateNewDatabase=True` that would have taken the database down.
8. For each deviation, propose what to do, but do not fix it unless the user asks.

`affects` is validated against the plan: an id that does not exist is rejected. If the review leads
you to conclude that an assumption in the plan was false, that is not a review finding — correct it
with `flexygo_revise_assumption`.

Write the table and what you record in the user's language: `agreed`, `found` and `deviation` are
read by them, not by the platform.

Never write `.flexygo/` by hand. This phase reads, compares and records what it finds; it does not
build.

When you finish, say how many deviations were recorded and **which command comes next**: `/flx-execute` to correct what the review found, or `/flx-verify` if nothing needs building.

And when a unit of work closes, look at whether the SESSION should close with it: the
seams that are worth offering `/clear` on, and the three lines plus the ready-to-paste
prompt that have to go with the offer, are in `.claude/CLAUDE.md`,
under "Leaving the session". You cannot measure your own context — the seam is what you can see.
