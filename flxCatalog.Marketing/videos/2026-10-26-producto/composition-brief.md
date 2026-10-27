# Composition brief · Catálogo Flexygo · recorrido de funcionalidades

The spec the three HyperFrames projects (`landscape/`, `vertical/`, `square/`) are built from. Story and copy:
`video-plan.md`. The scenes are written once in `src/` and emitted per format by `src/build.mjs`, so the three films
stay the same beat for beat and differ only in frame.

```text
GOAL:    a buyer of a B2B ordering portal sees eight things Catálogo Flexygo already does, each one working, and
         leaves with the name.
OUTPUT:  1920x1080 (landscape/), 1080x1920 (vertical/), 1080x1080 (square/), 30 fps, 30.0 s = 900 frames.
TIME:    music 120 BPM, track entered at 15.0 s -> beats on ~x.0 / x.5 of the film, a bar every 2 s.
         Scene cuts every 3.0 s (on the bar's 2nd/4th beat alternately). Brand lands at 27.5 s.
LOOK:    ground #EEF1F4 (the app's page colour), flat. Cards #FFFFFF, radius 16 px (vertical 22), shadow
         0 18px 50px rgba(28,27,29,.10). Ink #1C1B1D, muted #71717A, hairline #E4E4E7.
         Accent #2DB7B0 (the product's buttons): buttons, scene numbers, the marked star, the lit step.
         Status pills: soft tint + dot + word, as the product draws them (success #16A34A, warn #CA8A04,
         danger #DC2626, info #4361EE, neutral #71717A). Bars #6366F1 as on the dashboard.
         Type Inter: scene title 800, 84 px L / 96 px V / 72 px S, tracking -2.5%; line 500, 34/40/30 px, muted;
         number 800 accent 30/34/26 px. UI text ≥ 26 px L, ≥ 30 px V/S.
OBJECTS: product photos (assets/photos, 17 real Pexels images of the catalogue); the rebuilt pieces listed per scene
         in the plan; a cursor (black arrow with white edge) — the one drawn object, not product UI; Flexygo logo.
MOTION:  scene entry: the copy block slides 60 px from the left + fades (0.4 s, expo.out); the UI piece rises 80 px +
         fades (0.5 s, expo.out) 0.1 s later. Sequences 0.12-0.2 s apart (power3.out). Cursor travels power2.inOut
         0.45 s; click = scale 1 -> 0.85 -> 1 in 0.16 s, the next state lands on the click frame. Counters tween
         a number with snap. Exit: whole scene fades/slides out in the last 0.25 s (power3.in) except where the
         next scene's entry covers it. Nothing moves after it settles except the scene's one action.
SHOTS:   see the plan's storyboard; QA frames at 1.6, 4.6, 7.8, 10.6, 13.9, 16.8, 19.8, 22.9, 25.9, 28.6.
BANNED:  dark void ground; glow, particles, glass; title over a dimmed screenshot; raw screenshot crops as the medium;
         invented labels, columns or features; generic SaaS phrasing; the licence watermark; real persons' data.
```

## Format differences

| Scene | Landscape | Vertical | Square |
|---|---|---|---|
| copy block | top-left, x 120, y 110, width 760 | top, y 170-560, centred left at x 80 | top, y 70-300 |
| UI stage | right/below: x 120-1800, y 330-1000 (or right half when side by side) | y 600-1760, x 70-1010 | y 320-1020, x 60-1020 |
| side-by-side pieces (photo + dialog, two lists) | side by side | stacked | stacked or overlapped |
