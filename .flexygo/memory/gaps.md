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
