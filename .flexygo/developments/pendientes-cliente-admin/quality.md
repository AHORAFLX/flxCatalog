# Quality findings — pendientes-cliente-admin

## 2026-10-26 · module `mod-vta-mesa-pedidos-kanban`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `kanban-no-card-order` | fixed | Kanban_Settings_Orders vacío: las tarjetas salían en el orden del identificador (aleatorio). Cerrado con flexygo_update_view(VTA_PedidoKanban, orderBy: 'Fecha Desc') y flexygo_update_kanban_module(cardOrderBy: ['Fecha Desc']). | flexygo_update_kanban_module(cardOrderBy) + orden de la vista de tarjetas |  |
| `kanban-no-archive` | dismissed | archiveStateValue vacío: no hay caja de archivo. | flexygo_update_kanban_module(archiveStateValue) | Decidido por el agente con la delegación del usuario (D-16): es una demo y los estados finales (Entregado, Cancelado) son columnas que interesa enseñar en el tablero; una caja de archivo los escondería. |
| `kanban-process-does-not-save` | not-applicable | onChangeColumnProcess no está enganchado: guarda la propia plataforma. | — | Gate: sin proceso enganchado no hay nada que deje de guardar; onChangeColumnProcess vacío. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-mesa-incidencias-kanban`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `kanban-no-card-order` | fixed | Kanban_Settings_Orders vacío y la vista VTA_IncidenciaDefaultList sin orden. Cerrado con flexygo_update_view(orderBy: 'FechaAlta Desc') y flexygo_update_kanban_module(cardOrderBy: ['FechaAlta Desc']); el listado de incidencias gana el mismo orden. | flexygo_update_kanban_module(cardOrderBy) + orden de la vista de tarjetas |  |
| `kanban-no-archive` | dismissed | archiveStateValue vacío. | flexygo_update_kanban_module(archiveStateValue) | Decidido por el agente con la delegación del usuario (D-16): en la demo las incidencias Cerradas y Canceladas se enseñan como columnas del tablero. |
| `kanban-process-does-not-save` | not-applicable | onChangeColumnProcess no enganchado. | — | Gate: sin proceso enganchado guarda la plataforma. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-mesa-devoluciones-kanban`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `kanban-no-card-order` | fixed | Kanban_Settings_Orders vacío y la vista VTA_DevolucionDefaultList sin orden. Cerrado con flexygo_update_view(orderBy: 'FechaSolicitud Desc') y flexygo_update_kanban_module(cardOrderBy: ['FechaSolicitud Desc']); el listado de devoluciones gana el mismo orden. | flexygo_update_kanban_module(cardOrderBy) + orden de la vista de tarjetas |  |
| `kanban-no-archive` | dismissed | archiveStateValue vacío. | flexygo_update_kanban_module(archiveStateValue) | Decidido por el agente con la delegación del usuario (D-16): en la demo las devoluciones Rechazadas y Abonadas se enseñan como columnas del tablero. |
| `kanban-process-does-not-save` | not-applicable | onChangeColumnProcess no enganchado. | — | Gate: sin proceso enganchado guarda la plataforma. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-cat-color-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin colores todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista CAT_ColorDefaultList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha CAT_Color_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador (allUsers canView=false en la página de lista); el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve CAT_Color_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia CAT_Color_View. | — | La fila abre CAT_Color_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-cat-talla-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin tallas todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista CAT_TallaDefaultList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha CAT_Talla_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador; el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve CAT_Talla_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia CAT_Talla_View. | — | La fila abre CAT_Talla_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-estadopedido-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin estados todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista VTA_EstadoPedidoDefaultList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha VTA_EstadoPedido_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador; el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve VTA_EstadoPedido_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia VTA_EstadoPedido_View. | — | La fila abre VTA_EstadoPedido_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-estadodevolucion-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin estados todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista VTA_EstadoDevolucionList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha VTA_EstadoDevolucion_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador; el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve VTA_EstadoDevolucion_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia VTA_EstadoDevolucion_View. | — | La fila abre VTA_EstadoDevolucion_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-estadoincidencia-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin estados todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista VTA_EstadoIncidenciaList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha VTA_EstadoIncidencia_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador; el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve VTA_EstadoIncidencia_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia VTA_EstadoIncidencia_View. | — | La fila abre VTA_EstadoIncidencia_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · module `mod-vta-tipoincidencia-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | PagerId = syspager-listheader, PageSize 50. | — | Gate: el módulo ya tiene paginador (syspager-listheader). |
| `list-no-empty-state` | not-applicable | Objects_Templates.Empty tiene su texto propio traducible. | — | La plantilla ya lleva Empty propio («Sin tipos todavía»). |
| `list-no-column-sort` | not-applicable | Header con data-sort en Orden y Nombre. La vista VTA_TipoIncidenciaList no declaraba orden: se le puso 'Orden Asc, Nombre Asc' con flexygo_update_view. | — | La cabecera ya invoca el ordenador (data-sort en Orden y Nombre). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton (pagetypeid=view) y {{objectmenu}}. | — | La fila abre la ficha VTA_TipoIncidencia_View. |
| `list-row-target-denied` | not-applicable | Lista solo del administrador; el rol cliente no llega a ella. | — | Solo admins llega a la lista y admins ve VTA_TipoIncidencia_View. |
| `list-row-opens-generic` | not-applicable | El objeto tiene su página de ficha propia VTA_TipoIncidencia_View. | — | La fila abre VTA_TipoIncidencia_View, no el detalle genérico. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · interface `web2026`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `app-opens-on-nothing` | not-applicable | StartupPageName = VTA_Dashboard_Page; el login del administrador abre el Dashboard con indicadores y gráficos (test T15_Dashboard_EsElInicioYMuestraIndicadoresYGraficos en verde el 26-oct). | — | Gate: la página de inicio está puesta y se alcanza (VTA_Dashboard_Page). |
| `shell-widget-paints-nothing` | not-applicable | MainNavigateId = 95ccfb38 «Barra lateral 2026», con el árbol propio (Dashboard, Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas, Maestros, Ayuda); NavigateId = 5290bfaf con campana y carrito. | — | Gate: la raíz del panel lateral sirve los nodos propios de la aplicación. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · interface `webcliente`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `app-opens-on-nothing` | not-applicable | Interfaces.StartupPageName vacío, pero el perfil 'Cliente' lleva su página de inicio: el recorrido T-02 (login como cliente) aterriza en la página d2e00246 «Bienvenido, Cliente Cliente» con sus pedidos recientes. | flexygo_update_interface(startupPageName) | Gate medido con el usuario cliente: el login aterriza en su inicio (d2e00246), no en el panel vacío de la plataforma. |
| `shell-widget-paints-nothing` | not-applicable | MainNavigateId = c0167e61 «Menú Cliente» (Catálogo, Mi carrito, Mis pedidos, Mi ficha, Mis favoritos, Mis documentos, Mis devoluciones, Mis incidencias, Mis notificaciones, Ayuda), visto en la captura de T-02. | — | Gate: la raíz del menú del cliente sirve sus propios nodos. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `CAT_Favorito_Cliente_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-cat-favorito-cliente-list: PagerId syspager-listheader, PageSize 50. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Todavía no tienes productos favoritos» (visto con el cliente demo antes del reinicio de datos). | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Rejilla de tarjetas sin cabecera de columnas. | — | Gate: no aplica a una rejilla de tarjetas (misma decisión que en catalogo-demo). |
| `list-no-searcher` | not-applicable | Modules.Searcher = 1. | — | El buscador ya está activado. |
| `list-row-goes-nowhere` | not-applicable | La tarjeta lleva flx-navbutton a la ficha del producto y {{objectmenu}}. | — | La tarjeta abre el producto. |
| `list-row-opens-generic` | dismissed | Medido como cliente (Marta Rodríguez Díaz) el 26-oct: la tarjeta abre syspage-view-default, la misma ficha de producto con reseñas que abre el catálogo del cliente (CAT_Producto_Cliente_List), entregada por correcciones-rol-cliente. Además, esta página no la abre ningún menú: «Mis favoritos» del Menú Cliente abre el catálogo filtrado por favoritos. | una página view propia de producto para el cliente (flexygo_create_page) y el navbutton apuntando a ella | Decidido por el agente con la delegación del usuario (D-16): es la misma ficha que el cliente ve desde el catálogo, con las reseñas que se aprobaron en correcciones-rol-cliente; cambiar una sola de las dos entradas dejaría dos fichas distintas para el mismo producto. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

