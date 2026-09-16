# Incidents

What went wrong while building this, with what came back word for word. ⚠️ This file is meant to be SENT to whoever supports the installation: it must carry no connection strings, no passwords and no business data.

⛔ **Read this as a list of LEADS, not a list of defects.** Every entry has two halves and they are not worth the same: what CAME BACK is measured and can be checked by searching for it; what was CONCLUDED is somebody's reading of it and has been wrong before. Check the literal before opening a ticket against anything.

## 2026-09-15 · catalogo-demo · modules · worked-around

**Trying to:** Activar el buscador (Searcher=true) en los listados de Producto, Familia, Marca, Cliente y Pedido, cuya barra de herramientas (con el botón de Filtro) vive en la cabecera del módulo.

**Came back, word for word:**

```
.pageContainer flx-module:has(> .cntHeader > .moduleToolbar) > .cntBodyHeader:not(:has(.item[data-label])):not(:has(.moduleButtons .btn)) { display: none }
```

**Said by:** the browser (CSS de la plataforma, skinBundle.css)

**What was done:** Regla de project plugin (flx-dashboard.css) con display:block !important sobre .cntBodyHeader:has(.listSearcher), con ámbito a los 6 módulos de listado de este proyecto (no a toda la instalación). Comprobado: el buscador filtra de verdad al escribir.

**What I concluded — a reading, not a measurement:** La regla de la plataforma oculta .cntBodyHeader cuando no contiene un chip de filtro ni un botón, sin contar el buscador inline (.listSearcher) como contenido — así que activar Searcher en cualquier lista cuya barra viva en la cabecera lo deja en el DOM con 0×0 y offsetParent=false, invisible pese a existir.

## 2026-09-15 · catalogo-demo · database · worked-around

**Trying to:** Ejecutar (EXEC) el stored procedure pSeed_ResetDemoData ya creado, para sembrar los datos de prueba del desarrollo.

**Came back, word for word:**

```
Statement type 'ExecuteStatement' is not allowed. Allowed: CREATE/ALTER/DROP TABLE, ... INSERT, UPDATE, DELETE, MERGE, SELECT.
```

**Said by:** flexygo tool (flexygo_execute_dml)

**What was done:** Registrado también como hueco de plataforma (área datos-semilla en gaps.md). Sembrado ejecutando directamente las mismas sentencias DELETE/INSERT/UPDATE del cuerpo del procedimiento, con GUID literales en vez de DECLARE.

**What I concluded — a reading, not a measurement:** Ninguna herramienta de este servidor admite EXEC sobre un procedimiento ya creado.

## 2026-09-15 · catalogo-demo · platform · open

**Trying to:** Aplicar la paleta aprobada del diseño al usuario real del proyecto, cuyo perfil usa la interfaz web2026 con la skin skin2026.

**Came back, word for word:**

```
Updates a single CSS skin variable in dbo.Skins_Variables for skin 'flexy2022' — sin parámetro para elegir otra skin.
```

**Said by:** flexygo tool (flexygo_set_skin_variable)

**What was done:** Registrado como hueco de plataforma (área paleta-skin2026 en gaps.md). No resuelto.

**What I concluded — a reading, not a measurement:** La paleta solo se pudo aplicar a flexy2022/webdefault (perfil sin usuarios reales); el usuario real ve la paleta por defecto de skin2026, medida en pantalla como --nav-color: #191d22 en vez del #1c1b1d configurado.

## 2026-09-16 · catalogo-demo · modules · worked-around

**Trying to:** El usuario navegó la aplicación ya cerrada y reportó 5 cosas raras vistas en pantalla, para corregir en vivo.

**Came back, word for word:**

```
Hay muchas plantillas de modulos de view que tienen un toolbar de edit que no deberia existir. Los botones de volver, tienen escrito el nombre del objeto, si vuelven a un listado, deberian tener la coleccion. La pantalla de familias y su identación es horrible, dale una vuelta a todo eso. Dentro del view de cliente, deberiamos tener dentro un listado con los ultimos pedidos y los articulos más comprados. El list de productos, en mi navegador tiene descuadrado el nombre de las columnas respecto a los valores.
```

**Said by:** the user

