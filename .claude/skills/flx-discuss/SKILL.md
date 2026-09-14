---
name: flx-discuss
description: Walks the plan's open points and closes them one at a time with the user, recording every decision. Requires an existing plan.
---

# Work through the open points

1. Call `flexygo_can_discuss`. **It returns the open points, one per line**, with their id and
   whether they are blocking — there is no need to ask for the work's status as well. **If it
   returns an error, stop and explain it:** there is no plan to discuss and the step due is
   `/flx-plan`. If it tells you there are no open points, **do not invent questions**: say so and
   move to `/flx-execute B-1`.

   **If the user said what they want to discuss** —`/flx-discuss T-04`, `/flx-discuss B-2`— pass it
   in `affects` and work only on that. In a plan of forty tasks, walking all of them to close one
   is wasting their time.
2. Go through the points **one at a time**. Do not group them.
3. For each one, ask the user with `AskUserQuestion`, offering concrete options.
   *(In Copilot for VS Code, `vscode_askquestions` is the equivalent tool: use that one instead.
   Do not skip the question because `AskUserQuestion` is not there.)*
4. After each answer call `flexygo_record_decision` with `question`, `answer` and **`affects`**.
   **Without that call the decision does not exist.**
5. Update the plan, removing the marker now resolved.

Ask and record in the user's language: the questions are read by them, and so is what gets written
into `decisions.md`.

## Every invention the census surfaced, none skipped

`/flx-design` step 7 census's the approved screen field by field and names what the design added on
its own — a field, a label, an action nobody requested. Each one is an open point here too, asked
one at a time like any other and recorded with `flexygo_record_decision` **before** it gets built.
None gets skipped as "probably fine": of five inventions in one screen, one was
asked and two reached the screen unasked, because nothing forced asking about all of them.

## The behaviour points are the ones that cannot wait

A point that came from `screenBehaviours` names its screen and carries the question already written
out — putting it to the user costs no more than reading it. Those are **blocking**: the block they
belong to does not start until each one is closed with `flexygo_record_decision` naming its task.

Ask them **as they are written**, and offer the two answers the doctrine allows: a **placeholder**
for now, or the **functionality explained**. Do not answer one yourself from the screen — if it
could have been read off the screen it would never have been declared `needs-user`. And look at the
development's assumptions before asking: on Tender, one of five open behaviours was
already answered by an assumption recorded before anything was built.

## `affects` is mandatory and it is validated

`affects` says what the decision hangs off: a task (`"T-04"`), several (`"T-04,T-09"`) or a block
(`"B-2"`). The tool checks it against the plan and **rejects an id that does not exist**, so a typo
shows up at once instead of leaving the decision with no owner.

Pass `question`, `answer` and `affects` **as separate parameters**. If the text of one carries tags
from the call itself inside it (`</respuesta>`, `<parameter name=…>`), the tool refuses to write:
the call arrived malformed and has to be repeated, not insisted on with the same text.

## When the model is decided, and nobody has seen it on a page yet

The whole flow publishes **two artifacts and no more**: one when the data model is decided, and one
at the end. When the development came through `/flx-design`, the first one already exists — its
step 7 report showed the model and the screens together, and the user approved them there. **Do
not publish it again**: close this phase with the decisions summarised in the terminal.

When there was **no design** — the user went straight to building, or the model was read out of a
generated project — the model has only ever been text scrolling past in a terminal, and this is the
moment it gets decided. So, when the model's open points are closed and before `/flx-execute B-1`,
**publish the model as an artifact and hand them the link**: the entities, which are master and
which transactional, the cardinalities, the menu sections, what gets seeded and what does not, and
the decisions recorded here with their `D-n`. That is what they are approving; a table of tasks is
not. It is published **once**, on the first pass that closes the model; a later `/flx-discuss B-3`
for the points of one block closes in the terminal like a block does.

Never write `.flexygo/` by hand. When you finish, say the next step is `/flx-execute B-1`.
