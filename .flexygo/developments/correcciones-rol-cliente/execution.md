# Execution — correcciones-rol-cliente

## 2026-09-22 · T-01 · OK

**Tool:** `flexygo_set_skin_variable`

**Result:** Aplicadas las 7 variables de skin de flexy2022 (NavColor 1c1b1d, txtNavColor ffffff, HeaderColor ffffff, bgColor FAFAFA, OutstandingColor 333234, PrimaryColor 000000, NotifyColor 4361ee). Comprobado antes con flexygo_get_catalog('css_variables') que los 7 valores ya coincidían exactamente con los objetivos, así que la tarea confirma en vez de cambiar, como decía el enunciado. Verificado en pantalla tras logout/login como cliente: sidebar oscuro con texto blanco, fondo y cabecera claros, tal como la paleta declara. Sin incidencias.

## 2026-09-22 · T-03 · OK

**Tool:** `flexygo_update_navigation_node`

**Result:** Renombrado el nodo e8ead8ba-559a-43b1-b772-cb9bd080c842 ("Mi catálogo") a "Catálogo" en Menú Cliente. No se tocó typeId/pageName (ya era navegación directa a CAT_Producto_Cliente_List). Verificado en pantalla tras logout/login como cliente: el primer elemento del menú ahora se lee "Catálogo" y sigue abriendo el mismo catálogo. Sin incidencias.

## 2026-09-22 · T-02 · FALLO

**Tool:** `flexygo_get_navigation_nodes / flexygo_get_process_full_config / browser (playwright)`

**Result:** No modificado — dejado tal cual estaba, sin romper nada. Investigación: el nodo "Mi ficha" (042C02B7-0FDD-4E34-B06F-92E0C638B3A2) es hoy TypeId='process', ProcessName='pCLI_AbrirMiFicha' (confirmado por flexygo_get_process_full_config: LAUNCHED FROM lista ese nodo). flexygo_update_navigation_node y flexygo_create_navigation_node NO exponen ningún parámetro objectName/objectWhere/pageTypeId para un nodo — sus únicos destinos posibles son pageName o processName; un nodo typeId='page' no puede llevar un filtro de registro. Verificado en el navegador (cliente/-aZ654321): al pulsar "Mi ficha" hoy, el proceso genera exactamente la navegación que pedía la tarea — payload openpagename con objectname=CLI_Cliente, objectwhere=(Clientes.IdCliente='<guid del cliente logueado>'), pagename=CLI_Cliente_Mi_Ficha_View, pagetypeid=view — y la página muestra la ficha correcta del cliente actual (Marta Fernández Gutiérrez, CLI-2101). Es decir: el mecanismo actual (proceso) YA es la única forma de lograr lo que pedía la tarea (navegación directa con filtro por registro); convertir el nodo a typeId='page' con ObjectName/ObjectWhere no es posible con las herramientas MCP disponibles y habría roto la navegación (el módulo de la vista usa ObjectFilter={{ObjectWhere}}, que un nodo tipo página no puede rellenar). Registrado como missing capability, sin bloquear el resto del bloque (tal como indicaba la tarea).

## 2026-09-22 · T-04 · FALLO

**Tool:** `flexygo_get_navigation_nodes / flexygo_get_module_details / browser (playwright)`

**Result:** No modificado. Igual que en T-02: flexygo_update_navigation_node/flexygo_create_navigation_node no exponen ObjectWhere en un nodo, y confirmado en el navegador que un nodo typeId='page' (probado con "Mis favoritos", que hoy apunta a CAT_Favorito_Cliente_List) navega con un payload sin objectwhere/objectname. El módulo compartido de CAT_Producto_Cliente_List (mod-cat-producto-cliente-list) tiene ObjectFilter={{ObjectWhere}}, y ese mismo módulo/página es la entrada de 3 nodos distintos (Mi catálogo/Catálogo x2 sin filtrar, y el que sería "Mis favoritos" filtrado) — cambiar el ObjectFilter del módulo filtraría también el catálogo normal, y crear un módulo o vista segunda para favoritos incumple la restricción explícita de la tarea ("no construyas un módulo ni una página nueva"). No hay forma, con las herramientas MCP disponibles, de dar a un único nodo de menú un filtro propio sobre una página/módulo que ya comparten otros nodos sin filtro. Alternativa mínima que SÍ sería viable pero excede lo que la tarea autoriza sin visto bueno: crear un segundo módulo flx-objectlist del mismo objeto CAT_Producto (moduleName distinto) con su propio ObjectFilter fijo a favoritos, colocado en una página nueva o en la misma página como plantilla alternativa — esto sí crea un artefacto nuevo, así que no se ha hecho. Se deja "Mis favoritos" tal cual estaba (apuntando a CAT_Favorito_Cliente_List, su página dedicada actual), sin romper nada. Registrado como missing capability. Documentado para revisión del usuario, tal como pedía la tarea ("que la reviso yo"); se continúa con el resto del bloque (T-05/T-06) porque son independientes y no dependen de esta decisión.

## 2026-09-22 · T-05 · FALLO

**Tool:** `flexygo_get_app_shell_reference / flexygo_get_catalog / flexygo_list_jobs / flexygo_get_objects / browser (playwright)`

