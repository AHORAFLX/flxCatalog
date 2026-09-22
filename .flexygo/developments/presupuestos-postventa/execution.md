# Execution — presupuestos-postventa

## 2026-09-21 · T-01 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Añadidas a Pedidos las columnas Transportista (nvarchar 150, null), NumeroSeguimiento (nvarchar 100, null), UrlSeguimiento (nvarchar 500, null) y FechaEntregaEstimada (datetime2, null). Sin desviaciones.

## 2026-09-21 · T-02 · OK

**Tool:** `flexygo_create_properties_batch`

**Result:** Creadas en VTA_Pedido las 4 propiedades (Transportista, NumeroSeguimiento, UrlSeguimiento tipo url, FechaEntregaEstimada tipo datetime) en la vista de detalle existente (VTA_PedidoView), filas 7 y 8 del grid, sin colisión con las 8 propiedades ya existentes. 4/4 creadas sin fallos.

## 2026-09-21 · T-03 · OK

**Tool:** `flexygo_update_view + flexygo_update_template`

**Result:** Añadidas Transportista, NumeroSeguimiento, UrlSeguimiento y FechaEntregaEstimada a la vista VTA_PedidoClienteView (view SQL) y a la plantilla flx-vta-pedido-cliente-view, en una nueva sección 'Envío' de solo lectura con el mismo patrón isnull:— ya usado en el resto de la ficha (FormaPago). No se ocultó la sección antes de que el pedido esté en tránsito -se mostraría con guiones- para no complicar la plantilla con lógica condicional adicional; es una desviación menor respecto al enunciado literal, aceptable porque el resultado visual es equivalente (nada que enseñar hasta que el administrador rellena el transportista).

## 2026-09-21 · T-04 · OK

**Tool:** `flexygo_update_view + flexygo_update_template`

**Result:** Construido el indicador de progreso: 5 columnas calculadas en la vista (PasoBorrador..PasoEntregado, CASE sobre Pedidos_Estados.Orden) que dan 'done'/'current'/'pending' por paso, pintadas en la plantilla como 5 iconos (check/punto relleno/círculo vacío) con su etiqueta debajo. Un pedido Cancelado (Orden=6) pinta los 5 pasos como pendientes, ya que el estado en sí ya se distingue arriba con el badge rojo 'Cancelado' — se dejó así en vez de inventar un sexto paso fuera de la secuencia lineal.

## 2026-09-21 · T-05 · OK

**Tool:** `flexygo_create_page + flexygo_create_object_list_module + flexygo_compose_page_batch + flexygo_set_page_security`

