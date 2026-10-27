// Emits the three HyperFrames projects (landscape/, vertical/, square/) from the scenes in src/scenes.
// Run: node src/build.mjs   (from the run folder)
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const SRC = path.dirname(fileURLToPath(import.meta.url));
const RUN = path.dirname(SRC);
const FORMATS = [
  { dir: "landscape", fmt: "L", w: 1920, h: 1080 },
  { dir: "vertical", fmt: "V", w: 1080, h: 1920 },
  { dir: "square", fmt: "S", w: 1080, h: 1080 },
];
const TOTAL = 30;
const SCENES = [
  ["hook", 0, 3],
  ["catalogo", 3, 3],
  ["tallas", 6, 3],
  ["carrito", 9, 3],
  ["seguimiento", 12, 3],
  ["resenas", 15, 3],
  ["postventa", 18, 3],
  ["mesa", 21, 3],
  ["kpis", 24, 3],
  ["cierre", 27, 3],
].filter(([n]) => fs.existsSync(path.join(SRC, "scenes", n + ".html")));
// [file, absolute start, volume] — each sound sits on the visible action that causes it.
const SFX = JSON.parse(fs.readFileSync(path.join(SRC, "sfx.json"), "utf8"));
const SFX_LEN = { "click_002": 0.01, "mouseclick1": 0.059, "drop_002": 0.191, "card-slide-2": 0.584, "card-place-1": 0.689, "chips-stack-2": 0.172, "rollover2": 0.057, "impactSoft_medium_001": 0.183, "impactBell_heavy_000": 1.48 };

const CSS = fs.readFileSync(path.join(SRC, "common.css"), "utf8");
const JS = fs.readFileSync(path.join(SRC, "common.js"), "utf8");
const CURSOR = (id) => `<div class="cur" id="${id}-cur" data-layout-ignore><svg viewBox="0 0 22 30" aria-hidden="true"><path d="M2 2 L2 24 L8 18.5 L12.5 28 L16.5 26.2 L12 17 L20 17 Z" fill="#1c1b1d" stroke="#ffffff" stroke-width="1.6" stroke-linejoin="round"/></svg></div>`;

// A catalogue card as the product draws it: photo, "family · brand", name, price, "Novedad", "Añadir al carrito".
const PRODUCTS = JSON.parse(fs.readFileSync(path.join(SRC, "products.json"), "utf8"));
const PCARD = (scene, k) => {
  const p = PRODUCTS[k];
  return `<div class="pc" id="${scene}-pc-${k}"><div class="pc-ph photo" style="background-image:url('assets/photos/${p.img}.jpg')"><div class="pc-star" id="${scene}-star-${k}"><span class="s0">&#9734;</span><span class="s1" id="${scene}-on-${k}">&#9733;</span></div></div><div class="pc-b"><div class="pc-f muted">${p.fam}</div><div class="pc-n">${p.name}</div><div class="pc-p tab">${p.price}${p.new ? ' <span class="pill new">Novedad</span>' : ""}</div><div class="btn teal pc-btn" id="${scene}-add-${k}">A&ntilde;adir al carrito<span class="press"></span></div></div></div>`;
};

function scene(name, f) {
  const raw = fs.readFileSync(path.join(SRC, "scenes", name + ".html"), "utf8");
  const style = (raw.match(/<style>([\s\S]*?)<\/style>/) || [, ""])[1];
  const script = (raw.match(/<script>([\s\S]*?)<\/script>/) || [, ""])[1];
  const markup = raw.replace(/<style>[\s\S]*?<\/style>/, "").replace(/<script>[\s\S]*?<\/script>/, "").trim();
  const sub = (s) => s.replaceAll("__ID__", name).replaceAll("__FMT__", f.fmt).replaceAll("__CURSOR__", CURSOR(name))
    .replace(/__CARDS:([\w,]+)__/g, (_, ids) => ids.split(",").map((k) => PCARD(name, k)).join("\n"));
  return `<template>
  <style>
${CSS}
${sub(style)}
  </style>
  <div id="root" data-composition-id="${name}" data-width="${f.w}" data-height="${f.h}">
    <div class="fmt fmt-${f.fmt}"><div class="w" id="${name}-w">
${sub(markup)}
    </div></div>
  </div>
  <script>
    document.fonts.ready.then(() => {
${sub(JS)}
${sub(script)}
      window.__timelines["${name}"] = tl;
    });
  </script>
</template>
`;
}

function index(f) {
  const hosts = SCENES.map(([n, s, d]) =>
    `      <div id="${n}" data-composition-id="${n}" data-composition-src="compositions/${n}.html" data-start="${s}" data-duration="${d}" data-track-index="1" data-track-kind="graphics" data-width="${f.w}" data-height="${f.h}"></div>`).join("\n");
  const sfx = SFX.map(([file, t, vol], i) =>
    `      <audio id="sfx-${i + 1}" class="clip" src="assets/sfx/${file}.ogg" data-start="${t}" data-duration="${SFX_LEN[file]}" data-volume="${vol}" data-track-index="${3 + (i % 3)}"></audio>`).join("\n");
  return `<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=${f.w}, height=${f.h}" />
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js"></script>
    <style>
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html, body { margin: 0; width: ${f.w}px; height: ${f.h}px; overflow: hidden; background: #eef1f4; }
      #root { position: relative; width: 100%; height: 100%; background: #eef1f4; font-family: Inter, sans-serif; }
    </style>
  </head>
  <body>
    <div id="root" data-composition-id="main" data-start="0" data-duration="${TOTAL}" data-width="${f.w}" data-height="${f.h}">
${hosts}
      <audio id="bed" class="clip" src="assets/music/bed.mp3" data-start="0" data-duration="${TOTAL}" data-media-start="15" data-volume="0.5" data-fade-in="0.15" data-fade-out="1.4" data-track-index="2"></audio>
${sfx}
    </div>
    <script>
      window.__timelines["main"] = gsap.timeline({ paused: true });
    </script>
  </body>
</html>
`;
}

for (const f of FORMATS) {
  const dir = path.join(RUN, f.dir);
  fs.mkdirSync(path.join(dir, "compositions"), { recursive: true });
  fs.writeFileSync(path.join(dir, "index.html"), index(f));
  for (const [n] of SCENES) fs.writeFileSync(path.join(dir, "compositions", n + ".html"), scene(n, f));
  const cfg = path.join(dir, "hyperframes.json");
  if (!fs.existsSync(cfg)) fs.writeFileSync(cfg, JSON.stringify({ $schema: "https://hyperframes.heygen.com/schema/hyperframes.json", registry: "https://raw.githubusercontent.com/heygen-com/hyperframes/main/registry", paths: { blocks: "compositions", components: "compositions/components", assets: "assets" }, media: { autoProxy: true }, authoringSkill: "hyperframes" }, null, 2));
  const meta = path.join(dir, "meta.json");
  if (!fs.existsSync(meta)) fs.writeFileSync(meta, JSON.stringify({ id: f.dir, name: `catalogo-flexygo-${f.dir}`, createdAt: "2026-10-26T09:00:00.000Z" }, null, 2));
  console.log("built", f.dir);
}
