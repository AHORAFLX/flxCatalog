# Decisions — pendientes-cliente-admin

## 2026-09-30 · affects development

**Question:** Development 'pendientes-cliente-admin' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-21). Reason (in the user's own words): Acceso público/invitado descartado: todo lo que iba a ser de acceso público pasa a estar detrás del login del cliente, no se construye ningún acceso anónimo (decisión D-2 de seguridad-acceso-publico, 2026-09-21). Mismo motivo ya usado al abrir carrito-pedidos, portal-clientes, notificaciones-comunicacion, presupuestos-postventa y correcciones-rol-cliente; seguridad-acceso-publico sigue aparcado a la espera de decidir si se cierra o se reduce su alcance.

## 2026-09-30 · affects development

**Question:** El punto 'Borra todo lo que tiene que ver con Contacto y Demostracion' de pending.md: ¿se borra también la tabla SolicitudesContacto, o solo la configuración Flexygo (objetos, páginas, módulos, menú), dejando la tabla?

**User answer:** Todo, incluida la tabla: es una funcionalidad de demo que no se quiere conservar. Se borran los objetos Flexygo COM_SolicitudContacto/COM_SolicitudDemo con sus páginas, módulos y nodos de menú, y la tabla SolicitudesContacto de la base de datos.

## 2026-10-02 · affects T-08, T-09, T-10, T-11

**Question:** El kanban nativo de Flexygo necesita un objeto tablero con relaciones hacia las tarjetas; no existe ninguno que cubra todas las incidencias, pedidos y devoluciones. ¿Se crea un tablero propio o se sustituye el kanban por otro módulo?

**User answer:** Decisión tomada por Claude, no por el usuario: el usuario pidió expresamente el kanban nativo de Flexygo y que se continuara sin preguntar. Se crea un objeto y una tabla «Mesa de trabajo» con un único registro, sin alta ni borrado para nadie, y con una relación hacia incidencias, otra hacia pedidos y otra hacia devoluciones, de modo que cada kanban cuelgue de ese tablero. Se revisa si el usuario prefiere otra cosa al cierre.

## 2026-10-02 · affects T-08, T-09, T-10, T-11

**Question:** El kanban nativo necesita un objeto tablero con relación a las tarjetas y no existe uno que cubra todas las incidencias, pedidos y devoluciones. ¿Cómo lo resolvemos?

**User answer:** Opción 1: crear la tabla y el objeto «Mesa de trabajo» con un único registro, solo lectura para todos y sin showInMenu, con tres relaciones hacia incidencias, pedidos y devoluciones; comprobar cómo las recorre la plataforma. Añadir la tabla al proyecto SSDT y su fila única al seed. Si el tablero único no sirve de verdad, parar y devolver el mensaje literal.

## 2026-10-02 · affects T-14

**Question:** Los módulos de gráfico de Flexygo no admiten WHERE ni ORDER BY en su SQL, así que no se puede pedir un top N. ¿Cómo se construyen los cuatro rankings del dashboard?

**User answer:** Decisión tomada por Claude, no por el usuario, porque el usuario pidió seguir sin preguntar: cada ranking pasa a una vista de base de datos que ya calcula el top 8 ordenado (cuatro vistas nuevas), y el módulo de gráfico lee de esa vista sin WHERE ni ORDER BY, con los filtros fijos en objectFilter. Las vistas también se añaden al proyecto SSDT. La alternativa descartada es cambiar los gráficos por listas. Se revisa si el usuario prefiere otra cosa al cierre.

## 2026-10-02 · affects B-4

**Question:** Al desmarcar «mostrar en menú», seis maestros (Colores, Tallas, Estados de pedido, de devolución y de incidencia, Tipos de incidencia) quedan sin acceso, porque no tienen página de lista. ¿Se vuelven a marcar en el menú automático o se construyen sus páginas?

**User answer:** Decisión tomada por Claude, no por el usuario, porque el usuario pidió seguir sin preguntar: se mantiene el árbol propio como único menú y se construyen para los seis maestros una página de lista (con su módulo, solo admins) y un nodo bajo «Maestros». Volver a marcarlos habría creado un segundo menú junto al árbol, que es lo que la regla del plan prohíbe.

## 2026-10-02 · affects T-17

**Question:** Los maestros Colores, Tallas, Estados de pedido, de devolución y de incidencia y Tipos de incidencia no tenían página y quedaban sin acceso tras desmarcar «mostrar en menú». ¿Se construyen sus páginas de lista y su nodo bajo Maestros?

**User answer:** Sí (indicado por la coordinación): una página de lista por maestro con su módulo de lista, restringida a administradores (allUsers sin acceso, como el resto de páginas del administrador), y un nodo bajo «Maestros» en «Barra lateral 2026» con la misma seguridad. Las filas se abren con la edición genérica (sin páginas de ficha ni filtros nuevos) para no ampliar el alcance.

## 2026-10-02 · affects T-21, T-22

**Question:** Las herramientas de nodos no permiten un contador dinámico como el del badge de noticias. ¿Cómo se entrega el icono del carrito en la barra superior?

**User answer:** Decisión tomada por Claude, no por el usuario, porque el usuario pidió seguir sin preguntar: opción a. Se crea un nodo de proceso con icono de carrito en la barra superior, que abre el carrito del cliente (pVTA_AbrirMiCarrito) y solo es visible para el rol cliente. El contador queda sin entregar, porque exigiría escribir directamente en Navigation_Nodes o en el script global de la interfaz, y eso es un parche que no se hace. La carencia ya está registrada como falta de capacidad del servidor. Es una entrega parcial del punto del pending.md y el usuario tiene que decidir si acepta el carrito sin contador o si pide el parche.
