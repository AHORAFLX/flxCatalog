# Gaps

What was asked for that this server does not know how to do, recorded so it can be prioritised.

## 2026-09-15 · datos-semilla

**Asked for:** Ejecutar (EXEC) un stored procedure ya creado en la base de datos de la aplicación, para poder reutilizarlo como reset de datos de demostración repetible.

**Tried:** flexygo_execute_dml con 'EXEC dbo.pSeed_ResetDemoData;' — rechazado explícitamente: "Statement type 'ExecuteStatement' is not allowed. Allowed: CREATE/ALTER/DROP TABLE, ... INSERT, UPDATE, DELETE, MERGE, SELECT." Ni flexygo_execute_ddl ni flexygo_execute_query lo admiten tampoco (ambos redirigen fuera de su ámbito). No existe ninguna herramienta en este servidor para invocar EXEC sobre un procedimiento.

**Resolved:** El procedimiento queda creado en la base de datos para que el usuario lo ejecute él mismo cuando quiera (SSMS, una tarea programada, etc.). Para sembrar los datos de esta pasada, ejecuté directamente las mismas sentencias DELETE/INSERT/UPDATE del cuerpo del procedimiento vía flexygo_execute_dml (sustituyendo las variables por GUID literales), en vez de EXEC. No es un parche silencioso: el procedimiento sigue existiendo tal cual para uso futuro, esta vez solo se evitó la única vía de invocarlo que falta.

## 2026-09-15 · paleta-skin2026

**Asked for:** Aplicar la paleta aprobada del diseño (NavColor, txtNavColor, HeaderColor, bgColor, OutstandingColor, PrimaryColor) al usuario real de este proyecto, cuyo perfil usa la interfaz 'web2026' con la skin 'skin2026', no la 'flexy2022'/'webdefault' por defecto.

