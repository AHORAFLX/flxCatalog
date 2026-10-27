# Quality findings — carrito-pedidos

## 2026-10-26 · page `VTA_Pedido_MiCarrito_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | not-applicable | Sin módulo de vuelta. | flexygo_update_page(backLabel) | Gate: punto de entrada (menú «Mi carrito» e icono de la barra superior). |
| `list-no-pager` | not-applicable | mod-vta-lineapedido-carrito-list: syspager-listheader, 50 por página. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Tu carrito está vacío». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Tarjetas de línea editables sin cabecera. | — | Gate: lista de tarjetas sin cabecera de columnas. |
| `list-row-goes-nowhere` | not-applicable | Cantidad editable (cliCartSetQty) y quitar (cliCartRemove) en cada fila. | — | La fila tiene sus acciones. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-cat-producto-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId syspager-listheader, PageSize 50 (140 productos). | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Todavía no hay productos en tu catálogo». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Rejilla de tarjetas sin cabecera. | — | Gate: rejilla de tarjetas (misma decisión que en catalogo-demo). |
| `list-no-searcher` | dismissed | Searcher = 0; el buscador general de la barra superior encuentra productos (test Buscador_EncuentraUnProductoYAbreSuFicha). | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La foto abre la ficha del producto; botones Añadir al carrito, favorito y comparar. | — | La tarjeta tiene sus acciones. |
| `list-row-opens-generic` | dismissed | La foto abre syspage-view-default (ficha con reseñas) en ventana, medido como cliente el 26-oct. | página view propia de producto para el cliente | Decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): es la ficha con reseñas aprobada en correcciones-rol-cliente (P-RESEÑAS); el cliente no tiene acceso a la ficha de administración CAT_Producto_View. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `CAT_Producto_Comparador_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-row-goes-nowhere` | not-applicable | Página genérica (desde el 26-oct) con un módulo HTML que pinta las columnas de los productos marcados. | — | Gate: no hay filas; los módulos flx-html no tienen entradas en el catálogo. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `CAT_Favorito_Cliente_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | syspager-listheader, 50 por página. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Todavía no tienes productos favoritos». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Rejilla de tarjetas. | — | Gate: rejilla de tarjetas. |
| `list-row-opens-generic` | dismissed | Abre syspage-view-default, igual que el catálogo; además esta página ya no la abre ningún menú (correcciones-rol-cliente T-04 llevó «Mis favoritos» al catálogo filtrado). | página view propia de producto para el cliente | Decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): misma ficha que el catálogo del cliente. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.
