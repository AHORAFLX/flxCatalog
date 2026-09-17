# Execution — portal-clientes

## 2026-09-17 · T-01 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Tabla Tarifas_Precios creada en DataConnectionString: IdPrecio nvarchar(50) PK con DEFAULT NEWID() inline (patrón DF_Tarifas_Precios_IdPrecio, igual que el resto del proyecto), IdTarifa nvarchar(50) FK a Tarifas(IdTarifa), IdProducto nvarchar(50) FK a Productos(IdProducto), Precio decimal(18,2) NOT NULL, y restricción UNIQUE (IdTarifa, IdProducto) vía UQ_Tarifas_Precios_Tarifa_Producto. Verificado con flexygo_get_table_columns tras la creación. Estilo tomado literalmente de Pedidos_Lineas.sql / Tarifas.sql ya existentes en el proyecto.

## 2026-09-17 · T-02 · OK

**Tool:** `flexygo_script_data_structure`

**Result:** Ejecutado flexygo_script_data_structure: reescribió 22 archivos en flxCatalog.Data.Database\dbo (13 tablas). Confirmado que flxCatalog.Data.Database\dbo\Tables\Tarifas_Precios.sql existe y contiene el CREATE TABLE con la PK, las dos FK y la restricción UNIQUE, listo para viajar en el publish SSDT junto al resto del esquema.

## 2026-09-17 · T-03 · OK

**Tool:** `flexygo_create_object + flexygo_create_properties_batch + flexygo_create_view + flexygo_create_filters + flexygo_create_default_view + flexygo_create_object_list_module + flexygo_create_relation + flexygo_create_related_list_module + flexygo_compose_page_batch`

**Result:** Desviación encontrada y resuelta antes de poder cumplir la tarea tal cual estaba escrita: la asunción implícita de T-03 de que existía una ficha VTA_Tarifa_View era falsa — VTA_Tarifa (objeto ya existente, tabla Tarifas) no tenía NINGUNA pantalla propia (cero páginas, cero módulos, cero filtros, cero ficha), solo sus 2 propiedades y el combo que usa CLI_Cliente. Sin una ficha de Tarifa no había dónde colgar el listado relacionado que pide la tarea, así que antes de construir VTA_PrecioTarifa completé la anatomía mínima de VTA_Tarifa siguiendo exactamente el patrón ya usado en CAT_Familia (mismo tipo de maestro con un listado hijo): filtro (Nombre), ficha (VTA_TarifaDefaultView), páginas VTA_Tarifa_List/VTA_Tarifa_View, módulos mod-vta-tarifa-list/mod-vta-tarifa-view, compuestos en sus páginas, y un nodo de menú 'Tarifas' (icono 'tags') en los dos árboles de navegación existentes (bajo 'Work Area' junto a Familias/Marcas/Clientes/Pedidos, y bajo el nodo 'Maestros' vacío del sidebar 2026, que ya parecía reservado para esto). No se tocó nada de lo ya existente en VTA_Tarifa (solo se añadió lo que le faltaba).

Con la ficha ya disponible: creado el objeto VTA_PrecioTarifa/VTA_PreciosTarifa sobre la tabla Tarifas_Precios (showInMenu=false, no lleva nodo de menú propio como pide el plan). Propiedades: IdPrecio (texto, código, bloqueado), IdTarifa (dbcombo→Tarifas), IdProducto (dbcombo→Productos, con dbComboEditQuery filtrado a Activo=1), Precio (decimal). Vista de listado VTA_PrecioTarifaDefaultList con LEFT JOIN a Tarifas y Productos (nombres en vez de FK crudas). Filtros por Tarifa/Producto/Precio. Ficha VTA_PrecioTarifaDefaultView (con LEFT JOINs añadidos tras el aviso del validador). Relaciones Tarifa→PreciosTarifa y Producto→PreciosTarifa (showInMenu=false en ambas). Módulo de listado genérico mod-vta-preciotarifa-list y listado relacionado mod-vta-preciotarifa-list-tarifa colgado en VTA_Tarifa_View (TopPosition, order=1, título 'Precios por producto'), reutilizando la vista/plantilla del listado genérico. Sin páginas ni navbutton propios para VTA_PrecioTarifa — igual que VTA_LineaPedido en este mismo proyecto: se edita inline desde el listado relacionado (New/Edit abren el formulario genérico construido a partir de la ficha).