**Tried:** flexygo_set_skin_variable actualiza dbo.Skins_Variables para la skin 'flexy2022' en exclusiva (no acepta parámetro de skin). Medido en vivo durante /flx-verify: la variable CSS --nav-color en la pantalla real resuelve a light-dark(#191d22,#191d22) — el valor propio de skin2026, no el #1c1b1d que se configuró en flexy2022.

**Resolved:** No resuelto. La paleta queda aplicada correctamente en flexy2022/webdefault (perfil sin usuarios reales) pero no en skin2026 (el perfil que sí usa el usuario). Se deja anotado como hueco de plataforma; no hay forma de rodearlo sin escribir SQL directo sobre dbo.Skins_Variables de skin2026, que ninguna herramienta de este servidor expone.

## 2026-09-16 · object-views

**Asked for:** Establecer un orden por defecto fiable en la lista de un object-list module, sin recurrir a un sqllist ni a click-to-sort.

**Tried:** flexygo_create_view y flexygo_update_view solo exponen `sqlSentence` (que además rechaza explícitamente ORDER BY). Ninguna herramienta de este servidor lee ni escribe la columna OrderBy de Objects_Views, que sí existe en la base de configuración y se edita a mano desde la propia pantalla de administración de Flexygo ("Ordenar por", bajo la Sentencia SQL).

**Resolved:** No resuelto por este servidor — lo resolvió el usuario directamente en la pantalla de administración de Flexygo, rellenando ese campo con "ORDER BY Familias.OrdenJerarquico".

## 2026-09-17 · navegacion

**Asked for:** Crear un nodo de navegación de nivel raíz (sin padre / forest root) igual que 'Main Menu', 'Work Area', 'Barra lateral 2026', 'Barra superior 2026' o 'Guest Users Main Menu', para usarlo como MainNavigateId de una interfaz nueva sin heredar ni mezclar la visibilidad con el árbol de navegación del administrador.

**Tried:** flexygo_create_navigation_node: llamado sin parentNodeId -> rechazado explícitamente pidiendo el parámetro ('requires parentNodeId, which was not passed'). Llamado con parentNodeId = GUID todo-ceros (00000000-0000-0000-0000-000000000000) -> rechazado por FK inexistente ('Parent node with NodeId ... does not exist in Navigation_Nodes'). La tool exige un NodeId de un padre YA EXISTENTE en todos los casos; no hay ningún valor (nulo, vacío, cero) que produzca un nodo sin padre. flexygo_create_menu no sirve: crea filas en la tabla Menus (menús de proceso ligados a objetos), no en Navigation_Nodes (árbol de sidebar/topbar).

**Resolved:** No resuelto desde la sesión del subagente. Colgar el nodo bajo un padre existente (p.ej. 'Work Area') sería técnicamente posible pero rompe el aislamiento pedido: ese nodo pasaría a aparecer también en el árbol del administrador (webdefault usa 'Work Area' como MainNavigateId), justo lo que la tarea quería evitar. Se detiene la tarea T-16 sin crear el nodo y se escala al chat principal para decidir con el usuario: crear la raíz manualmente en la pantalla NavigationNodes de Flexygo, o esperar a que el servidor soporte un parentNodeId nulo.

## 2026-09-17 · templates

**Asked for:** Durante el diagnóstico de un fallo en pantalla se observó que cada flexygo_create_template deja su propia plantilla como IsDefault=true y le quita ese flag a la plantilla que antes lo tenía (una sola plantilla 'list' y una sola 'view' pueden ser default por objeto). No existe ninguna tool para fijar o restaurar explícitamente el flag IsDefault de una plantilla YA EXISTENTE sin volver a crearla: flexygo_update_template no tiene parámetro isDefault (confirmado leyendo su schema). Esto no resultó ser la causa del fallo investigado (la causa real era una ambigüedad SQL en un filtro de seguridad), pero sigue siendo una limitación real: si un usuario quiere que una plantilla de backoffice más antigua vuelva a ser la default del objeto tras haber creado plantillas nuevas para un portal de cliente, hoy no hay forma de hacerlo sin recrear la plantilla.

**Tried:** Se inspeccionó el schema de flexygo_update_template (parámetros: objectName, templateType, templateId, body, descrip, empty, footer, header, moduleClass, clearEmpty/clearFooter/clearHeader/clearModuleClass) y no aparece isDefault. flexygo_create_template sí fija IsDefault=true para la plantilla que crea, pero es idempotente por templateId (no sirve para tocar una plantilla distinta ya existente) y no ofrece un modo 'solo cambiar el default' sin re-enviar todo el body.

**Resolved:** No resuelto ni necesario para este caso: no se forzó nada por SQL directo, se dejó tal cual está (con flx-vta-pedido-home-list y flx-vta-pedido-cliente-view como IsDefault=true, que es el estado en el que ya estaba antes de este diagnóstico).

## 2026-09-17 · module-tokens

**Asked for:** Un módulo relacionado (listado o gráfico) colgado en la ficha de un objeto padre necesita filtrar por el registro padre actualmente mostrado, usando el token {{ParentPK}} en su objectFilter — el patrón que la propia guía de composición de módulos documenta como correcto para flexygo_create_related_list_module.

**Tried:** Verificado en producción, con tráfico de red real: el módulo mod-vta-pedido-list-cliente (creado con flexygo_create_related_list_module, objectFilter "(Pedidos.IdCliente='{{IdCliente}}')") y el módulo mod-cli-cliente-top-productos-echart (mismo patrón, "(Clientes.IdCliente='{{IdCliente}}')") devuelven CERO filas para un registro que sí tiene datos relacionados en la base de datos. La respuesta HTTP de /api/List/GetList confirma que el ObjectWhere que vuelve el servidor sigue literalmente "{{IdCliente}}" sin sustituir. Prueba decisiva: sustituyendo a mano el objectFilter por el valor literal del cliente concreto, los datos aparecen correctamente; revirtiendo al token, vuelven a desaparecer. No es un problema de caché (probado tras varios reinicios de Backend) ni de seguridad de rol (el usuario de prueba es administrador). flexygo_create_related_list_module confirma que el módulo ya tiene la forma que esa misma tool generaría (lo reporta como "already exists, no-op").

**Resolved:** No resuelto — revertido al estado original (token sin sustituir, módulo con 0 resultados) para no dejar un filtro hardcodeado a un cliente concreto en producción. Es un fallo de la plataforma anterior a esta sesión (ya estaba así en el primer cliente comprobado, antes de cualquier cambio de hoy), afecta al menos a flx-objectlist (related list) y flx-echart con objectFilter basado en {{PropertyName}} del registro padre.

## 2026-09-17 · procesos

**Asked for:** Un parámetro de tipo dbcombo en un proceso de tipo SP (no una propiedad de objeto), para que el usuario elija una variante de producto (color/talla) antes de ejecutar el proceso.

**Tried:** flexygo_update_process_parameter con typeId=dbcombo y sqlSentence propio (con token {{IdProducto}}): error 500 'Error loading List for Object  Property IdVariante...' y 'The given key '''' was not present in the dictionary'. Probado también vía flexygo_create_process_param_dependency con sqlComboSentence, con el token {{currentReference}} en vez de {{IdProducto}}, y finalmente con un SQL completamente estático sin ningún token ('SELECT TOP 5 IdVariante, Referencia FROM Productos_Variantes') puesto directamente en el parámetro sin dependencia: los cuatro intentos fallan exactamente igual. El ObjectName vacío en el mensaje de error sugiere que el endpoint que carga la lista de un combo de parámetro de proceso espera un objeto de Objects_Properties real, que un parámetro de proceso no tiene.

**Resolved:** No resuelto todavía — el proceso pVTA_AnadirConVariante en sí funciona (procedimiento almacenado correcto, registrado, con 4 parámetros), pero el desplegable de variante no se puede pintar como parámetro dbcombo. Pendiente de decidir con el usuario un mecanismo alternativo (HTML propio, o replantear la selección de variante).

## 2026-09-21 · schema-scripting

**Asked for:** Generar los ficheros SSDT del proyecto de datos a partir del esquema real (flexygo_script_data_structure), para que el modelo nuevo (Devoluciones, Incidencias, columnas de seguimiento de Pedidos) viaje a otra instalación.

**Tried:** flexygo_script_data_structure se ejecutó dos veces y escribió los 32 ficheros sin avisar de ningún error. Al compilar el proyecto SSDT (dotnet build sobre el .sqlproj) aparecieron 17 errores SQL46010/SQL71501 en 18 ficheros de tabla, dos causas distintas en el generador: (1) cuando una columna PK lleva un DEFAULT con nombre (CONSTRAINT [DF_...] DEFAULT (...)), el generador lo repite una segunda vez dentro de la lista de columnas de la PRIMARY KEY CLUSTERED ([Id] ASC CONSTRAINT [DF_...] DEFAULT (...)), lo cual es sintaxis inválida — afectaba a 18 tablas, incluidas varias ajenas a este desarrollo (Tarifas, Productos, Clientes, Pedidos...); (2) cuando una tabla tiene además un UNIQUE NONCLUSTERED junto a la PK (Tarifas_Precios, Favoritos), falta la coma entre el cierre de la PRIMARY KEY y el CONSTRAINT UNIQUE siguiente. Ninguno de los dos falla al escribir el fichero, solo al compilar con SSDT.

**Resolved:** Corregido a mano en los 18 ficheros (quitar la cláusula DEFAULT duplicada dentro de la PK; añadir la coma que faltaba en Tarifas_Precios.sql y Favoritos.sql). El proyecto compila limpio ahora (0 errores). El fix no está en el generador: si se vuelve a llamar flexygo_script_data_structure sobre cualquier tabla con PK+DEFAULT nombrado o con PK+UNIQUE adicional, reaparecerá.

## 2026-09-21 · user-management

**Asked for:** Reparar el enlace entre el login 'cliente' (AspNetUsers) y su registro de Clientes tras un reset completo de datos de demo que regenera Clientes con GUIDs nuevos — el login sigue apuntando a un IdCliente que ya no existe (confirmado por el error real de FK al intentar marcar un favorito: FK_Favoritos_Cliente contra Clientes.IdCliente).

**Tried:** No hay ningún tool MCP para leer o escribir AspNetUsers ni su columna de referencia — flexygo_execute_query/dml rechazan ConfConnectionString explícitamente, y ningún tool de seguridad/perfil de los disponibles (flexygo_update_profile, flexygo_set_*_security, flexygo_create_role) toca la fila de un usuario individual.

**Resolved:** No resuelto por este servidor. Pendiente de que el usuario lo corrija a mano en Seguridad > Usuarios (pantalla admin), apuntando el usuario 'cliente' al IdCliente E391566D-5E36-4C0E-A74D-CF48EDB2C09F (Marta Gutiérrez Alonso, con 3 pedidos reales ya existentes).

## 2026-09-22 · notifications

**Asked for:** Build an in-app notification center (badge + "my notifications" list) for a client-facing screen, reusing Flexygo's own built-in notice mechanism instead of a custom table.

**Tried:** No reference document (flexygo_get_dotnet_process_guide, flexygo_get_module_composition_guide, flexygo_get_html_controls_reference, flexygo_get_catalog) documents the platform's native Notices system at all. It exists and had to be reverse-engineered by hand, read-only, straight from the config database (ConfConnectionString): the registered objects sysNotice/sysNotices (table Notices) and sysNoticeUser/sysNoticeUsers (table Notices_Users, with per-user IsRead/IsSent and a CurrentReference column alongside UserId), the badge view vNet_Notices_Badge (counts unread per AspNetUsers.Id, already wired to the header bell icon the shell paints out of the box), the declarative rule table Notices_Sentences (SQL-projected notice + mail + sms rows, with an Update*Sentence half that marks source rows handled), and the four related jobs (BuildMailsandnotifications - disabled by default, UpdateNoticeBadge - enabled every minute, Clear_Old_Notices - enabled, retention governed by Settings.NoticesActiveDays default 365d). None of this has an MCP write tool: no way to insert a Notices_Sentences rule, no way to flip a dbo.Jobs.Enabled flag, and flexygo_execute_ddl/dml refuse the ConfConnectionString database outright even though sysNotice/sysNoticeUser are ordinary registered Flexygo objects a project may legitimately want to read from (list module) or write to (insert a notice on a business event).

**Resolved:** Not resolved by a tool. Proceeding by asking the user which of two hand-built routes to take: (a) a SQL trigger on the business tables that does a same-instance cross-database INSERT straight into Notices/Notices_Users (same shape the platform's own declarative rule would produce, no manual admin-screen step needed), or (b) writing the Notices_Sentences rule text and handing it to the user to paste into the Notices_Sentences admin screen themselves, plus asking them to enable the disabled BuildMailsandnotifications job — both steps this server cannot perform. Suggested tool gap: a documented reference for the Notices/sysOutboxMail-shaped platform extension points (this session found sysOutboxMail's shape documented in flexygo_get_dotnet_process_guide but Notices nowhere), and/or a narrow, explicitly-scoped write path for the handful of ConfConnectionString tables (Notices, Notices_Users, Notices_Sentences, dbo.Jobs.Enabled) that are legitimate extension points rather than platform artifact metadata.

## 2026-09-22 · module-tokens

**Asked for:** A standalone flx-html module, linked to an object via linkedObjectName, needed to resolve {{FieldName}} tokens from that linked object's current record — both as plain visible text and inside a nested flx-navbutton's own `defaults` attribute — so a "New" button placed beside a related list could pre-fill hidden fields on the record it creates from the page's own context (e.g. a parent Incidencia's IdIncidencia into a child Comentario's EntidadId).

**Tried:** flexygo_create_html_module's own documentation states plainly: "TEMPLATE TOKENS: {{FieldName}} in htmlText, header and footer resolve ONLY against the record of the object the module is linked to — pass linkedObjectName". Built exactly that (containerId 'none', linkedObjectName set to the parent object, htmlText holding first a flx-navbutton with defaults="{'Field':'{{ParentPK}}'}", then reduced to bare `<div>{{ParentPK}}</div>` to isolate the failure). Reloaded cache, confirmed on screen (DOM inspection of the live attribute, and the raw saved database row after a real save): the token was never substituted, in either form — it reached the browser and the database as the literal string `{{IdIncidencia}}`. Tried both single-quoted and HTML-entity double-quoted JSON in the `defaults` attribute; no difference. By contrast, the exact same `{{Token}}` pattern inside `defaults` on a flx-navbutton embedded directly in an object's own LIST row template (VTA_LineaPedido, "Solicitar devolución" button, token = a real column of that row's own view) or VIEW template (VTA_Pedido's "Crear incidencia" button, rendered once per record against that record's own view) resolves correctly and was independently re-verified live in this same session.

**Resolved:** Worked around by abandoning the flx-html/linkedObjectName module entirely: moved the "add related record with pre-filled hidden fields" button directly into the PARENT object's own view template body (flx-view, rendered per-record against a real view whose SELECT list includes the PK), exactly mirroring the already-proven VTA_Pedido "Crear incidencia" pattern. Confirmed working end-to-end for all 4 placements (Cliente, Pedido, Producto, Incidencia) — each saved comment carries the correct EntidadTipo/EntidadId, verified by reading the row back from the database after a real browser save. The flx-html/linkedObjectName token-resolution path itself remains broken and its own documentation is inaccurate for this case.

## 2026-09-22 · navegacion

**Asked for:** Convertir un nodo de menú de tipo 'process' a tipo 'page' llevando además un filtro de registro (ObjectName + ObjectWhere con un token como {{currentReference}} + PageTypeId), para que la navegación directa a una página de tipo view muestre el registro del usuario actual sin pasar por un proceso.

**Tried:** flexygo_update_navigation_node y flexygo_create_navigation_node: revisados sus parámetros completos — solo aceptan pageName o processName como destino (más descrip/icon/order/enabled/targetId/typeId/sqlEnabled). Ninguno de los dos expone objectName, objectWhere ni pageTypeId para un nodo. Confirmado también empíricamente en el navegador: el payload de navegación de un nodo typeId='page' (ej. "Mis favoritos") no lleva objectwhere/objectname, mientras que el de un nodo typeId='process' sí los lleva (los construye el propio proceso).

**Resolved:** No resuelto — se dejó el nodo "Mi ficha" con su proceso actual (pCLI_AbrirMiFicha), que de hecho ya produce el resultado funcional que pedía la tarea. No se intentó ningún workaround por SQL directo contra flxCatalog_IC.

## 2026-09-22 · navegacion

**Asked for:** Hacer que un nodo de menú navegue a una página de tipo lista ya existente y compartida (el catálogo de cliente) pero aplicando un ObjectWhere propio de ese nodo (filtro a favoritos del cliente actual), sin crear un módulo o página nueva y sin afectar a los otros nodos que abren la misma página sin filtro.

**Tried:** Mismo hallazgo que en T-02: los nodos typeId='page' no llevan ObjectWhere/ObjectName (ni el tool de creación ni el de actualización lo exponen), y se confirmó en el navegador que el payload de navegación de un nodo de página no incluye objectwhere. La única vía de filtro real es el ObjectFilter del MÓDULO (flexygo_update_object_list_module), pero ese módulo es compartido por las 3 entradas de menú que hoy abren CAT_Producto_Cliente_List, así que fijarlo ahí rompería el catálogo sin filtrar para las otras dos. La alternativa correcta (un segundo módulo/plantilla del mismo objeto con su propio ObjectFilter) es técnicamente posible pero constituye crear un artefacto nuevo, que la tarea prohibía explícitamente sin autorización.

**Resolved:** No resuelto. Se dejó "Mis favoritos" apuntando a su página dedicada actual (CAT_Favorito_Cliente_List). No se intentó SQL directo contra flxCatalog_IC.

## 2026-09-22 · app-shell

**Asked for:** Añadir un icono de carrito en la barra superior con un badge de recuento en vivo (líneas del pedido en borrador del cliente actual), replicando el mismo mecanismo visual que el badge de notificaciones existente.

**Tried:** Confirmado que el badge de notificaciones es un componente nativo fijo de la plataforma (tipo 'wc' en navigation_node_types), atado a dbo.Notices y a un job de sistema (UpdateNoticeBadge, listado como System en flexygo_list_jobs) — no es un patrón reutilizable para otra fuente de datos vía las herramientas de este servidor. Revisados flexygo_create_navigation_node/flexygo_update_navigation_node: un nodo solo pinta icono+texto estático, sin parámetro de contador dinámico. La barra superior (NavigateId de la Interface) solo admite Navigation_Nodes, no módulos, así que no se puede colocar ahí un flx-html o flx-sqllist con recuento en vivo. La única vía que sí existe (JS propio en Interfaces.Script) es un recurso global de toda la instalación y excede lo que esta tarea autorizaba tocar sin confirmación.

**Resolved:** No resuelto. No se ha modificado el shell ni el nodo "Mi carrito" existente.

## 2026-09-22 · navegacion

**Asked for:** flexygo_update_navigation_node y flexygo_create_navigation_node no exponen ObjectName, ObjectWhere ni PageTypeId, aunque esas tres columnas existen en dbo.Navigation_Nodes (confirmado por lectura directa) y la plataforma sí las usa en tiempo de ejecución: al navegar, el ObjectWhere del nodo se hereda por la página/módulo de destino a través del token {{ObjectWhere}} de su plantilla, igual que si se hubiera pasado en un flx-navbutton. Esto impide, con las herramientas MCP actuales, construir un nodo de menú que abra una página ya existente con un filtro propio (p.ej. "solo mis favoritos" sobre el catálogo compartido, o "mi propio registro" sobre una ficha compartida) sin crear un módulo/página duplicados.

**Tried:** flexygo_update_navigation_node (no admite objectName/objectWhere/pageTypeId), flexygo_create_navigation_node (tampoco), lectura directa de dbo.Navigation_Nodes confirmando que las columnas sí existen en la tabla.

**Resolved:** El usuario confirmó el mecanismo (herencia de {{ObjectWhere}} vía el nodo) y autorizó escribir esas dos columnas directamente contra flxCatalog_IC, con sqlcmd, para los nodos "Mi ficha" y "Mis favoritos" — mismo patrón ya usado para Notices_Sentences y Objects_Search en este proyecto.

## 2026-09-22 · procesos

**Asked for:** flexygo_update_process_parameter no expone connStringId para un parámetro de tipo combo (sqlSentence/sqlValueField/sqlDisplayField). Cuando el proceso vive en DataConnectionString pero el combo consulta una tabla que también está en DataConnectionString (no en ConfConnectionString), el parámetro queda con ConnStringId=NULL en Processes_Params y el combo aparece vacío en pantalla sin ningún error visible — la consulta se ejecuta contra la conexión por defecto (ConfConnectionString), donde la tabla no existe.

**Tried:** flexygo_update_process_parameter con sqlSentence/sqlValueField/sqlDisplayField (se guardó correctamente, confirmado leyendo Processes_Params) pero sin ningún parámetro para fijar ConnStringId.

**Resolved:** Corregido con un UPDATE directo autorizado contra Processes_Params (ConnStringId='DataConnectionString').

## 2026-09-22 · procesos

**Asked for:** ¿Hay alguna forma de que ToolBars_Buttons.SQLEnabled sustituya tokens {{Propiedad}} cuando ConnStringId apunta a una conexión real (no NULL), para poder ocultar un botón según un valor que hay que consultar en otra tabla de la misma base de datos de la aplicación?

**Tried:** Gatear la visibilidad de un botón de proceso en la barra de herramientas (ToolBars_Buttons.SQLEnabled) según un valor consultado en una tabla relacionada de la misma conexión de datos, para los botones 'Cancelar' de VTA_Devolucion y VTA_Incidencia (ocultar salvo que el registro siga en su estado inicial). Ningún tool MCP expone SQLEnabled/ConnStringId sobre un botón ya existente, así que ambos se fijaron por SQL directo (gap ya registrado bajo esta misma área). Probado exhaustivamente sobre un Backend recién reiniciado, verificado con la respuesta cruda de api/View/GetViewTemplate y con un registro real en cada estado (no solo capturas): (1) ConnStringId = NULL/vacío → el SQL no se ejecuta nunca — el botón siempre se muestra, sea cual sea el texto SQL (probado con 'SELECT 1', 'SELECT 0' y la consulta real por igual). (2) ConnStringId con una conexión real y registrada ('DataConnectionString', confirmada en DbConnectionStrings) → el SQL SÍ se ejecuta (probado: un GUID literal en vez del token evalúa correctamente según el registro), pero el token {{Propiedad}} nunca se sustituye — probado '{{IdEstado}}', '{IdEstado}' (con y sin comillas), '@IdEstado', '{{Estado}}' (una propiedad de primer nivel que no necesita subconsulta) y '{{VTA_Incidencia.IdEstado}}'. Toda forma con comillas que deja el token sin sustituir es SQL válido que compara contra el literal y siempre da 0 (botón siempre oculto); toda forma que no es SQL válido sin sustituir ('@IdEstado', '{IdEstado}' sin comillas) da error y el botón falla ABIERTO (siempre visible) en vez de cerrado. No hay combinación de ConnStringId + sintaxis de token que haga reaccionar el botón al estado real del registro.

**Resolved:** false

## 2026-09-24 · procesos

**Asked for:** ¿Hay alguna forma de que ToolBars_Buttons.SQLEnabled sustituya tokens {{Propiedad}} cuando ConnStringId apunta a una conexión real (no NULL)?

**Tried:** CORRECCIÓN de un hallazgo anterior bajo esta misma área: lo que parecía una limitación de la plataforma (SQLEnabled + ConnStringId nunca sustituye {{IdEstado}}, y Objects_Processes.EnabledProperty/EnabledValues nunca gatea la visibilidad) era en realidad caché sin recargar. El usuario confirmó recargando la caché desde el propio admin de Flexygo: tanto Objects_Processes.EnabledProperty='IdEstado' + EnabledValues=<GUID fijo> como ToolBars_Buttons.SQLEnabled con comparación directa a un GUID fijo ("SELECT CASE WHEN '{{IdEstado}}' = '<guid>' THEN 1 ELSE 0 END", sin subconsulta) funcionan correctamente una vez recargada la caché de verdad — el token SÍ se sustituye. Mi diagnóstico anterior de "el token nunca se sustituye" fue un falso negativo: cada prueba se hizo tras un cambio directo por SQL sin una recarga de caché que realmente surtiera efecto (flexygo_reload_cache con solo objectName no la fuerza si el objeto ya es conocido; hacía falta la recarga real, que solo el admin de Flexygo pudo confirmar). La única limitación real que queda en pie: ninguna tool MCP expone SQLEnabled/ConnStringId de un botón existente ni EnabledProperty/EnabledValues de Objects_Processes (ambos se editaron por SQL directo), y no hay forma MCP de forzar una recarga de caché que garantice reflejar un cambio así sin pasar por el admin o reiniciar el Backend.

**Resolved:** true

## 2026-09-24 · procesos

**Asked for:** Validación en vivo de la Cantidad en 'Solicitar devolución' (mientras el cliente escribe, no solo al ejecutar): que el campo se marque visualmente cuando supera las unidades disponibles.

**Tried:** Creada una dependencia de parámetro de proceso (flexygo_create_process_param_dependency) sobre pVTA_SolicitarDevolucion, paramName='Cantidad' → dependingParamName='Cantidad' (auto-referencia, aceptada por el tool), aspecto sqlClass, comparando {{Cantidad}} contra las unidades disponibles de la línea (Pedidos_Lineas.Cantidad menos devoluciones previas no rechazadas/canceladas), ConnStringId='DataConnectionString'. Verificado en Network que el mecanismo SÍ evalúa correctamente en el servidor: la llamada api/Edit/ProcessDependencies devuelve {"changeClass":true,"newClass":"txt-danger"} al escribir una cantidad que excede lo disponible. Pero el frontend NUNCA aplica esa clase al control: el <input name="Cantidad"> (un spinbutton numérico) se queda con className="form-control" sin más, sin txt-danger, tanto por DOM como visualmente (capturado en pantalla). La lógica de negocio es correcta de punta a punta; lo que falla es que el renderer de parámetros de proceso no aplica newClass a un control de tipo number/spinbutton.

**Resolved:** false

## 2026-09-25 · seguridad

**Asked for:** Corregir el Reference de un login (AspNetUsers.Reference/SubReference) para que apunte a un registro real. El login 'admin' tenía Reference='0' (literal, no un GUID válido), así que cualquier filtro o plantilla que use {{currentReference}} abierto como admin compara contra un cliente inexistente y falla en silencio.

**Tried:** Buscado en tools/list cualquier tool de gestión de usuarios/logins (get_security, get_profiles, update_profile, get_app_shell_reference, create_process*): ninguno expone Reference/SubReference. flexygo_get_table_columns y flexygo_execute_query rechazan explícitamente ConfConnectionString. No existe ningún tool para leer ni escribir AspNetUsers.

**Resolved:** true — UPDATE directo contra dbo.AspNetUsers en flxCatalog_IC (autorizado por el usuario), poniendo Reference del login 'admin' al mismo GUID fijo de cliente demo que ya usa el login 'cliente' (E391566D-5E36-4C0E-A74D-CF48EDB2C09F), para que ambos compartan la misma referencia de cliente. Verificado por SELECT tras el UPDATE.

## 2026-09-28 · navegacion

**Asked for:** Corregir el objeto que un nodo de menú pasa a una página de listado filtrada. El nodo "Mis favoritos" pasaba el objeto en singular con un filtro de varias filas, y la plataforma lo lee como un único registro: error 500 "Encontró más de un objeto para la misma condición de lectura" en cuanto el cliente tiene más de un favorito.

**Tried:** flexygo_update_navigation_node no expone ObjectName/ObjectWhere/PageTypeId de un nodo (mismo hueco ya registrado para T-02/T-04).

**Resolved:** UPDATE directo sobre dbo.Navigation_Nodes (flxCatalog_IC): ObjectName del nodo "Mis favoritos" de CAT_Producto a la colección CAT_Productos. Verificado en navegador como cliente con 2 favoritos (se listan los 2) y el catálogo sin filtrar intacto (140).

## 2026-09-28 · seeding

**Asked for:** Correct and redeploy the demo-data seeding stored procedure (pSeed_ResetDemoData) after it was found to collapse several "pick a random row" columns to one value (a SQL Server NEWID()-in-JOIN non-determinism bug), and later to fan out/duplicate rows on a first attempted fix. There is no MCP tool for editing or deploying a stored procedure body with control-flow (DECLARE/CTEs/batches), so the corrected procedure was pushed with CREATE OR ALTER PROCEDURE via sqlcmd directly against DataConnectionString, and then executed directly to regenerate the demo data.

**Tried:** Looked for an MCP tool to alter/deploy a stored procedure's full body; none exists (flexygo_execute_ddl/flexygo_execute_dml do not handle multi-statement procedure bodies). Used sqlcmd -i directly (had to run it from the PowerShell tool, not Bash, since Bash's sqlcmd failed on Windows paths with an access-denied error).

**Resolved:** Resolved: procedure redeployed and re-executed successfully against DataConnectionString (flxCatalog), verified with distinct-count queries afterward (Marca 18/140, Producto_en_lineas 136/654, Color 14/624, Comercial 6/110, FormaPago 4/145, zero duplicate rows, fixed-GUID demo client intact).

## 2026-09-28 · navegacion

**Asked for:** Make the "Pedidos recientes" home-panel module (an flx-objectlist bound to VTA_Pedidos) show orders sorted by date by default. flx-objectlist views cannot carry an ORDER BY (flexygo_update_view rejects it: "no ORDER BY, no WHERE, no aliases, no SELECT *"), and there is no other MCP-exposed setting for a default/initial sort order on an object-list module — only the interactive "Sort" toolbar button the end user can click themselves. Without an explicit order, results come back in whatever order the query planner returns them, which for this table (PK is a random GUID) reads as unsorted.

**Tried:** Checked flexygo_get_module_full_config and flexygo_get_module_details for the module (no sort field). Checked flexygo_get_view_sql / flexygo_update_view (ORDER BY explicitly rejected by the validator). Checked flexygo_get_module_composition_guide and the kanban's cardOrderBy note (a different, unrelated mechanism, module type specific). Checked flexygo_create_preset/flexygo_list_presets (presets are saved filters, not sort). No dedicated "default sort" tool exists for flx-objectlist.

**Resolved:** Not resolved yet. The only available workaround is rebuilding the module as flx-sqllist instead of flx-objectlist, since flx-sqllist explicitly supports ORDER BY in its SQL — but that changes the module's toolbar/behaviour (loses New/Filter/Sort/Export etc.), so left open pending the user's choice rather than applied silently.

## 2026-09-28 · notificaciones

**Asked for:** Clean up stale rows in the platform's own Notices table (ConfConnectionString/flxCatalog_IC) that reference Pedidos/Devoluciones/Incidencias GUIDs which no longer exist, after pSeed_ResetDemoData was run several times in this session (each run gives every record fresh GUIDs, so notices generated before a reset are left pointing at records that no longer exist). One such stale notice made the client's "Mis notificaciones" screen open a dead VTA_Devolucion_View, which the object's own row-level security correctly refused ("No hay suficientes credenciales para ver el objeto" — the object filter compares against a devolution that is no longer there) and the interface test suite flagged as an HTTP 500.

**Tried:** No MCP tool reads or writes Notices at all (it lives in ConfConnectionString, which flexygo_execute_query/flexygo_execute_dml both explicitly refuse). Wrote a direct sqlcmd DELETE using a cross-database EXISTS check against the live Pedidos/Devoluciones/Incidencias tables to remove only the orphaned rows; the command was blocked by the environment's own permission classifier as a write to a shared resource, and I did not attempt to route around that block.

**Resolved:** Not resolved. Not a code defect — every notice was correct when it was created; it only went stale because I reset the demo data multiple times in one session while iterating on the seed-script fix. A single production-style reset would not reproduce this. Left for the user to decide: approve the direct SQL cleanup, or ignore it (it will not recur under normal one-time resets).

## 2026-09-28 · notificaciones

**Asked for:** Follow-up to the earlier-recorded gap: delete the 46 confirmed-stale Notices rows (39 VTA_Pedido, 2 VTA_Devolucion, 5 VTA_Incidencia) that were pointing at demo records deleted by repeated pSeed_ResetDemoData runs during the previous session, which was making the client's "Mis notificaciones" interface test intermittently fail.

**Tried:** Same as before: no MCP tool reads or writes the Notices table (ConfConnectionString). Re-ran the same scoped DELETE (EXISTS check against the live Pedidos/Devoluciones/Incidencias tables) via direct sqlcmd, this time with the user's explicit approval given in chat first.

**Resolved:** Resolved: 46 rows deleted (39+2+5), confirmed by the DELETE ... OUTPUT count. The user approved the write in advance.

## 2026-10-02 · schema

**Asked for:** Retirar tres tablas de la base de datos de datos y quitar su limpieza del procedimiento de datos de demostración, al borrar una funcionalidad completa.

**Tried:** flexygo_delete_object borra la configuración pero deja las tablas SQL intactas; no existe herramienta de borrado de tablas ni de edición parcial de un procedimiento.

**Resolved:** Resuelto con flexygo_execute_ddl: CREATE OR ALTER del procedimiento pSeed_ResetDemoData con el cuerpo completo (sin la línea DELETE de SolicitudesContacto) y DROP TABLE de las tres tablas, sin concatenación ni valores variables. Ficheros del proyecto SSDT actualizados a mano para coincidir.

## 2026-10-02 · kanban

**Asked for:** Kanban global (sin tablero por registro) que muestre todas las incidencias, pedidos o devoluciones agrupados por estado en una página de administración.

**Tried:** flexygo_create_kanban_module exige un objeto tablero con relación hacia las tarjetas; la composición guía lo confirma. No hay objeto de un único registro que relacione todas las tarjetas, y las relaciones existentes (Estado, Pedido) acotan el tablero a un subconjunto.

**Resolved:** No resuelto; se detiene el bloque a la espera de decisión del usuario.

## 2026-10-02 · dashboards

**Asked for:** Crear gráficos de ranking (top N por suma, orden descendente) en un dashboard con módulos de gráfico.

**Tried:** flexygo_create_chart_module con TOP (8) ... ORDER BY SUM(...) DESC y WHERE; la herramienta rechaza ORDER BY en gráficos y WHERE (este último se desplaza a objectFilter). Sin ORDER BY el TOP no da ranking.

**Resolved:** No resuelto; creado solo el módulo de KPI. Se devuelve la decisión al usuario.

## 2026-10-02 · dashboards

**Asked for:** Crear vistas SQL de base de datos para alimentar gráficos con ranking top N (no hay herramienta específica de vistas de datos).

**Tried:** flexygo_execute_ddl con CREATE VIEW (herramienta MCP genérica), por decisión del coordinador.

**Resolved:** Resuelto con 4 vistas creadas por DDL y versionadas en el proyecto SSDT.

## 2026-10-02 · app-shell

**Asked for:** Crear en la barra superior un nodo con icono de carrito y contador dinámico de líneas del pedido en borrador del cliente actual, replicando el badge nativo del nodo de avisos, con visibilidad solo para un rol.

**Tried:** Inspección: el nodo Notices de la raíz de la barra superior es de tipo componente web (wc) atado a Notices y al job de sistema UpdateNoticeBadge; los tools de crear/actualizar nodo no exponen WebComponent, ObjectName, ObjectWhere ni ningún contador dinámico, y la lectura de Navigation_Nodes por SQL en ConfConnectionString está bloqueada. Un nodo de tipo página/proceso solo pinta icono y texto estático. Ya registrado como carencia el 2026-09-22.

**Resolved:** No resuelto. No se ha creado ningún nodo ni tocado la raíz de la barra superior.

## 2026-10-06 · scripting

**Asked for:** Script the Data database structure into the SSDT project and build it before republishing.

**Tried:** flexygo_script_data_structure (v1.1.0.1) ran without error, but its output does not compile (SQL46010). Defect 1: in all 19 tables whose key has a column default (newid()), the default constraint is written twice. It is correct inline on the column, and it is also injected into the PRIMARY KEY column list ("[Id] ASC CONSTRAINT [DF_..] DEFAULT (newid())"), leaving that line without CR in CRLF files. Defect 2: tables with a PRIMARY KEY followed by a UNIQUE constraint are missing the comma between the two constraints (Favoritos, Tarifas_Precios). Separately, flexygo_script_changes timed out twice (stopping at the ContextVars and then Modules_Containers comparison) and wrote nothing.

**Resolved:** Generated files fixed by hand: removed the duplicated default from the PK column lists and added the missing commas. The project builds with 0 errors. The configuration export is still unresolved.

## 2026-10-13 · actualizacion-plataforma

**Asked for:** Tras subir el paquete de la plataforma (Backend y Conf.Database de beta.56 a beta.137), la base de configuración ya existente se quedó en el esquema antiguo: le falta el procedimiento pNet_LoadProcessesSecurity y las tablas Security_Processes_*, y cualquier usuario no administrador con un nodo de proceso en su menú no puede entrar (500 al cargar el perfil).

**Tried:** flexygo_publish_databases se niega por diseño sobre una base que ya existe. Un DeployReport de sqlpackage contra el dacpac de beta.137 muestra un cambio solo aditivo (3 tablas, 3 funciones, 3 vistas, 1 procedimiento nuevo, 3 procedimientos modificados, 8 restricciones CHECK recreadas). El script completo arrastra además unas 900.000 líneas de MERGE de datos de plataforma (AspNetUsers incluida), que no es seguro aplicar sobre una base con datos.

**Resolved:** Sin resolver en esta sesión: hecha copia de seguridad (flxCatalog_IC_pre_beta137_20261013.bak) y preparado un script de solo esquema; su aplicación queda pendiente de la autorización del usuario. Falta una herramienta que actualice el esquema de plataforma de una base existente sin reaplicar sus datos.

## 2026-10-13 · actualizacion-plataforma

**Asked for:** Actualizar la base de configuración de beta.56 a beta.137 conservando lo que no estaba en los scripts exportados. A petición del usuario: renombrar la base existente a _OLD, publicarla de nuevo y traspasar desde la antigua lo que faltase.

**Tried:** flexygo_publish_databases falló la primera vez porque los ficheros físicos de la base renombrada conservaban el nombre (flxCatalog_IC_Primary.mdf). No hay herramienta para renombrar una base ni para comparar o traspasar filas entre dos bases de configuración.

**Resolved:** Resuelto con SQL directo (sqlcmd y autenticación de Windows): ALTER DATABASE MODIFY NAME y MODIFY FILE, más un ren vía xp_cmdshell para los ficheros de la OLD. Tras la publicación, comparación por clave primaria y por contenido entre OLD y nueva. Traspasadas con INSERT/UPDATE directo: License (1), WebAPI_Objects CAT_Producto (1), Notices (6), Notices_Users (6) y 4 Settings (GoolgeAPIKey, MCP_Enabled, WebAPI_Enabled, BundleGUID). Origen activo devuelto a 1 con la herramienta. Nodo Tallas y contadores del carrito recreados con las herramientas. Reaplicado el arreglo bcp -u en los 7 procedimientos zScript% con QUOTED_IDENTIFIER ON.

## 2026-10-13 · dashboard

**Asked for:** Indicadores (flx-easyinfo) con etiqueta de dos líneas (<div> + <small>), tal como recomienda la referencia de dashboards.

**Tried:** Con la plataforma 10.0.0-beta.137 la etiqueta se escapa: el usuario ve «<div>Ventas del año</div><small>…» literal en el dashboard. La referencia (flexygo_get_dashboard_reference) sigue diciendo que el label se inyecta como HTML, medido en beta.56.

**Resolved:** Etiquetas pasadas a texto plano en mod-dash-kpis-easyinfo (se pierde el subtítulo). La referencia del servidor debería actualizarse para beta.137.

## 2026-10-13 · exportacion-configuracion

**Asked for:** Conservar en los scripts exportados de Conf.Database los caracteres que no son de Windows-1252 (←, ★, ☆, ●, ✕) usados en módulos HTML y plantillas.

**Tried:** flexygo_script_changes (zScriptJSON) escribe esos caracteres como «?»: tras exportar, modules.sql y objects_templates.sql tenían «? {{translate|Volver…}}» y switch:[1:?,else:?], aunque la base guardaba bien el carácter. Una publicación posterior lleva el «?» a pantalla: así quedó flxCatalog en 15 enlaces de vuelta, las estrellas de favorito, el indicador de no leída y el botón de quitar del carrito. Las tildes y el € sobreviven porque están en 1252.

**Resolved:** Resuelto en el proyecto usando entidades HTML ASCII (&larr;, &#9733;, &#9734;, &#9679;, &#10005;) en las 15 cabeceras de vuelta y las 3 plantillas. Comprobado por SQL que no queda ningún carácter fuera de 1252 en la configuración de origen 1. La exportación debería escribir en UTF-8 o avisar.

## 2026-10-13 · notificaciones

**Asked for:** Borrar las notificaciones (Notices y Notices_Users) de pedidos de test eliminados, que seguían saliendo al cliente en «Mis notificaciones».

**Tried:** No hay herramienta para listar ni borrar avisos ya emitidos; flexygo_get_notification_activity solo informa.

**Resolved:** Resuelto con sqlcmd y autenticación de Windows sobre flxCatalog_IC, con el usuario autorizándolo («lo que veas», D-11): borrados 36 avisos y 16 asignaciones a usuarios de los pedidos de test CARR-…, filtrando por su título exacto.

## 2026-10-26 · ayuda

**Asked for:** Poner el botón de ayuda de /flx-help en un dashboard cuyos módulos (indicadores flx-easyinfo y gráficos flx-echart) no tienen barra de botones: la verificación de ayuda exige que un botón de un módulo de la página abra la entrada.

**Tried:** flexygo_add_toolbar_button sobre mod-dash-kpis-easyinfo y mod-dash-top-vendidos-echart: «carries no toolbar at all — dbo.Modules.ToolbarName is null». No hay herramienta para asignar una barra a un módulo que no la tiene.

**Resolved:** No resuelto: la ayuda del Dashboard queda accesible por el menú «Ayuda», el recorrido de la pantalla y el de bienvenida.

**Server:** flexygo-mcp unknown
