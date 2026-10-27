---
name: flx-video
description: Makes the product's social video with HyperFrames, the way /brag does for a website — a feature tour of the whole product (20-40 s) or the functionality a development just delivered (15-25 s), its screens rebuilt at video scale from real captures, rendered horizontal (1920x1080) and vertical (1080x1920) into {Product}.Marketing/videos/. Optional and never on your own initiative — offered once a development is closed, run only when the user says yes.
---

# Brag about it, in two formats

`/brag` turns a website into a short launch video by reading its `index.html`. A Flexygo product
has no `index.html`: what it is lives in `.flexygo/`, what it looks like lives in `DESIGN.md` and
the running application, and the words its users read are on its screens and in its help, when it
has one. This command is `/brag` with those sources, two formats instead of one, and a folder of
the product's own to land in.

**`/brag` is the creative engine, not a model to imitate.** Its planning rubric, tones, creative
laws, step 3 (composition brief, beat locks, audio-reactive treatment) and step 4 (delivery) are
followed as written; this command only swaps the sources, adds the second format and the Flexygo
rules. Where the two disagree on craft, `/brag` wins; where they disagree on data, secrets or the
application, this command wins.

**Shots are the source of truth; the video shows the UI rebuilt.** The real screens are captured
(section 4) for their exact words, figures, layout and colours, and each scene then recreates the
piece it needs at video scale (section 6), with the product's real photos. Measured 2026-10-23: a
product film made of the captures themselves — cropped and scaled up — came out grey, static and
small-typed, and the user judged it clearly worse than the `/brag` films built from recreated
screens and product photos.

## 0 - Only when the user asked for it

This is not a phase and nothing is gated on it. When a development closes, it may be offered once,
in one line; the user says yes or no, and no is a complete answer. Do not start it because a
development looks worth showing off.

## 1 - Parse the request

```
/flx-video                      -> the functionality of the active development, both formats
/flx-video product              -> the whole product
/flx-video --tone cinematic     -> a /brag tone preset or a freeform direction
/flx-video --formats vertical   -> one format only; the default is landscape,vertical
/flx-video --duration 20 --no-music --no-sfx --voice --title "..."
```

| Option | Values | Default |
|---|---|---|
| scope | `product`, or the active development (a slug names another) | the active development |
| `--tone` | `default`, `polished`, `app-store`, `cinematic`, `deadpan`, `yc-parody`, `chaotic`, or freeform | `polished` for a business product; `app-store` when the scope is the whole product |
| `--formats` | `landscape`, `vertical`, `square`, comma-separated | `landscape,vertical` |
| shape | `tour` (one built feature per scene) or `task` (one user task, entry -> action -> result) | `tour` for the whole product; `task` for a development |
| `--duration` | seconds | auto: 20-40 for a product tour, 15-25 otherwise |
| `--no-music`, `--no-sfx`, `--title` | as in `/brag` | music and sfx on |
| `--voice` | a voice-over made with ElevenLabs (section 1-ter) | off |

`yc-parody` and `chaotic` are never inferred: a customer's product is not a joke unless its
owner says so. A freeform direction is kept verbatim in the plan and mapped to the nearest
preset for pacing.

## 1-bis - Ask before making anything

The defaults above are suggestions, not decisions. **Before inspecting or shooting anything, put
these questions to the user in ONE message**, in their language, each with its default shown so
"the defaults" is a complete answer. Skip only what the invocation already answered with a flag.

1. **What it is about** — the whole product, or the functionality of a development (name the
   active one).
2. **Shape** — a feature tour, one built feature per scene (default for the whole product), or
   one task told end to end (default for a development).
3. **Formats** — horizontal 1920x1080, vertical 1080x1920, square 1080x1080; default the first two.
4. **Tone** — the presets in one line each (`polished`: sober, few scenes; `app-store`: clean
   feature cards; `cinematic`: trailer; `default`: light; `deadpan`: dry; `yc-parody`, `chaotic`:
   humour), or a direction in their own words.
5. **Duration** — 20 to 40 seconds for a product tour, 15 to 25 otherwise; default automatic.
6. **Music and sound effects** — each yes or no; default yes.
7. **Voice-over** — yes or no; default no. A yes opens section 1-ter.
8. **Title** — the name on screen; default the product's.