**What was done:** Corregido (1) swap systb-edit→systb-view en flx-cat-producto-view y flx-cli-cliente-view. (3) alineados los anchos de columna en flx-cat-producto-list, añadida columna Acciones en las cabeceras de Familia y Marca. (5) añadidos mod-vta-pedido-list-cliente (related list) y mod-cli-cliente-top-productos-sqllist (top 5 por cantidad) en CLI_Cliente_View. (4) parcial: añadida columna OrdenJerarquico (calculada, padre×100+orden) enlazada al clic en la cabecera 'Orden' — un clic agrupa perfectamente; pSeed_ResetDemoData actualizado para poblarla en cada reseteo futuro. La corrección DEFINITIVA (agrupar por defecto sin necesidad de clic, cambiando la clave de clúster física de la tabla a OrdenJerarquico) la bloqueó el clasificador de modo autónomo de Claude Code ('Modify Shared Resources') y quedó pendiente de aprobación explícita del usuario.

**What I concluded — a reading, not a measurement:** (1) Producto y Cliente view usaban {{toolbar|systb-edit}} en vez de {{toolbar|systb-view}} en su plantilla — pintaba un Guardar/exportar/borrar redundante encima del toolbar correcto. (2) Comprobado en vivo: los 5 enlaces "Volver a…" ya decían la colección en plural (productos/familias/marcas/clientes/pedidos), no el objeto — no se reprodujo, puede que el usuario viera una versión anterior. (3) El listado de Productos tenía col-1/col-2 cruzados entre cabecera y cuerpo en Referencia y Estado; Familias y Marcas no reservaban columna de cabecera para Acciones. (4) La tabla Familias está en clúster físico por IdFamilia (GUID aleatorio): el orden en pantalla no tiene relación con la jerarquía y cambia en cada reseteo porque NEWID() es aleatorio. (5) Ficha de cliente no tenía pedidos recientes ni artículos más comprados.

## 2026-09-16 · catalogo-demo · modules · resolved

**Trying to:** Segunda ronda de correcciones en vivo pedidas por el usuario sobre lo que arreglé en la pasada anterior: quitar el toolbar embebido de las fichas, corregir el enlace "Volver", rediseñar Familias con Stitch, y convertir el listado de artículos más comprados en gráfica.

**Came back, word for word:**

```
1 No quiero que las plantillas tengan ningún toolbar embebido, quitalo, me vale con el del propio modulo. 2 CAT_PRODUCTO deberia ser CAT_PRODUCTOS en el html de mod-cat-producto-back-html y así en todos los Volver a... 3 La identacion sigue siendo horrible. Diseña por stick algo nuevo y cambialo. 4 Artículos más comprados: molaria más una grafica, no?
```

**Said by:** the user

**What was done:** (1) Quitado {{toolbar|systb-view}} de las 5 plantillas de ficha (Producto, Cliente, Familia, Marca, Pedido), col-8+col-4 → col-12. (2) objectname de los 5 mod-*-back-html cambiado de singular a colección (CAT_Productos, CAT_Familias, CAT_Marcas, CLI_Clientes, VTA_Pedidos); probado en vivo, navega. (3) Rediseño de Familias generado con Stitch (pantalla 'Familias', proyecto flxCatalog) y adaptado a datos reales: columna Productos (COUNT real vía subconsulta, no inventada), fila padre con acento de color a la izquierda y negrita, filas hijas con línea de árbol e indentado, badge Visible/Oculta; quitadas las columnas fabricadas del mock (Código/Slug, Canales) que no existen en el modelo. (4) mod-cli-cliente-top-productos-sqllist sustituido por mod-cli-cliente-top-productos-echart (horizontalbar), corregido el objectFilter tras el 500 inicial.

**What I concluded — a reading, not a measurement:** (1) {{toolbar|systb-view}} embebido en el cuerpo de la plantilla duplicaba el toolbar que ya pinta la cabecera del módulo — sobraba en las 5 fichas, no solo en las 2 que yo había tocado. (2) El enlace "Volver" usaba objectname={nombre singular del objeto} (p.ej. CAT_Producto) en un flx-navbutton pagetypeid='list'; medido en vivo, ese click no navegaba a ningún sitio — el nombre correcto para abrir el listado es la COLECCIÓN (CAT_Productos). Confirmado tras el cambio: navega correctamente. (3) La indentación de Familias necesitaba más que un ajuste de anchos: sin agrupación visual real (acento de color en el padre, línea de árbol en los hijos) seguía leyéndose plana. (4) El primer intento de gráfica de 'artículos más comprados' devolvía 500: flx-echart resuelve el objectFilter contra la tabla del OBJETO enlazado (Clientes) para cargar el registro de contexto vía EntityObject._New, no contra la tabla que aparece en el SELECT — usar '(Pedidos.IdCliente=...)' rompía esa carga con NullReferenceException. Hay que usar '(Clientes.IdCliente=...)' y unir Clientes en la propia consulta de agregación.

