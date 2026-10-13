# Project context

## 2026-09-14

**Data model:** own — the project's own: tables are created with flexygo_execute_ddl against DataConnectionString.
**Offline app:** planned — foreseen, NOT built yet: its own development opens later, and today nothing of it exists.

flxCatalog es una aplicación pública de demostración construida íntegramente con Flexygo: un catálogo B2B/B2C que sirve como showcase completo de la plataforma (no solo un catálogo de productos). Cubre gestión de usuarios y roles (público, cliente, comercial, administrador), portal público y portal privado de clientes, backoffice administrativo, catálogo de productos con familias, variantes (talla/color), atributos dinámicos y multimedia, tarifas y precios personalizados por cliente, carrito y pedidos con workflow y timeline, presupuestos, devoluciones e incidencias, documentos (facturas, albaranes), notificaciones y emails automáticos, dashboards y gráficos, informes en PDF/Excel, automatizaciones (carrito abandonado, reposición de stock, aprobaciones), integraciones de ejemplo (API REST, webhooks, ERP/CRM), auditoría, multiidioma, responsive y personalización visual por cliente. Uso previsto: demostraciones comerciales, formaciones, eventos y pruebas de clientes potenciales; debe estar preparada con datos demo ricos y mecanismos de reset periódico al estar expuesta públicamente. Criterio de diseño: cada pantalla debe enseñar explícitamente alguna capacidad de Flexygo (listados en distintos formatos, formularios complejos, seguridad granular, procesos/workflows, documentos, visualización). La especificación funcional completa (101 secciones) está en docs/Catálogo Demo Flexygo - Funcionalidades.md, y trocheada por área funcional en docs/funcionalidades/ (ver README.md de esa carpeta) para consumir solo el bloque relevante en cada fase sin cargar el documento completo.

## 2026-09-15 · measured

Origin 1 (Product): 11 entity(ies), 11 collection(s), 29 module(s), 12 page(s).

Prefixes in use:
- `CAT_` — 6 entity(ies), tables drop the prefix.
- `VTA_` — 4 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `CAT_`: Color, Familia, Marca, Producto, Talla, Variante
- `VTA_`: EstadoPedido, LineaPedido, Pedido, Tarifa
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 3 different prefixes are in use (`CAT_`, `VTA_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-17 · measured

Origin 1 (Product): 11 entity(ies), 11 collection(s), 32 module(s), 12 page(s).

Prefixes in use:
- `CAT_` — 6 entity(ies), tables drop the prefix.
- `VTA_` — 4 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `CAT_`: Color, Familia, Marca, Producto, Talla, Variante
- `VTA_`: EstadoPedido, LineaPedido, Pedido, Tarifa
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 3 different prefixes are in use (`CAT_`, `VTA_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-17 · measured

Origin 1 (Product): 12 entity(ies), 12 collection(s), 45 module(s), 20 page(s).

Prefixes in use:
- `CAT_` — 6 entity(ies), tables drop the prefix.
- `VTA_` — 5 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `CAT_`: Color, Familia, Marca, Producto, Talla, Variante
- `VTA_`: EstadoPedido, LineaPedido, Pedido, PrecioTarifa, Tarifa
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 3 different prefixes are in use (`CAT_`, `VTA_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-21 · measured

Origin 1 (Product): 13 entity(ies), 13 collection(s), 50 module(s), 21 page(s).

Prefixes in use:
- `CAT_` — 7 entity(ies), tables drop the prefix.
- `VTA_` — 5 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `CAT_`: Color, Familia, Favorito, Marca, Producto, Talla, Variante
- `VTA_`: EstadoPedido, LineaPedido, Pedido, PrecioTarifa, Tarifa
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 3 different prefixes are in use (`CAT_`, `VTA_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-21 · measured

Origin 1 (Product): 18 entity(ies), 18 collection(s), 60 module(s), 26 page(s).

Prefixes in use:
- `VTA_` — 10 entity(ies), tables drop the prefix.
- `CAT_` — 7 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `VTA_`: Devolucion, EstadoDevolucion, EstadoIncidencia, EstadoPedido, Incidencia, LineaPedido, Pedido, PrecioTarifa, Tarifa, TipoIncidencia
- `CAT_`: Color, Familia, Favorito, Marca, Producto, Talla, Variante
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 3 different prefixes are in use (`VTA_`, `CAT_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-22 · measured

Origin 1 (Product): 23 entity(ies), 23 collection(s), 70 module(s), 31 page(s).

Prefixes in use:
- `VTA_` — 10 entity(ies), tables drop the prefix.
- `CAT_` — 7 entity(ies), tables drop the prefix.
- `COM_` — 5 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `VTA_`: Devolucion, EstadoDevolucion, EstadoIncidencia, EstadoPedido, Incidencia, LineaPedido, Pedido, PrecioTarifa, Tarifa, TipoIncidencia
- `CAT_`: Color, Familia, Favorito, Marca, Producto, Talla, Variante
- `COM_`: Comentario, EstadoSolicitud, SolicitudContacto, SolicitudDemo, TipoSolicitud
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 4 different prefixes are in use (`VTA_`, `CAT_`, `COM_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.

## 2026-09-30 · measured

Origin 1 (Product): 23 entity(ies), 23 collection(s), 71 module(s), 31 page(s).

Prefixes in use:
- `VTA_` — 10 entity(ies), tables drop the prefix.
- `CAT_` — 7 entity(ies), tables drop the prefix.
- `COM_` — 5 entity(ies), tables drop the prefix.
- `CLI_` — 1 entity(ies), tables drop the prefix.

Families already built:
- `VTA_`: Devolucion, EstadoDevolucion, EstadoIncidencia, EstadoPedido, Incidencia, LineaPedido, Pedido, PrecioTarifa, Tarifa, TipoIncidencia
- `CAT_`: Color, Familia, Favorito, Marca, Producto, Talla, Variante
- `COM_`: Comentario, EstadoSolicitud, SolicitudContacto, SolicitudDemo, TipoSolicitud
- `CLI_`: Cliente

Skin `flexy2022` — the palette the application already wears:
- `NavColor` #1c1b1d
- `txtNavColor` #ffffff
- `HeaderColor` #ffffff
- `bgColor` #FAFAFA
- `OutstandingColor` #333234
- `PrimaryColor` #000000
- `NotifyColor` #4361ee
This palette is installation-wide — one set of rows per skin, never one per origin — so changing it REPAINTS EVERY PAGE ALREADY BUILT, not only the new work.

⚠️ THE PROJECT'S OWN CONVENTIONS CONTRADICT EACH OTHER: 4 different prefixes are in use (`VTA_`, `CAT_`, `COM_`, `CLI_`). This project cannot say by itself how a new entity should be named. ASK THE USER which one to follow BEFORE proposing a model, and record the answer with flexygo_record_decision — choosing in silence is the failure this measurement exists to prevent.
