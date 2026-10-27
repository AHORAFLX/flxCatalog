---
name: flx-api
description: The phase after /flx-quality when someone uses the application from outside (an AI assistant, another system) — proposes what of the built goes out over the WebAPI, read only by default, and for which roles; on a 10.0, who uses the platform's own assistant. The user decides, it is written, probed from outside with one user per role, and recorded. Invoke it when the flow says "Next step: /flx-api".
---

# What goes out, and for whom — the user decides

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

`/flx-context` asked once whether anyone uses the application from outside. With a yes, the flow
does not end at `/flx-quality`: it sends here, and the development is not complete until this phase
is recorded. With a no, nobody comes here.

What is exposed to the platform's WebAPI is **global**: an object, a view or a process is open or it
is not, for whoever may call. **By role goes only WHO calls** — and, on a 10.0, who uses the
platform's own assistant. Everything below follows from those two facts.

⛔ **Never write `.flexygo/` by hand.** `flexygo_record_exposure` writes `exposure.md` from the
database itself; a list typed by hand drifts from what is really open, and the flow reads the tool's
entry, not a file.

## Already recorded — review it, change only what is asked

When the active development's `exposure.md` already holds an entry (`flexygo_development_status`
says the flow is complete), this phase does not propose again. Read §0.2 — and §0.4 before saying
whether a role exists — and compare what is open today with the LAST entry of that development's
`exposure.md`: its `**Decided by:**`, its `**Probe:**`, its photograph. Say whether they match or
what changed, and write nothing. Say only what you read: another development's file is not that
entry. If the user wants a change, §2 to §5 again — a new decision, written, probed, and recorded
with `flexygo_record_exposure`, which adds an entry under the old ones.

## 0 · Read before proposing

1. `flexygo_get_webapi_reference` — how a token is obtained, the two questions (who, what), what a
   refusal looks like, and §6: ⛔ **never `EnableOfflineRequirements`** to open the WebAPI; it writes
   eighteen grants nobody asked for, an administrator among them.
2. `flexygo_get_webapi_exposure` — what is open TODAY, who may call, and its `Platform:` line.
3. The project memory: its `**Roles:**` line says who uses the application, in the user's words.
4. `flexygo_list_roles` — the roles the platform has. ⛔ Each thing said of a role comes from the
   read that carries it: who may call, and who has `mcp`, from the `Roles authorized` rows of
   `flexygo_get_webapi_exposure`; that a role exists, that it does not, its id — only from this
   list. A role absent from `Roles authorized` has no grant; it may well exist.

## 1 · Which platform runs — it changes what a role means

The `Platform:` line reads the DLL the project runs, not its version number:

- **10.0** — the WebAPI refuses what the token's role may not open, and the platform has its own
  assistant (`/mcp`), with a permission of its own per user and role.
  The `MCP sign-in:` line says who gets in to it: by CIMD (Claude Code, claude.ai, ChatGPT) on a
  platform with FG-1, or only by DCR on an older 10.0. claude.ai, the desktop and ChatGPT reach it only
  on a public https address; Claude Code reaches it on `localhost`.
- **1.4/1.5** — the WebAPI **never asks the token's role**: a list the role is denied comes back
  EMPTY, as if there were no rows, and a process it is denied RUNS when called with no object.
  `flexygo_set_webapi_access` therefore refuses to authorize a role whose own security denies
  something exposed, and names each clash. There is no assistant of its own: say so and leave it out.
- **never compiled** — taken as a 1.4/1.5, and the acknowledgements say it.

## 2 · Propose from what was built

From what this development built on the active origin (its plan, `flexygo_get_objects`), put ONE
table to the user:

| object | list | record | insert | edit | delete | views | processes |
|---|---|---|---|---|---|---|---|

- **Read only by default**: the list and the record. Insert and edit only if the user asks for them;
  **delete is never proposed**. A process only when the user names it — it changes data from outside.
- A view goes out on its own row; opening the object does not open its views.
- Check each object's description for an assistant: `flexygo_get_webapi_exposure` counts the ones
  with none, and the connector guesses on those. Describe them first.

Then, in the same proposal, one question at a time:

- **Who calls.** The role names come from `**Roles:**`. With `single`, the question is yes or no: is
  it the one kind of user, or an integration user created for the purpose? With several, which of
  those roles call — and their ids in `flexygo_list_roles`.
- **On a 10.0, who uses the platform's assistant** — the same roles, or fewer. Say it when asking:
  the permission only stops clients that come in by OAuth; a role authorized on the WebAPI still
  gets in with its own token. What really closes the door to a role is not authorizing it.
- **Columns that must not travel** — costs, personal data. Ask; never guess them from the names.
- **The application's description.** Read `flexygo_get_settings(settingName: 'ApplicationDescription')`.
  If it is empty, draft it from the project context — what the application is, for whom, its main
  objects, what its business words mean — four to eight sentences in the language of its labels,
  show it, and save it only with the user's OK.