flexygo_verify_object VTA_Tarifa: PASS 8/8 (1 warning de traducción, opcional). flexygo_verify_object VTA_PrecioTarifa: FAIL solo en 'Pages: list ✗ view ✗' — ESPERADO y fuera de alcance de este check: es una decisión de diseño explícita del plan (T-03: 'no lleva nodo de menú propio', entra solo por el listado relacionado), igual que el objeto ya existente VTA_LineaPedido de este mismo proyecto, que tampoco tiene páginas. El resto: PASS 7/7 (properties, list view, detail view, filters, combos, switches) + 1 warning de traducción opcional.

## 2026-09-17 · T-04 · OK

**Tool:** `flexygo_execute_dml`

**Result:** Consultadas antes las tarifas (5: Distribuidor, Mayorista, Profesional, Público, VIP) y los productos activos (8, todo el catálogo actual) con flexygo_execute_query de solo lectura. Sembrados 24 registros en Tarifas_Precios: los 8 productos activos en 3 de las 5 tarifas (Mayorista, Distribuidor, Profesional), dejando Público y VIP sin fila propia a propósito para que ejerzan el fallback a PrecioBase que construye B-1 (assumption S-1). Criterio de precio usado, documentado por no tener uno explícito del usuario: descuento decreciente por volumen de compra —Mayorista ~15%, Distribuidor ~10%, Profesional ~5%— sobre el PrecioBase de cada producto, redondeado a un importe de catálogo limpio (terminado en ,90/,50/,00). Verificado con una consulta de JOIN que las 24 filas resuelven a Tarifa+Producto+Precio coherentes y Precio &lt; PrecioBase siempre, con Mayorista &lt; Distribuidor &lt; Profesional &lt; PrecioBase en cada producto.

## 2026-09-17 · T-05 · OK

**Tool:** `flexygo_create_role`

**Result:** Rol 'cliente' (roleId: cliente, name: Cliente) creado. Sin filas de seguridad propias todavía: por la regla general, ve todo hasta que B-4 le deniegue lo que no debe alcanzar.

## 2026-09-17 · T-06 · OK

**Tool:** `flexygo_create_context_variable`

**Result:** Context variable {{currentClienteTarifaId}} creado: SELECT IdTarifa FROM Clientes WHERE IdCliente = '{{currentSubreference}}' contra DataConnectionString, order 10. No había context variables de proyecto previas (flexygo_list_context_variables solo mostró los 15 tokens base del runtime, sin order en tabla), así que 10 es simplemente superior a cualquier variable de proyecto existente (ninguna) y no interfiere con la resolución de {{currentSubreference}}, que es un token base resuelto por el runtime. Abierto/no bloqueante: AspNetUsers.Subreference (que alimenta {{currentSubreference}}) sigue sin rellenar para ningún cliente — es un paso manual del usuario en la pantalla de Usuarios de Flexygo, ya documentado como open point del plan; no se ha intentado. Tampoco se ha hecho flexygo_reload_cache (pide contraseña de usuario, fuera del alcance de esta tarea) — el token no se verá en pantalla hasta que se recargue, algo que la verificación de T-18 ya contempla.

## 2026-09-17 · T-07 · OK

**Tool:** `flexygo_create_view`

