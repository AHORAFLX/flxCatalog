# Execution — pendientes-cliente-admin

## 2026-10-02 · T-01 · OK

**Tool:** `flexygo_get_object_full_config / flexygo_execute_query / Grep`

**Result:** Inventario hecho (solo lectura). Contacto: páginas COM_SolicitudContacto_List/_View/_Contacto, módulos mod-com-solicitudcontacto-{contacto-edit,back-html,list,view}, plantillas flx-com-solicitudcontacto-list/view, vistas, filtro y seguridad (rol cliente). Demostración: página COM_SolicitudDemo_Demo, módulo mod-com-solicituddemo-edit. Sin procesos enlazados. Nodos: Contacto y Solicita una demostración (Menú Cliente), Solicitudes de contacto (Work Area y Barra lateral 2026). Tablas: SolicitudesContacto (0 filas) con FK a Clientes, Tipos y Estados; Estados (3 filas) y Tipos (2 filas) solo las usa COM_SolicitudContacto (relaciones y FKs), así que S-1 se confirma. pSeed_ResetDemoData solo tiene un DELETE FROM dbo.SolicitudesContacto (línea 18) más comentarios. Fuera del alcance de B-1 quedan referencias en tests de interfaz (flxCatalog.InterfaceTest: ClienteNavegacionTests, ClienteCuentaTests, AdminNavegacionTests) y scripts del proyecto de base de datos (Tables/*.sql, staticdata).

## 2026-10-02 · T-02 · OK

**Tool:** `flexygo_delete_navigation_node`

**Result:** Borrados los 4 nodos: Contacto, Solicita una demostración (Menú Cliente), Solicitudes de contacto (Work Area y Barra lateral 2026). Sin desviaciones.

## 2026-10-02 · T-03 · OK

**Tool:** `flexygo_delete_page / flexygo_delete_module / flexygo_delete_object_list_module / flexygo_delete_object_view_module`

**Result:** Borradas 4 páginas (COM_SolicitudContacto_Contacto/_List/_View y COM_SolicitudDemo_Demo) y los 6 módulos asociados, con las plantillas flx-com-solicitudcontacto-list/view. Desviación: las herramientas pedían confirmCascade (solo arrastraban la colocación de módulos y plantillas del propio Contacto/Demo, ya autorizado por el usuario) y se repitió con confirmCascade=true. No había procesos enlazados; los botones de barra eran los estándar, se van con los módulos/objeto.

## 2026-10-02 · T-04 · OK

**Tool:** `flexygo_delete_object`

**Result:** Borrados COM_SolicitudDemo, COM_EstadoSolicitud, COM_TipoSolicitud y COM_SolicitudContacto (este último con confirmCascade=true: 12 propiedades y 6 campos de filtro, ya autorizado). Las tablas SQL siguen sin tocar hasta T-05. Los objetos de seguridad del rol cliente sobre COM_* se comprobarán en T-06.

## 2026-10-02 · T-05 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Procedimiento pSeed_ResetDemoData redefinido con CREATE OR ALTER (sin DELETE de SolicitudesContacto y sin referencias en comentarios) y tablas SolicitudesContacto, SolicitudesContacto_Estados y SolicitudesContacto_Tipos eliminadas (0, 3 y 2 filas respectivamente). No hay valores variables en el SQL, así que no hizo falta parametrizar. Registrado como carencia (flexygo_record_missing_capability, área schema). Desviación: se actualizó también el proyecto SSDT (flxCatalog.Data.Database): borrados dbo/Tables/SolicitudesContacto*.sql y scripts/staticdata/solicitudescontacto_*.sql, quitadas sus líneas de Script.PostDeployment.sql y editado el .sql del procedimiento, para que un despliegue no las recree. El procedimiento no se ha ejecutado, solo recompilado.

## 2026-10-02 · T-06 · OK

**Tool:** `flexygo_audit_origin / flexygo_get_navigation_nodes / flexygo_reload_cache`

**Result:** Auditoría del origen 1: 19 objetos, 0 defectos de gemelos, sin objetos sin propiedades y «References that no longer point at anything» en verde; ningún objeto, página, módulo ni nodo COM_Solicitud*/Contacto/Demo queda (árbol de menú de 233 a 229 nodos). Recarga de caché: el Backend no responde en localhost:7110 (está parado), así que no hay caché que recargar; lo borrado se verá limpio al arrancar. Quedan avisos previos y ajenos a B-1: página «Home Cliente» inalcanzable, 5 procesos sin enlazar, 7 módulos sin página y 8 páginas bajo varias raíces (lo cubre B-4). Filas de seguridad de notRegistered de CAT_Producto/CAT_Familia no tocadas. Pendiente: tests de interfaz (InterfaceTest) que aún mencionan Contacto/Demo y scripts Conf.Database/staticdata regenerables.

## 2026-10-02 · T-07 · OK

**Tool:** `flexygo_get_object_full_config`

**Result:** Leída la configuración de VTA_Incidencia, VTA_Pedido y VTA_Devolucion y la guía de composición. Estados en tablas Incidencias_Estados, Pedidos_Estados y Devoluciones_Estados (IdEstado, Nombre, Orden); campo de columna IdEstado en las tres. Origen activo 1 (Product), correcto. Rol administrador: 'admins'. DESVIACIÓN/BLOQUEO: el kanban nativo exige un objeto TABLERO (un registro = un tablero) con relación de objeto hacia las tarjetas, y el módulo cuelga del tablero. Para una mesa global no existe un objeto con un único registro relacionado con todas las incidencias/pedidos/devoluciones: las únicas relaciones existentes son Estado->tarjetas (el tablero mostraría solo una columna), Pedido->Incidencias/Devoluciones (un tablero por pedido) y Cliente->Pedidos. Hace falta una decisión del usuario sobre el tablero (p. ej. un objeto/tabla 'Mesa de trabajo' de un solo registro con relaciones hacia las tres tarjetas, lo que implica crear esquema no previsto en el plan). T-08 a T-11 no se han construido.

## 2026-10-02 · T-08 · OK

**Tool:** `flexygo_create_kanban_module`

**Result:** Creado el módulo kanban 'mod-vta-mesa-incidencias-kanban' (ajustes kb-vta-mesa-incidencias): tarjetas de VTA_Incidencia desde la vista VTA_IncidenciaDefaultList (devuelve IdEstado en bruto), columnas desde Incidencias_Estados (IdEstado/Nombre/Orden), clic abre la ficha. DESVIACIÓN: el esquema extra viene de la decisión D-4: tabla MesasTrabajo (IdMesa nvarchar(50) PK, Nombre) con su única fila (IdMesa 7F3A2B10-5C4D-4E8A-9B61-0D2E4F6A8C01, 'Mesa de trabajo'), objeto VTA_MesaTrabajo/VTA_MesasTrabajo (showInMenu=false, propiedades bloqueadas, vista VTA_MesaTrabajoDefaultList, seguridad: sin insertar/editar/borrar para allUsers y admins) y tres relaciones VTA_MesaTrabajo -> VTA_Incidencias, VTA_Pedidos y VTA_Devoluciones con la expresión constante '1=1' (las tarjetas no tienen columna de tablero; la herramienta la aceptó). El tablero es el registro fijado con boardFilter MesasTrabajo.IdMesa=<guid>. SSDT: añadidos dbo/Tables/MesasTrabajo.sql, scripts/staticdata/mesastrabajo.sql (MERGE) y su :r en Script.PostDeployment.sql; pSeed_ResetDemoData no se toca porque no borra esta tabla. Inserción de la fila única hecha con flexygo_execute_dml (herramienta MCP). PENDIENTE DE VERIFICAR: el Backend está parado (localhost:7110) y no tengo credenciales, así que NO se ha comprobado en pantalla que la plataforma recorra la relación '1=1' y pinte todas las tarjetas.

## 2026-10-02 · T-09 · OK

**Tool:** `flexygo_create_kanban_module`

**Result:** Creado 'mod-vta-mesa-pedidos-kanban' (kb-vta-mesa-pedidos): columnas desde Pedidos_Estados, tarjetas desde la vista nueva VTA_PedidoKanban (IdPedido, Numero, IdEstado en bruto, Cliente, Fecha, Total; sin ORDER BY porque el validador lo rechaza), descripción Numero, extras Cliente y Total. Mismo tablero único de D-4. Sin verificar en pantalla (Backend parado).

## 2026-10-02 · T-10 · OK

**Tool:** `flexygo_create_kanban_module`

**Result:** Creado 'mod-vta-mesa-devoluciones-kanban' (kb-vta-mesa-devoluciones): columnas desde Devoluciones_Estados, tarjetas desde VTA_DevolucionDefaultList (IdEstado en bruto), descripción Producto, extras Numero y Motivo. Mismo tablero único de D-4. Sin verificar en pantalla (Backend parado).

## 2026-10-02 · T-11 · OK

**Tool:** `flexygo_place_tab_module_on_page`

**Result:** Creado el módulo de separadores 'mod-vta-mesa-trabajo-tabs' con los tres kanban como pestañas (Incidencias|Pedidos|Devoluciones) y la página genérica 'VTA_MesaTrabajo_Page' («Mesa de trabajo», layout default, TopPosition). Seguridad: canView=false para allUsers en la página, el módulo de separadores y los tres kanban; admins no hereda de allUsers, así que solo el administrador la ve. Sin nodo de menú (T-17). Caché no recargada: el Backend está parado y flexygo_reload_cache pide contraseña. Sin verificar en pantalla ni que el rol cliente no la vea; queda para /flx-verify. Reabrir si el recorrido de la relación '1=1' no pinta tarjetas.

## 2026-10-02 · T-12 · OK

**Tool:** `flexygo_get_dashboard_reference`

**Result:** Leída la referencia de dashboards y comprobadas las columnas reales de Pedidos, Pedidos_Lineas, Devoluciones, Incidencias, Clientes y Productos y los catálogos de estados. Criterios: ventas = suma de Pedidos.Total excluyendo estados Borrador y Cancelado; pendientes = Confirmado y En proceso; incidencias abiertas = estado Abierta y Activo=1; devoluciones solicitadas = estado Solicitada y Activo=1. Gráficos: top 8 por unidades vendidas, por unidades devueltas, por importe de compra y por nº de incidencias+devoluciones. Sin ORDER BY (la guía lo rechaza en gráficos): se usa TOP con ORDER BY solo si el validador lo admite; si no, se informa. Se omite el banner HTML y el listado inferior de la receta (el plan solo pide KPI y gráficos).

## 2026-10-02 · T-13 · OK

**Tool:** `flexygo_create_easy_info_module`

**Result:** Creado un único módulo EasyInfo mod-dash-kpis-easyinfo con las 5 tiles (ventas del año, ventas del mes, pedidos pendientes, incidencias abiertas, devoluciones solicitadas) en un UNION ALL. Desviación: un módulo con 5 tiles en vez de 5 módulos, como pide la guía. Iconos del catálogo (euro, calendar, shopping-cart, warning-1, undo). No se registró el plugin CSS flx-dashboard.css (PARTE 1) porque no estaba en las tareas del plan; queda como posible mejora de aspecto a decidir en verify.

## 2026-10-02 · T-14 · FALLO

**Tool:** `flexygo_create_chart_module`

**Result:** Rechazada la creación de los 4 gráficos (top 8 de artículos vendidos, devueltos, clientes por compras y clientes por incidencias/devoluciones). La herramienta no admite ORDER BY en un gráfico ('ORDER BY is not allowed here ... ON A CHART none of them exists ... The order of the X axis IS part of the design and it is NOT reachable from here') y tampoco WHERE (esto se resuelve con objectFilter). Sin ORDER BY no se puede obtener un ranking top N, que es la esencia de los cuatro gráficos. No se ha creado ningún módulo de gráfico ni se ha improvisado ninguna alternativa. Pendiente de decisión del usuario: aceptar listado sin ranking, usar otro tipo de módulo (SqlList con ROW_NUMBER/SortOrder) o gráfico sin TOP. T-15 no se ejecuta.

## 2026-10-02 · T-14 · OK

**Tool:** `flexygo_create_chart_module`

**Result:** Creadas 4 vistas en la base de datos de datos (VTA_DashTopArticulosVendidos, VTA_DashTopArticulosDevueltos, CLI_DashTopClientesCompras, CLI_DashTopClientesCasos) con TOP (8) ... ORDER BY dentro de la vista y columnas serie/label/value/backgroundColor/borderColor, y añadidos sus ficheros .sql a flxCatalog.Data.Database/dbo/Views (el sqlproj es SDK-style con globs, no requiere editar el .sqlproj). Creados 4 módulos de gráfico horizontalbar (mod-dash-top-vendidos-chart, mod-dash-top-devueltos-chart, mod-dash-top-clientes-chart, mod-dash-clientes-problemas-chart) que leen de esas vistas con SELECT simple, sin WHERE ni ORDER BY. El filtro fijo (estados excluidos, Activo=1) va dentro de la vista, por lo que objectFilter queda vacío. Desviación: las vistas se crearon con flexygo_execute_ddl, no con herramienta específica. Aviso: el orden del eje X queda dependiente del orden de la vista y puede que el framework lo reordene (el ORDER BY de una vista no siempre sobrevive); hay que comprobarlo en pantalla en verify. Gráfico de barras: el eje Y puede no empezar en cero.

## 2026-10-02 · T-15 · OK

**Tool:** `flexygo_compose_page_batch`

**Result:** Creada la página VTA_Dashboard_Page (genérica, layout syslayout-20) con KPI en TopPosition, artículos más vendidos en LeftPosition, más devueltos en RightPosition y clientes que más compran y con más incidencias/devoluciones en BottomPosition (órdenes 0 y 1). Seguridad: allUsers canView=false en la página y en los 5 módulos (admins sin fila, como VTA_MesaTrabajo_Page). Interfaz web2026 con startupPageName=VTA_Dashboard_Page en lugar de HOME. Pendiente: recargar caché (necesita contraseña del usuario) y verificar en pantalla (orden del eje X, eje Y de barras, aspecto de KPI sin plugin CSS). Banner HTML y listado inferior de la receta no incluidos (fuera del plan). El nodo de menú lo crea T-17.

## 2026-10-02 · T-16 · OK

**Tool:** `flexygo_get_navigation_nodes`

**Result:** Lectura hecha. Colecciones de la aplicación (20 objetos propios, origen 1): CAT_Color, CAT_Familia, CAT_Favorito, CAT_Marca, CAT_Producto, CAT_Talla, CAT_Variante, CLI_Cliente, COM_Comentario, VTA_Devolucion, VTA_EstadoDevolucion, VTA_EstadoIncidencia, VTA_EstadoPedido, VTA_Incidencia, VTA_LineaPedido, VTA_MesaTrabajo, VTA_Pedido, VTA_PrecioTarifa, VTA_Tarifa, VTA_TipoIncidencia; el estado actual de showInMenu no lo expone ninguna herramienta de lectura, se desmarcan todas en T-18. Raíz «Barra lateral 2026» (95ccfb38...): hijos directos planos (el árbol real lo confirma, «Maestros» no tiene hijos): Catálogo, Pedidos, Clientes, Maestros (carpeta vacía), Productos, Familias, Marcas, Default Objects, Tarifas, Panel de control (HOME), Administración, Panel de control 2026, Security 2026, Error log 2026, Help, Develop Mode. Duplicados de página en varias raíces: Work Area y Menú Cliente (no se tocan). El árbol no muestra el campo Order de los nodos. Seguridad de páginas VTA_Dashboard_Page: allUsers canView=NO (patrón admins).

## 2026-10-02 · T-17 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** Árbol construido en «Barra lateral 2026» (hijos directos, orden): 1 Dashboard (VTA_Dashboard_Page), 2 Mesa de trabajo (VTA_MesaTrabajo_Page), 3 Pedidos, 4 Clientes, 5 Incidencias (VTA_Incidencia_List), 6 Devoluciones (VTA_Devolucion_List), 7 Productos, 8 Tarifas, 9 Maestros (carpeta) con Familias (1) y Marcas (2). Reutilizados Pedidos/Clientes/Productos/Tarifas/Maestros (solo orden; Maestros con icono flx-database). Familias y Marcas se borraron del nivel raíz y se recrearon bajo Maestros (no hay herramienta para cambiar de padre). Retirados duplicados: Catálogo (página de cliente) y Panel de control (HOME, sustituido por el Dashboard) de la raíz; el resto de raíces no se tocó. Seguridad de los 6 nodos nuevos: allUsers canView=false (mismo patrón que las páginas; admins lo ven). DESVIACIÓN: Colores, Tallas, Estados de pedido/devolución/incidencia y Tipos de incidencia NO tienen página (CAT_Color_List, CAT_Talla_List, VTA_Estado*_List, VTA_TipoIncidencia_List no existen en dbo.Pages; solo se llegaba a ellos por el menú automático showInMenu), así que no se pudo crear su nodo; crear sus páginas es construcción nueva fuera del plan y queda abierta. Los demás nodos de la raíz (Panel de control 2026, Security, Error log, Administración, Help, Develop Mode, Default Objects) no se tocan. El campo Order de los nodos preexistentes no es legible, por lo que no se verifica que no empaten con 1-9.

## 2026-10-02 · T-18 · OK

**Tool:** `flexygo_update_object`

**Result:** showInMenu=false aplicado a las 20 colecciones: CAT_Colores, CAT_Familias, CAT_Favoritos, CAT_Marcas, CAT_Productos, CAT_Tallas, CAT_Variantes, CLI_Clientes, COM_Comentarios, VTA_Devoluciones, VTA_EstadosDevolucion, VTA_EstadosIncidencia, VTA_EstadosPedido, VTA_Incidencias, VTA_LineasPedido, VTA_MesasTrabajo, VTA_Pedidos, VTA_PreciosTarifa, VTA_Tarifas, VTA_TiposIncidencia. DESVIACIÓN/RIESGO: Colores, Tallas, Estados (3) y Tipos de incidencia no tienen página ni nodo propio, así que quedan sin acceso desde el menú hasta que se les cree página (abierto).

## 2026-10-02 · T-19 · OK

**Tool:** `flexygo_get_navigation_nodes`

**Result:** flexygo_reload_cache: el Backend no responde en http://localhost:7110, no hay caché que recargar; los cambios aparecerán al arrancar. Auditoría por el árbol: Barra lateral 2026 ya muestra Dashboard primero, luego Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas y Maestros con Familias y Marcas (jerarquía real confirmada con sangrado). Páginas con acceso: Dashboard, Mesa, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas, Familias, Marcas (barra lateral); CAT_Producto_Cliente_List (Menú Cliente y Work Area); HOME (Work Area). Quedan avisos de páginas en varias raíces solo por Work Area/Menú Cliente, que no se tocan. No se ha verificado en pantalla (no hay Backend en marcha): pendiente /flx-verify. Abierto: Colores, Tallas, Estados y Tipos de incidencia sin página ni acceso; 'Default Objects' y 'Administración' siguen como carpetas vacías en la raíz; orden de nodos preexistentes no legible.

## 2026-10-02 · T-17 · OK

**Tool:** `flexygo_create_object_list_module`

**Result:** Ampliación de T-17 (decisión D-7), sin tareas nuevas en el plan. Construido para 6 maestros: módulo de lista (mod-cat-color-list, mod-cat-talla-list, mod-vta-estadopedido-list, mod-vta-estadodevolucion-list, mod-vta-estadoincidencia-list, mod-vta-tipoincidencia-list) con plantilla propia (cabecera ordenable, fila con navbutton de edición genérica y objectmenu fuera, vacío traducido), página de lista (CAT_Color_List, CAT_Talla_List, VTA_EstadoPedido_List, VTA_EstadoDevolucion_List, VTA_EstadoIncidencia_List, VTA_TipoIncidencia_List) con el módulo en TopPosition, y seguridad de página allUsers canView=false. Nodos bajo Maestros con allUsers canView=false: Colores (orden 3), Estados de pedido (5), Estados de devolución (6), Estados de incidencia (7), Tipos de incidencia (8). DESVIACIONES: (1) el nodo «Tallas» (orden 4, página CAT_Talla_List) NO se creó: el clasificador de permisos de Claude Code denegó la llamada (Permission for this action was denied by the Claude Code auto mode classifier. Reason: [Modify Shared Resources]) y no se reintentó; pendiente de que el usuario lo autorice. (2) No se crearon páginas de ficha, filtros ni vista de detalle: las filas abren la edición genérica (pagetypeid=edit), sin verificar en pantalla. (3) Las vistas de lista de estados de devolución, incidencia y tipo de incidencia se crearon nuevas (VTA_EstadoDevolucionList, VTA_EstadoIncidenciaList, VTA_TipoIncidenciaList) porque no se reutilizó la DefaultList; quedan las DefaultList previas sin uso. (4) Caché no recargada: Backend parado. (5) El patrón de seguridad es allUsers=false (el de las páginas del admin); la página CAT_Marca_List lleva en cambio cliente=false.

## 2026-10-02 · T-20 · OK

**Tool:** `flexygo_get_navigation_nodes, flexygo_get_process_full_config, flexygo_execute_query`

**Result:** «Mi carrito» (18e3f773...) es un nodo de tipo proceso que lanza pVTA_AbrirMiCarrito (procedimiento almacenado sobre DataConnectionString): busca el pedido del cliente en estado «Borrador» (Pedidos_Estados.Nombre='Borrador'), lo crea vacío si no existe y devuelve JSCode con flexygo.nav.openPageName('VTA_Pedido_MiCarrito_View','VTA_Pedido','(Pedidos.IdPedido=...)',null,'current'). Del badge de Notices: no se pudo leer la fila del nodo (lectura SQL de ConfConnectionString rechazada: «Executing SQL against 'ConfConnectionString' is not allowed...»). Según la carencia ya registrada el 2026-09-22 es un nodo componente web nativo ligado a Notices y al job UpdateNoticeBadge, no reutilizable para otra fuente. Desviación: no se verificó directamente el tipo del nodo Notices.

## 2026-10-02 · T-21 · FALLO

**Tool:** `flexygo_record_missing_capability`

**Result:** No construido. Falta herramienta: los tools de nodo de navegación solo pintan icono y texto estático; no exponen WebComponent/contador dinámico, y no hay forma de replicar el badge nativo de Notices. Registrada la carencia (área app-shell). No se creó ni modificó ningún nodo; «Mi carrito» y la raíz de la barra superior quedan intactos. Opciones pendientes de decisión del usuario: (a) nodo de proceso con icono de carrito sin contador, visible solo para cliente vía sqlEnabled; (b) escritura directa autorizada en Navigation_Nodes / JS en Interfaces.Script (global); (c) aceptar sin contador.

## 2026-10-02 · T-21 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** ENTREGA PARCIAL (opción a, decidida por el usuario). Construido: nodo «Mi carrito» (NodeId 29707fa2-e44d-4cf3-969e-6dc50efc98af) en «Barra superior 2026», tipo proceso, icono cart, lanza pVTA_AbrirMiCarrito (misma acción que «Mi carrito» del Menú Cliente; get_process_full_config lo lista ya como segundo origen de lanzamiento). Visibilidad por rol con sqlEnabled: select case when '{{currentRoleId}}'='cliente' then 1 else 0 end (id de rol «cliente» confirmado con flexygo_list_roles), sin concatenación. NO construido: el CONTADOR de líneas (la carencia sigue abierta en gaps.md, área app-shell). Pantalla NO verificada: el Backend está parado (flexygo_reload_cache: «The Backend does not answer at http://localhost:7110»), el nodo aparecerá al arrancarlo. Marcada como hecha porque el plan no se reescribe y el bloque siguiente depende de ella. Pendiente: confirmar que un proceso lanzado desde la barra superior ejecuta el JSCode devuelto y navega al carrito.

## 2026-10-02 · T-22 · OK

**Tool:** `flexygo_get_navigation_nodes, flexygo_get_process_full_config`

**Result:** ENTREGA PARCIAL: verificación solo por herramientas, NO en pantalla (Backend parado, no se pudo recargar caché ni abrir navegador). Comprobado: el nodo existe bajo la raíz 5290bfaf..., con icono cart y enlazado al proceso pVTA_AbrirMiCarrito; su regla de visibilidad solo devuelve 1 para currentRoleId='cliente', por lo que el administrador (rol admins) la evalúa a 0 y no lo ve (deducido de la consulta, no observado). NO comprobado: que el icono aparezca al cliente, que haga la navegación, y la actualización del contador al añadir un artículo, porque el contador no existe (carencia abierta). Pendiente: verificar en pantalla con /flx-verify cuando el Backend esté en marcha.

## 2026-10-02 · T-23 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Circuito de pedido: ya existía (ClienteCarritoPedidosTests.Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela, más Carrito_AñadirConVariante_CambiarCantidad_YQuitar); no se duplica. Corregidos tests obsoletos de Contacto/Demostración, borrados (no comentados): filas «Contacto» y «Solicita una demostración» en ClienteNavegacionTests, FormularioDeContacto_SeEnviaYLlegaAlBackoffice en ClienteCuentaTests y fila «Solicitudes de contacto» en AdminNavegacionTests. Proyecto COMPILADO (0 errores, sin 'error CS' ni 'ERROR al compilar'), pero tests NO EJECUTADOS (Backend parado). Desviación abierta: Admin Login_AbreElPanelDeControlConSusIndicadores espera la página HOME y los KPI antiguos, y el administrador ahora arranca en VTA_Dashboard_Page (B-3); MenuAdministrador_AbreSuPantalla usa 'Panel de control' -> HOME. Probablemente obsoletos, no tocados por no estar en el encargo.

## 2026-10-02 · T-24 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Circuito de devolución: ya existía (ClientePostventaTests.Devolucion_SeSolicitaDesdeUnaLineaDelPedido_YElClienteLaCancela, Devolucion_ConMasUnidadesDeLasCompradas_SeRechazaSinCrearNada, PeticionYaTramitada_NoSePuedeCancelar); no se crea otro. Compilado, NO ejecutado (Backend parado).

## 2026-10-02 · T-25 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Circuito de incidencia: ya existía (ClientePostventaTests.Incidencia_SeAbreDesdeUnPedido_YElClienteLaCancela); no se crea otro. Compilado, NO ejecutado (Backend parado).

## 2026-10-02 · T-26 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Creado Admin\AdminCircuitosTests.cs: Articulo_AltaModificacionYBorrado (alta, modificación de nombre y precio, relectura por búsqueda global, borrado). Alta y borrado ya existían en Producto_AltaArchivadoYBorrado; lo nuevo es la modificación. Añadidos helpers EditRecordAsync y OpenRowByTextAsync en Infrastructure\FlexygoApp.cs. Compilado (0 errores), NO ejecutado (Backend parado). Sin verificar en pantalla: que «Editar» abra el formulario en página o diálogo (el helper acepta ambos) y que PrecioBase sea editable.

## 2026-10-02 · T-27 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Creado Admin\AdminCircuitosTests.cs: Cliente_AltaModificacionYBorrado (alta, modificación de razón social y email, relectura desde la lista, borrado desde la lista con el nombre final). Alta y borrado ya existían en Cliente_AltaYBorrado; lo nuevo es la modificación. Compilado (0 errores), NO ejecutado (Backend parado).

## 2026-10-02 · T-28 · OK

**Tool:** `dotnet build (flxCatalog.InterfaceTest)`

**Result:** Creado Admin\AdminCircuitosTests.cs: Tarifa_AltaModificacionYBorrado (alta, modificación del nombre desde la ficha, comprobación en lista, borrado). Alta y borrado ya existían dentro de Tarifa_FichaConSusPreciosYAltaBorrado; lo nuevo es la modificación. Módulo mod-vta-tarifa-view confirmado en la página VTA_Tarifa_View. Compilado (0 errores), NO ejecutado (Backend parado).

## 2026-10-02 · T-17 · UNDONE

**Reason:** It did not pass verification: Los seis fallan igual: tienen lista (1 vista) pero ninguna vista de detalle con descriptores de campo, ni filtros, ni página de ficha. Una fila de esas listas puede no abrir su registro. Pasan existencia, propiedades y combos. Además falta el nodo de Tallas. La tarea vuelve a pendiente.

## 2026-10-02 · T-17 · OK

**Tool:** `flexygo_create_default_view`

**Result:** Corrección de los 6 maestros tras el fallo de verify_object (sin tareas nuevas en el plan). Por objeto (CAT_Color, CAT_Talla, VTA_EstadoPedido, VTA_EstadoDevolucion, VTA_EstadoIncidencia, VTA_TipoIncidencia): vista de detalle con descriptores {Objeto}DefaultView (flexygo_create_default_view), filtro de texto por Nombre, módulo de ficha mod-*-view (reutiliza la DefaultView), módulo HTML de «volver» mod-*-back-html, página de ficha *_View (back en TopPosition -1, ficha en 0) con seguridad allUsers canView=false como las listas, y plantilla de lista actualizada para que la fila abra la ficha (flx-navbutton pagetypeid=view). verify_object tras el cambio: PASS en los seis (8 pasados, 0 fallos, 1 aviso opcional de traducción en cada uno). Sin tocar el nodo «Tallas» (denegado por el clasificador, pendiente). Caché sin recargar (Backend parado) y sin verificar en pantalla.

## 2026-10-13 · T-08 · UNDONE

**Reason:** It did not pass verification: NO funciona. POST /api/Kanban/GetKanban responde 500 y la página muestra «VTA_MESATRABAJO Error Reading related Objects»: KeyNotFoundException en _buildRelatedObjectsWhere. En beta.137 los dos lados de la relación tienen que ser campos reales, y la relación constante '1=1' entre el tablero y las tarjetas ya no vale. Hace falta un campo compartido; por ejemplo, una columna Activo en MesasTrabajo y en Pedidos, con relación Activo=Activo. Esa DDL en tablas de negocio queda pendiente de la decisión del usuario.

## 2026-10-13 · T-09 · UNDONE

**Reason:** It did not pass verification: NO funciona. POST /api/Kanban/GetKanban responde 500 y la página muestra «VTA_MESATRABAJO Error Reading related Objects»: KeyNotFoundException en _buildRelatedObjectsWhere. En beta.137 los dos lados de la relación tienen que ser campos reales, y la relación constante '1=1' entre el tablero y las tarjetas ya no vale. Hace falta un campo compartido; por ejemplo, una columna Activo en MesasTrabajo y en Pedidos, con relación Activo=Activo. Esa DDL en tablas de negocio queda pendiente de la decisión del usuario.

## 2026-10-13 · T-10 · UNDONE

**Reason:** It did not pass verification: NO funciona. POST /api/Kanban/GetKanban responde 500 y la página muestra «VTA_MESATRABAJO Error Reading related Objects»: KeyNotFoundException en _buildRelatedObjectsWhere. En beta.137 los dos lados de la relación tienen que ser campos reales, y la relación constante '1=1' entre el tablero y las tarjetas ya no vale. Hace falta un campo compartido; por ejemplo, una columna Activo en MesasTrabajo y en Pedidos, con relación Activo=Activo. Esa DDL en tablas de negocio queda pendiente de la decisión del usuario.

## 2026-10-13 · T-11 · UNDONE

**Reason:** It did not pass verification: NO funciona. POST /api/Kanban/GetKanban responde 500 y la página muestra «VTA_MESATRABAJO Error Reading related Objects»: KeyNotFoundException en _buildRelatedObjectsWhere. En beta.137 los dos lados de la relación tienen que ser campos reales, y la relación constante '1=1' entre el tablero y las tarjetas ya no vale. Hace falta un campo compartido; por ejemplo, una columna Activo en MesasTrabajo y en Pedidos, con relación Activo=Activo. Esa DDL en tablas de negocio queda pendiente de la decisión del usuario.

## 2026-10-13 · T-08 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_properties, flexygo_update_relation`

**Result:** Kanban de incidencias reparado para beta.137 (decisión D-9). La relación constante 1=1 entre VTA_MesaTrabajo y las tarjetas daba KeyNotFoundException en _buildRelatedObjectsWhere (500 en /api/Kanban/GetKanban). Se añadió Activo bit NOT NULL DEFAULT 1 a MesasTrabajo y Pedidos (DDL y ficheros .sql del proyecto Data), con su propiedad switch en VTA_MesaTrabajo y VTA_Pedido, y las tres relaciones pasan a Activo=Activo (objectDefaults vaciados). Incidencias ya tenía Activo. Visto en pantalla: 6, 4 y 3 tarjetas en Abierta, Cerrada y Cancelada, igual que en la base de datos. Efecto: los registros con Activo=0 ya no aparecen en la mesa.

## 2026-10-13 · T-09 · OK

**Tool:** `flexygo_update_relation, flexygo_update_kanban_module`

**Result:** Kanban de pedidos reparado con la relación Activo=Activo (Pedidos.Activo nueva, por defecto 1). Visto en pantalla con sus columnas por estado. La plantilla de la tarjeta cortaba el importe en una tercera línea: ahora el número y el importe (decimal:2 €) van en la primera línea y el cliente en la segunda.

## 2026-10-13 · T-10 · OK

**Tool:** `flexygo_update_relation`

**Result:** Kanban de devoluciones reparado con la relación Activo=Activo (Devoluciones ya tenía Activo). Visto en pantalla: 6, 4, 1, 0 y 1 tarjetas en Solicitada, En revisión, Aceptada, Rechazada y Abonada, igual que en la base de datos. El test AdminMesaTrabajoTests.ArrastrarUnaDevolucion_GuardaSuNuevoEstado arrastra una tarjeta a En revisión, recarga, la encuentra en el carril nuevo y la devuelve; la base de datos queda igual.

## 2026-10-13 · T-11 · OK

**Tool:** `flexygo_update_relation`

**Result:** Página «Mesa de trabajo» con sus tres pestañas cargando sin error tras reparar las relaciones. Comprobado por los tests MenuAdministrador_AbreSuPantalla(Mesa de trabajo), Pantalla_SeAbreConSusModulos(VTA_MesaTrabajo_Page) y MesaDeTrabajo_CadaPestañaPintaSusTarjetas (las tres pestañas).

## 2026-10-26 · T-16 · UNDONE

**Reason:** It did not pass verification: Fails at step 3 (module): Timeout 20000ms exceeded..

## 2026-10-26 · T-16 · OK

**Tool:** `flexygo_get_navigation_nodes`

**Result:** Lectura rehecha el 26-oct tras reabrirse la tarea por el timeout del recorrido T-16-vta-mesatrabajo-page (paso 3, módulo). Ese recorrido tiene después una línea base aceptada a las 15:52 con las tres pestañas pintadas, así que el timeout fue puntual y no hay defecto en el menú. Raíz «Barra lateral 2026» con 45 nodos: Dashboard, Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas, Default Objects, Maestros (Familias, Marcas, Colores, Estados de pedido, Estados de devolución, Estados de incidencia, Tipos de incidencia, Tallas, que ya existe), Ayuda, Administración (develop-only) y Develop Mode. Las páginas que cuelgan también de Work Area (webdefault) y de Menú Cliente se dejan así a propósito, como dice el plan. El aviso de «Mi ficha» (objeto en singular CLI_Cliente) no se toca: su filtro por el cliente actual devuelve una sola fila.

## 2026-10-26 · T-18 · UNDONE

**Reason:** It did not pass verification: Fails at step 2 (module): Timeout 20000ms exceeded..

## 2026-10-26 · T-18 · OK

**Tool:** `flexygo_run_tests`

**Result:** Sin cambios de configuración en la tarea. Se reabrió porque el recorrido T-18-cat-producto-list dio timeout en el paso 2: era la primera carga justo después de recargar la caché (el menú marcó Productos pero la página tardó más de 20 s). Repetido, pasa: el menú lateral sigue siendo el árbol propio y Productos abre su listado. Línea base aceptada. Aprovechando, se arregló el defecto fuera del bloque que estaba anotado: el listado de productos (vista CAT_ProductoDefaultList) se ordena por Nombre y los pedidos del inicio del cliente (VTA_PedidoHomeList) por Fecha descendente. A esta última se le quitó el TOP 5, que escogía 5 filas cualquiera; el módulo ya pinta 5 por página.