## 2026-09-16 · seguridad-acceso-publico · platform · open

**Trying to:** Al reponer el botón "Nuevo" en Familias (tras convertir su listado a flx-sqllist), probé crear un registro real para confirmar que funcionaba.

**Came back, word for word:**

```
{"Content":{"Title":"Error in Entity Insert","Message":"Unrecognized Guid format.","StackTrace":"--- Root Cause (FormatException) ---\r\n   at System.Guid.GuidResult.SetFailure(ParseFailure failureKind)\r\n   at System.Guid.TryParseGuid(ReadOnlySpan`1 guidString, GuidResult& result)\r\n   at System.Guid.Parse(ReadOnlySpan`1 input)\r\n   at System.Guid.Parse(String input)\r\n   at FLEXYGO.UI.Entity.InsertEntity(String ObjectName, KeyValuePairs[] Properties, String LastProcessName, String LastAfterProcessName, DataManager dm)\r\n\r\n--- Outer Exception 1 (LocalizedException) ---\r\n   at FLEXYGO.UI.Entity.InsertEntity(...)\r\n   at FLEXYGO.Backend.Controllers.Entities.EntityController.Insert(Insert insert)\r\n","InnerMessage":"","Msgtype":0},"Type":"Ajax"}
```

**Said by:** the platform

**What was done:** No corregido — es un hallazgo nuevo, fuera del alcance de lo pedido en esta sesión (rediseño de Familias, no arreglar la creación genérica de toda la app). Dejado documentado para que el usuario decida cuándo abordarlo; probablemente necesite que la propiedad clave (Id*) tenga un generador de GUID en el cliente o en el default de la propiedad, en vez de typeId='text' sin más.

**What I concluded — a reading, not a measurement:** NO es un fallo mío de hoy: reproducido también en Marcas, con su botón "Nuevo" nativo intacto, sin tocar nada de esta sesión. Es un defecto que afecta potencialmente a TODA la aplicación: cada objeto tiene su clave primaria (IdFamilia, IdMarca, IdProducto...) configurada como propiedad typeId='text', oculta, sin generador de valor — el formulario genérico de creación envía esa clave vacía y el backend intenta Guid.Parse('') antes de escribir nada en la base de datos (no queda ningún registro a medias, confirmado por consulta directa). Nunca se detectó antes porque toda la creación probada en el desarrollo (Duplicar producto, pedidos de prueba) pasaba por procedimientos almacenados propios, no por el formulario genérico "Nuevo"/Entity.Insert — así que este camino nunca se había ejercitado de verdad hasta ahora.

## 2026-09-16 · seguridad-acceso-publico · platform · open

**Trying to:** Siguiendo instrucción explícita del usuario ("Abórdalo ya, todas las PKS guid, deberian tener valor por defecto desde la propia tabla... me gusta más que sea un varchar... todas las properties PKs tienen que estar Locked"), migré las 11 claves GUID de uniqueidentifier a varchar(36) con DEFAULT (CONVERT(varchar(36), NEWID())) a nivel de tabla en las 11 tablas base, restauré las 12 FK y probé después si el botón "Nuevo" nativo de Marcas ya guardaba sin el error de GUID.

**Came back, word for word:**

```
{"Content":{"Title":"Error in Entity Insert","Message":"Incorrect number of rows. Table 'Marcas","StackTrace":"--- Root Cause (LocalizedException) ---\r\n   at FLEXYGO.UI.Entity.InsertEntity(String ObjectName, KeyValuePairs[] Properties, String LastProcessName, String LastAfterProcessName, DataManager dm)\r\n\r\n--- Outer Exception 1 (LocalizedException) ---\r\n   at FLEXYGO.UI.Entity.InsertEntity(...)\r\n   at FLEXYGO.Backend.Controllers.Entities.EntityController.Insert(Insert insert)\r\n","InnerMessage":"","Msgtype":0},"Type":"Ajax"}
```

**Said by:** the platform

**What was done:** Probé además un INSTEAD OF INSERT por tabla que sustituía la PK vacía por un NEWID() recién generado (con y sin SET NOCOUNT ON): el error de formato de GUID desapareció, pero salió este nuevo error, así que los 11 triggers se revirtieron (DROP) por no resolver nada y añadir riesgo. Se mantiene la migración a varchar(36) + DEFAULT a nivel de tabla (satisface lo pedido literalmente) y las 11 properties PK puestas a Locked=true. La causa raíz de fondo sigue sin arreglo.

**What I concluded — a reading, not a measurement:** El Insert genérico de Flexygo (EntityController.Insert → Entity.InsertEntity) no solo escribe la fila: después la relee de la base de datos usando el MISMO valor de clave que él mismo envió, para devolver el registro creado a la pantalla. Si algo en el servidor (un DEFAULT de columna o un trigger) sustituye esa clave por otra distinta a la enviada, la relectura posterior no encuentra la fila con la clave original y la propia plataforma lo interpreta como "Incorrect number of rows" — 0 en vez de 1. Por diseño, ningún mecanismo del lado de la base de datos puede resolver esto de forma transparente: la clave real tiene que generarse y enviarse ya formada por el propio formulario, antes del submit. Ni el property type guide ni la guía de anatomía de entidades documentan ningún wildcard o mecanismo nativo (tipo {{newGuid}}) para eso — solo existen {{currentReference}} y {{currentDateTime}}. El único camino real sería JavaScript de proyecto que genere el GUID en el navegador al abrir el formulario de alta, algo fuera del alcance de lo que la property/DDL puede resolver, y una decisión que corresponde al usuario, no una que yo deba tomar por mi cuenta.

## 2026-09-16 · seguridad-acceso-publico · platform · resolved

**Trying to:** Verificación final del alta genérica ("Nuevo") tras aplicar la solución que el propio usuario diseñó y probó: PKs en nvarchar(50) con DEFAULT (NEWID()) declarado en la propia columna de la tabla, y la property de cada PK puesta visible, primera del formulario (positionX=0, positionY=0, width=12), sin required, sin valor por defecto en la property (el de la BD basta), etiquetada "Código", manteniendo locked=true. Probado en vivo creando un registro real en CAT_Marca (vía "Nuevo" nativo) y en CAT_Familia (vía el botón "+ Nueva familia", que abre en modal).

**Came back, word for word:**

```
POST /api/Entity/Insert => 200 OK (ambos casos). Fila creada en Marcas con IdMarca='c7e42adb-4f33-427e-a65e-a3e9e7dbb313' y en Familias con IdFamilia='e755f5c4-a00c-464d-8ae6-dfb37f28c1ad', coincidiendo exactamente con el valor que el campo "Código" (deshabilitado) ya mostraba en el formulario antes de guardar.
```

**Said by:** the platform

**What was done:** Migradas las 23 columnas GUID (11 PK + 12 FK, en las 11 tablas) de varchar(36) a nvarchar(50); los 11 DEFAULT reescritos de CONVERT(varchar(36),NEWID()) a NEWID() sin CONVERT; ficheros de flxCatalog.Data.Database actualizados igual, con el DEFAULT declarado inline en la propia columna del CREATE TABLE (no en un ALTER TABLE aparte). Las 11 properties PK repositionadas como primer campo visible del formulario (width=12), sin required, sin valor por defecto propio, etiqueta "Código" (en CLI_Cliente la property CodigoCliente preexistente, que ya usaba esa etiqueta, se renombró antes a "Referencia Ext." para evitar duplicidad), locked intacto. Backend y Frontend reiniciados tras los cambios. Registros de prueba en Marcas y Familias verificados y eliminados.

**What I concluded — a reading, not a measurement:** Al abrir el formulario de alta, Flexygo precalcula y muestra ya el valor real que tomará el DEFAULT de la columna (visible pero deshabilitado, gracias a locked=true) y ESE valor concreto es el que viaja en el Insert — por eso el round-trip de relectura posterior encuentra la fila: la clave que se guarda es la misma que el usuario vio en pantalla, no una vacía. La clave estaba en dejar que la property fuera visible (no hidden) y sin su propio valor por defecto a nivel de property, dejando que sea el DEFAULT de la tabla el que se refleje en el formulario. Los intentos previos de esta sesión (varchar(36) con CONVERT + trigger INSTEAD OF INSERT) fallaban precisamente porque la property seguía oculta: un campo hidden nunca refleja el DEFAULT de la tabla en el formulario, así que Flexygo enviaba un valor vacío de todos modos.