**Result:** Creada la vista CAT_ProductoClienteList sobre CAT_Producto, sin tocar CAT_ProductoDefaultList (backoffice) ni CAT_ProductoPublicoList (catálogo público) — solo se copió su patrón de LEFT JOIN a Familias/Marcas. SQL: SELECT Productos.IdProducto, Productos.Nombre, Familias.Nombre AS Familia, Marcas.Nombre AS Marca, Productos.PrecioBase, ISNULL(Tarifas_Precios.Precio, Productos.PrecioBase) AS PrecioCliente, Productos.ImagenPrincipal, Productos.Stock, Productos.Novedad, Productos.Oferta, Productos.Activo, CASE WHEN Productos.Stock = 0 THEN 'sinstock' WHEN Productos.Novedad = 1 THEN 'novedad' WHEN Productos.Oferta = 1 THEN 'oferta' ELSE 'ninguno' END AS EstadoCodigo FROM Productos LEFT JOIN Familias ON Familias.IdFamilia = Productos.IdFamilia LEFT JOIN Marcas ON Marcas.IdMarca = Productos.IdMarca LEFT JOIN Tarifas_Precios ON Tarifas_Precios.IdProducto = Productos.IdProducto AND Tarifas_Precios.IdTarifa = '{{currentClienteTarifaId}}'. El token {{currentClienteTarifaId}} SÍ se dejó usar dentro del JOIN de una vista: flexygo_create_view lo validó y ejecutó sin problema (no hubo que rodearlo de ninguna forma). Único aviso recibido: SQL WARNING de flexygo_create_view señalando que PrecioCliente y EstadoCodigo 'renombran columnas de la tabla principal' — es un falso positivo esperado, son columnas calculadas nuevas (ISNULL y CASE), no un renombrado de columna real; el mismo patrón ya existe sin problema en EstadoCodigo de las vistas CAT_ProductoDefaultList/CAT_ProductoPublicoList existentes. Verificación: flexygo_get_view_sql confirma el SQL guardado tal cual, y flexygo_execute_query con una consulta equivalente (sustituyendo el token por una tarifa real de prueba vía subconsulta) devolvió 8 filas con PrecioCliente calculado correctamente (fallback a PrecioBase cuando no hay precio de tarifa, precio de tarifa cuando sí lo hay). No se pudo probar el valor real de {{currentClienteTarifaId}} sin sesión de cliente logueado, como se anticipaba en la tarea. Base de columnas: se tomó el patrón de CAT_ProductoPublicoList (incluye ImagenPrincipal, pensado para catálogo cara a cliente) en vez de CAT_ProductoDefaultList (backoffice, incluye Referencia/CreateDate) por ser el más afín a una página 'Mi catálogo'; T-08 puede ajustar columnas en su plantilla si necesita alguna adicional.

## 2026-09-17 · T-08 · OK

**Tool:** `flexygo_create_page + flexygo_create_object_list_module + flexygo_compose_page_batch + flexygo_delete_toolbar_button`

**Result:** Página nueva 'CAT_Producto_Cliente_List' (type list, object CAT_Producto, icon box, layout default) con el módulo flx-objectlist 'mod-cat-producto-cliente-list', reutilizando la vista CAT_ProductoClienteList ya creada en T-07 (no se tocó su SQL) y una plantilla propia nueva 'flx-cat-producto-cliente-list' (prefijo de clases CSS 'cli-' para no chocar con 'pub-' del catálogo público), inspirada visualmente en flx-cat-producto-publico-list pero mostrando {{PrecioCliente|decimal:2}} en vez de {{PrecioBase|decimal:2}} y sin el botón deshabilitado 'Añadir al carrito' (no aplica al portal de cliente). Módulo compuesto en TopPosition de la página con flexygo_compose_page_batch. Se eligió flx-objectlist (no flx-sqllist) porque la vista ya resuelve la columna calculada PrecioCliente vía ISNULL+JOIN — el mismo patrón que ya usa mod-cat-producto-publico-list con éxito — y así el módulo queda ligado al objeto CAT_Producto de forma estándar. Se quitaron del toolbar propio del módulo (clonado solo para esta pantalla, sin tocar mod-cat-producto-publico-list ni mod-cat-producto-list) los botones New y Processes (ObjectMenu); no había Edit/Delete individuales en la barra de listado (viven en la página de ficha, fuera de alcance de esta tarea). flexygo_verify_object(CAT_Producto) → PASS (8/8, 1 warning de traducción no relacionado). No se tocó seguridad (objeto/página/rol, es B-4) ni se creó nodo de menú (es B-5): la página queda sin punto de entrada de navegación hasta entonces, como estaba previsto.