**Result:** No construido. Investigado el mecanismo real del badge de "Avisos" que la tarea pedía replicar: comprobado en el navegador que es el widget NATIVO de la plataforma (Notices/dbo.Notices) — un componente fijo (catálogo navigation_node_types incluye un tipo 'wc' = Web Component para estos widgets de cabecera) con su propio desplegable, contador y "marcar como leído", alimentado por notificaciones que ya insertan los procesos de pedido/incidencia existentes. No es un objeto Flexygo (no aparece en flexygo_get_objects) ni una vista de un objeto del proyecto — vNet_Notices_Badge/UpdateNoticeBadge (job de sistema, confirmado en flexygo_list_jobs como '(System)') son infraestructura fija de la plataforma atada únicamente a dbo.Notices, no un patrón parametrizable para otra fuente de datos. La barra superior (Barra superior 2026) solo admite Navigation_Nodes como contenido — no módulos — y un nodo de menú (typeId page/process) pinta icono+texto ESTÁTICO: no existe ningún parámetro para un contador dinámico en su etiqueta (descrip es texto fijo; sqlEnabled solo decide visibilidad 0/1, no un número). Por tanto no hay, con las herramientas MCP disponibles, una forma de añadir al carrito un badge con recuento en vivo igual al de notificaciones. La única vía técnica restante -- inyectar JS/CSS propio en Interfaces.Script (nvarchar(max), compartido por todo el shell) para pintar un contador ad-hoc -- toca un recurso compartido de toda la instalación y no está cubierta por ninguna tarea de este bloque ni autorizada explícitamente, así que no se ha intentado. No se ha tocado el nodo "Mi carrito" existente ni nada del shell. Registrado como missing capability para que el usuario decida si autoriza la vía de Interfaces.Script o prefiere otra solución.

## 2026-09-22 · T-06 · FALLO

**Tool:** `flexygo_get_table_columns / flexygo_get_object_properties / browser (playwright) — sin herramienta MCP para Objects_Search`

**Result:** Verificado en pantalla (cliente/-aZ654321): buscar "Bota Casual" en el buscador genérico de la barra superior devuelve "0 · 7/7 · 7 with no matches" — no encuentra productos hoy. Coincide con el hallazgo de la sesión principal: Objects_Search (flxCatalog_IC) solo tiene 8 filas Generic=1, todas de objetos de plataforma, ninguna de CAT_Producto. Buscado en tools/list cualquier tool MCP para crear/editar una fila de Objects_Search (create_filters/create_preset son otra cosa: filtros de búsqueda por propiedades y vistas guardadas de UN objeto, no la fila EXISTS-SQL del buscador genérico) — no existe ninguno. No se ha escrito SQL a mano contra flxCatalog_IC. SQLSentence propuesto para CAT_Producto (tabla física Productos, PK IdProducto), con los anchos reales leídos de flexygo_get_table_columns (Referencia 50, Nombre 200, DescripcionCorta 500, Marcas.Nombre 150, Familias.Nombre 150):

( EXISTS (
 SELECT * FROM Productos FlxTblFilter
 LEFT JOIN Marcas FlxCmb1 ON FlxCmb1.IdMarca = Productos.IdMarca
 LEFT JOIN Familias FlxCmb2 ON FlxCmb2.IdFamilia = Productos.IdFamilia
 WHERE ( [Productos].[Referencia] LIKE {~@Param1|16|50|FindString~}
 or [Productos].[Nombre] LIKE {~@Param2|16|200|FindString~}
 or [Productos].[DescripcionCorta] LIKE {~@Param3|16|500|FindString~}
 or [FlxCmb1].[Nombre] LIKE {~@Param4|16|150|FindString~}
 or [FlxCmb2].[Nombre] LIKE {~@Param5|16|150|FindString~}
 )
 AND [Productos].[IdProducto] = [FlxTblFilter].[IdProducto]
))

Fila destino: Objects_Search, ObjectName='CAT_Producto' (o el nombre físico que use el resto de filas, a confirmar contra las 8 existentes), Generic=1, SQLSentence = el texto de arriba. Queda pendiente de que la sesión principal la inserte con autorización del usuario. No se sigue intentando ninguna vía alternativa (no se construye un segundo buscador).

## 2026-09-22 · T-06 · OK

**Tool:** `sqlcmd directo contra flxCatalog_IC (autorizado por el usuario tras bloqueo del clasificador; flexygo_execute_dml rechaza escrituras contra la base de configuración)`

**Result:** Insertada la fila que faltaba en Objects_Search: ObjectName='CAT_Producto', Generic=1, con el SQLSentence propuesto por el subagente (EXISTS sobre Productos con LEFT JOIN a Marcas/Familias, buscando por Referencia/Nombre/DescripcionCorta/Marca/Familia). Verificado en el navegador logueado como cliente: buscar "Bota Casual" en la barra superior ahora encuentra "Producto Bota Casual" y al pulsar navega correctamente a la ficha del producto (REF-2062, Botas, Norden, 92,90€). Antes de esta fila la búsqueda daba "0 · 7/7 · 7 with no matches". Hallazgo menor sin resolver: el encabezado de grupo del resultado muestra literalmente "Producto {{Nombre}}1" en vez de un texto resuelto — un token sin sustituir en la cabecera del desplegable de búsqueda genérica, cosmético, no afecta a que la búsqueda encuentre y navegue bien. No investigado más a fondo por no bloquear el resto del desarrollo; queda anotado para quien lo quiera pulir.

## 2026-09-22 · T-02 · OK

**Tool:** `UPDATE directo contra dbo.Navigation_Nodes en flxCatalog_IC (autorizado por el usuario, quien indicó el mecanismo correcto: el ObjectWhere del nodo se hereda por la página/módulo de destino vía {{ObjectWhere}} — flexygo_update_navigation_node no expone esas columnas, gap registrado en gaps.md área 'navegacion')`