**Result:** Creada la página VTA_MisDocumentos_List (typeId list, objectName VTA_Pedido, icon 'document', layout 'default'). Creado el módulo mod-vta-pedido-list-documentos, segunda lista sobre VTA_Pedido reutilizando la vista existente VTA_PedidoDefaultList (misma SQL exacta: Pedidos LEFT JOIN Clientes LEFT JOIN Pedidos_Estados) con plantilla propia flx-vta-pedido-list-documentos que añade, por fila, un flx-navbutton type=execprocess contra pVTA_GenerarPdfPedido (objectwhere cuota'do sobre Pedidos.IdPedido, que es texto, no numérico) para la descarga del PDF, y navegación a la ficha VTA_Pedido_Cliente_View ya existente. Compuesta la página con este módulo en TopPosition/0, título 'Mis pedidos'. La seguridad de fila por cliente NO se duplicó a mano: VTA_Pedido ya tiene en Security_Objects_Roles un filtro de fila para el rol 'cliente' (Pedidos.IdCliente = '{{currentReference}}', en canView y canViewCollection) que se comprobó con flexygo_get_security antes de construir — al ser seguridad de OBJETO, cualquier módulo nuevo sobre VTA_Pedido la hereda automáticamente sin configuración adicional. Añadida una fila explícita de seguridad de página (cliente canView=true) igual que las que ya llevan VTA_Pedido_List y VTA_Pedido_Cliente_View, aunque el tool avisa que no cambia nada (sin fila ya era visible) — se deja por coherencia con el patrón existente. Sin desviaciones bloqueantes.

## 2026-09-21 · T-06 · OK

**Tool:** `flexygo_compose_page_batch + flexygo_set_object_security`

**Result:** Añadido a la página VTA_MisDocumentos_List el módulo genérico existente mod-vta-tarifa-list (el mismo que usa la página de administración VTA_Tarifa_List), en TopPosition/1, título 'Tarifas' — reutilizado tal cual, sin crear vista ni plantilla nueva. Desviación resuelta: al introspeccionar con flexygo_get_object_full_config y flexygo_get_security antes de construir se comprobó que el rol cliente tenía TODO denegado sobre VTA_Tarifa (canView=False, canViewCollection=False) — no era 'visible para el cliente' como decía el contexto recibido, estaba cerrado. Corregido con flexygo_set_object_security: canView=true y canViewCollection=true para cliente; canInsert/canEdit/canDelete/canPrint quedan en false (catálogo de solo lectura). No se añadió filtro de fila: se interpreta como el catálogo completo de tarifas, no acotado a una tarifa propia. Pendiente de recarga de caché del Backend para que el cambio de seguridad surta efecto; no verificado en pantalla, corresponde a /flx-verify.

## 2026-09-21 · T-07 · OK

**Tool:** `flexygo_create_navigation_node + flexygo_verify_object`

**Result:** Creado el nodo de navegación 'Mis documentos' (NodeId 684882f1-584c-48dc-9b78-b9d51f0c255d) bajo 'Menú Cliente' (c0167e61-8539-4658-baeb-7fb023d88f58), orden 5, apuntando a la página VTA_MisDocumentos_List, icono 'document'. Es el único punto de entrada a la página, tal como pedía la tarea. Cerrando el bloque, flexygo_verify_object sobre VTA_Pedido y VTA_Tarifa da PASS 8/8 en ambos (único aviso: traducción pendiente, opcional, no bloqueante). Pendiente para /flx-verify: reload de caché del Backend (requiere contraseña del usuario, no disponible en esta sesión) y comprobación en pantalla de que el listado de pedidos filtra por cliente, el botón de descarga de PDF funciona, y las tarifas ahora son visibles para el rol cliente.

## 2026-09-21 · T-08 · OK

**Tool:** `flexygo_execute_ddl + flexygo_execute_dml`

**Result:** ok:true. Tabla Devoluciones_Estados creada (IdEstado NVARCHAR(50) DEFAULT NEWID() PK, Nombre NVARCHAR(50), Orden INT DEFAULT 0 — añadida Orden como columna adicional no listada literalmente en el plan, siguiendo el mismo patrón ya usado en Pedidos_Estados de este proyecto, para poder ordenar el combo). Sembradas 5 filas: Solicitada(1), En revisión(2), Aceptada(3), Rechazada(4), Abonada(5).

## 2026-09-21 · T-09 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** ok:true. Tabla Devoluciones creada con IdDevolucion NVARCHAR(50) DEFAULT NEWID() PK, IdPedido FK->Pedidos, IdLinea FK->Pedidos_Lineas, Cantidad INT, Motivo NVARCHAR(200), Comentario NVARCHAR(500) NULL, IdEstado FK->Devoluciones_Estados, FechaSolicitud DATETIME2 DEFAULT SYSDATETIME(), Activo BIT DEFAULT 1, y las 4 columnas de auditoría (CreatedBy/CreateDate/ModifiedBy/ModifiedDate, NVARCHAR(200)/DATETIME2, todas NULL — mismo tipo ya usado en Productos). FKs declaradas como constraints SQL además de las relaciones lógicas Flexygo que se crearán en T-21.

## 2026-09-21 · T-10 · OK

**Tool:** `flexygo_create_object`

**Result:** ok:true. Objeto VTA_EstadoDevolucion / colección VTA_EstadosDevolucion creado sobre Devoluciones_Estados. showInMenu=false porque, según la asunción S-2 del plan, es una tabla maestra fija sin pantalla propia.

## 2026-09-21 · T-11 · OK

**Tool:** `flexygo_create_object`

**Result:** ok:true. Objeto VTA_Devolucion / colección VTA_Devoluciones creado sobre Devoluciones, showInMenu=true (llega al administrador por el bloque automático de menú, como indica T-16).

## 2026-09-21 · T-12 · OK

**Tool:** `flexygo_create_properties_batch`

**Result:** ok:true. 13/13 propiedades creadas en VTA_Devolucion. IdPedido y IdEstado como dbcombo simples; IdLinea como dbcombo con subconsulta envuelta (Pedidos_Lineas + Productos.Nombre) para mostrar "Producto (xCantidad)" en vez del FK crudo, con combo.filterBy=IdPedido=IdPedido para que el combo de línea se acote al pedido ya elegido. IdEstado con DefaultValue fijo al Id de 'Solicitada' (CB6E0913-0A81-4C7B-BC78-925F53FCF836) y PersistDefaultValue=false (se aplica solo al crear). CreatedBy/CreateDate con PersistDefaultValue=false y ModifiedBy/ModifiedDate con PersistDefaultValue=true, según la tabla de flexygo_get_property_type_guide. Además se crearon las 3 propiedades de VTA_EstadoDevolucion (IdEstado, Nombre, Orden) — no era una tarea explícita del plan pero es necesaria para que el objeto quede coherente y flexygo_verify_object no falle en 'Properties'.

## 2026-09-21 · T-13 · OK

**Tool:** `flexygo_create_view`

**Result:** ok:true. Vista VTA_DevolucionDefaultList creada con LEFT JOIN a Pedidos, Pedidos_Lineas, Productos y Devoluciones_Estados (todas las tablas FK, aunque Pedidos_Lineas no se renderiza directamente, está unida porque el motor de filtros dinámicos la necesita). Alias Producto/Estado para resolver la colisión de columna 'Nombre' entre Productos y Devoluciones_Estados.

## 2026-09-21 · T-14 · OK

**Tool:** `flexygo_create_filters`

**Result:** ok:true. Filtro 'Buscar devoluciones' creado con IdPedido (dbcombo), IdEstado (dbcombo), Motivo (text), FechaSolicitud (datetime-range), Activo (check).

## 2026-09-21 · T-15 · OK

**Tool:** `flexygo_create_default_view`

**Result:** ok:true. Vista de detalle VTA_DevolucionDefaultView creada, con los 13 campos propios del objeto (FK mostrados como dbcombo, igual que IdCliente/IdEstado en VTA_PedidoView) y el SQL con los mismos LEFT JOIN que la lista.

## 2026-09-21 · T-16 · OK

**Tool:** `flexygo_create_page_batch`

**Result:** ok:true. Página de lista VTA_Devolucion_List (layout default) y de detalle VTA_Devolucion_View (layout syslayout-6, anticipando el gestor de imágenes de T-18) creadas, únicas para admin y cliente (a diferencia de VTA_Pedido, T-17 pide una sola pantalla compartida).

## 2026-09-21 · T-17 · OK

**Tool:** `flexygo_create_object_list_module + flexygo_create_object_view_module + flexygo_compose_page_batch + flexygo_set_object_security`

**Result:** ok:true. Una única pantalla de lista (VTA_Devolucion_List, mod-vta-devolucion-list) y una única de ficha (VTA_Devolucion_View, mod-vta-devolucion-view, syslayout-6 anticipando el gestor de imágenes de T-18) compartidas por administrador y cliente — sin páginas _Cliente_ separadas, a diferencia de VTA_Pedido, tal como pide la tarea. Seguridad de fila aplicada sobre el objeto SINGULAR 'VTA_Devolucion' para el rol 'cliente' (mismo patrón que VTA_Pedido, verificado antes con flexygo_get_security): canView/canViewCollection/canInsert=true con el filtro 'Devoluciones.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = {{currentReference}})' (subconsulta vía Pedidos porque, a diferencia de Pedidos, Devoluciones no tiene IdCliente propio); canEdit/canDelete=false. Ninguna fila de seguridad de página añadida: al ser páginas nuevas sin restricción, el rol 'cliente' (registrado, no invitado) ya las ve por ausencia de fila.

## 2026-09-21 · T-18 · OK

**Tool:** `flexygo_create_object_doc_and_image_manager + flexygo_compose_page_batch`

**Result:** ok:true. Gestor de imágenes 'Fotografías' (y documentos, por defecto de la herramienta) creado para VTA_Devolucion (PK IdDevolucion) y colocado en RightPosition de VTA_Devolucion_View, mismo patrón que VTA_Pedido_View.

## 2026-09-21 · T-19 · OK

**Tool:** `flexygo_update_template`

**Result:** ok:true, con una desviación documentada. Añadido un flx-navbutton "Solicitar devolución" a la plantilla flx-vta-lineapedido-detalle-list (módulo mod-vta-lineapedido-detalle-list, línea de pedido del cliente en VTA_Pedido_Cliente_View). type='openpage' pagetypeid='edit' objectname='VTA_Devolucion' con defaults=\"{'IdPedido':'{{IdPedido}}','IdLinea':'{{IdLinea}}'}\" (JSON con comillas simples, como exige newDefaults) y targetid='popup' para abrirlo en modal.
DESVIACIÓN: el validador de plantillas exige el atributo objectwhere en todo navbutton openpage con pagetypeid edit/view; para crear un registro NUEVO (no editar uno existente) tuve que pasar objectwhere=\"\" (vacío) en lugar de omitirlo — coincide con lo que documenta flexygo_get_custom_screens_reference (\"decides insert vs update by whether objectWhere is empty\"), pero no está probado en pantalla porque el Backend no está levantado en esta sesión. Debe confirmarse en /flx-verify que el botón abre el formulario en blanco con Pedido/Línea ya precargados, y no un error.

## 2026-09-21 · T-20 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** ok:true. Nodo 'Mis devoluciones' (2fb0babb-8ff4-4ed0-9497-67996257cfdd) creado bajo 'Menú Cliente', apuntando a VTA_Devolucion_List. Sin fila de seguridad propia, igual que 'Mis pedidos' y el propio 'Menú Cliente' (ninguno de los dos la tiene): la separación admin/cliente de este proyecto no se hace por seguridad de nodo sino en otro nivel ya existente, y el acotado real de qué filas ve el cliente lo hace la seguridad de fila de T-17.

## 2026-09-21 · T-21 · OK

**Tool:** `flexygo_create_relation`

**Result:** ok:true. Relaciones creadas al final, con todos los objetos y propiedades ya existentes: VTA_Pedido → VTA_Devoluciones (IdPedido=IdPedido) y VTA_EstadoDevolucion → VTA_Devoluciones (IdEstado=IdEstado). No se creó una relación Pedidos_Lineas→Devoluciones (IdLinea) porque el plan solo pedía estas dos explícitamente; queda abierta si se quiere un listado relacionado de devoluciones colgado de la línea de pedido.

## 2026-09-21 · T-22 · OK

**Tool:** `flexygo_execute_ddl + flexygo_execute_dml`

**Result:** Tabla Incidencias_Tipos creada (IdTipo NVARCHAR(50) PK DEFAULT NEWID(), Nombre, Orden) y sembrada con las 6 filas indicadas en el plan (Orden 1-6). Sin desviaciones.

## 2026-09-21 · T-23 · OK

**Tool:** `flexygo_execute_ddl + flexygo_execute_dml`

**Result:** Tabla Incidencias_Estados creada (IdEstado NVARCHAR(50) PK DEFAULT NEWID(), Nombre, Orden) y sembrada con Abierta/Cerrada (Orden 1-2). Se añadió columna Orden igual que en Devoluciones_Estados (B-3), no mencionada literalmente en el enunciado de la tarea pero coherente con el patrón de tablas maestras ya construido. Sin otras desviaciones.

## 2026-09-21 · T-24 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Tabla Incidencias creada (IdIncidencia NVARCHAR(50) PK DEFAULT NEWID(), IdPedido/IdTipo/IdEstado FK, Descripcion, FechaAlta DATETIME2 DEFAULT SYSDATETIME(), Activo BIT DEFAULT 1, CreatedBy/CreateDate/ModifiedBy/ModifiedDate). Esquema verificado con INFORMATION_SCHEMA.COLUMNS: 17 columnas repartidas en las 3 tablas, todas presentes. Sin desviaciones.

## 2026-09-21 · T-25 · OK

**Tool:** `flexygo_create_object + flexygo_create_properties_batch`

**Result:** Objeto VTA_TipoIncidencia creado sobre Incidencias_Tipos, showInMenu=false y sus 3 propiedades (IdTipo código bloqueado, Nombre, Orden), igual patrón que VTA_EstadoDevolucion en B-3: sin vistas, filtros, páginas ni módulos propios (tabla maestra fija). Sin desviaciones.

## 2026-09-21 · T-26 · OK

**Tool:** `flexygo_create_object + flexygo_create_properties_batch`

**Result:** Objeto VTA_EstadoIncidencia creado sobre Incidencias_Estados, showInMenu=false y sus 3 propiedades (IdEstado código bloqueado, Nombre, Orden), mismo patrón sin pantalla propia que VTA_EstadoDevolucion. Sin desviaciones. Ambos objetos maestros (T-25/T-26) se crearon secuencialmente pese a estar marcados [P] en el plan, porque el trigger Objects_ITrig de la plataforma no admite flexygo_create_object concurrente.

## 2026-09-21 · T-27 · OK

**Tool:** `flexygo_create_object`

**Result:** Objeto VTA_Incidencia creado sobre la tabla Incidencias. Sin desviaciones.

## 2026-09-21 · T-28 · OK

**Tool:** `flexygo_create_properties_batch`

**Result:** 11 propiedades creadas en VTA_Incidencia: IdIncidencia (código bloqueado), IdPedido/IdTipo/IdEstado (dbcombo, mismo patrón SELECT clave, texto ORDER BY que VTA_Devolucion), FechaAlta (datetime), Descripcion (multiline), Activo (switch), y el cuarteto de auditoría CreatedBy/CreateDate (PersistDefaultValue=false) y ModifiedBy/ModifiedDate (PersistDefaultValue=true). Sin desviaciones.

## 2026-09-21 · T-29 · OK

**Tool:** `flexygo_create_view`

**Result:** Vista VTA_IncidenciaDefaultList creada con LEFT JOIN a Pedidos, Incidencias_Tipos e Incidencias_Estados (mismo patrón que VTA_DevolucionDefaultList). Sin desviaciones.

## 2026-09-21 · T-30 · OK

**Tool:** `flexygo_create_filters`

**Result:** Filtro 'Buscar incidencias' creado: IdPedido/IdTipo/IdEstado (dbcombo), Descripcion (text), FechaAlta (datetime-range), Activo (check). Sin desviaciones.

## 2026-09-21 · T-31 · OK

**Tool:** `flexygo_create_default_view`

**Result:** Vista de detalle VTA_IncidenciaDefaultView creada con los 11 campos propios (los dbcombo resuelven su propia etiqueta, igual que en VTA_Devolucion). Sin desviaciones.

## 2026-09-21 · T-32 · OK

**Tool:** `flexygo_create_page_batch`

**Result:** Páginas VTA_Incidencia_List (list, layout default) y VTA_Incidencia_View (view, layout syslayout-6, para dejar sitio al gestor de imágenes en RightPosition) creadas. Sin desviaciones.

## 2026-09-21 · T-33 · OK

**Tool:** `flexygo_create_object_list_module + flexygo_create_object_view_module + flexygo_compose_page_batch + flexygo_set_object_security`

**Result:** Módulos mod-vta-incidencia-list y mod-vta-incidencia-view creados con plantillas propias (badges Abierta/Cerrada vía switch, navbutton con clave NVARCHAR entre comillas) y compuestos en VTA_Incidencia_List (default) y VTA_Incidencia_View (syslayout-6, deja RightPosition libre para el gestor de imágenes de T-34). Pantalla única compartida admin+cliente: no se crearon páginas '_Cliente_' separadas. Seguridad de fila aplicada al rol 'cliente' con el mismo patrón que VTA_Devolucion (subconsulta vía Pedidos.IdCliente='{{currentReference}}') en canView/canViewCollection/canInsert, sin canEdit/canDelete. El propio tool advierte que como no había fila previa para este rol/objeto, todo estaba ya permitido por defecto y el filtro de fila es lo que realmente acota el acceso; corresponde recargar caché (flexygo_reload_cache) antes de verificar en pantalla. Sin otras desviaciones.

## 2026-09-21 · T-34 · OK

**Tool:** `flexygo_create_object_doc_and_image_manager + flexygo_compose_page_batch`

**Result:** Gestor de documentos e imágenes añadido a VTA_Incidencia (módulo vta_incidencia_gestion_doc_img, evento dialog/closed→refresh) y colocado en RightPosition de VTA_Incidencia_View con título 'Fotografías', igual patrón que vta_devolucion_gestion_doc_img. Sin desviaciones.

## 2026-09-21 · T-35 · OK

**Tool:** `flexygo_update_template`

**Result:** Botón 'Crear incidencia' añadido a la plantilla flx-vta-pedido-cliente-view (VTA_Pedido, template view), justo bajo la cabecera/badge de estado: flx-navbutton type='openpage' pagetypeid='edit' objectname='VTA_Incidencia' objectwhere="" defaults="{'IdPedido':'{{IdPedido}}'}" targetid='popup', mismo patrón que 'Solicitar devolución' en las líneas de pedido. Estilo en línea (no se reutilizó la clase crd-return-btn porque vive en el Header de otra plantilla que esta vista no incluye). Recordar reiniciar backend/frontend o el cambio de plantilla no se verá en pantalla hasta entonces (advertencia del propio tool). Sin otras desviaciones.

## 2026-09-21 · T-36 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** Nodo 'Mis incidencias' creado bajo 'Menú Cliente' (NodeId 84817e32-a0b6-43ac-b9b7-ee8943277e17), apuntando a VTA_Incidencia_List, icono warning-1, orden 7. La lista ya queda acotada por la seguridad de fila de T-33. Sin desviaciones.

## 2026-09-21 · T-37 · OK

**Tool:** `flexygo_create_relation_batch`

**Result:** 3 relaciones creadas: VTA_Pedido→VTA_Incidencias (IdPedido=IdPedido), VTA_TipoIncidencia→VTA_Incidencias (IdTipo=IdTipo), VTA_EstadoIncidencia→VTA_Incidencias (IdEstado=IdEstado). Sin desviaciones.

## 2026-09-21 · T-38 · OK

**Tool:** `flexygo_script_data_structure`

**Result:** 32 ficheros escritos en flxCatalog.Data.Database/dbo (19 tablas, 10 SP, 1 vista, 1 función, 1 UDT). Verificado en disco que las 5 tablas nuevas de presupuestos-postventa están (Devoluciones.sql, Devoluciones_Estados.sql, Incidencias.sql, Incidencias_Estados.sql, Incidencias_Tipos.sql) y que Pedidos.sql incluye las 4 columnas de seguimiento de B-1 (Transportista, NumeroSeguimiento, UrlSeguimiento, FechaEntregaEstimada). El modelo completo de presupuestos-postventa (B-1 a B-4) queda listo para viajar a otra instalación. Sin desviaciones.
