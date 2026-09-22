# Quality findings — presupuestos-postventa

## 2026-09-21 · page `VTA_Devolucion_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | open | No hay módulo ni enlace de vuelta en la página: composición = solo mod-vta-devolucion-view (flx-view) + galería de fotos. La plantilla flx-vta-devolucion-view no incluye ningún flx-navbutton de vuelta, y la barra systb-view (11 botones estándar) tampoco lleva ninguno que vuelva a la lista. | flexygo_create_html_module con un flx-navbutton de vuelta a VTA_Devolucion_List, colocado en TopPosition (mismo patrón ya aplicado en VTA_Pedido_Cliente_View: '← Volver a mis pedidos'). |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** view-no-way-back: No hay módulo ni enlace de vuelta en la página: composición = solo mod-vta-devolucion-view (flx-view) + galería de fotos. La plantilla flx-vta-devolucion-view no incluye ningún flx-navbutton de vuelta, y la barra systb-view (11 botones estándar) tampoco lleva ninguno que vuelva a la lista.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-21 · page `VTA_Incidencia_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | open | Misma composición que VTA_Devolucion_View: solo mod-vta-incidencia-view (flx-view) + galería de fotos, sin módulo ni enlace de vuelta; la plantilla flx-vta-incidencia-view no lleva flx-navbutton de vuelta y systb-view tampoco. | flexygo_create_html_module con un flx-navbutton de vuelta a VTA_Incidencia_List, colocado en TopPosition. |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** view-no-way-back: Misma composición que VTA_Devolucion_View: solo mod-vta-incidencia-view (flx-view) + galería de fotos, sin módulo ni enlace de vuelta; la plantilla flx-vta-incidencia-view no lleva flx-navbutton de vuelta y systb-view tampoco.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-21 · page `VTA_Devolucion_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | No hay módulo ni enlace de vuelta en la página. | flexygo_create_html_module (mod-vta-devolucion-back-html, containerId 'none', flx-navbutton openpagename → VTA_Devolucion_List) + flexygo_add_page_module en TopPosition. Verificado en pantalla como cliente: clic en '← Volver a mis devoluciones' navega correctamente a la lista, sin errores de consola. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-21 · page `VTA_Incidencia_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | No hay módulo ni enlace de vuelta en la página. | flexygo_create_html_module (mod-vta-incidencia-back-html, containerId 'none', flx-navbutton openpagename → VTA_Incidencia_List) + flexygo_add_page_module en TopPosition. Verificado en pantalla como cliente: clic en '← Volver a mis incidencias' navega correctamente a la lista, sin errores de consola. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.