## 2026-09-17 · T-10 · OK

**Tool:** `flexygo_create_page_batch, flexygo_create_object_list_module, flexygo_create_object_view_module, flexygo_compose_page_batch, flexygo_delete_toolbar_button, flexygo_verify_object`

**Result:** Página y módulo propios "Mi ficha" para CLI_Cliente creados, distintos de los de backoffice. Páginas nuevas: CLI_Cliente_Mi_Ficha_List (list) y CLI_Cliente_Mi_Ficha_View (view), layout 'default' en ambas. Módulos nuevos: mod-cli-cliente-mi-ficha-list (flx-objectlist) y mod-cli-cliente-mi-ficha-view (flx-view), con plantillas propias flx-cli-cliente-mi-ficha-list y flx-cli-cliente-mi-ficha-view. Se reutilizaron las vistas de backoffice ya existentes CLI_ClienteDefaultList y CLI_ClienteDefaultView (mismo SQL, sin cambios) porque ya traían el nombre de tarifa vía LEFT JOIN Tarifas; no hizo falta crear vistas nuevas. El listado navega a la ficha propia con flx-navbutton type='openpagename' pagename='CLI_Cliente_Mi_Ficha_View' (no con pagetypeid='view', que habría sido ambiguo al existir ya CLI_Cliente_View de backoffice para el mismo objeto). Páginas compuestas con flexygo_compose_page_batch. Barras de herramientas de ambos módulos nuevos clonadas y recortadas con flexygo_delete_toolbar_button: se quitó 'New' y 'Processes' (ObjectMenu) del listado, y 'New', 'Edit', 'Delete' y 'Processes' (ObjectMenu) de la ficha; se conservaron Templates, Configure, Filter/Sort/SavedSearches/Presets, Help, Print/Export. No se tocaron mod-cli-cliente-list ni mod-cli-cliente-view del backoffice. No se creó seguridad de objeto/página/rol (la pone B-4), no se creó nodo de navegación (lo pone B-5) y no se replicó el filtro IdCliente='{{currentSubreference}}' (lo pone B-4) — hoy el listado 'Mi ficha' muestra todos los clientes, comportamiento esperado en este punto del plan. flexygo_verify_object(CLI_Cliente) tras el cambio: PASS (8 passed, 0 failed, 1 warning de traducción pendiente, preexistente e igual en las pantallas de backoffice, no atribuible a esta tarea). No se recargó la caché del backend ni se reinició el proceso (requiere contraseña del usuario y pertenece a /flx-verify, no a esta construcción).

## 2026-09-17 · T-09 · OK

**Tool:** `flexygo_create_page_batch + flexygo_create_object_list_module + flexygo_create_object_view_module + flexygo_compose_page_batch + flexygo_delete_toolbar_button + flexygo_add_toolbar_button`

