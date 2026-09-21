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
