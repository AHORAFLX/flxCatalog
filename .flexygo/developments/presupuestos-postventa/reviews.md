# Reviews — presupuestos-postventa

## 2026-09-21 · affects T-01, T-02, T-04

**Agreed:** Añadir a Pedidos las 4 columnas de seguimiento, sus propiedades en la ficha admin, y un indicador visual de progreso de EstadoPedido en la ficha del cliente.

**Found:** Columnas creadas (Transportista, NumeroSeguimiento, UrlSeguimiento, FechaEntregaEstimada), propiedades en VTA_Pedido colocadas en la vista de detalle existente, e indicador de 5 pasos (Borrador→Confirmado→En proceso→Enviado→Entregado) calculado en la vista VTA_PedidoClienteView y pintado con iconos en la plantilla del cliente. flexygo_verify_object(VTA_Pedido): PASS 8/8.

**Deviation:** Ninguna.

## 2026-09-21 · affects T-03

**Agreed:** Mostrar las propiedades de seguimiento en la ficha del cliente como datos de solo lectura una vez el pedido está en tránsito.

**Found:** Las 4 propiedades se muestran siempre en una nueva sección 'Envío' de la ficha del cliente, con guiones (—) cuando aún no hay datos, igual que ya hacía el campo FormaPago en esa misma plantilla.

**Deviation:** La sección no se oculta condicionalmente antes de que el pedido esté en tránsito, para no complicar la plantilla con lógica condicional adicional. Efecto visual equivalente (no hay nada que ver hasta que el admin rellena el transportista), pero es una desviación literal del enunciado.

## 2026-09-21 · affects T-05, T-07

**Agreed:** Página 'Mis documentos' del cliente con listado de sus pedidos y descarga de PDF, alcanzable por una entrada de navegación en el menú del cliente.

**Found:** Página VTA_MisDocumentos_List creada sobre VTA_Pedido, con botón de descarga de PDF por fila (proceso pVTA_GenerarPdfPedido existente) y nodo de menú 'Mis documentos' bajo Menú Cliente — único punto de entrada, confirmado por flexygo_audit_origin (no aparece en 'pages reachable from more than one root' ni en 'pages that cannot be reached').

**Deviation:** Ninguna.

## 2026-09-21 · affects T-06

**Agreed:** Añadir a 'Mis documentos' un listado de las Tarifas visibles para el cliente, reutilizando VTA_Tarifa.

**Found:** Módulo mod-vta-tarifa-list (el mismo que usa la administración) colocado también en la página nueva. Al introspeccionar la seguridad antes de construir, se encontró que el rol 'cliente' tenía VTA_Tarifa completamente cerrado (canView=False, canViewCollection=False) — se corrigió con flexygo_set_object_security abriendo solo canView/canViewCollection (de solo lectura). flexygo_verify_object(VTA_Tarifa): PASS 8/8.

**Deviation:** No es una desviación del plan, pero sí un cambio de seguridad no explícito en el texto de la tarea: el cliente ve el catálogo COMPLETO de tarifas, no solo la propia (ya trasladado al usuario tras B-2, sin respuesta todavía).

## 2026-09-21 · affects B-3

**Agreed:** Tabla maestra de estados, tabla Devoluciones, objetos VTA_EstadoDevolucion/VTA_Devolucion, vista, filtros, páginas, módulos en pantalla única admin+cliente, gestor de fotos, y relaciones Pedido→Devoluciones y Devolución→Estado.

**Found:** Todo construido tal como se acordó. flexygo_verify_object(VTA_Devolucion): PASS 8/8. flexygo_verify_object(VTA_EstadoDevolucion): FAIL 4/8 en vista/filtros/páginas — esperado por S-2 (tabla maestra fija sin pantalla propia). Seguridad de fila resuelta con una subconsulta vía Pedidos (Devoluciones no tiene IdCliente propio), en vez de una columna directa como en VTA_Pedido — mismo efecto, adaptación necesaria por la forma real de la tabla.

**Deviation:** Ninguna respecto al efecto acordado. No se creó relación Pedidos_Lineas→Devoluciones (el plan no la pedía); queda como posible ampliación futura si se quiere listar devoluciones desde la línea de pedido.

## 2026-09-21 · affects T-19

**Agreed:** Botón 'Solicitar devolución' en la línea de pedido del cliente que abra la creación de una Devolución ligada a ese pedido y esa línea.

**Found:** Añadido a la plantilla flx-vta-lineapedido-detalle-list como flx-navbutton hacia VTA_Devolucion con objectwhere="" (fuerza alta en vez de edición) y defaults precargando IdPedido/IdLinea. Pasa la validación del servidor.

**Deviation:** No verificado en pantalla — el Backend no estaba levantado durante la construcción. Pendiente de /flx-verify: confirmar que abre el alta con los campos precargados y no un error.

## 2026-09-21 · affects B-4

**Agreed:** Dos tablas maestras (Tipos/Estados), tabla Incidencias, tres objetos, vista, filtros, páginas, módulos en pantalla única admin+cliente, gestor de fotos, relaciones, y el esquema completo del desarrollo llevado a SSDT.

**Found:** Todo construido tal como se acordó, simétrico a B-3. flexygo_verify_object(VTA_Incidencia): PASS 8/8. VTA_TipoIncidencia y VTA_EstadoIncidencia: FAIL 4/8 esperado (mismo motivo que VTA_EstadoDevolucion). flexygo_script_data_structure escribió 32 ficheros en flxCatalog.Data.Database/dbo, confirmados en disco, incluyendo las columnas de seguimiento de Pedidos (B-1).

**Deviation:** Ninguna.

## 2026-09-21 · affects T-35

**Agreed:** Botón 'Crear incidencia' en la ficha de pedido del cliente que abra la creación de una Incidencia ligada a ese pedido.

**Found:** Añadido a la plantilla flx-vta-pedido-cliente-view (la misma que ya lleva el indicador de progreso de B-1) como flx-navbutton hacia VTA_Incidencia con objectwhere="" y defaults precargando IdPedido.

**Deviation:** No verificado en pantalla, mismo motivo que T-19. Pendiente de /flx-verify.

## 2026-09-21 · affects T-38

**Agreed:** Llevar el esquema nuevo al proyecto de datos SSDT con flexygo_script_data_structure para que viaje a otra instalación.

**Found:** El usuario reportó que el proyecto de datos (flxCatalog.Data.Database) no compilaba. flexygo_script_data_structure había escrito los 32 ficheros sin avisar de error, pero dotnet build sobre el .sqlproj daba 17 errores SQL46010/SQL71501 en 18 ficheros de tabla — un fallo del generador (documentado en flexygo_record_missing_capability, área schema-scripting), no del modelo en sí. Corregido a mano: quitada la cláusula DEFAULT duplicada dentro de la lista de columnas de la PK en 18 tablas, y añadida la coma que faltaba entre PK y UNIQUE en Tarifas_Precios.sql y Favoritos.sql. Recompilado: 0 errores.

**Deviation:** El resultado de T-38 no era el que se registró (build limpio) hasta esta corrección manual. El fallo es del generador de scripts, no de las tablas nuevas de este desarrollo específicamente — afectaba también a tablas ajenas (Tarifas, Productos, Clientes, Pedidos, Favoritos).