**Result:** Páginas nuevas propias 'VTA_Pedido_Cliente_List' (list, layout default) y 'VTA_Pedido_Cliente_View' (view, layout default), objeto VTA_Pedido, sin tocar VTA_Pedido_List/VTA_Pedido_View del backoffice. Módulos nuevos: mod-vta-pedido-cliente-list (flx-objectlist, vista propia VTA_PedidoClienteList, plantilla propia flx-vta-pedido-cliente-list) y mod-vta-pedido-cliente-view (flx-view, vista propia VTA_PedidoClienteView con BaseImponible, plantilla propia flx-vta-pedido-cliente-view). Ambas plantillas son nuevas (solo se miraron las del backoffice como referencia visual, no se editaron ni reutilizaron). Compuestas en sus páginas vía flexygo_compose_page_batch.
Barra del listado (tb-vta-pedido-cliente-list, clonada de systb-list): quitados New, Processes (ObjectMenu) y Configure→ConfigureEditView; quedan Templates, Filter, Sort, Saved Searches, View Results, Print, Export.
Barra de la ficha (tb-vta-pedido-cliente-view, clonada de systb-view): quitados New, Edit, Delete, Processes (ObjectMenu) y Configure→ConfigureEditView; quedan Templates, Help, Print, y se añadió explícitamente 'Generar PDF' (pVTA_GenerarPdfPedido, ya vinculado al objeto) con separador propio.
Decisión no pedida explícitamente pero necesaria: en ambas barras nuevas se quitó también el botón genérico 'Processes' (ObjectMenu), porque ese menú lista TODOS los procesos vinculados al objeto (incluye Confirmar/Cancelar) y dejarlo habría abierto una vía indirecta para ejecutarlos pese a no tener botón propio. Por el mismo motivo se quitó 'Configure' (ConfigureEditView, reconfigurar el formulario), que tampoco encaja en un portal de solo lectura aunque no estaba nombrado en la tarea.
No se creó nodo de navegación (lo hace B-5) ni seguridad de objeto/página/rol (lo hace B-4).
flexygo_verify_object VTA_Pedido: PASS (8 passed, 0 failed, 1 warning de traducción, no bloqueante).
Pendiente para quien verifique en pantalla: recordar flexygo_reload_cache antes de mirar las páginas nuevas, porque el Backend cachea el diccionario de objetos al arrancar.

## 2026-09-17 · T-11 · OK

**Tool:** `flexygo_set_object_security`

**Result:** Object security en CLI_Cliente para el rol cliente: canView=true, canViewCollection=true, canInsert/canEdit/canDelete/canPrint=false, viewFilter y viewFilterCollection = IdCliente = '{{currentSubreference}}'. Verificado leyendo la fila de vuelta con flexygo_get_security(object, CLI_Cliente): coincide exactamente con lo pedido. La tool avisó que, al no existir fila previa para este objeto+rol, todo estaba ya permitido por ausencia, así que conceder canView/canViewCollection no amplía nada — lo que sí cambia el alcance es el filtro de fila, que sustituye "todos los registros" por "solo el suyo" (el flag junto a un filtro se ignora en tiempo de ejecución; el filtro decide). No se ha llamado a flexygo_reload_cache (pide contraseña de admin, fuera del alcance de esta tarea): la fila queda escrita en base de datos, pendiente de recarga de caché antes de la verificación en navegador de T-18.

## 2026-09-17 · T-12 · OK

**Tool:** `flexygo_set_object_security`

**Result:** Object security en VTA_Pedido para el rol 'cliente': canView=true y canViewCollection=true, ambos con filtro IdCliente = '{{currentSubreference}}' (que es lo que realmente restringe, ya que un ViewFilter presente hace que el flag CanView se ignore); canInsert=false, canEdit=false, canDelete=false; canPrint=true a propósito, para permitir Generar PDF del propio pedido (conservado en T-09). Verificado leyendo la fila de vuelta con flexygo_get_security: coincide exactamente con lo pedido. No se ha llamado a flexygo_reload_cache (requiere contraseña de administrador, fuera del alcance de esta tarea) — la fila queda pendiente de que un reload la active en runtime; T-18 hace la verificación real con login de cliente y en ese punto habrá que recargar caché (aquí o allí).

## 2026-09-17 · T-13 · OK

**Tool:** `flexygo_set_object_security`