Record the answer with `flexygo_record_decision` (affects: `development`). Its D-n is what the
record cites. Nothing is written before it.

## 3 · Write it

- Each object, view and process: `flexygo_set_webapi_exposure(objectName: 'CRM_Cliente', canView: true, canViewCollection: true)`.
- Each role that calls: `flexygo_set_webapi_access(roleId: 'comercial', authorized: true)` — on a
  10.0 add `mcp: true` for the ones that use the assistant. An integration user goes by `userName`.
- Each column that must not travel: `flexygo_update_property(objectName: 'CRM_Cliente', propertyName: 'Coste', webApiHidden: true)`.
  ⚠️ Say it to the user: the column cannot be WRITTEN from outside either — an insert or an edit
  through the WebAPI drops it silently.
- The switches, **only with the user's OK**: `flexygo_set_setting(settingName: 'WebAPI_Enabled', settingValue: 'true')`,
  and on a 10.0 `MCP_Enabled` the same way. Like `ApplicationDescription`, they do not travel in the
  deployment script: say so.
- Then `flexygo_reload_cache`: a running Backend does not see a grant until it reloads.

⛔ **On a 1.4/1.5, a refusal that names a clash is the user's to resolve**, never yours to route
around: (1) do not expose that thing, (2) authorize an integration user instead of the role, or
(3) upgrade the platform. Put the three to them as the tool names them.

## 4 · Probe it from outside, one user per role

With the application running — whoever starts it stops it, as `/flx-verify` says — for **each
authorized role**:

1. A token for its test user (reference §1). The test users are the ones `/flx-verify` §4-ter
   creates, one per role. ⛔ **Each one takes a seat of the licence**: if there is none, ask the
   user. The licence is never worked around.
2. **One exposed list that reads** — how many rows came back.
3. **One list the role is denied, refused** — the message, literally. On a 1.4/1.5 it does not refuse:
   it comes back empty. Write that down as it is; it is the platform's limit, not a pass.

⚠️ The status code depends on the Frontend: before beta.83 a refusal arrives as HTTP 200 carrying
`Unauthorized collection …` in its `Ajax` envelope; later ones answer 401 or 403. Read the message,
not the code.

4. **On a 10.0 with `MCP_Enabled`, each role allowed the assistant goes through `/mcp` too** — a token
   on the WebAPI says nothing of whether an AI client gets in. Connect Claude Code to the application
   (`claude mcp add --transport http <name> <frontend>/mcp`), sign in as that role's test user in the
   browser of this session and allow the consent, then list the tools and read one exposed collection
   and one that is not exposed. A role authorized on the WebAPI WITHOUT the assistant is refused at the
   consent — write that literally too. Remove the connection when done (`claude mcp remove <name>`).
   `flexygo_record_exposure` refuses a probe that does not say what came back after `/mcp`.
5. **If an insert or an edit is open**, do one on a `TEST` record through the WebAPI and undo it:
   reading proves the door is open, not that the write lands.

⛔ **On an evaluation licence, one role user at a time.** It counts every unlocked user besides admin
and guest; over its maximum, every screen says «INVALID LICENSE» and the role users cannot sign in.
Ask the user to leave unlocked only the test user being probed, and to restore the rest after.

**And leave the probe as a test that stays**: `flexygo_scaffold_tests(taskId: 'T-03', exposure: 'comercial')`
writes, for each authorized role or user, a test in the InterfaceTest that signs in, reads an open
collection and is refused a closed one. `flexygo_run_tests(project: 'interface')` runs it from then on,
and it goes red the day a change closes what was open or opens what was not.

If the user decides not to probe now, that is their decision, recorded like any other.

## 5 · Record it, and what comes next

`flexygo_record_exposure(decidedBy: 'D-4', probe: 'role comercial read 12 rows of Pedido; Factura refused with Unauthorized collection Factura for role comercial')`.

- The probe names **every** authorized role and user; one left out is refused.
- Not probed: `probe: 'not-run: <why>'` with `probeWaivedBy`, the D-n of the user's decision.
- Nothing goes out: the decision alone; the photograph says zero rows.

The tool photographs the database — switches, objects with their verbs, views, processes, who may
call, the platform — into `exposure.md`, and its first entry closes the phase. It also writes `API.md`
at the project's root, for whoever uses the application from outside: where to call, how to sign in,
which assistants get in, and what is open for whom. Tell the user it is there, and that it travels
with the project. Then say what comes
next: the flow is complete; the next commission starts with `/flx-new-development`. Tell the user
that an assistant connected through the WebAPI (or the platform's own `/mcp` on a 10.0) now sees
exactly what was exposed, with the security of the role it signs in with.