Write the answers into the plan's header and do not ask them again.

## 1-ter - The voice-over, with ElevenLabs

Only when the user said yes to the voice. The voice is made with ElevenLabs, never with a stand-in
voice the user did not choose.

**Ask for what the voice needs**, in one message:

- **The API key — never in the chat.** Ask the user to set it themselves as the environment
  variable `ELEVENLABS_API_KEY` (user scope) and to restart the session if it was not set when it
  started. A key pasted into the chat is a key that leaked: if it happens, do not use it, do not
  repeat it, and tell them to revoke it and set a new one in the variable. It never goes into a
  file, the plan, the composition or a command line.
- **The voice** — a `voice_id` from their account. If they do not know it, list theirs with
  `GET https://api.elevenlabs.io/v1/voices` (header `xi-api-key` from the variable) and show
  name, gender, accent and description, never the key. A cloned voice of a real person needs that
  person's consent: ask, and do not proceed without a yes.
- **Model** — `eleven_v3` by default, the one that reads the expression tags below; another model
  only if they ask, and then without tags.
- **Language and accent** — default the user's language (`es` with a Spanish-from-Spain accent
  unless they say otherwise).
- **Delivery** — stability `0.5` (natural) by default, `0.0` more expressive, `1.0` steadier; and
  whether the voice is warm, energetic, institutional or close.

**Write the script with expression tags.** Under `## Voiceover script` in `videos/<slug>/video-plan.md`, one
line per scene, timed to the scene it sits on, complementing the picture instead of reading what
is on screen. For `eleven_v3`, mark the delivery with its audio tags in square brackets, placed
before the words they colour — for example `[excited]`, `[curious]`, `[calm]`, `[whispers]`,
`[sighs]`, `[laughs]`, `[pause]`, `[confident]` — and use punctuation for rhythm: an ellipsis for
a held breath, a dash for a cut, capitals sparingly for one stressed word. Few tags, chosen by the
tone: `polished` and `app-store` want one or two per script; never a tag on every line. Show the
script to the user and wait for an approval or corrections before spending a single call.

**Generate it** once the script is approved: `POST https://api.elevenlabs.io/v1/text-to-speech/<voice_id>/with-timestamps`
with `model_id`, `language_code`, `voice_settings` and the script, the key read from the variable
by the command itself. The response carries the audio and the character timings; save the audio
as `assets/voiceover.mp3` and the timings as `assets/voiceover-timings.json`. The voice sets the
pace: scene durations are adjusted to the timings, the music ducks under the voice, and the voice
never gets cut by a scene that ends early. A refusal from the API (quota, invalid voice, invalid
key) is reported with its message and the run waits: the video is not rendered without the voice
the user asked for.

## 2 - Check the tooling before promising anything

- `node` and `npx hyperframes --version`: the renderer. `npx hyperframes usage --json` reads its
  allowance; read it again before rendering. When it answers `unknown` or fails — no HyperFrames
  account signed in — say that the allowance is unknown and carry on: it is information, not a
  tool that is missing.
- `ffmpeg`: the poster frame is baked with it.
- **The `brag` plugin** — `/brag:brag` among your skills. Read its `SKILL.md` and its step 2, 3
  and 4 references, its tones and its audio reference before planning: they are this command's
  method. Its bundled music, sound effects and cue presets live under its `assets/`.
- **The HyperFrames skills**, whatever names the installed version gives them (they were renamed
  once mid-run; `npx hyperframes skills update` refreshes them). Use them for the composition
  contract, motion, keyframes and the CLI. ⛔ Do **not** follow the HyperFrames entry workflow's
  intent interview, storyline round or spec doctrine (its banned-defaults list forbids feature
  cards, which `app-store` is made of): `/brag` step 3 says the same, and following it is what
  produced the flat film of 2026-10-23.
- The browser tooling (Playwright), as `/flx-verify` uses it: the real screens are shot as the
  source of truth.

If any of these, other than the allowance, fails or is missing, **say so and stop**. Do not reach for another renderer, do
not invent a UI the product does not have, do not describe a video instead of making one.

## 3 - Inspect the product, the Flexygo way

