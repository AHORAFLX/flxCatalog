---
version: alpha
name: flxCatalog
description: Screens assembled from independent boxes, drawn in the shadcn / Radix / Vercel idiom.
colors:
  primary: '#000000'
  success: '#16a34a'
  warning: '#ca8a04'
  danger: '#dc2626'
  muted: '#71717a'
typography:
  page-title:
    fontFamily: Inter
    fontSize: 30px
    fontWeight: 700
  box-title:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: 600
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: 400
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: 400
  caption:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: 400
rounded:
  none: 0px
  sm: 8px
  md: 12px
  lg: 16px
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  margin: 32px
  gutter: 20px
  card-padding: 24px
  table-row-height: 56px
---

<!-- identity taken from: captures already archived in this project -->

## Overview

A modern product screen of the kind a good design tool would ship today: air where it belongs, few
things per screen, big confident type, one obvious action. Calm, precise, unhurried.

It is not an admin panel, not a back office, not a control room. Do not optimise for information
density, and do not reach for "high density", "functional minimalism" or "industrial robustness":
every one of them produces the same grey data grid. When a screen looks empty at the bottom, that
is correct: emptiness is the design working, not a slot left unfilled.

Drawn in the idiom of shadcn / Radix / Vercel.

## Colors

Colour means status, never decoration: success, warning, danger, muted, plus the accent for the one
action that matters on the screen. A screen with six colours has none.

A status pill is a soft tinted background with a small dot and a word, never a hard block of colour.
Dark mode is a token swap, not a second design.

## Typography

The scale is deliberately uneven: wide at the top where hierarchy is needed, short at the bottom
where density rules. Numbers are tabular. Weight does the work, never underlining.

## Layout

Space is the layout, outside the data. The page margin belongs to the page, never to a table or a
KPI strip, which take the width they are given. Air goes in the page margin, under the page title,
and between boxes; inside a table, a KPI strip or a chart it does not.

## Elevation & Depth

Hairline borders over drop shadows. A 1px border and a restrained radius separate two surfaces
better than a shadow, and survive dark mode. Contrast comes from flat background tiering, a cool
near-white page behind pure white cards, never from floating elevation.

No gradients as decoration, no glassmorphism, no coloured drop shadows, no full-bleed hero images.

## Shapes

Containers, cards and interactive elements use a restrained radius. Status pills are fully rounded.

## Components

- button-primary: one per screen, filled, always labelled with words. Icons are for the secondary
  row actions.
- button-secondary: ghost or outline, with fine-line icons in the same colour as the text beside them.
- status-pill: a soft tinted background with a small dot and a word.
- table: a filters row, a search box, a pager, and a per-row action menu. Dates shown relative.
- card: white surface, 1px hairline border, the card padding above.
- kpi-strip: the headline numbers in tabular figures, minimal chrome, and no page margin of its own.

## Do's and Don'ts

- Do write in sentence case everywhere, and let weight carry the hierarchy.
- Don't set anything in capitals: not a column header, not a KPI label, not a section title.
- Don't force lower case either: the first letter up, and every proper noun keeps its capital.

## Project identity

flxCatalog. This identity is the project's own and outranks every guideline above; every
future development on this same product keeps it.

- The accent is #000000.
- The palette: {"NavColor":"#1c1b1d","txtNavColor":"#ffffff","HeaderColor":"#ffffff","bgColor":"#FAFAFA","OutstandingColor":"#333234","PrimaryColor":"#000000","NotifyColor":"#4361ee"}
