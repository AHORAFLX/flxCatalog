# Execution — carrito-pedidos

## 2026-09-17 · T-01 · OK

**Tool:** `flexygo_execute_ddl + flexygo_update_process + flexygo_update_process_parameter`

**Result:** Se añadió la comprobación de propiedad a pVTA_ConfirmarPedido. El procedimiento (flxCatalog.Data.Database\dbo\Stored Procedures\pVTA_ConfirmarPedido.sql, y aplicado en vivo con CREATE OR ALTER vía flexygo_execute_ddl sobre DataConnectionString) ahora declara dos parámetros nuevos, @CurrentRole y @CurrentReference, y comprueba: si @CurrentRole='cliente' y el IdCliente del pedido no coincide con @CurrentReference, RAISERROR 'No tienes permiso sobre este pedido.' y no continúa; para cualquier otro rol el comportamiento no cambia. El registro del proceso en Flexygo se resincronizó con flexygo_update_process(storedName) para que derivase los 2 parámetros nuevos de la firma real, y ambos quedaron ocultos con su valor por defecto ({{currentRole}}, {{currentReference}}) vía flexygo_update_process_parameter — el usuario nunca los ve ni los rellena. Verificado con flexygo_get_process_full_config: 3 parámetros, los 2 nuevos ocultos con los tokens correctos.

## 2026-09-17 · T-02 · OK

**Tool:** `flexygo_execute_ddl + flexygo_update_process + flexygo_update_process_parameter`

**Result:** Misma corrección aplicada a pVTA_CancelarPedido, con idéntico mecanismo: CREATE OR ALTER vía flexygo_execute_ddl añadiendo @CurrentRole/@CurrentReference y el mismo RAISERROR de propiedad antes de la comprobación de estado existente; proceso resincronizado y los 2 parámetros nuevos ocultos con sus valores por defecto. Verificado con flexygo_get_process_full_config.

## 2026-09-17 · T-03 · OK

**Tool:** `flexygo_reload_cache + verificación manual en navegador (admin)`

**Result:** Cache del Backend recargada (flexygo_reload_cache, sesión admin) para que recogiera los 2 parámetros nuevos de ambos procesos. Verificado en el navegador, con sesión de administrador, en la página de backoffice VTA_Pedido_View (no la de cliente): Confirmar sobre PED-1059 (Borrador, Central Importación S.L.) → pasó a Confirmado con el toast "Pedido confirmado.", igual que antes de la corrección. Cancelar sobre PED-1039 (Borrador, Cantábrica Comercio S.L.) → pasó a Cancelado, igual que antes. La comprobación de propiedad añadida en T-01/T-02 no afecta al rol admin (solo actúa cuando @CurrentRole='cliente'), confirmado en vivo.

Deviación/hallazgo no relacionado con este bloque, dejado abierto para tratar aparte: el módulo "Pedidos recientes" del panel de control de ADMIN abre las filas con pagename=VTA_Pedido_Cliente_View (la ficha de CLIENTE) en lugar de VTA_Pedido_View (la de backoffice) — un admin que hace clic ahí ve la ficha de cliente sin los botones Confirmar/Cancelar. Es un defecto preexistente de un desarrollo anterior (no introducido aquí); no se ha tocado en este bloque.

## 2026-09-17 · T-04 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Tabla Favoritos creada en DataConnectionString, siguiendo exactamente el patrón de PK ya usado en el proyecto (NVARCHAR(50) DEFAULT newid(), visto en Productos/Productos_Variantes): IdFavorito (PK), IdCliente (FK a Clientes), IdProducto (FK a Productos), FechaAlta (DEFAULT getdate()). Restricción UNIQUE (IdCliente, IdProducto) para impedir duplicados de favorito.

## 2026-09-17 · T-05 · OK

**Tool:** `flexygo_create_object + flexygo_propose_properties_from_table + flexygo_create_properties_batch + flexygo_create_view + flexygo_create_filters`