`/brag`'s nine questions are answered from these sources, never from memory of what a Flexygo
application usually looks like:

| Question | Where the answer is |
|---|---|
| What is the product, for whom | `flexygo_get_project_status` and the context under `.flexygo/memory/`; the product's help, when it has one, says it in the user's words |
| What the development delivered | `flexygo_development_status`: its blocks, entities, processes and pages; the plan under `.flexygo/developments/<slug>/` says what was agreed |
| The words users read | the screens themselves — menu labels, buttons, notices as they read — and the help's guides when there are any. Copy that appears in the video appears **verbatim**, in the user's language |
| The look | `DESIGN.md` gives the **identity only**: palette, typeface, logo. Its layout rules (air, restraint, one accent per screen) are written for the product's screens, not for a promo film — the tone preset sets the film's energy. When its colours are `omitted`, read the product's own css under `{Product}.Frontend/wwwroot/{Product}/css/` and sample the skin on the shots; the product's logo is under `wwwroot/{Product}/images/` when there is one, and Flexygo's own (for a "made with" line) is `staticwebassets/img/logo.svg` in the `Flexygo.Frontend` package of the version the product uses |
| The product's imagery | the photos and images its data carries (product pictures, avatars, documents) under `wwwroot/{Product}/images/`. They are where the film's colour comes from: use them across the scenes, not only in the hook |
| What worked before | earlier runs under `{Product}.Marketing/videos/` that the user approved: their plan, frames and render. Start from what worked and say in the plan which run this one builds on |
| The real screens | **the running application, opened in the browser** (section 4). Verification captures under `.flexygo/developments/<slug>/screenshots/` and a help site's screenshots, when there are any, only save shots |
| The flow worth showing | the task the development exists for, as a user does it: entry -> key action -> result. A help guide, when there is one, already has it as numbered steps; otherwise walk it in the application and write the steps down as you go. A product scope picks the thing the product exists for |

⛔ **No captures, no help, no verification screenshots is never a reason to stop or to draw a
screen.** The product itself is the source: section 4 opens it and shoots everything the
storyboard needs.

Write the nine answers down before planning, as `/brag` does. The hook is decided first.

⛔ **Nothing secret, nothing real.** A video is posted. No connection string, hostname, real
customer, name, email or figure from a real table reaches the plan, the composition or the
render. The screens are shot on demo data; when a real row would show, substitute a stand-in
and say so in the plan. Seeding demo data is asked for, never done on your own.

## 4 - Open the product and shoot it

Existing captures save time when they are current and the right size; everything else is shot
now, from the application itself. Usually that is all of it: a product that never had a help
site has nothing to reuse, and that is the normal case, not a gap.

**Bring the application up.**

1. The address: `flexygo_get_project_status` gives the Frontend's folder; its
   `Properties/launchSettings.json` gives the URL (`applicationUrl`), and the Backend's gives its
   own. Ask the user only when neither file says.
2. If the Frontend answers there, check **whose** it is before using it: the process listening on
   that port, by its executable path (`Get-NetTCPConnection` + `Win32_Process`), not by name.
   Measured 2026-10-23: both ports of a product were held by a different Flexygo product of the
   same machine. If it is this product, it is the user's: say the video is shot on **their**
   running instance and its data. If it is another one, neither use it nor stop it: start this
   product on free ports (step 3) with environment overrides, no file edited —
   `Kestrel__Endpoints__Http__Url` on both halves, `FrontendEndpoint` on the Backend,
   `BackendEndpoint` (ending in `/api/backend/`) on the Frontend.
3. If it does not answer, offer to start it — Backend first, then Frontend, each with
   `dotnet run --project <folder> --launch-profile <the profile with that URL>` in the background,
   or its built executable with the project folder as working directory (it reads `conf/` from
   there) and `ASPNETCORE_ENVIRONMENT=Development` — and start it only on a yes. Wait until the URL answers. At the end, stop **only** the
   processes you started, by the id you got when starting them, never by name.
4. Before the first look, the two traps `/flx-verify` section 0 describes: `MailSettings.Configured`
   in the Backend's `conf/appsettings.Development.json` (a product nobody configured opens on the
   configurator instead of the login), and `flexygo_reload_cache` with an entity of the scope (the
   Backend never re-reads definitions on its own).

