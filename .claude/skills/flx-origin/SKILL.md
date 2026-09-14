---
name: flx-origin
description: Shows which origin what gets built lands in and how much work each one holds, and allows changing it. Invoke it when the user asks about the origin, or before building on a project they did not set up themselves.
---

# Origin

Everything the MCP creates lands in the **active origin**. Reads that filter by origin see one
origin's work, never two, so anything sitting in another origin is invisible to what gets built
now. That is not noticed while creating: it is noticed days later, when half the application is
missing.

## Consult

Call `flexygo_get_active_origin`. It returns the catalogue with how many objects each origin holds
and which one is active. Show it to the user as it comes, without summarising: the numbers are what
lets them decide.

If there are objects in an origin other than the active one, **say so and ask** before creating
anything. Most likely their real work is there and they are about to build alongside it by accident.

## Change

`flexygo_set_active_origin(originId, reason)`.

**Never call it on your own initiative.** That the origin "should" be another one is a conclusion of
yours; the project is the user's. Explain what stays where and wait for them to ask.

Three things the tool does for you, worth knowing before proposing the change:

- **It refuses while a development is half built.** What is already created is in the current
  origin and the rest would land in another; the two halves would not see each other. Finish the
  work or start a new one.
- **It refuses origin 0 (System)**, which is the platform's and is no place to build.
  ⛔ **That refusal only covers origin 0 as a DESTINATION.** Nothing stops you when the ACTIVE
  origin is already 0 — the tools run, the rows save, and it is the platform's own origin they
  land in. So read the answer for that too: if the active one is 0, say so and get it changed
  before anything else gets created, because here the refusal is not going to do it for you.
- **It demands a reason**, and returns it in the answer. That is not paperwork: it is the only
  thing that will explain the change to whoever runs into it in two weeks' time.

If it refuses, do not look for the way round. The refusal is the function.

Write the reason and what you tell the user in their language.

## Where else it shows up

`flexygo_get_project_status` already says the active origin and the split of objects, so if you
have just called it there is no need to repeat the query.

Never write `.flexygo/` by hand, and never change `dbo.Origins` with SQL: the change has guards and
skipping them is reintroducing the failure that put them there.

Say where things stand when you finish: which origin is active, and what the next step is — `flexygo_set_active_origin` with a reason if it is not the one they want, or carrying on with the phase that was due if it is.