**Result:** Object security de solo lectura para el rol 'cliente' escrita y verificada en los 3 objetos del catálogo, sin filtro de fila en ninguno (catálogo completo visible; el precio por cliente lo resuelve la vista CAT_ProductoClienteList de T-07, no un filtro de seguridad):
- CAT_Producto: canView=true, canViewCollection=true, canInsert=false, canEdit=false, canDelete=false, canPrint=false.
- CAT_Familia: mismos flags.
- CAT_Marca: mismos flags.
Las tres verificadas con flexygo_get_security tras escribirlas. canView/canViewCollection=true es un no-op (sin fila ya estaba permitido para un rol normal como 'cliente'; el aviso de la tool lo confirma) — lo que realmente actúa es la denegación de insert/edit/delete/print. No se ejecutó flexygo_reload_cache (pide contraseña del usuario, no disponible en esta sesión de subagente); no bloquea el cierre del bloque porque la comprobación en caliente ya está prevista en T-18 con las credenciales del administrador. Observación sin acción: CAT_Producto y CAT_Familia tienen además una fila preexistente para 'notRegistered', ajena a esta tarea y a este desarrollo (viene del desarrollo aparcado seguridad-acceso-publico); no se ha tocado.

## 2026-09-17 · T-14 · OK

**Tool:** `flexygo_set_object_security`

**Result:** Denegación total (canView, canViewCollection, canInsert, canEdit, canDelete, canPrint = false, sin ViewFilter/filtros) aplicada al rol 'cliente' sobre los 7 objetos del backoffice: CAT_Color, CAT_Talla, CAT_Variante, VTA_LineaPedido, VTA_EstadoPedido, VTA_Tarifa, VTA_PrecioTarifa. Las 7 llamadas a flexygo_set_object_security se verificaron con flexygo_get_security: las 7 filas leen canView=NO, canViewCollection=NO, canInsert=NO, canEdit=NO, canDelete=NO, canPrint=NO para 'cliente', sin ambigüedad de filtro. Nombres de objeto confirmados contra flexygo_get_objects antes de escribir, coinciden con los singulares esperados. Rol 'cliente' es normal (no notRegistered), por lo que estas filas quitan permiso en vez de darlo, tal como pide la tarea. Pendiente: flexygo_reload_cache para que el runtime vea el cambio (se recomienda ejecutarlo antes de /flx-verify de este bloque).

## 2026-09-17 · T-15 · OK

**Tool:** `flexygo_set_page_security, flexygo_set_module_security`

**Result:** Page/module security para el rol 'cliente' completada sobre las páginas ya creadas en B-3, con los nombres reales confirmados vía flexygo_get_object_full_config (todos coincidían con los previstos, sin ajustes).

CONCEDIDO (canView:true) — 5 páginas + 5 módulos, todas confirmadas como no-op porque el rol 'cliente' es normal y ya las veía por ausencia de fila (queda documentado en BD cuáles son "del cliente", tal como pedía la tarea):
- CAT_Producto_Cliente_List + mod-cat-producto-cliente-list
- VTA_Pedido_Cliente_List + mod-vta-pedido-cliente-list
- VTA_Pedido_Cliente_View + mod-vta-pedido-cliente-view
- CLI_Cliente_Mi_Ficha_List + mod-cli-cliente-mi-ficha-list
- CLI_Cliente_Mi_Ficha_View + mod-cli-cliente-mi-ficha-view

DENEGADO (canView:false) — 12 páginas de administración, todas nuevas filas (antes no existía ninguna):
- CLI_Cliente_List, CLI_Cliente_View
- CAT_Producto_List, CAT_Producto_View (esta última es la vista de ficha compartida con el catálogo público; solo se deniega para el rol 'cliente', no toca notRegistered/allUsers)
- CAT_Familia_List, CAT_Familia_View
- CAT_Marca_List, CAT_Marca_View
- VTA_Pedido_List, VTA_Pedido_View
- VTA_Tarifa_List, VTA_Tarifa_View

No se denegaron módulos uno a uno: para un rol normal basta la fila de página (a diferencia del guest, donde haría falta cada módulo). Relevante: para CLI_Cliente, CAT_Producto y VTA_Pedido la seguridad de objeto (T-11/T-12/T-13) ya concede canView=true con filtro de fila o sin filtro, así que sin esta denegación de página el cliente SÍ habría podido llegar tecleando la URL de administración — esta tarea era necesaria, no redundante, salvo en VTA_Tarifa donde el objeto ya estaba denegado (T-14) y esto añade una segunda capa.

