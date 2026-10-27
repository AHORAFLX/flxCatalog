# Composition brief · flxCatalog · un pedido, a dos lados

The spec both HyperFrames projects build from (`landscape/`, `vertical/`). The story and the copy are in
`video-plan.md`; this file turns them into numbers.

```text
GOAL:    a company that sells to other companies sees its own customer order from a photo catalogue, sees that
         order land on its own board, and leaves knowing it is one finished application.
OUTPUT:  HyperFrames, 1920x1080 (landscape/) and 1080x1920 (vertical/), 30 fps
TIME:    22.5 s x 30 = 675 frames. Music 120 BPM = 15 frames a beat, a bar every 60 frames.
         Track entered at 15.0 s so its beats land on 0.0, 0.5, 1.0 ... of the film; scene cuts on whole
         or half seconds; the mark lands on 20.0 s (a strong cue of the track at 35.02 s).
LOOK:    ground #EEF1F4 (the app's own page colour), flat, no texture. Ink #1C1B1D. Accent #2DB7B0 (the
         product's buttons and Flexygo's mark): only on the CARR card ring, the Entregado step, the end card.
         Display: Inter 700, 76 px landscape / 104 px vertical, tracking -2.5%. Labels: Inter 600, 34 px
         landscape / 44 px vertical, ink at 64%.
         Medium: the product's real screens, cut to the piece each shot uses, shown at 1.3-2x, corner radius
         18 px, 1 px hairline #DCE1E6, no drop shadow. The sidebar (#191D22) appears only inside a real screen.
OBJECTS: product cards with their Pexels photos; the "Elige color y talla" dialog; the "Mi carrito" card with
         two lines and Total pedido 139,70 €; the board's Borrador column with CARR-20261013180858 · 139,70 €;
         the "Seguimiento del pedido" bar; the "Indicadores clave" strip; Flexygo's logo.svg. A cursor (black
         arrow, white 3 px edge, 60 px tall landscape / 84 px vertical) is the one drawn object: it is not
         product UI.
MOTION:  arrivals expo.out 0.5 s; camera moves power2.inOut 0.6 s; exits power3.in 0.3 s (40% shorter);
         titles per word: blur 6 px -> 0 and opacity 0 -> 1 in 0.13 s, 0.067 s apart, no translate, then dead
         still. Cards of the hook: scale 0.92 -> 1 + blur 8 -> 0, 0.045 s apart along the diagonal. Cursor
         clicks: press scale 1 -> 0.86 -> 1 over 0.16 s; the click causes the next state on the same frame.
SHOTS:   1  0.0-3.0  hook: 12 catalogue cards settle; title "Tu catálogo. Sus pedidos." already legible at
                     frame 0 (thumbnail); camera pushes into card 1 at 2.4 s (zoom through).
         2  3.0-6.0  card 1 at 2x; cursor enters 3.3, clicks "Añadir al carrito" 3.9; the button morphs into
                     the dialog (0.25 s, power3.out); cursor clicks "Añadir" 5.2; whip right at 5.75.
         3  6.0-9.0  "Mi carrito": header card then the lines card arrive (0.12 s apart); Total pedido gets
                     an ink underline at 7.4; hold.
         4  9.0-13.0 split: the cart slides left to half width while the Borrador column arrives right
                     (carry across); CARR card gets the accent ring at 10.0 (pop); labels per side; 11.4 the
                     confirm dialog drops on the left half; cursor clicks "Sí" 12.2; at 12.6 the right half's
                     column header row (the five states) is what the eye follows into shot 5.
         5  13.0-16.0 "Seguimiento del pedido": the bar fills left to right, one step every 0.4 s, Entregado
                     in accent; title "Hasta su puerta".
         6  16.0-19.0 "Indicadores clave" strip at 1.15x, then the whole board pulls back underneath it at
                     17.5; title "Todo el negocio, de un vistazo".
         7  19.0-22.5 end card on the ground: "flxCatalog" per letter 0.05 s apart from 19.3; at 20.0 the mark
                     lands (bell); line "Catálogo, pedidos y postventa" 20.4; "Hecho con" + logo 20.8; hold
                     to 22.5.
BANNED:  dark void ground; glow, particles, gradients, glass; title over a dimmed screenshot; three cards in
         a row; logo docked in a corner; every scene entering the same way; titles that move after landing;
         drawn or invented UI; the licence watermark in frame; any real customer data (there is none: demo seed).
QA:      t=0.0 (thumbnail reads), 4.0 (dialog legible), 7.5 (139,70 € legible), 10.5 (CARR card + ring),
         12.2 (Sí click), 15.5 (Entregado lit), 17.0 (162.849,58 € legible), 21.5 (end card settled).
```

## Format differences

| Shot | Landscape | Vertical (text and product inside 168-1330 px) |
|---|---|---|
| 1 | title band left 0-700 px, cards right | title 200-430, phone catalogue cards 470-1320 |
| 2 | desktop card at 2x, dialog morphs out of the button | phone dialog full width (scale 1.3) |
| 3 | desktop cart, both cards | phone cart, cropped to header + lines |
| 4 | side by side | stacked: cart top half, Borrador column bottom half; the confirm dialog then fills the band |
| 5 | desktop stepper bar | phone stepper bar at 1.15x |
| 6 | KPI strip, then the board | phone KPI grid (2 x 3) |
| 7 | centred lockup | centred lockup, larger type |