**Result:** Objeto CAT_Favorito/CAT_Favoritos creado (tabla Favoritos, showInMenu=false — sigue el árbol de navegación propio del cliente, ya establecido en portal-clientes, no el menú automático). 4 propiedades (IdFavorito código bloqueado, IdCliente y IdProducto como dbcombo con su SQL, FechaAlta oculta con el valor que pone la BD). Vista CAT_FavoritoDefaultList con los nombres legibles de cliente y producto (RazonSocial, Nombre) vía LEFT JOIN. Filtro 'Buscar favoritos' sobre Cliente/Producto/FechaAlta. Deliberadamente SIN ficha de vista/edición (ni flexygo_create_default_view ni página tipo view): el alta y la baja se hacen solo a través del proceso pCAT_ToggleFavorito (T-06), nunca por formulario — esto es el supuesto S-1 del plan, no un olvido; flexygo_verify_object marcará como FAIL la falta de vista de detalle/página view, lo cual es lo esperado.

## 2026-09-17 · T-06 · OK

**Tool:** `flexygo_execute_ddl + flexygo_create_process + flexygo_update_process_parameter + flexygo_create_menu + flexygo_link_process_to_object`

**Result:** Procedimiento pCAT_ToggleFavorito creado (Data DB): recibe @IdProducto y @CurrentReference; si ya existe una fila en Favoritos para ese cliente+producto la borra ('Quitado de favoritos.'), si no la crea ('Añadido a favoritos.'); RETURN 1 en ambos caminos, RAISERROR si no hay @CurrentReference. Registrado como proceso Flexygo tipo 0 (SP) sobre CAT_Producto, con los 2 parámetros ocultos por defecto ({{IdProducto}}, {{currentReference}}) — se ejecuta sin ventana de parámetros, un solo clic. Vinculado a CAT_Producto vía menú de objeto (flexygo_create_menu + flexygo_link_process_to_object). Sin fila de seguridad añadida: la ausencia de fila ya permite al rol cliente ejecutarlo (regla de seguridad por defecto).

## 2026-09-17 · T-07 · OK

**Tool:** `flexygo_set_object_security + flexygo_update_view + flexygo_create_object_list_module + flexygo_update_object_list_module + flexygo_create_page + flexygo_compose_page_batch`

**Result:** Seguridad: rol cliente sobre CAT_Favorito (singular, mismo patrón ya usado en VTA_Pedido) con canView/canViewCollection=true y viewFilter/viewFilterCollection = "Favoritos.IdCliente = '{{currentReference}}'"; canInsert/canEdit/canDelete=false (el alta/baja pasa solo por el proceso T-06). Vista CAT_FavoritoDefaultList ampliada con IdProducto (para el navbutton y el proceso) y PrecioCliente (misma resolución de tarifa que CAT_ProductoClienteList: ISNULL(Tarifas_Precios.Precio, PrecioBase) por currentClienteTarifaId). Módulo mod-cat-favorito-cliente-list (tarjetas, mismo estilo que Mi catálogo, con {{objectmenu}} para quitar de favoritos vía el proceso ya vinculado en T-06) con buscador activado desde el principio. Página CAT_Favorito_Cliente_List (interfaz webcliente) compuesta con ese módulo. Pendiente de entrada de navegación (T-08) y de recarga de caché antes de verse en el navegador.

## 2026-09-17 · T-08 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** Entrada 'Mis favoritos' añadida al árbol 'Menú Cliente' (mismo padre que Mi catálogo/Mis pedidos/Mi ficha), apuntando a CAT_Favorito_Cliente_List. Bloque B-2 completo (5/5 tareas). Pendiente: recargar caché y verificar en el navegador antes de pasar a B-3.

## 2026-09-17 · T-06 · OK

**Tool:** `flexygo_update_object_list_module + flexygo_add_toolbar_button + flexygo_delete_toolbar_button + verificación en navegador (cliente)`