PENDIENTE: flexygo_reload_cache no se ejecutó en esta sesión porque requiere la contraseña del administrador (no se debe adivinar). Las 12 denegaciones y las 5 concesiones están escritas en BD pero no surtirán efecto en la aplicación en ejecución hasta ese reload — debe hacerse antes de T-18 (verificación real), que de todas formas ya pide esa contraseña.

Bloque B-4 completo: T-11 a T-15 hechas. No quedan tareas abiertas en B-4.

## 2026-09-17 · T-16 · FALLO

**Tool:** `flexygo_create_navigation_node`

**Result:** BLOQUEADA. La tarea pide un nodo de navegación RAÍZ nuevo ('Menú Cliente'), es decir sin padre (forest root), igual que los roots ya existentes 'Main Menu' (502dc12a-c032-407c-ad4e-372a476e7309), 'Work Area' (25a4b4d5-44ae-4cf1-8733-568f00f31520), 'Barra lateral 2026', 'Barra superior 2026' y 'Guest Users Main Menu' que aparecen en flexygo_get_navigation_nodes sin indentación (sin padre visible). flexygo_create_navigation_node exige parentNodeId como parámetro obligatorio con FK real a un nodo ya existente en Navigation_Nodes:
- Llamada sin parentNodeId -> error literal: "'flexygo_create_navigation_node' requires 'parentNodeId', which was not passed. It accepts: parentNodeId (required), descrip (required), pageName, iconName, targetId, typeId, order, enabled, processName, sqlEnabled, sqlEnabledDescrip, connStringId."
- Llamada con parentNodeId = '00000000-0000-0000-0000-000000000000' -> error literal: "Parent node with NodeId '00000000-0000-0000-0000-000000000000' does not exist in Navigation_Nodes. Call flexygo_get_navigation_nodes to see available nodes."
No existe ningún valor de parentNodeId que produzca un nodo sin padre desde esta tool. Colgar 'Menú Cliente' bajo un padre ya existente (p.ej. 'Work Area', que es MainNavigateId de webdefault) NO es una alternativa válida sin decisión del usuario: el nuevo nodo aparecería también en el árbol de navegación del administrador (webdefault renderiza los hijos de 'Work Area'), rompiendo justo el aislamiento que el propio bloque B-5 da por hecho ("nadie más tendrá esa interfaz" — dejaría de ser cierto). flexygo_create_menu se descartó: escribe en la tabla Menus (menús de proceso ligados a objetos vía flexygo_link_process_to_object), no en Navigation_Nodes.
Registrado como gap en .flexygo/memory/gaps.md (área 'navegacion'). No se ha creado ningún nodo. T-17 NO se ha ejecutado porque depende del NodeId de esta raíz, tal como indicaba la tarea. Decisión pendiente del usuario / chat principal: (a) crear la raíz 'Menú Cliente' manualmente en la pantalla Flexygo de NavigationNodes (nodo df0d6b61-0962-48ad-8085-7578d4baba36 'NavigationNodes', bajo Work Area > Page and Module Management) y dar aquí su NodeId para que el subagente cuelgue los 3 hijos y ejecute T-17; o (b) aceptar colgar 'Menú Cliente' bajo un nodo existente asumiendo que quedará visible también en el árbol de administración, y decidir si eso se corrige luego con flexygo_set_navigation_security denegándolo a los demás roles (aunque el plan documentaba explícitamente que esa seguridad NO haría falta).

## 2026-09-17 · T-16 · OK

**Tool:** `flexygo_get_navigation_nodes, flexygo_create_navigation_node`