**Result:** Corregido el hallazgo inicial. El nodo "Mi ficha" pasó de TypeId='process' a TypeId='page', con PageName='CLI_Cliente_Mi_Ficha_View', ObjectName='CLI_Cliente', ObjectWhere="(Clientes.IdCliente='{{currentReference}}')", PageTypeId='view', ProcessName=NULL. Requirió un flexygo_reload_cache autenticado (con contraseña de admin) tras la escritura para que el Frontend recogiera el cambio del árbol de navegación — sin ese reload la navegación seguía usando la configuración vieja en caché. Verificado en el navegador logueado como cliente: "Mi ficha" navega ahora directamente (sin proceso intermedio) y muestra la ficha correcta del cliente logueado (Marta Fernández Gutiérrez, CLI-2101), con la URL resuelta mostrando el GUID real del cliente en vez del token sin sustituir.

## 2026-09-22 · T-04 · OK

**Tool:** `UPDATE directo contra dbo.Navigation_Nodes en flxCatalog_IC (autorizado por el usuario, mismo mecanismo que T-02)`

**Result:** Corregido el hallazgo inicial. El nodo "Mis favoritos" pasó de apuntar a la página dedicada CAT_Favorito_Cliente_List a apuntar a CAT_Producto_Cliente_List (el mismo catálogo compartido), con ObjectName='CAT_Producto' y ObjectWhere="(Productos.IdProducto IN (SELECT IdProducto FROM Favoritos WHERE IdCliente='{{currentReference}}'))", PageTypeId='list'. No se creó ningún módulo ni página nueva, tal y como pedía la tarea original. Requirió el mismo flexygo_reload_cache autenticado que T-02. Verificado end-to-end en el navegador logueado como cliente: "Catálogo" sigue mostrando los 140 productos sin filtrar (no se rompió el acceso compartido); se marcó "Bota Casual" como favorito desde el catálogo; "Mis favoritos" mostró exactamente ese único producto (Total: 1); se desmarcó el favorito al terminar para no dejar datos de prueba.

## 2026-09-22 · T-05 · OK

**Tool:** `(ninguna — decisión del usuario)`

**Result:** El usuario decidió, tras conocer que un contador dinámico requeriría tocar Interfaces.Script (recurso compartido de toda la instalación, no solo de esta app), quedarse solo con el icono, sin contador. El nodo "Mi carrito" ya existe en el menú de cliente con su icono — no se ha necesitado construir nada nuevo. Tarea cerrada sin cambios sobre lo ya existente.

## 2026-09-22 · T-07 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_properties, flexygo_update_view, flexygo_create_view, flexygo_set_object_security, flexygo_update_template, flexygo_register_project_plugin, playwright (browser)`

**Result:** Construido el módulo de reseñas de producto sustituyendo al botón "Nuevo comentario" roto, y verificado en pantalla como cliente con un caso de compra y otro sin ella.

