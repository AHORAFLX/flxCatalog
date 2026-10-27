---
name: flx-fast
description: Builds a minor change on what already exists — a property, a label, a filter, a module, a list on an object that is already there — with no development, plan or blocks, and leaves a record of it. Anything bigger goes to /flx-new-development.
---

# A minor change, the quick way

For "two small things" the flow of development, plan, decisions and blocks is out of proportion.
This path skips exactly that and nothing else: it reads before it touches, it builds by the same
rules, and it leaves a record a later review can find.

## 1. Check that it is minor

**In**: touching or adding on what exists — a property, a label, a filter, a module, a list on an
object that is already there.

**Out**: new tables or entities, permissions, seeding or migrating data, deleting an entity. And
more than about five changes, even if each one is small.

If the request has anything from the second list, **say so, send it to `/flx-new-development`, and
stop** — build none of it, not even the part that would have fitted. Half a request built the quick
way and the other half planned leaves two records of one piece of work.

## 2. Read before you touch

- The whole configuration of what is going to change: `flexygo_get_object_full_config`,
  `flexygo_get_page_full_config`, `flexygo_get_module_full_config`. Otherwise you propose what is
  already there, or change the wrong one of two lookalikes.
- If you are going to **name** anything new — a property, a filter, a module —
  `flexygo_recall_decisions` first, and `flexygo_get_conventions` if you have not read it in this
  session: the project already has prefixes and names, and a quick change is not the place to
  invent a second set.

## 3. Say what you will change, and carry on

A short list, in the user's words: what changes and where. Then **build without waiting** — this is
the quick path. Ask first only in two cases: the change deletes something (a property, a filter, a
module placement), or the request can be read two ways. Then ask, and wait.

## 4. Build it here, in this chat

With the MCP tools, **here, in this chat** — never handed to a subagent. How to build is written
down in `.claude/CLAUDE.md`, under "How to build", installed by `flexygo_sync_skills`: one thing at
a time, read before you assert, look at the active origin, and the refusal says what to do. What
that section says you do not do unless asked still holds here.

If a development is open, **do not touch it**: no task is recorded, its plan is not rewritten, and
the change is not one of its blocks.

## 5. Make it visible and keep it

- If the application is running, the screen keeps showing the old definition until the cache is
  reloaded: a change to something that already existed only shows after a reload —
  whatever the diagnosis without it says. So ask the user for their password, in so many
  words, and call `flexygo_reload_cache(objectName: …, password: …)` with the object you
  touched (adding `userName` if theirs is not `admin`). Afterwards, reopening the page is enough.
  If they do not give it, tell them the change will not show until the cache is reloaded, and that
  the "Reload Cache" button in the application's user list does it. If the application is stopped,
  do not start it: say the change shows the next time it starts.
- If the project keeps its configuration in version control — a `*.Conf.Database` folder whose
  `scripts/staticdata` already carries scripts — regenerate them with `flexygo_script_changes`, or
  the next publish of the database puts the old configuration back.

## 6. Leave the record

`flexygo_record_quick_change(request: …, changes: …)`, once the change is built:

- `request`: what the user asked, **word for word**, in their language.
- `changes`: what was touched — which object, property, filter or module, and how.

It writes the dated entry in `.flexygo/memory/quick-changes.md`, with the open development's slug
when there is one, and it works with none. `/flx-review` reads it so the change does not read as a
deviation of a plan. Never write `.flexygo/` by hand: the tool is what later phases read.

If something failed, say it with the literal message of the tool that refused, and record in
`changes` only what was actually changed.

## 7. Close

Tell the user, in their language and without tool names: what changed, and where to see it — the
page, the list, the field. Then say what comes next: **the flow carries on where it was.** If a
development was open, name the command it was due for (`flexygo_get_project_status` says which);
if not, there is nothing pending from this change.