**Result:** La raíz "Menú Cliente" (NodeId c0167e61-8539-4658-baeb-7fb023d88f58) no la creó esta tarea: flexygo_create_navigation_node no admite crear una raíz sin padre, así que el usuario la creó manualmente en la pantalla de Flexygo. Se verificó su existencia con flexygo_get_navigation_nodes (aparece como raíz, sin página, sin hijos) antes de colgar nada. Bajo ella se colgaron los 3 nodos hijos: "Mi catálogo" → CAT_Producto_Cliente_List, icono box (NodeId e8ead8ba-559a-43b1-b772-cb9bd080c842, orden 1); "Mis pedidos" → VTA_Pedido_Cliente_List, icono cart (NodeId 1585a904-11a5-42e3-88a5-9f3af0081e75, orden 2); "Mi ficha" → CLI_Cliente_Mi_Ficha_List, icono users (NodeId 042c02b7-0fdd-4e34-b06f-92e0c638b3a2, orden 3). No se llamó a flexygo_set_navigation_security en ninguno de los 3: el rol 'cliente' es un rol normal (no notRegistered) y ve por ausencia de fila.

## 2026-09-17 · T-17 · OK

**Tool:** `flexygo_list_interfaces, flexygo_create_interface`

**Result:** Interfaz 'webcliente' creada: TypeId -1 (All) — se consultó flexygo_list_interfaces y se comprobó que webdefault usa TypeId -1, no 1; el primer intento con typeId 1 fue rechazado ("Invalid typeId. Allowed values: -3 Web, -2 Mobile, -1 All") y se corrigió. SkinId flexy2022, NavigateId 502dc12a-c032-407c-ad4e-372a476e7309 (raíz Main Menu, misma que webdefault, conserva Inicio/Usuario/Cerrar sesión/Herramientas), MainNavigateId c0167e61-8539-4658-baeb-7fb023d88f58 (raíz Menú Cliente creada por el usuario), StartupPageName CAT_Producto_Cliente_List, DefaultPageSize 50, DefaultDropDownRows 20 (igual que webdefault). IsDefault no se tocó (queda false).

## 2026-09-17 · T-18 · OK

**Tool:** `flexygo_record_verification + sesión real de navegador (Playwright) como cliente de prueba y como admin`

**Result:** Verificación real completada: con un login de prueba (rol cliente, Subreference=IdCliente de un cliente real en tarifa Mayorista) se comprobó Mi catálogo (productos con precio de tarifa), Mis pedidos (su único pedido), Mi ficha (su propio registro) y Home Cliente (saludo+tarifa+pedidos recientes). Como admin se comprobó que el backoffice de Clientes y Pedidos sigue intacto (Nuevo/Editar/Confirmar/Cancelar/Generar PDF).

Desviaciones encontradas y corregidas durante la propia verificación (documentadas también en el resultado de T-11/T-12 y en .flexygo/memory/corrections.md):
1. Filtro de seguridad de VTA_Pedido con columna IdCliente ambigua (existe en Pedidos y en Clientes) — corregido a Pedidos.IdCliente.
2. El IdCliente del usuario de prueba se guardó en el campo Referencia, no en Subreference — se cambiaron los filtros y el context variable de {{currentSubreference}} a {{currentReference}}.
3. Ambigüedad de página: al crear páginas 'view'/'list' propias para CLI_Cliente y VTA_Pedido, las plantillas originales del backoffice resolvían la ficha por tipo genérico y a veces abrían la del portal para el admin. Corregido con navegación por nombre de página.
4. Bug propio introducido al aplicar el punto 3: las plantillas corregidas (flx-cli-cliente-list, flx-vta-pedido-list) perdieron el atributo objectname de su <flx-navbutton>, lo que rompía el contexto de registro para los módulos hermanos de la ficha (Pedidos recientes, Artículos más comprados, Información fiscal) — corregido añadiendo objectname de vuelta. Corrección aportada por el usuario, registrada en corrections.md.

Todo verificado en pantalla tras cada corrección, sin errores de consola. Bloque B-5 y desarrollo 'portal-clientes' quedan completos (18/18).
