# Quality findings — correcciones-rol-cliente

## 2026-10-26 · interface `webcliente`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `app-opens-on-nothing` | not-applicable | Hoy, entrando como la cliente Marta Rodríguez Díaz, el inicio es la página de su perfil «Bienvenido…», con sus pedidos recientes. StartupPageName de la interfaz está vacío, pero el perfil Cliente fija la suya. | flexygo_update_interface(startupPageName) | Gate: el rol tiene página de inicio propia y alcanzable; se midió entrando con el usuario de ese rol. |
| `shell-widget-paints-nothing` | not-applicable | El panel lateral pinta el «Menú Cliente» con Catálogo, Mi carrito, Mis pedidos, Mi ficha, Mis favoritos, Mis documentos, Mis devoluciones, Mis incidencias, Mis notificaciones y Ayuda (captura de hoy de la ficha de producto). La barra superior lleva el buscador, las notificaciones y «Mi carrito» con su contador. | flexygo_update_interface(mainNavigateId) | Gate: la raíz del menú sirve los nodos propios del rol cliente. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_MisDocumentos_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-vta-pedido-documentos-cliente-sqllist y mod-vta-tarifa-list-documentos llevan syspager-listheader. | flexygo_update_sql_list_module(pagerId) | Los dos módulos tienen paginador. |
| `list-no-empty-state` | fixed | El sqllist de documentos tiene texto vacío propio, «Aún no tienes documentos», puesto con flexygo_update_sql_list_module(empty) y visto hoy con la cliente de demo, que no tiene documentos. | flexygo_update_sql_list_module(empty) |  |
| `list-no-column-sort` | not-applicable | Los documentos salen ordenados por fecha descendente en su SQL. La tarifa es una sola fila, la del cliente. | plantilla con data-sort | Gate: el orden lo fija su consulta y la tarifa es una fila acotada por el modelo. |
| `list-no-searcher` | dismissed | Searcher = 0 en los dos módulos. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_Devolucion_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La ficha lleva arriba mod-vta-devolucion-back-html (order -1), con el enlace «← Volver a mis devoluciones», además de la ficha y la galería de fotos. Leído hoy con flexygo_get_page_modules. | flexygo_create_html_module + flexygo_add_page_module(TopPosition) |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_Incidencia_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La ficha lleva arriba mod-vta-incidencia-back-html (order -1), además de la ficha, los comentarios y las fotos. Leído hoy con flexygo_get_page_modules. | flexygo_create_html_module + flexygo_add_page_module(TopPosition) |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_Pedido_Cliente_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La ficha de pedido del cliente lleva mod-vta-pedido-cliente-back-html antes de la ficha, que es donde se pusieron los botones «Solicitar devolución» y «Abrir incidencia» (T-15). | flexygo_create_html_module + flexygo_add_page_module(TopPosition) |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.
