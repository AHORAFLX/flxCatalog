# Decisions — correcciones-rol-cliente

## 2026-09-22 · affects development

**Question:** Development 'correcciones-rol-cliente' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-21). Reason (in the user's own words): Acceso público/invitado descartado: todo lo que iba a ser de acceso público pasa a estar detrás del login del cliente, no se construye ningún acceso anónimo (decisión D-2 de seguridad-acceso-publico, 2026-09-21). Mismo motivo ya usado al abrir carrito-pedidos, portal-clientes, notificaciones-comunicacion y presupuestos-postventa; seguridad-acceso-publico sigue aparcado a la espera de decidir si se cierra o se reduce su alcance.

## 2026-09-22 · affects development

**Question:** Para correcciones-rol-cliente, ¿se construye todo directo contra el skin instalado (sin Stitch), como en los 4 desarrollos anteriores, o se diseña antes con Stitch?

**User answer:** Todo en directo salvo la pantalla de visualización del artículo (ficha de producto) con el módulo de reseñas/comentarios: esa pantalla sí se diseña con Stitch antes de construirla. El resto (navegación de menú, favoritos, mis documentos, devoluciones/incidencias de cliente, carrito en barra superior, buscador) se construye directo, sin pasar por Stitch ni aprobación de pantallas.

## 2026-09-22 · affects development

**Question:** El módulo de reseñas de producto pedido en pending.md, ¿es una entidad nueva o reutiliza algo que ya existe?

**User answer:** No es una entidad nueva: reutiliza COM_Comentario (tabla Comentarios, patrón EntidadTipo/EntidadId ya construido en notificaciones-comunicacion), que ya tiene un módulo de lista sobre CAT_Producto_View (mod-com-comentario-list-producto, EntidadTipo='Producto'). Lo que se corrige es la UI (botón sin permisos, diseño pobre) rediseñándola como un módulo HTML propio con listado de últimas reseñas + formulario de alta, no el modelo de datos.

## 2026-09-22 · affects development

**Question:** ¿Qué sistema de diseño de Stitch se usó para dibujar P-RESEÑAS (reseñas de producto)?

**User answer:** Se reutilizó el proyecto Stitch ya existente del producto ("flxCatalog", projects/15428611361078160014) y su sistema de diseño DESKTOP ya derivado de DESIGN.md (assets/94f3f699a84b47b8a536af88cfb017db) — el mismo que se usó en catalogo-demo — en vez de crear uno nuevo, para mantener coherencia visual con el resto de la aplicación ya construida.

## 2026-09-22 · affects development

**Question:** ¿Se aprueba la pantalla P-RESEÑAS (sección de reseñas de producto) tal y como se presentó en el informe?

**User answer:** Aprobada tal cual. Además, el usuario recuerda la norma del proyecto: todo lo que se construya en este desarrollo tiene que llevar datos de demo añadidos a pSeed_ResetDemoData (nunca seeding ad-hoc aparte) — aplica en particular a los comentarios/reseñas de producto (COM_Comentario con EntidadTipo='Producto'), que hoy no tienen fila alguna en el procedimiento de reset.

## 2026-09-22 · affects development

**Question:** ¿Qué pasa con una devolución/incidencia cuando el cliente la cancela estando en estado 'Solicitada'/inicial?

**User answer:** Pasa a un nuevo estado "Cancelada" — no se borra. Hay que añadir esa fila a Devoluciones_Estados e Incidencias_Estados (GUID libre, no hace falta fijo porque ningún property la lleva como DefaultValue) y su seeding correspondiente en pSeed_ResetDemoData.

## 2026-09-22 · affects development

**Question:** Comportamiento de P-RESEÑAS no visible en la captura: ¿qué pasa al publicar, puede un cliente dejar varias reseñas del mismo producto, y en qué orden salen las 'últimas reseñas'?

**User answer:** Restricción de negocio explícita del usuario: un cliente solo puede publicar una reseña de un producto que haya comprado (existe una línea de ese producto en algún pedido suyo). Si no lo ha comprado, no puede publicar — el formulario debe impedirlo o explicar por qué no está disponible, no fallar en silencio. Para lo no cubierto explícitamente se aplica un placeholder razonable: tras publicar, la reseña aparece al instante en la lista sin mensaje aparte; el orden de 'últimas reseñas' es por fecha, más reciente primero; no hay restricción de una sola reseña por producto más allá de la restricción de compra ya indicada.

## 2026-09-22 · affects plan

**Question:** Plan rewritten (was 4 block(s), 16 task(s))

**User answer:** Reason: Aclarar en el propio texto de cada tarea el punto de entrada de la página que toca, tal y como pide el aviso de la escritura anterior — sin cambiar alcance, bloques ni número de tareas.

## 2026-09-25 · affects T-02

**Question:** T-02: ¿un nodo de navegación admite tokens ({{currentReference}}) en ObjectWhere igual que un módulo?

**User answer:** Sí, un nodo de navegación admite ObjectWhere con tokens ({{currentReference}}) igual que un módulo — el token se resuelve vía {{ObjectWhere}} en la página/módulo de destino. Pero ningún tool MCP (flexygo_update_navigation_node / flexygo_create_navigation_node) expone las columnas ObjectName/ObjectWhere/PageTypeId de un nodo, así que hay que escribir directo en dbo.Navigation_Nodes. Confirmado y aceptado tal cual quedó aplicado en "Mi ficha" el 2026-09-22 (verificado en pantalla como cliente).

## 2026-09-25 · affects T-04

**Question:** T-04: ¿un nodo tipo 'page' admite ObjectWhere sobre una página de tipo list (no solo view)?

**User answer:** Sí, un nodo tipo 'page' admite ObjectWhere sobre una página tipo 'list', mismo mecanismo que T-02: hay que escribir directo en dbo.Navigation_Nodes porque el MCP no expone esas columnas para nodos. Confirmado y aceptado tal cual quedó aplicado en "Mis favoritos" el 2026-09-22 (apunta al catálogo compartido CAT_Producto_Cliente_List con ObjectWhere filtrando favoritos, verificado en pantalla sin afectar al catálogo sin filtrar).

## 2026-09-25 · affects T-11

**Question:** T-11: ¿desde qué pantalla se dispara "Solicitar devolución" — un botón en el pedido del cliente, o desde 'Mis devoluciones'?

**User answer:** Ninguna de las dos: se reutiliza el botón "Solicitar devolución" que ya existía por línea de pedido, en la plantilla flx-vta-lineapedido-detalle-list (objeto VTA_LineaPedido, dentro de VTA_Pedido_Cliente_View), que antes abría un alta directa. Es el punto de entrada correcto porque una devolución es sobre una línea concreta, no sobre el pedido entero. Ya construido, cableado a pVTA_SolicitarDevolucion y verificado en pantalla. Confirmado sin añadir un punto de entrada adicional a nivel de pedido.

## 2026-10-26 · affects development

**Question:** En la comparación de P-RESEÑAS, ¿qué se hace con las diferencias que no son del bloque de reseñas (cabecera y detalles de la ficha de producto, marco del módulo genérico de vista, tipografía Geist frente a Inter)?

**User answer:** Se quedan como están. El bloque de reseñas (lo que construyó este desarrollo) se ajusta al original: tamaños, pesos, radios, rellenos, avatar, fecha relativa y el botón negro del acento. La cabecera y los detalles de la ficha son la plantilla de producto de catalogo-demo, compartida con la ficha del administrador; el marco con título del módulo es el visor genérico de la plataforma. La tipografía Geist es la de toda la aplicación, y cambiarla solo en este bloque lo desentonaría. Decidido por el agente con la delegación del usuario («si hay que tomar alguna decisión la tomas tú»).

## 2026-10-26 · affects development

**Question:** Comparación de «Reseñas de producto (P-RESEÑAS)»: ¿se cierran por alcance las filas typography, record-card, badges, iconography y module-chrome, que difieren del original?

**User answer:** Sí, se aceptan tal como están.
- typography: se mantiene Geist, la familia de toda la aplicación, en lugar de Inter.
- record-card y badges: la cabecera de la ficha y la píldora «Activo» son de la plantilla de producto de catalogo-demo, compartida con la ficha del administrador, y no se tocan en este desarrollo.
- iconography: se mantienen las estrellas rellenas, que hacen falta para pintar la media parcial.
- module-chrome: la cabecera interior es el visor genérico de la plataforma, común a todas las fichas.
Decidido por el agente con la delegación del usuario.

## 2026-10-26 · affects T-01, T-02, T-03, T-04, T-05, B-2, T-11, T-12, T-13, T-14, T-15, T-16

**Question:** ¿Qué tests propios lleva «correcciones-rol-cliente» (T-01 a T-05, B-2, T-11 a T-16)?

**User answer:** No se escriben tests nuevos con estos identificadores. Los cubren las pruebas de interfaz del portal de clientes que ya existen y corren en cada pasada:
- ClienteNavegacionTests: menú y navegación del cliente (T-01 a T-05).
- ClienteCatalogoTests: reseñas y buscador (B-2).
- ClientePostventaTests: devoluciones e incidencias del cliente, con la validación de estado en el servidor (T-11 a T-15).
- La prueba de Mis documentos (T-16).
Los identificadores de tarea chocan con los de otros desarrollos, así que no se renombran pruebas existentes. Decidido por el agente con la delegación del usuario.

## 2026-10-26 · affects T-01

**Question:** ¿Lleva ayuda propia T-01, las variables de color de la skin?

**User answer:** No. Es la paleta de toda la aplicación, no una pantalla: no tiene nada que explicar a quien la usa. Decidido por el agente con la delegación del usuario.

## 2026-10-26 · affects development

**Question:** ¿Qué saca por la WebAPI «correcciones-rol-cliente» (reseñas, procesos de solicitar y cancelar devoluciones e incidencias, menú del cliente)?

**User answer:** Nada nuevo. Sigue la exposición decidida para el proyecto: 14 objetos en solo lectura, con admins como único rol que llama y que usa el asistente.
- Las reseñas (COM_Comentario) siguen cerradas.
- Los procesos de solicitar y cancelar son acciones del portal del cliente y no se abren desde fuera.
- El rol cliente no se autoriza.
Decidido por el agente con la delegación del usuario.