**Screenshot:** `screenshots/quality/2026-10-26-cat-favorito-cliente-list-33-quality-cliente-producto-modal.png`

## 2026-10-26 · page `VTA_MisDocumentos_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-vta-pedido-documentos-cliente-sqllist: syspager-listheader, 15 por página; mod-vta-tarifa-list-documentos: syspager-listheader. | — | Los dos módulos tienen paginador. |
| `list-no-empty-state` | fixed | El sqllist de documentos no tenía Empty: en vacío pintaba la alerta de la plataforma (verificación de presupuestos-postventa: «el icono queda a la izquierda y el texto centrado»). Cerrado con flexygo_update_sql_list_module(empty: «Todavía no tienes documentos: aparecerán aquí las facturas y albaranes de tus pedidos.»). La lista de tarifa ya tenía «Sin tarifa asignada». | flexygo_update_sql_list_module(empty) |  |
| `list-no-column-sort` | not-applicable | Documentos: rejilla sin plantilla, ordenada en su SQL por fecha descendente. Tarifa: una sola fila (la del cliente). | — | Gate: el orden es el de su consulta (fecha descendente) y la tarifa es una sola fila acotada por el modelo. |
| `list-no-searcher` | dismissed | Searcher = 0 en los dos. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-vta-pedido-home-list: syspager-listheader, 5 por página (resumen del inicio). | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Todavía no tienes pedidos». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Cabecera con data-sort en Número, Fecha y Total; la vista VTA_PedidoHomeList pasa a ordenarse por Fecha Desc (antes salía en el orden de la tabla). | — | La cabecera ya invoca el ordenador. |
| `list-no-searcher` | not-applicable | Searcher = 0. | — | Gate: resumen de inicio de solo vistazo (5 filas por página), el mismo límite que ya se aceptó en catalogo-demo para el widget de pedidos recientes. |
| `list-row-goes-nowhere` | not-applicable | La fila abre la ficha del pedido (flx-navbutton pagetypeid=view) y lleva {{objectmenu}}. | — | La fila abre el pedido. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `COM_MisNotificaciones_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-pager` | not-applicable | mod-com-misnotificaciones-list: PagerId syspager-listheader, PageSize 50. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «No tienes notificaciones». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | fixed | La cabecera no tenía data-sort y la vista sysNoticeUserMisNotificaciones no declaraba orden. Cerrado con flexygo_update_template(header con data-sort en Title e InsertDate) y flexygo_update_view(orderBy: 'InsertDate Desc'). | flexygo_update_template(header con data-sort) | La desestimación de catalogo-demo era para una rejilla de tarjetas; esta es una lista con columnas. El usuario, en esta pasada (26-oct): «si hay que tomar alguna decisión la tomas tú, pero deja el proyecto de demo perfecto» (D-16). |
| `list-no-searcher` | dismissed | Modules.Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | La fila lleva flx-navbutton openpagename a la página que cita la notificación. | — | La fila abre lo que la notificación cita. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_Tarifa_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La ficha no tenía módulo de vuelta. Cerrado con flexygo_update_page(backLabel: 'Volver a tarifas'), que colocó mod-vta-tarifa-back-html hacia VTA_Tarifa_List; como el cliente tiene denegada VTA_Tarifa_List (canView=NO) y llega a su tarifa desde «Mis documentos», el enlace se le oculta con flexygo_set_module_security(cliente, canView=false). | flexygo_update_page(backLabel) |  |
| `list-no-pager` | not-applicable | mod-vta-preciotarifa-list-tarifa: syspager-listheader, 50 por página. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Sin precios todavía para esta tarifa». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | fixed | Cabecera sin data-sort y vista VTA_PrecioTarifaDefaultList sin orden (140 precios por tarifa). Cerrado con flexygo_update_template(data-sort en Producto y Precio) y flexygo_update_view(orderBy: 'Producto Asc'). | flexygo_update_template(header con data-sort) | La desestimación de catalogo-demo era para una rejilla de tarjetas; esta es una lista con columnas. El usuario, en esta pasada (26-oct): «si hay que tomar alguna decisión la tomas tú, pero deja el proyecto de demo perfecto» (D-16). |
| `list-no-searcher` | dismissed | Searcher = 0. | flexygo_update_object_list_module(searcher: true) | Decisión anterior del usuario que sigue en pie (catalogo-demo, 16-sep): «No lo quiero, me vale con los filtros que ya hay configurado.» |
| `list-row-goes-nowhere` | not-applicable | Fila de solo lectura (producto y precio), sin navegación. | — | Gate: lista de solo lectura cuyas filas son todo el contenido (la tabla de precios de la tarifa). |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `VTA_Pedido_MiCarrito_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | not-applicable | Sin módulo de vuelta. | flexygo_update_page(backLabel) | Gate: es un punto de entrada (el carrito se abre desde el menú «Mi carrito» y desde el icono de la barra superior), no una ficha a la que se llega desde un listado. |
| `list-no-pager` | not-applicable | mod-vta-lineapedido-carrito-list: syspager-listheader, 50 por página. | — | Ya tiene paginador. |
| `list-no-empty-state` | not-applicable | Empty propio «Tu carrito está vacío». | — | La plantilla lleva Empty propio. |
| `list-no-column-sort` | not-applicable | Filas de tarjeta editable (foto, cantidad, quitar) sin cabecera de columnas. | — | Gate: no aplica a una lista de tarjetas sin cabecera. |
| `list-row-goes-nowhere` | not-applicable | Cada fila se edita en el sitio: cantidad (cliCartSetQty) y quitar (cliCartRemove). | — | La fila tiene sus acciones. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.

## 2026-10-26 · page `CAT_Producto_Comparador_List`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-row-goes-nowhere` | not-applicable | La página solo tiene mod-comparador-productos-html (flx-html), que pinta por JavaScript (flxcatalog-comparador.js) las columnas de los productos marcados en el catálogo. Estaba dada de alta como página de tipo lista de CAT_Producto sin lista; se pasa a genérica sin objeto con flexygo_update_page(typeId: 'generic', clearObjectName), porque la abre el plugin por su nombre. Comprobado como cliente el 26-oct: con dos productos marcados abre CAT_Producto_Comparador_List y compara Abrigo Niño Deluxe y Pantalón Niño Pro. | — | Gate: no hay filas; es una comparación de columnas pintada por un módulo HTML, y los módulos flx-html no tienen entradas en el catálogo. |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, `not-applicable` with the gate that does not hold, or `raised` with its class of cause.