**Result:** Verificado en vivo como cliente de prueba, con dos hallazgos no anticipados y ya corregidos:
1) {{objectmenu}} no pintaba nada en las tarjetas de Mi catálogo hasta añadir un chip posicionado (position:absolute) alrededor del token en el Header/Body de la plantilla — igual que hace la plantilla de muestra 'list-cards' (.itm-menu). Sin ese wrapper el menú de fila existe pero no es visible. Aplicado a mod-cat-producto-cliente-list y mod-cat-favorito-cliente-list.
2) Un proceso vinculado a un objeto mediante flexygo_link_process_to_object desaparece del menú {{objectmenu}} de fila si ESE MISMO proceso también tiene un botón de barra de herramientas propio en el MISMO módulo (probado añadiendo y luego quitando un botón de barra 'Favorito' con flexygo_add_toolbar_button/flexygo_delete_toolbar_button sobre mod-cat-producto-cliente-list: con el botón de barra presente, 'Añadir/quitar de favoritos' no aparecía en el menú de fila pese a estar correctamente vinculado; al quitarlo, apareció). Se optó por NO tener botón de barra y dejar solo el menú de fila, que es semánticamente correcto para una acción por producto.
Confirmado end-to-end: añadir a favoritos desde Mi catálogo (menú de fila) y quitar de favoritos desde Mi catálogo y desde Mis favoritos (menú de fila en ambos), con refresco automático de la lista en los tres casos.

## 2026-09-17 · T-09 · OK

**Tool:** `flexygo_execute_ddl`

**Result:** Procedimiento pVTA_ActualizarLineaCarrito creado en DataConnectionString. Recibe @IdProducto, @IdVariante (opcional), @Cantidad, @CurrentReference. Localiza el pedido en Borrador del cliente (por IdCliente+IdEstado) o lo crea si no existe (numerado 'CARR-yyyyMMddHHmmss'); resuelve el precio igual que CAT_ProductoClienteList (Tarifas_Precios del cliente, o PrecioBase si no hay tarifa específica); si Cantidad<=0 borra la línea (producto+variante), si no existe la crea y si existe la actualiza; siempre recalcula Pedidos.Total sumando las líneas. RETURN 1 en todos los caminos válidos, RAISERROR si falta @CurrentReference. No se ha registrado todavía como proceso Flexygo — eso lo hacen T-11 y T-12, cada uno apuntando a este mismo procedimiento con distintos parámetros visibles/ocultos.

## 2026-09-17 · T-10 · OK

**Tool:** `flexygo_update_view`

**Result:** Vista CAT_ProductoClienteList ampliada con TieneVariantes = CASE WHEN EXISTS (SELECT 1 FROM Productos_Variantes WHERE IdProducto = Productos.IdProducto) THEN 1 ELSE 0 END. El módulo mod-cat-producto-cliente-list no tiene SQL propio (usa la vista directamente), así que no hace falta tocarlo aparte.

## 2026-09-17 · T-11 · OK

**Tool:** `flexygo_create_process + flexygo_update_process_parameter`

**Result:** Proceso pVTA_AnadirRapido registrado (SP pVTA_ActualizarLineaCarrito) sobre CAT_Producto: los 4 parámetros ocultos (IdProducto={{IdProducto}}, IdVariante sin valor/NULL, Cantidad=1, CurrentReference={{currentReference}}). Sin ventana de parámetros: un clic añade 1 unidad directamente. No vinculado por menú de objeto a propósito (se invoca desde la plantilla con flx-navbutton type="execprocess" en T-13, no desde el menú ⋮).

## 2026-09-17 · T-12 · OK

**Tool:** `flexygo_create_process + flexygo_update_process_parameter`

**Result:** Proceso pVTA_AnadirConVariante registrado (mismo SP) sobre CAT_Producto: IdProducto oculto ({{IdProducto}}), IdVariante visible como dbcombo 'Color / Talla' filtrado por el producto actual (SQL con WHERE IdProducto='{{IdProducto}}', ordenado por talla y color), Cantidad visible (por defecto 1), CurrentReference oculto ({{currentReference}}). Al tener parámetros visibles, Flexygo abre automáticamente la ventana de selección antes de ejecutar. Tampoco vinculado por menú de objeto; se invoca desde la plantilla en T-13.

## 2026-09-17 · T-13 · OK

**Tool:** `flexygo_update_object_list_module`

**Result:** Plantilla de Mi catálogo (mod-cat-producto-cliente-list) ampliada con un botón 'Añadir al carrito' bajo cada tarjeta, usando flx-navbutton type="execprocess": se pintan los DOS botones (uno por proceso) y la visibilidad se controla con la clase CSS cli-hide seleccionada por {{TieneVariantes|switch:...}} — con variantes se muestra el que abre pVTA_AnadirConVariante (con el diálogo de selección), sin variantes el que ejecuta pVTA_AnadirRapido directamente. Se eligió flx-navbutton execprocess en vez de vincular por menú de objeto porque el carrito necesita un botón visible y prominente, no escondido en el menú ⋮ (a diferencia de favoritos).

