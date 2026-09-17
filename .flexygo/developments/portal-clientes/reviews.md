# Reviews — portal-clientes

## 2026-09-17 · affects B-1

**Agreed:** Tabla Tarifas_Precios (IdPrecio PK nvarchar(50) DEFAULT NEWID(), IdTarifa/IdProducto FK, Precio, UNIQUE IdTarifa+IdProducto), llevada al proyecto de datos; objeto VTA_PrecioTarifa completo colgado como listado relacionado en VTA_Tarifa_View; datos demo de precios por tarifa.

**Found:** Tabla creada y verificada — se detectó y corrigió hoy un error de sintaxis en el .sql exportado (DEFAULT duplicado dentro de la lista de columnas del PRIMARY KEY, y una coma que faltaba entre PRIMARY KEY y UNIQUE), confirmado con flexygo_execute_ddl (ScriptDOM). Objeto VTA_PrecioTarifa completo (propiedades, vista con LEFT JOIN a Tarifas y Productos, ficha, filtros), listado relacionado mod-vta-preciotarifa-list-tarifa colgado en VTA_Tarifa_View. Como parte de T-03 se completó también VTA_Tarifa entero (no tenía página ni ficha propia). Datos demo ampliados hoy a 420 filas (Mayorista/Distribuidor/Profesional sobre 140 productos) como parte de la petición de más volumen de datos.

**Deviation:** Ninguna respecto al alcance del bloque. El módulo genérico de listado mod-vta-preciotarifa-list (sin el sufijo -tarifa) queda sin colocar en ninguna página — es el prerequisito técnico que exige flexygo_create_related_list_module para poder derivar la plantilla del listado relacionado, no un módulo huérfano por descuido (mismo patrón que ya existía en VTA_LineaPedido). flexygo_audit_origin lo señala como advertencia, no como defecto.

## 2026-09-17 · affects B-2

**Agreed:** Rol 'cliente' creado con flexygo_create_role. Context variable {{currentClienteTarifaId}} = SELECT IdTarifa FROM Clientes WHERE IdCliente = '{{currentSubreference}}'.

**Found:** Rol 'cliente' creado correctamente, sin filas de seguridad propias hasta B-4. Context variable creado con order 10, pero su SQL se corrigió durante T-18 a WHERE IdCliente = '{{currentReference}}' — el usuario guardó el IdCliente del cliente de prueba en AspNetUsers.Reference, no en Subreference.

**Deviation:** El token base cambió de {{currentSubreference}} a {{currentReference}}. Recogido en la decisión D-3: cada alta de cliente futura usará el campo Referencia, no Subreference.

## 2026-09-17 · affects B-3

**Agreed:** Vista CAT_ProductoClienteList con columna PrecioCliente. Tres páginas nuevas de solo lectura (Mi catálogo, Mis pedidos, Mi ficha), sin dashboard adicional (asunción S-2 original).

**Found:** Las tres páginas construidas, verificadas en pantalla con datos reales de un cliente de prueba (8 productos con precio de tarifa, 1 pedido propio, su propia ficha con tarifa). Además existe una cuarta página, 'Home Cliente' (creada por el usuario, no por una tarea del plan), con un resumen (saludo, tarifa, últimos 5 pedidos) que sí funciona como un pequeño dashboard del cliente.

**Deviation:** La asunción S-2 ('sin dashboard adicional') quedó revisada — el usuario pidió expresamente ese resumen sobre la página que él mismo creó. Ver S-2 revisada y decisión asociada. No es un defecto: fue una petición directa dentro de esta misma sesión.

## 2026-09-17 · affects B-4

**Agreed:** Object security en CLI_Cliente y VTA_Pedido con filtro IdCliente = '{{currentSubreference}}'; CAT_Producto/Familia/Marca en solo lectura sin filtro; el resto del backoffice denegado; página/módulo security concediendo las 3 páginas nuevas y denegando las de administración.

**Found:** Las 5 tareas aplicadas y verificadas en pantalla. Durante T-18 se corrigieron dos problemas no previstos: (1) el filtro de VTA_Pedido usaba la columna IdCliente sin cualificar, ambigua entre Pedidos y Clientes por el JOIN de las vistas — se cualificó como Pedidos.IdCliente; (2) el token pasó de {{currentSubreference}} a {{currentReference}} en ambos objetos, igual que en B-2.

**Deviation:** Columna cualificada en el filtro de VTA_Pedido (Pedidos.IdCliente) y cambio de token a {{currentReference}} — ninguno cambia lo que el bloque tenía que lograr (cada cliente ve solo lo suyo), solo cómo se consiguió.

## 2026-09-17 · affects B-5

**Agreed:** Nodo de navegación raíz 'Menú Cliente' creado con flexygo_create_navigation_node, con 3 hijos. Interfaz 'webcliente'. Verificación real con login de prueba.

**Found:** flexygo_create_navigation_node no admite crear una raíz sin padre (gap de plataforma ya registrado en gaps.md, área 'navegacion') — el usuario creó la raíz él mismo en la pantalla de Flexygo (NodeId c0167e61-8539-4658-baeb-7fb023d88f58) y los 3 hijos se colgaron ahí con la tool. Interfaz 'webcliente' creada según lo acordado. Verificación real completada con un cliente de prueba (rol cliente, Referencia=IdCliente real): catálogo con precio de tarifa, su propio pedido, su propia ficha, y backoffice de admin intacto tras corregir dos regresiones encontradas en la propia verificación (ambigüedad de página entre ficha de backoffice y ficha del portal; y una plantilla propia sin objectname que rompía los módulos hermanos de la ficha de cliente/pedido en el backoffice — ambas corregidas y verificadas).

**Deviation:** La raíz del menú la creó el usuario a mano en vez de una tool, por el gap de plataforma. Dos correcciones no previstas en el plan (ambigüedad de página con nombre explícito de página; objectname restaurado en flx-cli-cliente-list y flx-vta-pedido-list) — ninguna estaba en el alcance original de B-5, surgieron al verificar, y quedan documentadas en corrections.md.
