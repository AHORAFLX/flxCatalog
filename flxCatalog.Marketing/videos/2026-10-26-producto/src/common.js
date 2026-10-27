  const ID = "__ID__";
  const FMT = "__FMT__";
  const W = document.getElementById(ID + "-w");
  const $ = (s) => W.querySelector(s);
  const $$ = (s) => Array.from(W.querySelectorAll(s));
  // Offset of an element inside the scene, measured once before building tweens.
  // A scene is display:none until its slot: measure with its hidden ancestors shown for the instant of the read.
  const withLayout = (fn) => {
    const hid = [];
    for (let e = W; e && e !== document.documentElement; e = e.parentElement) {
      if (getComputedStyle(e).display === "none") { hid.push([e, e.style.getPropertyValue("display"), e.style.getPropertyPriority("display")]); e.style.setProperty("display", "block", "important"); }
    }
    try { return fn(); } finally { hid.reverse().forEach(([e, v, p]) => (v ? e.style.setProperty("display", v, p) : e.style.removeProperty("display"))); }
  };
  const off = (el) => { let x = 0, y = 0; while (el && el !== W) { x += el.offsetLeft; y += el.offsetTop; el = el.offsetParent; } return { x, y }; };
  const pt = (sel, fx = 0.5, fy = 0.5) => withLayout(() => { const el = typeof sel === "string" ? $(sel) : sel; const o = off(el); return { x: o.x + el.offsetWidth * fx, y: o.y + el.offsetHeight * fy }; });
  const tl = gsap.timeline({ paused: true });
  const pick = (L, V, S) => (FMT === "L" ? L : FMT === "V" ? V : S);
  // Scene entry: copy slides in from the left, the stage rises.
  const enter = (t = 0.05) => {
    tl.fromTo($(".copy"), { x: -70, opacity: 0 }, { x: 0, opacity: 1, duration: 0.42, ease: "expo.out" }, t);
    tl.fromTo($(".stage"), { y: 90, opacity: 0 }, { y: 0, opacity: 1, duration: 0.55, ease: "expo.out" }, t + 0.1);
  };
  const exit = (t) => {
    tl.to($(".copy"), { x: -50, opacity: 0, duration: 0.24, ease: "power3.in" }, t);
    tl.to($(".stage"), { y: -40, opacity: 0, duration: 0.26, ease: "power3.in" }, t);
    if ($(".cur")) tl.to($(".cur"), { opacity: 0, duration: 0.15 }, t);
  };
  // Cursor: travel to a target, then click it (the press lands on the click frame).
  const cur = () => $(".cur");
  const curFrom = (x, y, t = 0) => tl.fromTo(cur(), { x, y, scale: 1, opacity: 1 }, { x, y, duration: 0.01 }, t);
  const moveTo = (sel, t, d = 0.45, fx = 0.5, fy = 0.55) => { const p = pt(sel, fx, fy); tl.to(cur(), { x: p.x - 6, y: p.y - 4, duration: d, ease: "power2.inOut" }, t); };
  const click = (sel, t) => {
    tl.to(cur(), { scale: 0.84, duration: 0.06, ease: "power2.in", transformOrigin: "6px 4px" }, t);
    tl.to(cur(), { scale: 1, duration: 0.1, ease: "power2.out", transformOrigin: "6px 4px" }, t + 0.06);
    const pr = sel && $(sel + " .press");
    if (pr) { tl.fromTo(pr, { opacity: 0 }, { opacity: 1, duration: 0.05 }, t); tl.to(pr, { opacity: 0, duration: 0.18 }, t + 0.1); }
  };
  // Count a number into an element (es-ES formatting), measured by the timeline, not the clock.
  const nf = (dec) => new Intl.NumberFormat("es-ES", { minimumFractionDigits: dec, maximumFractionDigits: dec, useGrouping: "always" });
  const count = (sel, from, to, t, d, dec = 0, suffix = "") => {
    const el = typeof sel === "string" ? $(sel) : sel; const f = nf(dec); const o = { v: from };
    el.textContent = f.format(from) + suffix;
    tl.to(o, { v: to, duration: d, ease: "power2.out", onUpdate: () => { el.textContent = f.format(o.v) + suffix; } }, t);
  };
  // Items arriving one by one.
  const seq = (els, t, gap, from = { y: 40, opacity: 0 }, d = 0.45) => els.forEach((el, i) => tl.fromTo(el, from, { x: 0, y: 0, opacity: 1, scale: 1, duration: d, ease: "power3.out" }, t + i * gap));
