
## 2026-09-15 · Panel de control

**Measured against:** reference/panel-de-control.png + .html, comparado contra HOME en vivo (http://localhost:7111/Index) con los datos del seed pSeed_ResetDemoData tras iniciar sesión como admin.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Medido con getComputedStyle: sidebar aprobado #1c1b1d (aside bg), sidebar construido --nav-color resuelve a #191d22 (valor propio de la skin skin2026, no el NavColor que se configuró en flexy2022). Visualmente casi idéntico pero numéricamente distinto. | raised | platform |  |
| `typography` | different | Medido con getComputedStyle en el título de la gráfica 'Ventas por mes': aprobado Inter 14px/600/line-height 20px; construido Geist (pila de fuentes de la skin) 20px/600/line-height 26px. La skin no tiene variable de fuente. | raised | config | D-7 |
| `list-row` | same | Fila de 'Pedidos recientes' corregida en esta misma pasada: columnas Pedido/Cliente/Estado/Total/Fecha en el mismo orden que el original (antes traía Acciones y arrastraba el orden del listado completo de Pedidos), fila completa clicable. |  |  |  |
| `record-card` | notapplicable | El panel de control no tiene ficha de registro. |  |  |  |
| `badges` | different | Se corrigió un defecto real: 'Confirmado' y 'Enviado' pintaban el mismo color (ambos flx-state-tools). Ahora cada uno tiene clase propia (flx-state-confirmed #1d4ed8, flx-state-shipped #0369a1) y son distinguibles, pero los tonos exactos no igualan el azul/cian del original. | raised | config | D-7 |
| `spacing` | different | Medido: tarjeta KPI aprobada padding 24px; tarjeta KPI construida (.flx-easyinfo) padding 6px — más denso que el original. | raised | config | D-7 |
| `iconography` | same | Cada módulo lleva un icono propio del catálogo de Flexygo (euro, carpeta, carrito) en vez de los Material Symbols del original — es el lenguaje de iconos de la plataforma, coherente con D1 (usar los estándares de Flexygo). |  |  |  |
| `composition` | different | El original tiene un H1 suelto (sin caja) y 4 tarjetas KPI sueltas. Lo construido envuelve el título en un módulo 'Cabecera del panel de control' y las 4 KPI en un módulo 'Indicadores del panel de control' — cajas envolventes que el original no tiene. | raised | config | D-7 |
| `density` | different | Consecuencia directa de spacing + module-chrome: menos contenido visible por alto de pantalla que el original. | raised | config | D-7 |
| `nav-and-branding` | same | Los 6 enlaces, el orden, el bloque de marca 'flxCatalog / Catálogo B2B/B2C demo' y el bloque de usuario abajo están todos presentes y en el mismo sitio que el original. El matiz de color de fondo ya se cuenta en la fila palette. |  |  |  |
| `module-chrome` | different | El original no tiene cabecera de caja ni iconos de herramientas en ninguna tarjeta. Lo construido usa la cabecera estándar de Flexygo (icono + título + refrescar/configurar/menú) en cada módulo. | raised | config | D-7 |
| `toolbar-and-actions` | different | El widget 'Pedidos recientes' del original no tiene ningún botón (es solo de consulta); lo construido conserva el botón '+ Nuevo' del listado estándar. No se pudo quitar en esta pasada por un fallo del parámetro toolbarName vacío en la herramienta; queda abierto. | raised | config | D-7 |

**What the screen does not show** (K-51)

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a value whose rule is not on screen, a state the original can be in, a navigation with no destination built — were looked for on this screen and none was found. It does NOT mean 'one was found and could not be settled': that is `needs-user`, it has been a value since K-69, and it would be in the table above this line instead of missing from it.

**Does not meet it yet:** palette (different): Medido con getComputedStyle: sidebar aprobado #1c1b1d (aside bg), sidebar construido --nav-color resuelve a #191d22 (valor propio de la skin skin2026, no el NavColor que se configuró en flexy2022). Visualmente casi idéntico pero numéricamente distinto.; typography (different): Medido con getComputedStyle en el título de la gráfica 'Ventas por mes': aprobado Inter 14px/600/line-height 20px; construido Geist (pila de fuentes de la skin) 20px/600/line-height 26px. La skin no tiene variable de fuente.; badges (different): Se corrigió un defecto real: 'Confirmado' y 'Enviado' pintaban el mismo color (ambos flx-state-tools). Ahora cada uno tiene clase propia (flx-state-confirmed #1d4ed8, flx-state-shipped #0369a1) y son distinguibles, pero los tonos exactos no igualan el azul/cian del original.; spacing (different): Medido: tarjeta KPI aprobada padding 24px; tarjeta KPI construida (.flx-easyinfo) padding 6px — más denso que el original.; composition (different): El original tiene un H1 suelto (sin caja) y 4 tarjetas KPI sueltas. Lo construido envuelve el título en un módulo 'Cabecera del panel de control' y las 4 KPI en un módulo 'Indicadores del panel de control' — cajas envolventes que el original no tiene.; density (different): Consecuencia directa de spacing + module-chrome: menos contenido visible por alto de pantalla que el original.; module-chrome (different): El original no tiene cabecera de caja ni iconos de herramientas en ninguna tarjeta. Lo construido usa la cabecera estándar de Flexygo (icono + título + refrescar/configurar/menú) en cada módulo.; toolbar-and-actions (different): El widget 'Pedidos recientes' del original no tiene ningún botón (es solo de consulta); lo construido conserva el botón '+ Nuevo' del listado estándar. No se pudo quitar en esta pasada por un fallo del parámetro toolbarName vacío en la herramienta; queda abierto.

⛔ **NOT CLOSED — 3 row(s) are not final:** list-row (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; iconography (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; nav-and-branding (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not. Reaching a target is not closing: close the row by the mechanism its "Where it is fixed" column names, or declare `fix: raised` with its `cause`.

**Seen and not closed:** list-row: Fila de 'Pedidos recientes' corregida en esta misma pasada: columnas Pedido/Cliente/Estado/Total/Fecha en el mismo orden que el original (antes traía Acciones y arrastraba el orden del listado completo de Pedidos), fila completa clicable.; iconography: Cada módulo lleva un icono propio del catálogo de Flexygo (euro, carpeta, carrito) en vez de los Material Symbols del original — es el lenguaje de iconos de la plataforma, coherente con D1 (usar los estándares de Flexygo).; nav-and-branding: Los 6 enlaces, el orden, el bloque de marca 'flxCatalog / Catálogo B2B/B2C demo' y el bloque de usuario abajo están todos presentes y en el mismo sitio que el original. El matiz de color de fondo ya se cuenta en la fila palette.. Reaching a row's target is not a closure — close it (§5-bis names the tools) or raise it with its class of cause.

## 2026-09-15 · Panel de control

**Amendment** of the pass of 2026-09-15 · row `list-row`: fix
**Reason:** La nota describe una corrección ya aplicada en esta misma pasada (orden de columnas y colores de badge del widget de pedidos recientes), mecanismo: plantilla propia (flx-vta-pedido-recent-list). Faltaba declarar fix. (drafted by the agent, chosen by the user)
**Measured against:** reference/panel-de-control.png + .html, comparado contra HOME en vivo (http://localhost:7111/Index) con los datos del seed pSeed_ResetDemoData tras iniciar sesión como admin.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Medido con getComputedStyle: sidebar aprobado #1c1b1d (aside bg), sidebar construido --nav-color resuelve a #191d22 (valor propio de la skin skin2026, no el NavColor que se configuró en flexy2022). Visualmente casi idéntico pero numéricamente distinto. | raised | platform |  |
| `typography` | different | Medido con getComputedStyle en el título de la gráfica 'Ventas por mes': aprobado Inter 14px/600/line-height 20px; construido Geist (pila de fuentes de la skin) 20px/600/line-height 26px. La skin no tiene variable de fuente. | raised | config | D-7 |
| `list-row` | same | Fila de 'Pedidos recientes' corregida en esta misma pasada: columnas Pedido/Cliente/Estado/Total/Fecha en el mismo orden que el original (antes traía Acciones y arrastraba el orden del listado completo de Pedidos), fila completa clicable. | done |  |  |
| `record-card` | notapplicable | El panel de control no tiene ficha de registro. |  |  |  |
| `badges` | different | Se corrigió un defecto real: 'Confirmado' y 'Enviado' pintaban el mismo color (ambos flx-state-tools). Ahora cada uno tiene clase propia (flx-state-confirmed #1d4ed8, flx-state-shipped #0369a1) y son distinguibles, pero los tonos exactos no igualan el azul/cian del original. | raised | config | D-7 |
| `spacing` | different | Medido: tarjeta KPI aprobada padding 24px; tarjeta KPI construida (.flx-easyinfo) padding 6px — más denso que el original. | raised | config | D-7 |
| `iconography` | same | Cada módulo lleva un icono propio del catálogo de Flexygo (euro, carpeta, carrito) en vez de los Material Symbols del original — es el lenguaje de iconos de la plataforma, coherente con D1 (usar los estándares de Flexygo). |  |  |  |
| `composition` | different | El original tiene un H1 suelto (sin caja) y 4 tarjetas KPI sueltas. Lo construido envuelve el título en un módulo 'Cabecera del panel de control' y las 4 KPI en un módulo 'Indicadores del panel de control' — cajas envolventes que el original no tiene. | raised | config | D-7 |
| `density` | different | Consecuencia directa de spacing + module-chrome: menos contenido visible por alto de pantalla que el original. | raised | config | D-7 |
| `nav-and-branding` | same | Los 6 enlaces, el orden, el bloque de marca 'flxCatalog / Catálogo B2B/B2C demo' y el bloque de usuario abajo están todos presentes y en el mismo sitio que el original. El matiz de color de fondo ya se cuenta en la fila palette. |  |  |  |
| `module-chrome` | different | El original no tiene cabecera de caja ni iconos de herramientas en ninguna tarjeta. Lo construido usa la cabecera estándar de Flexygo (icono + título + refrescar/configurar/menú) en cada módulo. | raised | config | D-7 |
| `toolbar-and-actions` | different | El widget 'Pedidos recientes' del original no tiene ningún botón (es solo de consulta); lo construido conserva el botón '+ Nuevo' del listado estándar. No se pudo quitar en esta pasada por un fallo del parámetro toolbarName vacío en la herramienta; queda abierto. | raised | config | D-7 |

## 2026-09-15 · Panel de control

**Amendment** of the pass of 2026-09-15 · row `iconography`: fix
**Reason:** La nota es aclaratoria (por qué se considera igual pese a no usar Material Symbols), no una diferencia pendiente de cerrar. Nada que arreglar. (drafted by the agent, chosen by the user)
**Measured against:** reference/panel-de-control.png + .html, comparado contra HOME en vivo (http://localhost:7111/Index) con los datos del seed pSeed_ResetDemoData tras iniciar sesión como admin.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Medido con getComputedStyle: sidebar aprobado #1c1b1d (aside bg), sidebar construido --nav-color resuelve a #191d22 (valor propio de la skin skin2026, no el NavColor que se configuró en flexy2022). Visualmente casi idéntico pero numéricamente distinto. | raised | platform |  |
| `typography` | different | Medido con getComputedStyle en el título de la gráfica 'Ventas por mes': aprobado Inter 14px/600/line-height 20px; construido Geist (pila de fuentes de la skin) 20px/600/line-height 26px. La skin no tiene variable de fuente. | raised | config | D-7 |
| `list-row` | same | Fila de 'Pedidos recientes' corregida en esta misma pasada: columnas Pedido/Cliente/Estado/Total/Fecha en el mismo orden que el original (antes traía Acciones y arrastraba el orden del listado completo de Pedidos), fila completa clicable. | done |  |  |
| `record-card` | notapplicable | El panel de control no tiene ficha de registro. |  |  |  |
| `badges` | different | Se corrigió un defecto real: 'Confirmado' y 'Enviado' pintaban el mismo color (ambos flx-state-tools). Ahora cada uno tiene clase propia (flx-state-confirmed #1d4ed8, flx-state-shipped #0369a1) y son distinguibles, pero los tonos exactos no igualan el azul/cian del original. | raised | config | D-7 |
| `spacing` | different | Medido: tarjeta KPI aprobada padding 24px; tarjeta KPI construida (.flx-easyinfo) padding 6px — más denso que el original. | raised | config | D-7 |
| `iconography` | same | Cada módulo lleva un icono propio del catálogo de Flexygo (euro, carpeta, carrito) en vez de los Material Symbols del original — es el lenguaje de iconos de la plataforma, coherente con D1 (usar los estándares de Flexygo). | none |  |  |
| `composition` | different | El original tiene un H1 suelto (sin caja) y 4 tarjetas KPI sueltas. Lo construido envuelve el título en un módulo 'Cabecera del panel de control' y las 4 KPI en un módulo 'Indicadores del panel de control' — cajas envolventes que el original no tiene. | raised | config | D-7 |
| `density` | different | Consecuencia directa de spacing + module-chrome: menos contenido visible por alto de pantalla que el original. | raised | config | D-7 |
| `nav-and-branding` | same | Los 6 enlaces, el orden, el bloque de marca 'flxCatalog / Catálogo B2B/B2C demo' y el bloque de usuario abajo están todos presentes y en el mismo sitio que el original. El matiz de color de fondo ya se cuenta en la fila palette. |  |  |  |
| `module-chrome` | different | El original no tiene cabecera de caja ni iconos de herramientas en ninguna tarjeta. Lo construido usa la cabecera estándar de Flexygo (icono + título + refrescar/configurar/menú) en cada módulo. | raised | config | D-7 |
| `toolbar-and-actions` | different | El widget 'Pedidos recientes' del original no tiene ningún botón (es solo de consulta); lo construido conserva el botón '+ Nuevo' del listado estándar. No se pudo quitar en esta pasada por un fallo del parámetro toolbarName vacío en la herramienta; queda abierto. | raised | config | D-7 |

## 2026-09-15 · Panel de control

**Amendment** of the pass of 2026-09-15 · row `nav-and-branding`: fix
**Reason:** La nota es aclaratoria (remite el matiz de color a la fila palette), no una diferencia pendiente de cerrar aquí. Nada que arreglar. (drafted by the agent, chosen by the user)
**Measured against:** reference/panel-de-control.png + .html, comparado contra HOME en vivo (http://localhost:7111/Index) con los datos del seed pSeed_ResetDemoData tras iniciar sesión como admin.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Medido con getComputedStyle: sidebar aprobado #1c1b1d (aside bg), sidebar construido --nav-color resuelve a #191d22 (valor propio de la skin skin2026, no el NavColor que se configuró en flexy2022). Visualmente casi idéntico pero numéricamente distinto. | raised | platform |  |
| `typography` | different | Medido con getComputedStyle en el título de la gráfica 'Ventas por mes': aprobado Inter 14px/600/line-height 20px; construido Geist (pila de fuentes de la skin) 20px/600/line-height 26px. La skin no tiene variable de fuente. | raised | config | D-7 |
| `list-row` | same | Fila de 'Pedidos recientes' corregida en esta misma pasada: columnas Pedido/Cliente/Estado/Total/Fecha en el mismo orden que el original (antes traía Acciones y arrastraba el orden del listado completo de Pedidos), fila completa clicable. | done |  |  |
| `record-card` | notapplicable | El panel de control no tiene ficha de registro. |  |  |  |
| `badges` | different | Se corrigió un defecto real: 'Confirmado' y 'Enviado' pintaban el mismo color (ambos flx-state-tools). Ahora cada uno tiene clase propia (flx-state-confirmed #1d4ed8, flx-state-shipped #0369a1) y son distinguibles, pero los tonos exactos no igualan el azul/cian del original. | raised | config | D-7 |
| `spacing` | different | Medido: tarjeta KPI aprobada padding 24px; tarjeta KPI construida (.flx-easyinfo) padding 6px — más denso que el original. | raised | config | D-7 |
| `iconography` | same | Cada módulo lleva un icono propio del catálogo de Flexygo (euro, carpeta, carrito) en vez de los Material Symbols del original — es el lenguaje de iconos de la plataforma, coherente con D1 (usar los estándares de Flexygo). | none |  |  |
| `composition` | different | El original tiene un H1 suelto (sin caja) y 4 tarjetas KPI sueltas. Lo construido envuelve el título en un módulo 'Cabecera del panel de control' y las 4 KPI en un módulo 'Indicadores del panel de control' — cajas envolventes que el original no tiene. | raised | config | D-7 |
| `density` | different | Consecuencia directa de spacing + module-chrome: menos contenido visible por alto de pantalla que el original. | raised | config | D-7 |
| `nav-and-branding` | same | Los 6 enlaces, el orden, el bloque de marca 'flxCatalog / Catálogo B2B/B2C demo' y el bloque de usuario abajo están todos presentes y en el mismo sitio que el original. El matiz de color de fondo ya se cuenta en la fila palette. | none |  |  |
| `module-chrome` | different | El original no tiene cabecera de caja ni iconos de herramientas en ninguna tarjeta. Lo construido usa la cabecera estándar de Flexygo (icono + título + refrescar/configurar/menú) en cada módulo. | raised | config | D-7 |
| `toolbar-and-actions` | different | El widget 'Pedidos recientes' del original no tiene ningún botón (es solo de consulta); lo construido conserva el botón '+ Nuevo' del listado estándar. No se pudo quitar en esta pasada por un fallo del parámetro toolbarName vacío en la herramienta; queda abierto. | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. |  |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. |  |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). |  |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. |  |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. |  |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

**What the screen does not show** (K-51)

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a value whose rule is not on screen, a state the original can be in, a navigation with no destination built — were looked for on this screen and none was found. It does NOT mean 'one was found and could not be settled': that is `needs-user`, it has been a value since K-69, and it would be in the table above this line instead of missing from it.

**Does not meet it yet:** palette (different): Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022).; typography (different): Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido).; badges (different): El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo.; module-chrome (different): Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control.; toolbar-and-actions (different): Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54).

⛔ **NOT CLOSED — 6 row(s) are not final:** list-row (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; spacing (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; iconography (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; composition (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; density (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not; nav-and-branding (same): answered `same` and carries a note that nothing was done with — say what became of what you saw: `fix: done` if the mechanism closed it, `raised` with its `cause` if it did not. Reaching a target is not closing: close the row by the mechanism its "Where it is fixed" column names, or declare `fix: raised` with its `cause`.

**Seen and not closed:** list-row: Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original.; spacing: Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla.; iconography: Icono de caja en la cabecera, coherente con el resto (D1).; composition: Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original.; density: Altura de fila y proporción de espacio en blanco comparables al original.; nav-and-branding: Misma barra lateral que en Panel de control, ya evaluada allí.. Reaching a row's target is not a closure — close it (§5-bis names the tools) or raise it with its class of cause.

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `list-row`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. |  |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). |  |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. |  |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. |  |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `spacing`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). |  |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. |  |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. |  |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `iconography`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. |  |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. |  |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `composition`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. | none |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. |  |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `density`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. | none |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. |  |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Listado de productos

**Amendment** of the pass of 2026-09-15 · row `nav-and-branding`: fix
**Reason:** Nota aclaratoria de por qué coincide, no una diferencia pendiente. (drafted by the agent, chosen by the user)
**Measured against:** reference/listado-de-productos.png vs CAT_Producto_List en vivo (http://localhost:7111), 8 productos del seed pSeed_ResetDemoData.

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco ya registrado en Panel de control: sidebar aprobado #1c1b1d, construido resuelve a #191d22 (skin2026, no flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que en Panel de control: Inter (aprobado) vs la pila de la skin (construido). | raised | config | D-7 |
| `list-row` | same | Mismas 8 columnas (Referencia/Nombre/Familia/Marca/Precio/Stock/Estado/Acciones), fila completa clicable, badges con punto de color como el original. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | El tono de 'Novedad' no coincide (aprobado morado/rosa, construido azul); Activo y Sin stock sí coinciden en verde/rojo. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes de la tarjeta muy cercanos al original en esta pantalla. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | same | Título + barra de herramientas + tabla + paginador, mismo esqueleto que el original. | none |  |  |
| `density` | same | Altura de fila y proporción de espacio en blanco comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en Panel de control, ya evaluada allí. | none |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo (icono + título + 3 iconos de herramientas) donde el original no tiene caja. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo producto'; paginador con formato 'Página X de Y · Total: Z' en vez de 'Mostrando X de Y' con Anterior/1/2/3/Siguiente. El filtro inline del original no se compara (vive tras el icono de embudo, según flexygo_get_custom_screens_reference §54). | raised | config | D-7 |

## 2026-09-15 · Ficha de producto

**Measured against:** reference/ficha-de-producto.png vs CAT_Producto_View en vivo, registro REF-1001 'Camiseta Urban' del seed (mismo registro que muestra la referencia).

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original. | none |  |  |
| `record-card` | different | El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene (va directo a la cabecera de la ficha). | raised | config | D-7 |
| `badges` | same | Estado 'Activo' con punto verde, igual que el original. | none |  |  |
| `spacing` | same | Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | different | El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0) — es lo máximo que da el componente estándar. Ver behaviours. | raised | scope | D-8 |
| `density` | same | Altura y espaciado de las secciones (Detalles/Variantes) comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Corregido en esta misma pasada: Duplicar y Archivar ahora son procesos reales (antes no hacían nada). El original solo muestra 3 botones (Editar/Duplicar/Archivar); lo construido conserva además la barra estándar completa de Flexygo (Nuevo/Eliminar/Plantillas/...), aceptado por D-7. | done |  |  |

**What the screen does not show** (K-51)

| What | Kind | Resolution |
|---|---|---|
| Panel de Imágenes: el original muestra una galería real (miniaturas + subir); el componente estándar de Flexygo solo cuenta (0 Imágenes/0 Documentos), no puede mostrar miniaturas. Resuelto: D-8, se deja pendiente para una fase posterior. | state | asked-explained |

**Does not meet it yet:** palette (different): Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022).; typography (different): Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas.; record-card (different): El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene (va directo a la cabecera de la ficha).; composition (different): El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0) — es lo máximo que da el componente estándar. Ver behaviours.; module-chrome (different): Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original. Mismo patrón que Panel de control.; toolbar-and-actions (different): Corregido en esta misma pasada: Duplicar y Archivar ahora son procesos reales (antes no hacían nada). El original solo muestra 3 botones (Editar/Duplicar/Archivar); lo construido conserva además la barra estándar completa de Flexygo (Nuevo/Eliminar/Plantillas/...), aceptado por D-7.

⛔ **NOT CLOSED — 1 row(s) are not final:** toolbar-and-actions (different): declared `fix: done` while the row still differs — if the mechanism closed it the verdict is `same`, and if it did not, it is `raised` with its `cause`. Reaching a target is not closing: close the row by the mechanism its "Where it is fixed" column names, or declare `fix: raised` with its `cause`.

**Declared as nothing-to-close (fix: none):** list-row: Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original.; badges: Estado 'Activo' con punto verde, igual que el original.; spacing: Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original.; iconography: Icono de caja en la cabecera, coherente con el resto (D1).; density: Altura y espaciado de las secciones (Detalles/Variantes) comparables al original.; nav-and-branding: Misma barra lateral que en el resto de pantallas.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-09-15 · Ficha de producto

**Amendment** of the pass of 2026-09-15 · row `toolbar-and-actions`: fix, cause
**Reason:** La acción en sí (Duplicar/Archivar reales) ya está cerrada — eso funcionaba mal y ahora funciona. Lo que queda visualmente distinto es tener más botones que el original (barra estándar completa), y eso cae bajo la misma decisión D-7 que module-chrome, no un 'done' nuevo. (drafted by the agent, chosen by the user)
**Measured against:** reference/ficha-de-producto.png vs CAT_Producto_View en vivo, registro REF-1001 'Camiseta Urban' del seed (mismo registro que muestra la referencia).

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original. | none |  |  |
| `record-card` | different | El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene (va directo a la cabecera de la ficha). | raised | config | D-7 |
| `badges` | same | Estado 'Activo' con punto verde, igual que el original. | none |  |  |
| `spacing` | same | Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | different | El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0) — es lo máximo que da el componente estándar. Ver behaviours. | raised | scope | D-8 |
| `density` | same | Altura y espaciado de las secciones (Detalles/Variantes) comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Corregido en esta misma pasada: Duplicar y Archivar ahora son procesos reales (antes no hacían nada). El original solo muestra 3 botones (Editar/Duplicar/Archivar); lo construido conserva además la barra estándar completa de Flexygo (Nuevo/Eliminar/Plantillas/...), aceptado por D-7. | raised | config |  |

## 2026-09-15 · Ficha de producto

**Amendment** of the pass of 2026-09-15 · row `toolbar-and-actions`: note, fix, cause
**Reason:** Añadiendo D-7 al texto de la nota ya que el campo decision no está expuesto en esta herramienta de enmienda; el resto de filas con cause=config de esta misma pantalla sí llevan D-7 en su columna Decision desde el registro inicial. (drafted by the agent, chosen by the user)
**Measured against:** reference/ficha-de-producto.png vs CAT_Producto_View en vivo, registro REF-1001 'Camiseta Urban' del seed (mismo registro que muestra la referencia).

**Deviations:** not re-measured — this is an amendment; the pass of 2026-09-15 recorded no count.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original. | none |  |  |
| `record-card` | different | El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene (va directo a la cabecera de la ficha). | raised | config | D-7 |
| `badges` | same | Estado 'Activo' con punto verde, igual que el original. | none |  |  |
| `spacing` | same | Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | different | El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0) — es lo máximo que da el componente estándar. Ver behaviours. | raised | scope | D-8 |
| `density` | same | Altura y espaciado de las secciones (Detalles/Variantes) comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original. Mismo patrón que Panel de control. | raised | config | D-7 |
| `toolbar-and-actions` | different | Corregido en esta pasada: Duplicar y Archivar ahora son procesos reales. El original solo muestra 3 botones (Editar/Duplicar/Archivar); lo construido conserva además la barra estándar completa de Flexygo (Nuevo/Eliminar/Plantillas/...), aceptado por D-7 (mismo patrón que module-chrome). | raised | config |  |

## 2026-09-15 · Ficha de producto

**Measured against:** reference/ficha-de-producto.png vs CAT_Producto_View en vivo, registro REF-1001 'Camiseta Urban' del seed (mismo registro que muestra la referencia). Segunda pasada: corrige la fila toolbar-and-actions, que se había quedado sin decisión asociada tras una enmienda.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original. | none |  |  |
| `record-card` | different | El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene. | raised | config | D-7 |
| `badges` | same | Estado 'Activo' con punto verde, igual que el original. | none |  |  |
| `spacing` | same | Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original. | none |  |  |
| `iconography` | same | Icono de caja en la cabecera, coherente con el resto (D1). | none |  |  |
| `composition` | different | El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0). Ver behaviours. | raised | scope | D-8 |
| `density` | same | Altura y espaciado de las secciones comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original. | raised | config | D-7 |
| `toolbar-and-actions` | different | Duplicar y Archivar ya son procesos reales (corregido en esta pasada). El original solo muestra 3 botones; lo construido conserva además la barra estándar completa de Flexygo, aceptado por D-7. | raised | config | D-7 |

**What the screen does not show** (K-51)

| What | Kind | Resolution |
|---|---|---|
| Panel de Imágenes: el original muestra una galería real (miniaturas + subir); el componente estándar de Flexygo solo cuenta (0 Imágenes/0 Documentos), no puede mostrar miniaturas. Resuelto: D-8, se deja pendiente para una fase posterior. | state | asked-explained |

**Does not meet it yet:** palette (different): Mismo hueco de paleta que en las pantallas anteriores (skin2026 vs flexy2022).; typography (different): Misma familia tipográfica de la skin (Geist) en vez de Inter, igual que en el resto de pantallas.; record-card (different): El original tiene un enlace 'Volver a productos' encima de la ficha; lo construido no lo tiene.; composition (different): El panel de Imágenes del original es una galería real con miniaturas; lo construido es un contador (0/0). Ver behaviours.; module-chrome (different): Cabecera de módulo estándar de Flexygo en vez de las cajas sin cromar del original.; toolbar-and-actions (different): Duplicar y Archivar ya son procesos reales (corregido en esta pasada). El original solo muestra 3 botones; lo construido conserva además la barra estándar completa de Flexygo, aceptado por D-7.

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** list-row: Listado embebido de Variantes con las mismas columnas (Talla/Color/Referencia/Stock) que el original.; badges: Estado 'Activo' con punto verde, igual que el original.; spacing: Distribución de los campos de Detalles (2 columnas, mismo agrupado) muy cercana al original.; iconography: Icono de caja en la cabecera, coherente con el resto (D1).; density: Altura y espaciado de las secciones comparables al original.; nav-and-branding: Misma barra lateral que en el resto de pantallas.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-09-15 · Listado de clientes

**Measured against:** reference/listado-de-clientes.png vs CLI_Cliente_List en vivo, 6 clientes del seed.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta ya registrado (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Mismas 7 columnas (Código/Razón social/CIF/Tarifa/Comercial/Estado/Acciones) en el mismo orden, fila clicable. | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | Tarifa se pinta como texto plano; el original la muestra como una píldora gris. Estado (Activo/Bloqueado) sí coincide en verde/rojo con punto. | raised | config | D-7 |
| `spacing` | same | Padding de fila y márgenes cercanos al original. | none |  |  |
| `iconography` | same | Icono de personas en la cabecera, coherente con el resto. | none |  |  |
| `composition` | same | Título + barra + tabla + paginador, mismo esqueleto. | none |  |  |
| `density` | same | Altura de fila comparable al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Mismo patrón de cabecera estándar que el resto de pantallas. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo cliente'; paginador con formato distinto; filtro inline no se compara (vive tras el embudo). | raised | config | D-7 |

**What the screen does not show** (K-51)

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a value whose rule is not on screen, a state the original can be in, a navigation with no destination built — were looked for on this screen and none was found. It does NOT mean 'one was found and could not be settled': that is `needs-user`, it has been a value since K-69, and it would be in the table above this line instead of missing from it.

**Does not meet it yet:** palette (different): Mismo hueco de paleta ya registrado (skin2026 vs flexy2022).; typography (different): Misma diferencia de familia tipográfica que el resto de pantallas.; badges (different): Tarifa se pinta como texto plano; el original la muestra como una píldora gris. Estado (Activo/Bloqueado) sí coincide en verde/rojo con punto.; module-chrome (different): Mismo patrón de cabecera estándar que el resto de pantallas.; toolbar-and-actions (different): Botón 'Nuevo' en vez de 'Nuevo cliente'; paginador con formato distinto; filtro inline no se compara (vive tras el embudo).

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** list-row: Mismas 7 columnas (Código/Razón social/CIF/Tarifa/Comercial/Estado/Acciones) en el mismo orden, fila clicable.; spacing: Padding de fila y márgenes cercanos al original.; iconography: Icono de personas en la cabecera, coherente con el resto.; composition: Título + barra + tabla + paginador, mismo esqueleto.; density: Altura de fila comparable al original.; nav-and-branding: Misma barra lateral que en el resto de pantallas.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-09-15 · Listado de pedidos

**Measured against:** reference/listado-de-pedidos.png vs VTA_Pedido_List en vivo, 6 pedidos del seed.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta ya registrado (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Mismas 6 columnas (Número/Cliente/Fecha/Estado/Total/Acciones) en el mismo orden, fila clicable, fecha relativa ('hace un día'). | none |  |  |
| `record-card` | notapplicable | Pantalla de listado, sin ficha. |  |  |  |
| `badges` | different | Medido con getComputedStyle: el estado se pinta como texto de color (padding 0, sin píldora), el original usa una píldora con fondo claro y punto. Comprobado que es así en todas las listas del proyecto, no solo aquí (mismo patrón de plataforma). | raised | config | D-7 |
| `spacing` | same | Padding de fila cercano al original. | none |  |  |
| `iconography` | same | Icono de carrito en la cabecera, coherente con el resto. | none |  |  |
| `composition` | same | Título + barra + tabla + paginador, mismo esqueleto. | none |  |  |
| `density` | same | Altura de fila comparable al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que en el resto de pantallas. | none |  |  |
| `module-chrome` | different | Mismo patrón de cabecera estándar que el resto de pantallas. | raised | config | D-7 |
| `toolbar-and-actions` | different | Botón 'Nuevo' en vez de 'Nuevo pedido'; paginador con formato distinto; filtro inline no se compara (vive tras el embudo). | raised | config | D-7 |

**What the screen does not show** (K-51)

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a value whose rule is not on screen, a state the original can be in, a navigation with no destination built — were looked for on this screen and none was found. It does NOT mean 'one was found and could not be settled': that is `needs-user`, it has been a value since K-69, and it would be in the table above this line instead of missing from it.

**Does not meet it yet:** palette (different): Mismo hueco de paleta ya registrado (skin2026 vs flexy2022).; typography (different): Misma diferencia de familia tipográfica que el resto de pantallas.; badges (different): Medido con getComputedStyle: el estado se pinta como texto de color (padding 0, sin píldora), el original usa una píldora con fondo claro y punto. Comprobado que es así en todas las listas del proyecto, no solo aquí (mismo patrón de plataforma).; module-chrome (different): Mismo patrón de cabecera estándar que el resto de pantallas.; toolbar-and-actions (different): Botón 'Nuevo' en vez de 'Nuevo pedido'; paginador con formato distinto; filtro inline no se compara (vive tras el embudo).

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** list-row: Mismas 6 columnas (Número/Cliente/Fecha/Estado/Total/Acciones) en el mismo orden, fila clicable, fecha relativa ('hace un día').; spacing: Padding de fila cercano al original.; iconography: Icono de carrito en la cabecera, coherente con el resto.; composition: Título + barra + tabla + paginador, mismo esqueleto.; density: Altura de fila comparable al original.; nav-and-branding: Misma barra lateral que en el resto de pantallas.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-09-15 · Ficha de pedido

**Measured against:** reference/ficha-de-pedido.png vs VTA_Pedido_View en vivo, PED-1042 (Comercial Ibérica S.L., mismo pedido que muestra la referencia).

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Mismo hueco de paleta ya registrado (skin2026 vs flexy2022). | raised | platform |  |
| `typography` | different | Misma diferencia de familia tipográfica que el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Líneas del pedido con las mismas columnas (Producto/Cantidad/Precio/Subtotal). | none |  |  |
| `record-card` | different | Falta el enlace 'Volver a pedidos' del original. | raised | config | D-7 |
| `badges` | different | Estado 'Confirmado' en texto de color, sin píldora — mismo patrón de plataforma que el resto de listas/fichas. | raised | config | D-7 |
| `spacing` | same | Distribución de Detalles y Progreso del pedido cercana al original. | none |  |  |
| `iconography` | same | Iconos coherentes con el resto (D1). | none |  |  |
| `composition` | different | Corregido en esta pasada: se añadió el panel 'Información fiscal' que faltaba (datos reales del cliente). Sigue faltando: 'Documentos' del original muestra archivos reales descargables, lo construido solo cuenta (0) — mismo techo de plataforma que la galería de imágenes de Producto (D-8). | raised | scope | D-8 |
| `density` | same | Altura y espaciado comparables al original. | none |  |  |
| `nav-and-branding` | same | Misma barra lateral que el resto de pantallas. | none |  |  |
| `module-chrome` | different | Mismo patrón de cabecera estándar de Flexygo que el resto de pantallas. | raised | config | D-7 |
| `toolbar-and-actions` | different | Corregido en esta pasada: Confirmar, Cancelar y Generar PDF ahora son procesos reales (probados en vivo: cambian el estado y descargan un PDF de verdad). El original solo muestra 3 botones; lo construido conserva además la barra estándar completa de Flexygo, aceptado por D-7. | raised | config | D-7 |

**What the screen does not show** (K-51)

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a value whose rule is not on screen, a state the original can be in, a navigation with no destination built — were looked for on this screen and none was found. It does NOT mean 'one was found and could not be settled': that is `needs-user`, it has been a value since K-69, and it would be in the table above this line instead of missing from it.

**Does not meet it yet:** palette (different): Mismo hueco de paleta ya registrado (skin2026 vs flexy2022).; typography (different): Misma diferencia de familia tipográfica que el resto de pantallas.; record-card (different): Falta el enlace 'Volver a pedidos' del original.; badges (different): Estado 'Confirmado' en texto de color, sin píldora — mismo patrón de plataforma que el resto de listas/fichas.; composition (different): Corregido en esta pasada: se añadió el panel 'Información fiscal' que faltaba (datos reales del cliente). Sigue faltando: 'Documentos' del original muestra archivos reales descargables, lo construido solo cuenta (0) — mismo techo de plataforma que la galería de imágenes de Producto (D-8).; module-chrome (different): Mismo patrón de cabecera estándar de Flexygo que el resto de pantallas.; toolbar-and-actions (different): Corregido en esta pasada: Confirmar, Cancelar y Generar PDF ahora son procesos reales (probados en vivo: cambian el estado y descargan un PDF de verdad). El original solo muestra 3 botones; lo construido conserva además la barra estándar completa de Flexygo, aceptado por D-7.

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** list-row: Líneas del pedido con las mismas columnas (Producto/Cantidad/Precio/Subtotal).; spacing: Distribución de Detalles y Progreso del pedido cercana al original.; iconography: Iconos coherentes con el resto (D1).; density: Altura y espaciado comparables al original.; nav-and-branding: Misma barra lateral que el resto de pantallas.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-09-15 · Catálogo público

**Measured against:** reference/catalogo-publico.png vs CAT_Catalogo_Publico en vivo, 8 productos reales del seed con fotos (ImagenPrincipal ya resuelto por la plantilla — confirmado visualmente: las 8 fotos cargan bien).

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | different | Las tarjetas en sí (blancas, texto negro) coinciden; la diferencia grande es que toda la página hereda la barra lateral oscura del backoffice en vez del fondo claro y cabecera pública del original. | raised | scope | D-9 |
| `typography` | different | Misma diferencia de familia tipográfica que el resto de pantallas. | raised | config | D-7 |
| `list-row` | same | Rejilla de tarjetas con foto, categoría·marca, nombre, precio y botón, misma estructura de 4 columnas que el original. | none |  |  |
| `record-card` | notapplicable | No hay ficha de producto pública propia en las 7 pantallas aprobadas; la tarjeta abre la ficha de administración. |  |  |  |
| `badges` | same | Novedad/Oferta/Sin stock se pintan sobre las tarjetas correctas (Mochila=Novedad, Pantalón=Sin stock), coherente con el original. | none |  |  |
| `spacing` | same | Padding y separación de tarjetas cercanos al original. | none |  |  |
| `iconography` | notapplicable | Las tarjetas del catálogo público no llevan iconos propios en ninguna de las dos versiones. |  |  |  |
| `composition` | different | Falta la cabecera pública propia (logo, menú Catálogo/Marcas/Novedades/Ofertas/Ayuda/Contacto, carrito con contador, Iniciar sesión) — la página usa la composición del backoffice. Ver behaviours y D-9. | raised | scope | D-9 |
| `density` | same | 4 tarjetas por fila, misma densidad que el original. | none |  |  |
| `nav-and-branding` | different | Barra lateral oscura del backoffice (con Seguridad/Centinela/Modo Desarrollo visibles) en vez de la cabecera pública clara del original — el mayor defecto de esta pantalla, cubierto por D-9 (acceso anónimo real, desarrollo de seguridad aparte). | raised | scope | D-9 |
| `module-chrome` | different | Cabecera de módulo con título 'Catálogo público', botón '+ Nuevo' y iconos de herramientas propios de una pantalla de administración, impropios de una vista pública. Depende del mismo rediseño de acceso anónimo (D-9). | raised | scope | D-9 |
| `toolbar-and-actions` | different | 'Añadir al carrito' se ve gris y deshabilitado (tooltip 'Próximamente') en vez del botón negro activo del original — correcto y ya decidido en D-4 (carrito placeholder, sin persistencia). El resto de la barra (+Nuevo, iconos admin) depende de D-9. | raised | config | D-4 |

**What the screen does not show** (K-51)

| What | Kind | Resolution |
|---|---|---|
| Botón 'Añadir al carrito': visible pero sin persistencia (carrito real no construido). | control | asked-explained |
| Enlaces de cabecera pública Marcas/Novedades/Ofertas/Ayuda/Contacto: no existen en lo construido (se cuelga del árbol del backoffice, sin cabecera pública propia). | navigation | asked-explained |

**Does not meet it yet:** palette (different): Las tarjetas en sí (blancas, texto negro) coinciden; la diferencia grande es que toda la página hereda la barra lateral oscura del backoffice en vez del fondo claro y cabecera pública del original.; typography (different): Misma diferencia de familia tipográfica que el resto de pantallas.; composition (different): Falta la cabecera pública propia (logo, menú Catálogo/Marcas/Novedades/Ofertas/Ayuda/Contacto, carrito con contador, Iniciar sesión) — la página usa la composición del backoffice. Ver behaviours y D-9.; nav-and-branding (different): Barra lateral oscura del backoffice (con Seguridad/Centinela/Modo Desarrollo visibles) en vez de la cabecera pública clara del original — el mayor defecto de esta pantalla, cubierto por D-9 (acceso anónimo real, desarrollo de seguridad aparte).; module-chrome (different): Cabecera de módulo con título 'Catálogo público', botón '+ Nuevo' y iconos de herramientas propios de una pantalla de administración, impropios de una vista pública. Depende del mismo rediseño de acceso anónimo (D-9).; toolbar-and-actions (different): 'Añadir al carrito' se ve gris y deshabilitado (tooltip 'Próximamente') en vez del botón negro activo del original — correcto y ya decidido en D-4 (carrito placeholder, sin persistencia). El resto de la barra (+Nuevo, iconos admin) depende de D-9.

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** list-row: Rejilla de tarjetas con foto, categoría·marca, nombre, precio y botón, misma estructura de 4 columnas que el original.; badges: Novedad/Oferta/Sin stock se pintan sobre las tarjetas correctas (Mochila=Novedad, Pantalón=Sin stock), coherente con el original.; spacing: Padding y separación de tarjetas cercanos al original.; density: 4 tarjetas por fila, misma densidad que el original.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).