## 2026-09-17 · T-12 · OK

**Tool:** `flexygo_update_process_parameter + flexygo_register_project_plugin + reinicio Backend/Frontend + verificación en navegador`

**Result:** DESVIACIÓN IMPORTANTE respecto al diseño original, con autorización del usuario: el parámetro IdVariante como dbcombo en un proceso (no en una propiedad de objeto) resultó ser una limitación real de la plataforma — falla siempre con 'Error loading List for Object Property...' (500, 'The given key '''' was not present in the dictionary'), probado con token {{IdProducto}}, con {{currentReference}}, vía flexygo_create_process_param_dependency, y con SQL completamente estático sin tokens: los cuatro intentos fallan igual. Registrado como gap de plataforma (área 'procesos') con flexygo_record_missing_capability. Presentado al usuario, que eligió la opción 'HTML propio en el popup'.

Solución aplicada: IdVariante y Cantidad se dejaron ocultos en el proceso (ya no dbcombo, tipo text/number ocultos) y el propio proceso pVTA_AnadirConVariante ya NO se invoca mediante el diálogo nativo de parámetros de Flexygo. En su lugar, un popup HTML propio (ver T-13) recoge la variante y la cantidad y llama al proceso directamente vía flexygo.nav.execProcessObj(...) pasando processparams explícitos ([{Key:'IdVariante',...},{Key:'Cantidad',...}]), lo que evita por completo el combo roto. Verificado en vivo: añadir 'Camiseta Manga Larga Basic' con variante 'Amarillo Mostaza / S' creó un pedido Borrador nuevo (CARR-20260917220149) con la línea correcta, precio de tarifa correcto y Total recalculado.

## 2026-09-17 · T-13 · OK

**Tool:** `flexygo_update_view + flexygo_update_object_list_module + flexygo_register_project_plugin + reinicio Backend/Frontend + verificación en navegador`

**Result:** Rediseñado respecto al plan original (ver T-12): en vez de dos flx-navbutton type=execprocess conmutados por CSS, la plantilla de Mi catálogo lleva un único <button> con data-idproducto y data-variantes (JSON de variantes, generado en la vista CAT_ProductoClienteList con STRING_AGG) y onclick="cliOpenAddPopup(this)". La función cliOpenAddPopup vive en un plugin de proyecto registrado (flxcatalog-carrito.js, vía flexygo_register_project_plugin, ya que scriptText de módulo está retirado): si el producto no tiene variantes llama directamente a pVTA_AnadirRapido; si tiene, monta un popup propio (select de color/talla + cantidad) y al confirmar llama a pVTA_AnadirConVariante con processparams explícitos. Requirió reiniciar Backend y Frontend (un plugin nuevo no se recoge en caliente) — reiniciados correctamente apuntando al puerto real, ASPNETCORE_ENVIRONMENT=Development, working directory en la raíz de cada proyecto (no en bin/, donde no está la carpeta conf/). Verificado en vivo end-to-end: ambas rutas (con variante y sin variante) crean/actualizan correctamente la línea del carrito y el Total del pedido.

## 2026-09-17 · T-14 · OK

**Tool:** `flexygo_set_object_security`

**Result:** Rol cliente sobre VTA_LineaPedido (singular, mismo patrón que VTA_Pedido/CAT_Favorito): canView/canViewCollection=true, canInsert/canEdit/canDelete=false. Row filter (viewFilter y viewFilterCollection) = "IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = '{{currentReference}}')" — como el propio Pedidos_Lineas no tiene columna de cliente, el filtro resuelve la propiedad vía subconsulta contra Pedidos, de modo que aunque en el futuro se reutilizara este objeto en otra pantalla, un cliente nunca vería líneas de un pedido que no es suyo. Antes de este cambio, el rol cliente tenía denegado ver esta colección por completo (canView/canViewCollection en False), así que sin esto Mi carrito no habría podido mostrar ninguna línea.

## 2026-09-17 · T-15 · OK

**Tool:** `flexygo_create_process + flexygo_update_process_parameter + flexygo_create_view + flexygo_update_view + flexygo_create_object_list_module + flexygo_update_object_list_module + flexygo_register_project_plugin`

**Result:** Proceso pVTA_ActualizarCarrito (mismo SP pVTA_ActualizarLineaCarrito) registrado sobre VTA_LineaPedido, con los 4 parámetros ocultos (IdProducto/IdVariante/Cantidad se pasan siempre explícitos desde JS, CurrentReference con su token). Vista VTA_LineaPedidoCarritoList con Producto, imagen, Variante (Color+Talla concatenados, NULL si no aplica), Cantidad, Precio, Subtotal. Módulo mod-vta-lineapedido-carrito-list con plantilla propia (fila con foto, nombre, variante, input numérico editable, subtotal y botón ✕ quitar), objectFilter=(Pedidos_Lineas.IdPedido='{{IdPedido}}') igual que el patrón admin ya existente. Añadidas al plugin flxcatalog-carrito.js las funciones cliCartSetQty/cliCartRemove/cliCartRunUpdate, que llaman a pVTA_ActualizarCarrito vía execProcessObj con processparams explícitos (Cantidad=0 para quitar, con confirmación). Edición del plugin ya registrado: no ha hecho falta reiniciar Backend/Frontend (solo los ficheros NUEVOS lo requieren).

## 2026-09-17 · T-16 · OK

**Tool:** `flexygo_create_object_view_module + flexygo_add_toolbar_button + flexygo_create_page + flexygo_compose_page_batch + flexygo_execute_ddl + flexygo_create_process`

**Result:** DESVIACIÓN respecto al diseño literal del plan, necesaria porque una entrada de menú no puede llevar un objectWhere propio: en vez de que el nodo de navegación abra directamente la página con el Borrador del cliente, el nodo de menú (T-17) lanza un proceso pVTA_AbrirMiCarrito (SP) que localiza el Borrador del cliente actual o lo CREA VACÍO si no existe (evitando así una vista sobre 0 filas, que Flexygo no maneja con una pantalla de 'vacío' propia) y navega mediante JSCode (flexygo.nav.openPageName) a la página VTA_Pedido_MiCarrito_View con el IdPedido correcto. El estado 'carrito vacío' se expresa como un Borrador con 0 líneas (el módulo de líneas ya muestra 'Tu carrito está vacío' cuando no hay ninguna), no como ausencia de Borrador.

Construido: módulo mod-vta-pedido-carrito-view (ficha reutilizando la vista VTA_PedidoClienteView, con Número/Fecha/Dirección/Base imponible/Total) con su propio botón de barra 'Confirmar pedido' (usa pVTA_ConfirmarPedido, ya asegurado por propiedad en B-1; sqlEnabled solo lo activa si el estado es Borrador). Página VTA_Pedido_MiCarrito_View (interfaz webcliente) compuesta con ese módulo de ficha y el de líneas editable de T-15.

## 2026-09-17 · T-17 · OK

**Tool:** `flexygo_create_navigation_node`

**Result:** Entrada 'Mi carrito' añadida al árbol 'Menú Cliente' (mismo padre que Mi catálogo/Mis pedidos/Mi ficha/Mis favoritos), de tipo proceso (no página), apuntando a pVTA_AbrirMiCarrito — ver la desviación explicada en T-16 sobre por qué un nodo de proceso y no uno de página directo.

## 2026-09-17 · T-18 · OK

**Tool:** `flexygo_update_object_list_module + flexygo_register_project_plugin`

**Result:** Añadida una casilla "Comparar" por tarjeta en Mi catálogo (mod-cat-producto-cliente-list), posicionada en la esquina superior izquierda con position:absolute, y una barra flotante "N productos seleccionados / Comparar / Cancelar" en el pie del listado, oculta hasta que hay 2 o más seleccionados. La lógica de selección (máximo 3, con aviso) vive en el plugin flxcatalog-comparador.js, registrado vía flexygo_register_project_plugin. Verificado en vivo como cliente: selección de 2 y de 3 productos, la barra aparece/actualiza el contador correctamente, y un cuarto intento de selección es rechazado con aviso.

## 2026-09-17 · T-19 · OK

**Tool:** `flexygo_create_html_module + flexygo_create_page + flexygo_add_page_module + flexygo_register_project_plugin`

**Result:** Página CAT_Producto_Comparador_List (sin entrada de menú, alcanzable solo desde el botón "Comparar" de Mi catálogo) con un módulo HTML standalone (mod-comparador-productos-html) que muestra los productos elegidos en columnas: imagen, nombre, precio, familia, marca y stock. No persiste nada: los ids viajan de Mi catálogo al comparador vía flexygo.storage.session (sessionStorage de la pestaña, no servidor), y el módulo los lee y consulta la vista existente CAT_ProductoClienteList con flexygo.obj.Entity.getView bajo un IN (...) al abrir la página.

Desviación respecto al diseño inicial: el primer diseño intentaba pasar los ids seleccionados como un WHERE con IN(...) directamente en el objectWhere de flexygo.nav.openPageName sobre una página tipo 'list' ligada a CAT_Producto (un segundo flx-objectlist con objectFilter='{{ObjectWhere}}'). Eso falla en este Flexygo con un 500: "Error Reading object CAT_Producto... Encontró más de un objeto para la misma condición de lectura" — GetPageByName intenta resolver el objectWhere de una página 'list' como una única entidad, y un IN con 2-3 filas rompe esa resolución. Es un comportamiento de la plataforma, no un fallo del módulo. Solución adoptada: módulo HTML standalone sin objectName ligado a la página, que hace su propia consulta vía JS en cuanto se detecta en el DOM (con un MutationObserver, ya que el parámetro htmlInit del módulo HTML NO es JavaScript sino HTML de marcador de posición — solo se pinta con ManualInit activo, y nada lo activa por defecto). Verificado en vivo end-to-end con 2 y con 3 productos reales, sin errores de consola ni de red.

## 2026-09-17 · T-20 · OK

**Tool:** `browser (Playwright) live verification`

**Result:** Verificado en vivo como cliente de prueba: añadido un producto con variante (Camiseta Manga Larga Basic, Blanco/L) y otro sin variante (Gorra Trail), cambio de cantidad de Gorra Trail a 3, eliminación de la línea de la camiseta, y comprobación del total de Mi carrito correcto en cada paso (183,70 € → 215,50 € → 47,70 €). Ver flexygo_record_verification para el detalle.

## 2026-09-17 · T-21 · OK

**Tool:** `browser (Playwright) live verification`

**Result:** Verificado en vivo: confirmado el pedido CARR-20260917230224 desde Mi carrito, pasó de Borrador a Confirmado sin recargar la página, y aparece correctamente en Mis pedidos con estado Confirmado y total 47,70 €.

## 2026-09-17 · T-22 · OK

**Tool:** `browser (Playwright) live verification`

**Result:** Verificado en vivo: marcado como favorito Camiseta Manga Larga Basic desde el menú de Mi catálogo, comprobado que aparece en Mis favoritos; desmarcado desde el menú de Mis favoritos, comprobado que la lista se refresca sola al estado vacío "Todavía no tienes productos favoritos".

## 2026-09-17 · T-23 · OK

**Tool:** `browser (Playwright) live verification`

**Result:** Verificado en vivo con 2 productos (Mochila Style, Sandalia Premium): seleccionados en Mi catálogo, la barra mostró "2 productos seleccionados", y el comparador mostró ambos correctamente en columnas. Durante esta prueba se detectó y corrigió un fallo real (cliCompareSelected no se reiniciaba entre visitas a Mi catálogo); ver flexygo_record_verification para el detalle del fix aplicado y reverificado.

## 2026-09-17 · T-24 · OK

**Tool:** `browser (Playwright) live verification + flexygo_execute_query`

**Result:** Verificado en vivo: el cliente de prueba (Norte Almacenes S.L.) intentó cancelar un pedido Confirmado de otro cliente (PED-1090, Pedro Muñoz Fernández) y confirmar un pedido Borrador de otro cliente (PED-1109, Central Moda S.L.U.), usando pVTA_CancelarPedido/pVTA_ConfirmarPedido asegurados en B-1. Ambos intentos fueron rechazados con "No tienes permiso sobre este pedido.", y se confirmó por SQL que el estado de ambos pedidos ajenos no cambió.