**Sign in and walk it.** Browser **visible**, never headless. The login is `#username`,
`#password` and `#MainButton` (a button, not a submit); after it the shell is `#mainNav` and the
page is `main.pageContainer[pagename]`. Ask for the password of the role each scene shows, at the
moment of typing it, once, and never repeat it back. Move through the product **the way a user
does — by its menu** — so the walk itself teaches the flow, and because a menu node often carries
the filter its page needs: measured 2026-10-23, a cart page opened by name without it showed
"empty" while its order held two lines. When a page has no menu entry,
`flexygo.nav.openPageName(pagename, objectname, objectwhere, null, 'current', false, $('body'))`
opens it. If the tables the flow needs are empty, ask whether to seed demo data before shooting:
an empty list films as nothing.

**Prefer rebuilding a state to writing it.** A scene may need a state no row is in (a cart holding
two products, an order one step further). A rebuilt screen (section 6) may combine real demo
values into that state — real products, at their real prices — without writing anything; it never
shows a label, a column or a feature the product does not have. Writing data only to film it is
asked first; when the user agrees, undo it afterwards and verify the undo with a read, not with
the screen.

**Shoot.** Each shot after the skin and the ajax (`jQuery.active === 0` twice, then about 800 ms),
in the state after the action — the notice still showing, the dialog open, the row just created.
The page scrolls inside `#mainContent`, so `fullPage` captures only the viewport. Look at every
shot before using it: the login page, the configurator, an unstyled first paint, a 500 and an
empty list have all passed for "the screen" before.

**Keep the words with the shot.** Beside each shot, save the visible text of its main modules
(their `innerText`) as `assets/screens/<scene>.txt`, and note the colours the rebuild needs
(sampled from the shot): rebuilding a screen needs its exact labels and figures, and reading them
back off a scaled bitmap is where typos come from.

**One subagent per scene group** when the walk is long: it gets the
pages, the role, the viewport and where to leave the shots, and returns the ordered steps it
performed in a user's words and the path of each shot — not a summary.

- **Landscape** reference: 1920x1080 shots (`browser_resize`), the desktop layout as it is.
- **Vertical** reference: the same pages at a phone viewport (about 412x915, device scale about
  2.6 so the shot is sharp) — it shows how the product itself stacks each screen on a phone, which
  is how the vertical rebuild stacks it. A 16:9 screen squeezed or letterboxed inside 9:16 is the
  result to avoid.

Shots land in `{Product}.Marketing/videos/<slug>/assets/screens/`, named by scene.

## 5 - Plan and storyboard

`{Product}.Marketing/` is the product's own folder for this; create it with its `videos/`
subfolder when the product was born before the template carried it. One run is one folder,
`videos/<yyyy-mm-dd>-<slug>/`, and the plan goes in it as `videos/<slug>/video-plan.md` with
`/brag`'s shape: what the product is, the angle, the hook, two or three key moments, the outro,
the flow worth showing, tone, duration, visual identity, share copy, audio direction, and the
storyboard.

Two things `/brag` does not need and this does:

- **Every scene is storyboarded for both formats.** The same beat, the same words, a different
  frame: what sits side by side in landscape stacks in vertical, type grows, a screen becomes a
  punch-in. Write the vertical framing under each scene, not as an afterthought at the end.
- **The shape decides the centerpiece.**
  - A **tour** (the default for the whole product): one built feature per scene — only what the
    developments actually delivered (`flexygo_development_status`), never the wish list of a
    spec. Each scene is a big title, a short line, the rebuilt screen doing that feature's job and
    the product's imagery around it. The breadth of the product *is* the tour; the hook is its
    best picture (the catalogue's photos, the dashboard's headline figure) and the end card names
    the product.
  - A **task** (the default for a development): that functionality in use, entry -> key action ->
    result, with one real value travelling through it; the product is named once.

