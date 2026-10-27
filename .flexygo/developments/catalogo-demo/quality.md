# Quality findings — catalogo-demo

## 2026-09-15 · module `mod-cat-familia-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False (por defecto). El buscador es imprescindible: catálogo de familias con jerarquía, útil para localizar una familia hija concreta. | flexygo_update_object_list_module(objectName:'CAT_Familia', searcher:true) + regla de plugin para que .cntBodyHeader no se oculte (ver mod-cat-producto-list). |  |
| `list-no-column-sort` | fixed | Cabecera sin ningún data-sort. | flexygo_update_template: data-sort="Nombre" y data-sort="Orden" añadidos. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · module `mod-cat-marca-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False. | flexygo_update_object_list_module(objectName:'CAT_Marca', searcher:true) + regla de plugin. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort. | flexygo_update_template: data-sort="Nombre". |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · module `mod-cat-producto-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False. Detectado además un defecto de plataforma real al activarlo: el CSS de la plataforma (skinBundle.css) oculta .cntBodyHeader cuando no contiene un chip de filtro ni un botón, sin contar el buscador (.listSearcher) como contenido — el buscador quedaba en el DOM con 0×0 y offsetParent=false. | flexygo_update_object_list_module(objectName:'CAT_Producto', searcher:true) + regla de project plugin (flx-dashboard.css) que fuerza display:block en .cntBodyHeader cuando contiene .listSearcher, con ámbito a los módulos de este proyecto. Comprobado escribiendo 'Gorra' en el buscador: la lista filtró a 1 fila. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort. | flexygo_update_template: data-sort en Referencia/Nombre/Precio/Stock. Comprobado con clic en 'Precio': la lista se reordenó de menor a mayor. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · module `mod-cli-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False. | flexygo_update_object_list_module(objectName:'CLI_Cliente', searcher:true) + regla de plugin. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort. | flexygo_update_template: data-sort en Código y Razón social. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · module `mod-vta-pedido-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False. | flexygo_update_object_list_module(objectName:'VTA_Pedido', searcher:true) + regla de plugin. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort. | flexygo_update_template: data-sort en Número, Fecha y Total. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · module `mod-cat-producto-publico-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False. | flexygo_update_object_list_module(moduleName:'mod-cat-producto-publico-list', searcher:true) + regla de plugin. |  |
| `list-no-column-sort` | dismissed | No aplica: rejilla de tarjetas sin cabecera de columnas (gate del propio catálogo). | — | Gate de la entrada: no aplica a una rejilla de tarjetas sin cabecera de columnas. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Familia_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | Ningún botón de la barra ni la plantilla llevaban de vuelta al listado. | flexygo_create_html_module(mod-cat-familia-back-html, containerId:'none') + flexygo_add_page_module(TopPosition, order:-1). Comprobado en pantalla: enlace '← Volver a familias' visible y funcional. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Marca_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | Ningún botón de la barra ni la plantilla llevaban de vuelta al listado. | flexygo_create_html_module(mod-cat-marca-back-html, containerId:'none') + flexygo_add_page_module(TopPosition, order:-1). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Producto_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | Ningún botón de la barra ni la plantilla llevaban de vuelta al listado (el original aprobado sí lo tiene: 'Volver a productos'). | flexygo_create_html_module(mod-cat-producto-back-html, containerId:'none') + flexygo_add_page_module(TopPosition, order:-1). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CLI_Cliente_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | Ningún botón de la barra ni la plantilla llevaban de vuelta al listado. | flexygo_create_html_module(mod-cli-cliente-back-html, containerId:'none') + flexygo_add_page_module(TopPosition, order:-1). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `VTA_Pedido_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | Ningún botón de la barra ni la plantilla llevaban de vuelta al listado (el original aprobado sí lo tiene: 'Volver a pedidos'). | flexygo_create_html_module(mod-vta-pedido-back-html, containerId:'none') + flexygo_add_page_module(TopPosition, order:-1). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Familia_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-cat-familia-list. | Ver módulo mod-cat-familia-list: flexygo_update_object_list_module(searcher:true) + regla de plugin. Ya cerrado. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort en mod-cat-familia-list. | Ver módulo mod-cat-familia-list: data-sort añadido a Nombre y Orden. Ya cerrado. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Marca_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-cat-marca-list. | Ver módulo mod-cat-marca-list. Ya cerrado. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort en mod-cat-marca-list. | Ver módulo mod-cat-marca-list. Ya cerrado. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Producto_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-cat-producto-list. | Ver módulo mod-cat-producto-list. Ya cerrado, probado escribiendo 'Gorra'. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort en mod-cat-producto-list. | Ver módulo mod-cat-producto-list. Ya cerrado, probado ordenando por Precio. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CLI_Cliente_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-cli-cliente-list. | Ver módulo mod-cli-cliente-list. Ya cerrado. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort en mod-cli-cliente-list. | Ver módulo mod-cli-cliente-list. Ya cerrado. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `VTA_Pedido_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-vta-pedido-list. | Ver módulo mod-vta-pedido-list. Ya cerrado. |  |
| `list-no-column-sort` | fixed | Cabecera sin data-sort en mod-vta-pedido-list. | Ver módulo mod-vta-pedido-list. Ya cerrado. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `CAT_Catalogo_Publico`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher=False en mod-cat-producto-publico-list. | Ver módulo mod-cat-producto-publico-list. Ya cerrado. |  |
| `list-no-column-sort` | dismissed | No aplica: rejilla de tarjetas sin cabecera de columnas. | — | Gate de la entrada: no aplica a una rejilla de tarjetas. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-15 · page `HOME`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | mod-vta-pedido-recent-list: Modules.Searcher=False. | — | Gate de la entrada: widget de 8 pedidos recientes de los últimos 60 días, de solo vistazo — el mismo límite que exime a list-no-pager de una lista acotada por el modelo de datos. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-cat-familia-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-cat-marca-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-cat-producto-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-cat-producto-publico-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-cli-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-16 · module `mod-vta-pedido-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | dismissed | Se había activado searcher:true y una regla CSS de plugin para hacerlo visible. | flexygo_update_object_list_module(searcher:false); regla CSS retirada de flx-dashboard.css. | El usuario no quiere el buscador de texto libre: 'No lo quiero, me vale con los filtros que ya hay configurado.' El botón Filtro de la barra ya cubre esa necesidad. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_MisDocumentos_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-vta-pedido-documentos-cliente-sqllist: syspager-listheader, 15 por página; mod-vta-tarifa-list-documentos: syspager-listheader. | — | Los dos módulos tienen paginador. |
| `list-no-empty-state` | not-applicable | CORRECCIÓN del registro anterior de hoy: el sqllist de documentos SÍ tenía Empty propio («Aún no tienes documentos», lo comprueba el test MisDocumentos_MuestraSusDocumentosYSuTarifa_SinListarPedidos); el agente lo sobrescribió sin leer antes el cuerpo del módulo y lo ha restaurado con el mismo texto, centrado. La lista de tarifa tiene «Sin tarifa asignada». | — | Los dos módulos tienen su propio estado vacío. |
| `list-no-column-sort` | not-applicable | Documentos: lista de filas con plantilla, ordenada en su SQL por fecha descendente. Tarifa: una sola fila (la del cliente). | — | Gate: el orden es el de su consulta (fecha descendente) y la tarifa es una sola fila acotada por el modelo. |
| `list-no-searcher` | dismissed | Searcher = 0 en los dos. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.