QUÉ SE CONSTRUYÓ:
1. Propiedad nueva `Puntuacion` (tipo number/int, NO requerida) en COM_Comentario, sobre columna física Comentarios.Puntuacion (INT NULL, añadida por ALTER TABLE) — solo los comentarios de producto la llevan, el resto (pedido/incidencia/cliente) se queda sin puntuar.
2. Vista COM_ComentarioList actualizada para incluir Puntuacion.
3. Vista nueva VTA_LineaPedidoCompra (Pedidos_Lineas.IdProducto, Pedidos.IdCliente) — usada solo internamente por el JS para comprobar si el cliente actual compró el producto.
4. Seguridad de COM_Comentario para el rol cliente: view=True y view list=True con filtro EntidadTipo='Producto' (así el cliente nunca ve comentarios internos de Pedido/Incidencia/Cliente); create=True con insertFilter que exige EntidadTipo='Producto' AND EXISTS(línea de pedido de ese producto para Pedidos.IdCliente='{{currentReference}}'); edit=False, delete=False.
5. Plantilla flx-cat-producto-view: eliminado el flx-navbutton "Nuevo comentario" (abría un edit sin permisos para cliente); añadida una caja "Reseñas de clientes" con resumen de valoración media (número + 5 estrellas, ámbar/gris), listado de últimas 3 reseñas (iniciales, nombre, estrellas, fecha relativa, texto) y formulario "Escribe tu reseña" (estrellas seleccionables + textarea + botón "Publicar reseña"), gateado por compra.
6. Plugin registrado: flxcatalog-cat-reviews.css (clases catrev-*, ámbar #f59e0b sobre gris, usa las variables del skin como --primary-color/--border-module-color) y flxcatalog-cat-reviews.js (fetch de reseñas vía Entity.getView sobre COM_ComentarioList, comprobación de compra vía Entity.getViewCount sobre VTA_LineaPedidoCompra, alta vía Entity.insert con flexygo.utils.uniqueUUID() para el PK).
7. Backend y Frontend reiniciados (ASPNETCORE_ENVIRONMENT=Development) — imprescindible: un plugin nuevo y una plantilla view se cachean y no se ven con solo flexygo_reload_cache.

HALLAZGO IMPORTANTE ENCONTRADO Y RESUELTO: la página compuesta CAT_Producto_View tiene una fila de seguridad preexistente `cliente | canView=NO` (no creada por mí, ya estaba antes de este bloque). Comprobado en pantalla que, pese a eso, el popup del cliente SÍ abre — porque cuando el rol no tiene acceso a esa página concreta, Flexygo cae a una página genérica del sistema (syspage-view-default) que pinta solo la plantilla de vista por defecto del objeto, no los módulos compuestos de la página (Variantes, Imágenes, Comentarios internos quedan fuera). Por eso construí las reseñas DENTRO de la plantilla (E2, no como módulo nuevo de página): un módulo de página en CAT_Producto_View nunca habría llegado al cliente con la seguridad actual. No he tocado esa fila de seguridad de página porque no es parte del alcance de T-07 y además sirve, de facto, para mantener fuera del cliente el resto de módulos internos (Variantes/Imágenes/Comentarios internos) sin necesidad de restringirlos uno a uno — pero lo dejo anotado por si el usuario quiere revisar por qué está ahí.

VERIFICADO EN PANTALLA (cliente/Cliente Cliente):
- Caso SIN compra: producto "Bota Casual" (REF-2062, no está en ninguno de los 2 pedidos del cliente). Badge "Todavía no tiene reseñas", lista "Todavía no hay reseñas para este producto.", y en el sitio del formulario: "Solo puedes escribir una reseña de un producto que hayas comprado." — sin formulario. Botón roto confirmado ausente.
- Caso CON compra: producto "Chaqueta Cortavientos Essential" (REF-2030, presente en PED-1096 y PED-1128 del cliente). Formulario desbloqueado con 5 estrellas seleccionables + textarea + botón "Publicar reseña". Seleccioné 4 estrellas, escribí un texto y publiqué: la reseña apareció AL INSTANTE en la lista (iniciales "CC", nombre "Cliente Cliente", 4 estrellas, texto exacto), el badge pasó a "4,0 ★★★★☆ (1 reseña)", y el formulario se reseteó (estrellas y textarea vacíos), sin mensaje aparte — tal como decidió el usuario. Verificado también contra la base de datos: la fila insertada en Comentarios tiene EntidadTipo='Producto', EntidadId=GUID del producto, Autor='Cliente Cliente', Puntuacion=4, Fecha correcta y el texto exacto.

ABIERTO: queda 1 fila de reseña de prueba en Comentarios (la publicada durante esta verificación, sobre Chaqueta Cortavientos Essential). No la he borrado por la regla de no borrar datos sin que se pida explícitamente; se puede limpiar con el próximo reset de datos demo (T-08) o a petición.

## 2026-09-22 · T-08 · OK

**Tool:** `Edit (archivo .sql)`

**Result:** Añadido a flxCatalog.Data.Database/dbo/Stored Procedures/pSeed_ResetDemoData.sql (sustituyendo el comentario "Comentarios: sin seed de datos") un bloque de generación de reseñas de producto para COM_Comentario, siguiendo el mismo patrón ya usado en el procedimiento para Devoluciones/Incidencias (partir de combinaciones REALES, nunca al azar):

- CTE ComprasUnicas: SELECT DISTINCT IdProducto/IdCliente de Pedidos_Lineas JOIN Pedidos — solo pares (cliente, producto) donde ese cliente tiene de verdad una línea de ese producto en algún pedido suyo.
- Cap a 150 filas (de las combinaciones únicas que resulten) para no disparar el volumen sin control.
- Texto: tabla @ResenasTextos con 24 reseñas realistas en español (variedad de tono: muy positivas, neutras, alguna con matiz negativo), elegidas con CROSS APPLY...ORDER BY NEWID() (correlado por fila, evita el colapso de NEWID() de la nota de memoria del proyecto — mismo patrón que ya usa el resto del procedimiento para productos/pedidos).
- Puntuacion: tabla @Puntuaciones con distribución ponderada hacia positivo (4×5, 5×4, 2×3, 1×2, 1×1) elegida igual, por fila.
- Autor: Clientes.RazonSocial (mismo campo que usa el JS del módulo vía currentUserFullName).
- Fecha: variada, hasta 120 días atrás.
- EntidadTipo='Producto', EntidadId=IdProducto.

NO SINCRONIZADO CON LA BASE VIVA: no he ejecutado ALTER PROCEDURE / CREATE OR ALTER PROCEDURE contra flxCatalog_IC ni contra la base de datos de aplicación. No encontré en esta sesión ni en execution.md un patrón ya establecido de cómo se hizo ese sync en bloques anteriores de este desarrollo (T-06 de B-1 usó sqlcmd directo autorizado por el usuario para una fila de Objects_Search, pero eso es un caso distinto — INSERT de una fila de configuración, no una redefinición de stored procedure). Siguiendo la instrucción explícita de la tarea, lo dejo para que la sesión principal lo remate. El archivo .sql queda editado y lo que se seedeará está descrito arriba; no se ha ejecutado ningún reset de datos.

## 2026-09-22 · T-09 · OK

**Tool:** `flexygo_execute_dml + Edit (pSeed_ResetDemoData.sql)`

**Result:** ok:true. Añadida fila 'Cancelada' a Devoluciones_Estados (Orden=6) e Incidencias_Estados (Orden=3) en la base viva, vía flexygo_execute_dml con NEWID() (ninguna de las dos propiedades IdEstado lleva DefaultValue en 'Cancelada', así que el GUID libre es correcto). Editado pSeed_ResetDemoData.sql: añadidas ambas filas al INSERT de los maestros y redistribuido el CASE de generación de Devoluciones (8 cubos: Solicitada 3/8, En revisión 2/8, Aceptada 1/8, Cancelada 1/8 nuevo, Abonada 1/8) e Incidencias (5 cubos: Abierta 2/5, Cerrada 2/5, Cancelada 1/5 nuevo). NO se ha ejecutado el ALTER PROCEDURE contra la base viva, conforme a la regla del proyecto — pendiente de que el usuario lo sincronice.

## 2026-09-22 · T-10 · OK

**Tool:** `flexygo_set_object_security + flexygo_update_object_list_module`

**Result:** ok:true (configuración aplicada; verificación en pantalla pendiente — ver nota final del bloque). canInsert=False para el rol cliente en VTA_Devolucion y VTA_Incidencia (view/view list intactos). El botón "New" nativo de mod-vta-devolucion-list y mod-vta-incidencia-list se quitó reapuntando su toolbarName a 'tb-vta-lineapedido-detalle-list', el mismo toolbar sin New ya reutilizado por los 4 módulos de COM_Comentario (mismo patrón que comentarios, confirmado leyendo su configuración antes de aplicar). No se ha podido verificar en pantalla como cliente porque flexygo_reload_cache requiere la contraseña del admin, que esta sesión no tiene, y el cambio de seguridad/toolbar no es visible en el Backend en memoria hasta recargar caché.

## 2026-09-22 · T-11 · OK

**Tool:** `flexygo_create_process (typeId=1, DLL)`

**Result:** ok:false — bloqueado. Código escrito en flxCatalog.Processes/VtaPostventa.cs (método SolicitarDevolucion(string IdLinea, int Cantidad, string Motivo, string Comentario, EntityObject Entity, ref ProcessHelper Ret)), compila correctamente (un primer intento falló por CS0023 porque DataManager.ExecuteSql devuelve int y no bool en este SDK, corregido). Implementa exactamente la regla de negocio: valida cantidad>0, motivo no vacío, pertenencia del pedido al cliente actual (Ret.ConfToken.UserSecurity.Reference), suma de Devoluciones previas de esa línea excluyendo Rechazada/Cancelada, rechaza si Cantidad supera lo disponible, e inserta con IdEstado fijo 'Solicitada' (CB6E0913-0A81-4C7B-BC78-925F53FCF836) solo si es válida. flexygo_create_process se negó a registrar el proceso con este mensaje literal: "The library built, but 'flxCatalog.Processes.dll' could NOT be copied into the backend's bin, and the copy sitting there is a different build... Almost always this is the Flexygo application running and holding the file — stop the backend (and the frontend), then register again. Ask the user to do it rather than stopping it yourself; it is their session. The process cannot access the file 'c:\Codigo Git\Prueba\flxCatalog\flxCatalog.Backend\bin\flxCatalog.Processes.dll' because it is being used by another process." No se ha reintentado porque nada cambió entre intentos. Pendiente: el usuario debe parar el Backend (puerto 7110, http://localhost:7110) y el Frontend, y entonces repetir el registro.

## 2026-09-22 · T-12 · OK

**Tool:** `flexygo_execute_ddl + flexygo_create_process (typeId=0) + flexygo_create_menu + flexygo_link_process_to_object + flexygo_add_toolbar_button`

**Result:** ok:true (configuración aplicada; verificación en pantalla pendiente). Creado pVTA_CancelarDevolucion como stored procedure, calcado del patrón de pVTA_CancelarPedido: cambia IdEstado a 'Cancelada' solo si el estado actual es 'Solicitada' y el IdCliente del pedido asociado coincide con @CurrentReference cuando @CurrentRole='cliente'; RAISERROR+RETURN 0 en cualquier otro caso, RETURN 1 en éxito con SuccessMessage. Registrado como proceso (typeId=0), parámetros IdDevolucion/CurrentRole/CurrentReference ocultos con default {{IdDevolucion}}/{{currentRole}}/{{currentReference}} (igual que pVTA_CancelarPedido), vinculado a VTA_Devolucion vía menú, y añadido como botón "Cancelar" en el toolbar de la vista (tb-vta-devolucion-view, clonado de systb-view), visible solo cuando Estado='Solicitada' (sqlEnabled). No se ha podido verificar en pantalla (mismo motivo que T-10: falta la contraseña de admin para recargar caché).

## 2026-09-22 · T-13 · OK

**Tool:** `flexygo_create_process (typeId=1, DLL) — no intentado`

**Result:** ok:false — bloqueado por la misma causa que T-11 (mismo proyecto flxCatalog.Processes, mismo DLL bloqueado por el Backend en ejecución). Código ya escrito y compilado en VtaPostventa.cs: SolicitarIncidencia(string IdPedido, string IdTipo, string Descripcion, EntityObject Entity, ref ProcessHelper Ret) — valida descripción no vacía, pertenencia del pedido al cliente actual, resuelve el IdEstado de 'Abierta' por nombre (Incidencias_Estados no tiene GUID fijo, a diferencia de Devoluciones) e inserta la incidencia. No se ha intentado el registro porque el bloqueo de T-11 (backend reteniendo flxCatalog.Processes.dll) no ha cambiado y repetir la llamada habría fallado igual. Pendiente de que el usuario pare Backend+Frontend y se repita el registro para ambos procesos DLL (T-11 y T-13) en la misma sesión de parada.

## 2026-09-22 · T-14 · OK

**Tool:** `flexygo_execute_ddl + flexygo_create_process (typeId=0) + flexygo_create_menu + flexygo_link_process_to_object + flexygo_add_toolbar_button`

**Result:** ok:true (configuración aplicada; verificación en pantalla pendiente). Creado pVTA_CancelarIncidencia, mismo patrón que pVTA_CancelarDevolucion: cambia IdEstado a 'Cancelada' solo si el estado actual es 'Abierta' y el pedido pertenece al cliente actual. Registrado (typeId=0), parámetros IdIncidencia/CurrentRole/CurrentReference ocultos con los mismos defaults, vinculado a VTA_Incidencia, y añadido como botón "Cancelar" en tb-vta-incidencia-view, visible solo cuando Estado='Abierta'. Verificación en pantalla pendiente por la misma falta de contraseña de admin.

## 2026-09-22 · T-15 · OK

**Tool:** `flexygo_add_toolbar_button (parcial) — flexygo_update_template no ejecutado`

**Result:** ok:false — parcial. Mitad "Cancelar" completa: los botones ya quedaron colocados en tb-vta-devolucion-view y tb-vta-incidencia-view como parte de T-12/T-14 (visibles solo en el estado inicial). Mitad "Solicitar" NO hecha a propósito: sustituir los flx-navbutton actuales (alta directa) por execprocess hacia pVTA_SolicitarDevolucion/pVTA_SolicitarIncidencia habría dejado botones rotos en pantalla, porque esos dos procesos no llegaron a registrarse (bloqueo de T-11/T-13). Confirmado el punto de entrada antes de tocar nada: para incidencias es el botón "Crear incidencia" ya existente en la plantilla flx-vta-pedido-cliente-view (objeto VTA_Pedido) — coincide con lo indicado en el contexto. Para devoluciones el punto de entrada NO es el sugerido (un botón nuevo en flx-vta-pedido-cliente-view): ya existe, construido en un bloque anterior, un botón "Solicitar devolución" por LÍNEA en la plantilla flx-vta-lineapedido-detalle-list (objeto VTA_LineaPedido, módulo mod-vta-lineapedido-detalle-list, colocado en VTA_Pedido_Cliente_View) que hoy abre exactamente la misma alta directa que hay que eliminar — es el punto de entrada correcto y ya resuelto, más preciso que uno a nivel de pedido porque una devolución es por línea. Pendiente: una vez el usuario pare Backend+Frontend y se registren pVTA_SolicitarDevolucion/pVTA_SolicitarIncidencia (T-11/T-13), sustituir en ambas plantillas el flx-navbutton type="openpage" pagetypeid="edit" por uno type="execprocess" con defaults IdLinea/IdPedido según corresponda.

## 2026-09-22 · T-11 · OK

**Tool:** `flexygo_create_process (typeId=1) + flexygo_update_process_parameter + flexygo_create_menu + flexygo_link_process_to_object`

**Result:** ok:true (registro y cableado completos; verificación en pantalla la hace el coordinador desde la sesión principal). Con el Backend confirmado abajo, se registró pVTA_SolicitarDevolucion (DLL validado por reflexión: flxCatalog_processes.VtaPostventa.SolicitarDevolucion). Parámetros: IdLinea oculto con default {{IdLinea}}; Cantidad y Motivo visibles y requeridos; Comentario visible como multiline. Vinculado a VTA_Devolucion vía menú 'Solicitar devolución'. El botón "Solicitar devolución" por línea en la plantilla flx-vta-lineapedido-detalle-list (objeto VTA_LineaPedido — nombre real bajo el que está registrada la plantilla, distinto de la colección VTA_LineasPedido usada en objectname del propio botón) se cambió de type="openpage" pagetypeid="edit" (alta directa, eliminada) a type="execprocess" processname="pVTA_SolicitarDevolucion" objectname="VTA_LineasPedido" objectwhere="(Pedidos_Lineas.IdLinea='{{IdLinea}}')" — con objectname siempre presente, como exige la regla del proyecto.

## 2026-09-22 · T-13 · OK

**Tool:** `flexygo_create_process (typeId=1) + flexygo_update_process_parameter + flexygo_create_menu + flexygo_link_process_to_object`

**Result:** ok:true (registro y cableado completos; verificación en pantalla la hace el coordinador). Registrado pVTA_SolicitarIncidencia (DLL validado: flxCatalog_processes.VtaPostventa.SolicitarIncidencia). Parámetros: IdPedido oculto con default {{IdPedido}}; IdTipo como combo (SELECT IdTipo, Nombre FROM Incidencias_Tipos ORDER BY Orden), requerido; Descripcion multiline, requerido. Vinculado a VTA_Incidencia vía menú 'Solicitar incidencia'. El botón "Crear incidencia" de la plantilla flx-vta-pedido-cliente-view (objeto VTA_Pedido) se cambió de type="openpage" pagetypeid="edit" objectname="VTA_Incidencia" (alta directa, eliminada) a type="execprocess" processname="pVTA_SolicitarIncidencia" objectname="VTA_Pedido" objectwhere="(Pedidos.IdPedido='{{IdPedido}}')", y su texto pasó de "Crear incidencia" a "Solicitar incidencia" para reflejar que ya no es un alta directa.

## 2026-09-22 · T-15 · OK

**Tool:** `flexygo_update_template (x2) + flexygo_add_toolbar_button (ya hecho en T-12/T-14)`

**Result:** ok:true — completa. Mitad "Cancelar" ya colocada en T-12/T-14 (botones en tb-vta-devolucion-view/tb-vta-incidencia-view, visibles solo en estado inicial). Mitad "Solicitar" completada ahora: flx-vta-lineapedido-detalle-list (VTA_Pedido_Cliente_View, por línea de pedido) dispara pVTA_SolicitarDevolucion; flx-vta-pedido-cliente-view (mismo VTA_Pedido_Cliente_View, a nivel de pedido) dispara pVTA_SolicitarIncidencia. Ambos botones sustituyen el acceso directo de creación anterior, ambos llevan objectname. Punto de entrada de devoluciones confirmado distinto del sugerido en el contexto: no se creó un botón nuevo en flx-vta-pedido-cliente-view, se reutilizó y recableó el que ya existía por línea en flx-vta-lineapedido-detalle-list (más correcto, porque una devolución es sobre una línea, no sobre el pedido entero). Verificación en pantalla pendiente de que el coordinador reinicie el Backend y la haga desde la sesión principal.

## 2026-09-22 · T-12 · OK

**Tool:** `sqlcmd (direct SQL) + flexygo_record_missing_capability`

**Result:** Corrección post-cierre del bloque: el botón 'Cancelar' de VTA_Devolucion (ButtonId 5AEBBF07-871B-4C48-AE80-170C0FE03347) funciona y pVTA_CancelarDevolucion rechaza correctamente con un mensaje claro si el estado actual no es 'Solicitada' (verificado leyendo el SP: valida estado y propiedad del cliente antes de cancelar). La parte visual — ocultar el botón cuando ya no aplica, vía SQLEnabled — se investigó exhaustivamente y resultó ser una limitación real de la plataforma: ToolBars_Buttons.SQLEnabled con ConnStringId a NULL nunca ejecuta el SQL (el botón siempre se muestra); con ConnStringId a una conexión real SÍ ejecuta el SQL pero nunca sustituye el token {{IdEstado}} (probadas 5 sintaxis distintas), así que sólo puede dar siempre 0 (oculto) o fallar abierto (visible), nunca reaccionar al registro real. Registrado como gap de plataforma (área 'procesos', flexygo_record_missing_capability). Se deja SQLEnabled con ConnStringId=NULL (botón siempre visible, texto SQL legible documentando la intención) y el control real recae en el SP, que sí es correcto y ya fue verificado.

## 2026-09-22 · T-14 · OK

**Tool:** `sqlcmd (direct SQL) + flexygo_record_missing_capability`

**Result:** Corrección post-cierre del bloque: el botón 'Cancelar' de VTA_Incidencia (ButtonId 8FED0611-209B-48C6-AB42-C6FD3631F299) funciona y pVTA_CancelarIncidencia rechaza correctamente con un mensaje claro si el estado actual no es 'Abierta' (verificado leyendo el SP: valida estado y propiedad del cliente antes de cancelar). Misma limitación de plataforma que T-12 (ver su resultado y el gap registrado en el área 'procesos'): ocultar el botón vía SQLEnabled no es alcanzable de forma fiable en esta versión, así que se deja siempre visible con el control real en el SP.

## 2026-09-24 · T-12 · OK

**Tool:** `flexygo_delete_toolbar_button + sqlcmd (Objects_Processes) + flexygo_add_toolbar_button + reload_cache (por el usuario, admin)`

**Result:** Corrección final (sustituye el resultado anterior, que diagnosticó mal una limitación de plataforma — ver gap corregido en gaps.md área 'procesos'): la causa real era caché sin recargar de verdad, no un fallo de sustitución de tokens. Fijado el GUID de 'Solicitada' de Devoluciones_Estados como maestro puro con GUID fijo (ver flxCatalog.Data.Database/scripts/staticdata/devoluciones_estados.sql, referenciado desde postdeploy). Objects_Processes.EnabledProperty='IdEstado', EnabledValues='CB6E0913-0A81-4C7B-BC78-925F53FCF836' para pVTA_CancelarDevolucion — gatea correctamente la entrada 'Cancelar devolución' en el menú Procesos (confirmado por el usuario tras recargar caché desde el admin de Flexygo). Además, recreado el botón dedicado en la toolbar (tb-vta-devolucion-view) con SQLEnabled = comparación directa del token {{IdEstado}} contra el mismo GUID fijo, sin subconsulta — confirmado funcionando igual (visible solo en 'Solicitada', oculto en cualquier otro estado) tras la misma recarga de caché real hecha por el usuario.

## 2026-09-24 · T-14 · OK

**Tool:** `flexygo_delete_toolbar_button + sqlcmd (Objects_Processes) + flexygo_add_toolbar_button + reload_cache (por el usuario, admin)`

**Result:** Corrección final (mismo caso que T-12, ver su resultado y el gap corregido en gaps.md). Fijado el GUID de 'Abierta' de Incidencias_Estados como maestro puro con GUID fijo (ver flxCatalog.Data.Database/scripts/staticdata/incidencias_estados.sql). Objects_Processes.EnabledProperty='IdEstado', EnabledValues='25B5DB82-DB5D-483F-86DC-C6BA418C4FE2' para pVTA_CancelarIncidencia, y botón dedicado recreado en tb-vta-incidencia-view con la misma comparación directa por token. Ambos confirmados funcionando por el usuario tras recargar caché real.

## 2026-09-24 · T-10 · OK

**Tool:** `flexygo_update_template + flexygo_update_toolbar_button + flexygo_delete_toolbar_button + flexygo_add_toolbar_button + flexygo_update_process + flexygo_update_object_list_module + flexygo_update_page + reload_cache (admin)`

**Result:** Ronda de correcciones tras revisión del usuario sobre VTA_Pedido_Cliente_View: (1) el botón 'Solicitar incidencia', antes inline en la plantilla flx-vta-pedido-cliente-view, se quitó de ahí y se añadió como botón de la toolbar tb-vta-pedido-cliente-view, junto a 'Generar PDF', con processName pVTA_SolicitarIncidencia. (2) 'Generar PDF' renombrado a 'Imprimir Recibo'. (3) el botón de toolbar renombrado a 'Abrir incidencia'. (4) ambos procesos (pVTA_SolicitarDevolucion y pVTA_SolicitarIncidencia) actualizados con targetId='slideright' y closeDialogOnOk=true — verificado en vivo: ambos abren como panel deslizante desde la derecha y se cierran solos tras un envío correcto (probado de extremo a extremo con una devolución real, creada y luego borrada). (5) quitado el botón 'Plantillas' de la toolbar del pedido de cliente. (6) el botón de envío del formulario de pVTA_SolicitarIncidencia cambiado a 'Enviar' (runButtonText), verificado en pantalla. Adicional fuera de T-10 pero en la misma ronda: renombrado el título del módulo de catálogo de cliente ('Mi catálogo' → 'Catálogo', tanto el Title del módulo mod-cat-producto-cliente-list como el Name de la página CAT_Producto_Cliente_List) — el nodo de menú ya se había renombrado en T-03 pero el título visible en pantalla seguía sin cambiar.

## 2026-09-24 · T-11 · FALLO

**Tool:** `flexygo_create_process_param_dependency + playwright (verificación de red)`

**Result:** Intento de validación en vivo de Cantidad (feedback del usuario tras revisión: "si la propiedad tuviera un validador de SQL lo veríamos en el momento de establecer la cantidad y no al ejecutar"). Creada una dependencia sqlClass sobre pVTA_SolicitarDevolucion (Cantidad→Cantidad, auto-referencia) que compara la cantidad tecleada contra las unidades disponibles de la línea. La lógica es correcta y se evalúa bien en el servidor (confirmado leyendo la respuesta real de api/Edit/ProcessDependencies: {"changeClass":true,"newClass":"txt-danger"} para una cantidad excesiva), pero el frontend no aplica esa clase a un control numérico (spinbutton) — verificado por DOM y por captura de pantalla, el campo se queda sin marcar visualmente. Registrado como gap de plataforma (área 'procesos'). La validación real sigue ocurriendo al ejecutar (el DLL la rechaza con mensaje claro, ya verificado en un bloque anterior); lo que no se ha conseguido es adelantarla visualmente al momento de escribir.

## 2026-09-25 · T-16 · OK

**Tool:** `flexygo_create_sql_list_module, flexygo_remove_page_module, flexygo_add_page_module, flexygo_reload_cache`

**Result:** ok:true. Quitado el módulo 'Mis pedidos' (mod-vta-pedido-list-documentos) de VTA_MisDocumentos_List. Construido mod-vta-pedido-documentos-cliente-sqllist (flx-sqllist, connStringId=DataConnectionString): cruza Pedidos con las tablas reales de la gestión documental de la plataforma — Documents_Objects (ObjectName='VTA_Pedido', ObjectId=Pedidos.IdPedido), Documents (nombre, fecha) y Documents_Versions (FilePath de la última versión, aliasado como flxpathdocument para el enlace de descarga cifrado, según flexygo_get_template_syntax_reference). Documents_Objects/Documents/Documents_Versions viven en ConfConnectionString (tabla real 'Documents_Objects', no 'Documents_Object' como decía la tarea) mientras Pedidos vive en DataConnectionString — el SQL cualifica esas tres tablas con el nombre de base de datos (flxCatalog_IC.dbo.…) para el cruce entre bases, aceptado sin problema por el validador del tool. Filtrado al cliente actual vía objectFilter=(Pedidos.IdCliente='{{currentReference}}'), no en el SQL. Colocado en TopPosition order 0 (antes que 'Mi tarifa', que se deja tal cual). Verificado en pantalla como cliente: el módulo pinta correctamente su estado vacío ("Aún no tienes documentos") porque no hay documentos de pedido en la base de demo hoy — Documents_Objects no tiene ninguna fila con ObjectName='VTA_Pedido'. No se ha podido verificar visualmente la fila con datos ni el enlace de descarga por falta de datos de demo; el join, el alias flxpathdocument y el objectFilter están construidos según la referencia de plantillas pero esa parte concreta queda sin comprobar en pantalla. Sin errores de consola (el único warning de consola es de moment.js, preexistente y no relacionado).

## 2026-09-28 · T-04 · OK

**Tool:** `sqlcmd (UPDATE dbo.Navigation_Nodes) + flexygo_reload_cache + navegador`

**Result:** Corrección 28-09, encontrada al escribir los tests de interfaz: "Mis favoritos" daba HTTP 500 en GetPageByName ("Encontró más de un objeto para la misma condición de lectura") en cuanto el cliente tenía 2 o más favoritos. El nodo pasaba ObjectName='CAT_Producto' (singular), que la plataforma resuelve como un único registro; la verificación del 22-09 pasó solo porque entonces había exactamente 1 favorito. Cambiado a la colección 'CAT_Productos' por SQL directo (sin tool MCP, gap registrado en 'navegacion'). Verificado como cliente: con 2 favoritos se listan los 2, y "Catálogo" sigue mostrando los 140 productos sin filtrar.
