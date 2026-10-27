# Decisions — presupuestos-postventa

## 2026-09-21 · affects development

**Question:** Development 'presupuestos-postventa' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-21). Reason (in the user's own words): Acceso público/invitado descartado: todo lo que iba a ser de acceso público pasa a estar detrás del login del cliente, no se construye ningún acceso anónimo (decisión D-2 de seguridad-acceso-publico, 2026-09-21).

## 2026-09-21 · affects development

**Question:** ¿Qué prefijo de entidad se usa para presupuestos-postventa, dado que el proyecto ya mezcla CAT_/VTA_/CLI_?

**User answer:** VTA_ — mismo prefijo que Pedido/LineaPedido/Tarifa, presupuestos es parte del mismo ciclo de ventas.

## 2026-09-21 · affects development

**Question:** ¿Se diseñan antes las pantallas de presupuestos-postventa con Stitch, o se construye directo con el aspecto propio de la plataforma?

**User answer:** Construir directo, sin diseño previo — mismo criterio que carrito-pedidos, sin pasar por Stitch ni aprobación de pantallas.

## 2026-09-21 · affects plan

**Question:** Plan rewritten (was 4 block(s), 36 task(s))

**User answer:** Reason: Ajuste del mismo plan recién escrito (0 tareas hechas) para dejar explícito, en el propio texto de cada tarea, cómo se alcanza cada página nueva — el propio servidor lo señaló como aviso en la escritura anterior.

## 2026-09-21 · affects T-07

**Question:** ¿El alcance de 'Mis documentos' se limita a Pedidos (PDF) y Tarifas, dejando fuera albaranes, certificados, contratos y fichas técnicas por no corresponder a nada del modelo actual, y descartando también Presupuestos del desarrollo completo?

**User answer:** Sí — el usuario confirmó el desglose de bloques propuesto (incluyendo esta acotación explícita de 'Mis documentos') y además pidió quitar Presupuestos de todas las especificaciones del desarrollo.

## 2026-09-21 · affects B-2

**Question:** En "Mis documentos", ¿el cliente debe ver el catálogo completo de tarifas (VIP, Mayorista, Profesional, Público, Distribuidor) o solo la tarifa que tiene asignada?

**User answer:** Solo la suya. El bloque "Tarifas" de "Mis documentos" debe mostrar únicamente la tarifa asignada al cliente logueado, no el catálogo completo.

## 2026-10-26 · affects T-05, T-06, T-07, T-16, T-17, T-20, T-32, T-33, T-36

**Question:** ¿Cómo quedan probadas T-05, T-06, T-07, T-16, T-17, T-20, T-32, T-33 y T-36 de presupuestos-postventa (Mis documentos, pantallas y menús de devoluciones e incidencias)?

**User answer:** Decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): las cubren los tests de interfaz de la batería, en verde el 26-oct, sin renombrarlos porque los números de tarea se repiten entre desarrollos: T-05/T-06/T-07 → ClienteCuentaTests.MisDocumentos_MuestraSusDocumentosYSuTarifa_SinListarPedidos y ClienteNavegacionTests.MenuCliente_AbreSuPantalla(Mis documentos); T-16/T-17/T-20 → ClientePostventaTests.Devolucion_SeSolicitaDesdeUnaLineaDelPedido_YElClienteLaCancela, Devolucion_ConMasUnidadesDeLasCompradas_SeRechazaSinCrearNada y AdminVentasTests.Postventa_ElAdministradorVeTodasYAbreSuFicha(Devoluciones); T-32/T-33/T-36 → ClientePostventaTests.Incidencia_SeAbreDesdeUnPedido_YElClienteLaCancela y Postventa_ElAdministradorVeTodasYAbreSuFicha(Incidencias).

## 2026-10-26 · affects development

**Question:** /flx-api de presupuestos-postventa: ¿qué de lo construido sale por la WebAPI y para quién?

**User answer:** Lo decidido por el usuario el 26-oct (D-15 de pendientes-cliente-admin): solo lectura (listado y ficha) de VTA_Devolucion, VTA_EstadoDevolucion, VTA_Incidencia, VTA_EstadoIncidencia y VTA_TipoIncidencia; los procesos de solicitar y cancelar no se exponen porque escriben datos. Llama solo el rol admins, también por /mcp.