`/brag`'s creative laws hold: its length (15-25 s, stretched to 40 for a whole-product tour);
readable (fast in, then hold: a label about 0.8 s settled, a sentence about 0.3 s per word);
specific to this product; **show the thing** (the product's real UI, rebuilt, doing its job);
no generic software language; the hook decides everything.

## 6 - Compose, once per format

Write `videos/<slug>/composition-brief.md` as `/brag`'s step 3 lays it out, then build one
HyperFrames project per format next to it — `landscape/` at 1920x1080, `vertical/` at
1080x1920, `square/` at 1080x1080 when asked — sharing one `assets/` folder for screens, images,
music and sfx. HyperFrames resolves `assets/...` from each project's own root, so each project
reaches the shared folder through a directory junction (`mklink /J`) or a copy. The HyperFrames
skills own the composition contract, the timing mechanics and the checks; `/brag` owns the craft
(tone, pacing, beat locks, audio-reactive treatment); this command owns the angle, the copy, the
screens and the delivery.

**Rebuild the screens; never make the film out of the shots.** Each scene's product moment is
recreated in HTML and CSS at video scale — `/brag`'s "recreate a working-app moment" — from its
shot and its text file:

- the labels **verbatim**, the figures as they read, the product's colours, typeface, icons and
  status pills; the product's photos as real images;
- only the piece the beat uses (the card, the dialog, the cart lines, the headline figure), at a
  size where every word reads: the 13-14 px of a desktop screen becomes 28 px or more;
- built so the UI can act inside the shot — the counter running to the real total, the card
  moving to the next column, the rows arriving one by one, the button pressed by the cursor —
  which a bitmap cannot do;
- vertical re-lays the same pieces out the way the product's phone layout stacks them, larger
  type, one piece at a time — not the landscape frame cropped.

A raw shot may still appear as a **proof beat** — the real screen held for a moment, or behind
the rebuilt piece — never as the medium of the whole film. A crop of a shot can never be animated
inside, so a film made of them reads as a slideshow: the 2026-10-23 run is the measurement.

Audio: when the `brag` plugin is installed, its sound effects are CC0 (Kenney) and may be used.
Its music tracks come from ende.app and the plugin's own README asks for their terms to be
verified before redistribution: use one only after telling the user, and write that caveat in the
plan and in the closing message. Otherwise `/media-use` resolves a track; otherwise the video is
silent and the plan says so. A track whose licence is unknown is never used — the video is posted
under the customer's name.

`npx hyperframes check` passes with zero errors in **each** format before anything renders.

## 7 - Deliver

Per format, in `videos/<slug>/`: the render at delivery quality (`landscape.mp4`, `vertical.mp4`),
the poster pulled from the strongest settled beat (`landscape.jpg`, `vertical.jpg`) and baked as
frame 0 with ffmpeg exactly as `/brag`'s step 4 does, and one `share-copy.txt` for all formats,
in the user's language. Open the Studio preview of one format before the delivery render and
tell the user where it is: they are the owner of what gets posted.

What the user approves stays where it is: the run's folder, render included, is the reference the
next run reads first (section 3, "What worked before"). Never clean it up as scratch: measured
2026-10-23, the films the user liked most were no longer on disk, and the run had nothing to
compare against.

Final shape:

```
{Product}.Marketing/
  README.md
  videos/
    2026-10-22-carrito-pedidos/
      video-plan.md
      composition-brief.md
      share-copy.txt
      landscape.mp4   landscape.jpg
      vertical.mp4    vertical.jpg
      assets/ (screens, music, sfx)
      landscape/      (HyperFrames project)
      vertical/       (HyperFrames project)
```

Nothing of this goes into `.flexygo/`: the tools write that folder, and a video is not a phase
artifact. The Marketing folder is its own record.

## 8 - Do not improve the product from here

A screen that does not film well is a finding, not a fix: say what had to be cut around and
leave the application alone. It goes to the next development, through `/flx-plan`.

## Closing

Say where the videos and the share copy are, in one sentence what the video does creatively,
and offer the usual re-rolls: another scene, another tone, another angle, one more format. Then
say what comes next: nothing is gated on this — `/flx-new-development` for the next commission.

And when a unit of work closes, look at whether the SESSION should close with it: the
seams that are worth offering `/clear` on, and the three lines plus the ready-to-paste
prompt that have to go with the offer, are in `.claude/CLAUDE.md`,
under "Leaving the session". You cannot measure your own context — the seam is what you can see.
