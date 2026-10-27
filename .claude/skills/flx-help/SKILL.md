---
name: flx-help
description: Gives each screen this development built its help for the people who use it — the tour of the screen, the field help where a field is not obvious, and its page of the application's help with screenshots on the demo data — and records it. Invoke it after /flx-quality.
---

# Help for whoever uses what was built

**Resuming in a new chat?** Start with `flexygo_get_project_status`: its checkpoint gives the phase,
the block, the open decisions, the last verify results and what comes next. Take your bearings from
it rather than by re-reading `plan.md`, `execution.md` or the catalogue, and read those only for
what this phase works on.

A screen nobody explains is learned by asking someone, or not at all. Three layers, from the
smallest to the largest: the help of a field, the tour of the screen — plus one welcome tour of the
whole application, offered the first time each user enters — and the manual — a guide of
the business flows, by role, step by step across the screens. The manual teaches the work, not the
screens: one thin page per screen is what this phase must not leave behind.

⛔ Never write anything under `.flexygo/` by hand: the tools write it. The manual is the
application's own help, written with the tools; only its screenshots are files you save, under
`{Product}.Frontend/wwwroot/{product}/help/`.

## 0 · Read the guide first

`flexygo_get_help_reference`: the three layers, how the platform's tour works and what offers it,
how the manual lives in the application's help and is reached, and how a help entry is recorded and checked.

## 1 · What gets help — propose it, in the user's words

`flexygo_get_project_status` says whether this phase applies: it asks for it only when the plan
built screens, and it names the tasks still without help. Read the business flow in `ONBOARDING.md`
at the project's root and the context, and put to the user in their language:

- **the manual**: for each role, the flows it takes part in, in the order of the work ("receive an
  appliance", "diagnose and repair", "close and deliver"), each with the screens it crosses;
- for each screen, the steps of its tour and the fields that need a word of help;
- **the welcome tour**: one per role when their start pages or menus differ (`tour-welcome-<role>`),
  or a single one when they all start the same, with its steps — what the application is for, the
  menu and its sections for that role, the search, the notifications, the user menu, where the Help
  entry is, and optionally one step per main screen of the role.

Wait for the yes. They may decide a screen goes without help (§4).

## 2 · Write it

1. **Read what is there**: `flexygo_get_tours` before changing a tour, `flexygo_get_page_modules` for
   the modules a step can point at.
2. **The tour** with `flexygo_set_tour`, anchored to modules wherever there is one, and offered on
   its screen (`offerOnPage`). Then `flexygo_reload_cache`, open the screen, and walk the tour to
   the end: a step whose anchor is not on screen is skipped without a word.
3. **The welcome tour** (the guide's §2): on the start page of each role's profile
   (`flexygo_get_profiles`), with `autoStart: "yes"` and `offerOnPage` that page; when there is one per
   role, its offer module (`mod-tour-<tourId>`) denied to every other role with
   `flexygo_set_module_security`. Write it after the Help entry of step 7, which one of its steps
   points at. Reload the cache and sign in as one user of each role: it comes up on its own, reaches
   the end with no step skipped, and does not come up again.
4. **The field help** that is missing, with the property's `tooltip`.
5. **One page of the manual per flow and role**, with `flexygo_set_help_entry`, as a tutorial: what
   starts it, what it is for, the numbered steps across every screen it crosses (screen, what to do,
   what the application answers, its screenshot), who continues, what can go wrong, and a worked
   example on the demo data by name. The guide's §3 is the shape; a page of two or three steps is a
   screen description, not a guide.
6. **The screenshots** on the **demo data** (`flexygo_demo_data`), never on the customer's: each one
   the module the step talks about, whole, with the licence watermark and the floating buttons
   hidden for the capture only, framed in the page — and **look at each one** before using it:
   retake it when a word is cut on an edge or an overlay shows.
7. **The index page**, role by role, linking the flows; each screen's **button** on the bar of its
   main module (`flexygo_add_toolbar_button` with `helpId`) opening the flow it serves most; and the
   first time in the product, the **"Help" entry in the menu** opening the index —
   `flexygo_create_navigation_node` with `helpId`, in the product's part of the menu (after its last
   entry, never under Administration or after Develop Mode) and denied to no role. Reload the cache,
   and see it signed in as one user of each role.

## 2 bis · Review it before recording

Read every page back and put the guide's two tables to the user: **coverage** (every flow of every
role has its page, with its steps and screenshots counted) and **depth** (per page: starts from
its trigger, every step names screen, action and answer, every step has a capture you looked at,
who continues, what can go wrong, a worked example). Rewrite every gap and every "no", show the
tables again, and record only after the user's yes on both.

## 3 · Record it, one task at a time

`flexygo_record_verification`, `kind: "help"`, `affects` the task that built the screen, and
`check` in the shape the guide gives — `tour: … · page: … · help: …`. The server checks that the
help entry exists, that a button on that page opens it and that the tour has steps on that page
and that a welcome tour is offered on its own before it writes anything; if something is missing
it says what. If the user decides to go without the welcome tour, record that decision and add
`welcome: D-n` to the check. The phase closes when every task that built a screen is recorded.

## 4 · Going without

If the user decides a screen goes without help, record their decision with
`flexygo_record_decision` naming the task, and file it with `flexygo_record_verification`,
`kind: "help"`, `waivedBy: "D-n"`.

## 5 · What comes next

Say which screens got their tour and their page of the help, and how to open them, and which
welcome tour each role gets the first time it enters. Next step:
`/flx-api` if the application is used from outside; otherwise the development is complete —
`/flx-status` says so.
