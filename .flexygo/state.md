# State

active: correcciones-rol-cliente

> The MCP regenerates it on every write. Do not edit it by hand: use /flx-status to read it and the workflow tools to change it.

## Active development — correcciones-rol-cliente

- **Request:** Correcciones de rol cliente, listadas en docs/pending.md bajo "ROL CLIENTE": (1) el menú de cliente abre "Mi Catálogo" y "Mi ficha" como procesos en vez de navegación al List/View correspondiente; (2) "Mi Catálogo" debería llamarse "Catálogo"; (3) el view de producto muestra un botón "mi comentario" sin permisos que no gusta — diseñar un módulo HTML con reseñas de producto (listado de últimas reseñas + formulario para añadir una nueva); (4) "Mis Favoritos" debería ser una navegación al catálogo filtrada a favoritos, no un módulo aparte; (5) "Mis documentos" debería ser solo el listado de documentos de la gestión documental del cliente actual, sin ver pedidos; (6) el cliente no debe poder dar de alta/editar/borrar una devolución directamente — alta/edición/borrado deben ser solo de admin, y el cliente debe tener un proceso DLL "Solicitar" (artículo, cantidad validando que no supere las unidades ya devueltas, pedido, comentario, motivo) que cree la devolución en estado 'Solicitada'; el cliente solo puede Cancelar una devolución que esté en 'Solicitada', ninguna otra acción sobre otros estados; (7) lo mismo para incidencias; (8) icono de carrito en la barra superior con badge igual que el de notificaciones; (9) buscador de artículos en la barra superior.
- **Progress:** 16/16 tasks (100 %) — FINISHED (adjudicated 2026-10-26)
- **Block in progress:** none, every block is finished.
- **Open points:** 0 (0 blocking)
- **Assumptions:** 2
- **Last activity:** 2026-09-28 · T-04 · OK

## Other developments

- carrito-pedidos — 24/24 tasks — FINISHED (adjudicated 2026-10-26)
- catalogo-demo — 26/26 tasks — FINISHED (adjudicated 2026-10-26)
- notificaciones-comunicacion — 10/10 tasks — FINISHED (adjudicated 2026-10-26)
- pendientes-cliente-admin — 28/28 tasks — FINISHED (adjudicated 2026-10-26)
- portal-clientes — 18/18 tasks — FINISHED (adjudicated 2026-10-26)
- presupuestos-postventa — 38/38 tasks — FINISHED (adjudicated 2026-10-26)
