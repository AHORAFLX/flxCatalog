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

## 2026-10-13 · affects T-08, T-09, T-10, T-11

**Question:** Con Flexygo beta.137 el kanban de la mesa de trabajo responde 500 porque ya no admite la relación constante «1=1» entre el tablero y las tarjetas. ¿Se añade una columna Activo (por defecto 1) a MesasTrabajo y a Pedidos y se relaciona Activo=Activo?

**User answer:** «Haz lo que consideres»: autorizado el cambio de esquema propuesto.

## 2026-10-13 · affects B-3

**Question:** El indicador «Pedidos pendientes» del dashboard cuenta los pedidos en estado Confirmado y En proceso. ¿Vale ese criterio?

**User answer:** Me vale.

## 2026-10-13 · affects development

**Question:** Quedan datos de prueba de los tests de interfaz (una devolución, una incidencia y un producto «ZZ…» del 03/10, y carritos CARR-… cancelados por el test de confirmar pedido) visibles en las listas y en el portal del cliente. ¿Se borran?

**User answer:** «Lo que veas»: autorizado borrar los restos de test.

## 2026-10-13 · affects development

**Question:** La página HOME (panel de control antiguo) está sustituida por el dashboard y tiene defectos visibles (leyenda encima del donut, títulos técnicos, gráficos en gris). ¿Se retira o se arregla?

**User answer:** Arréglalo.

## 2026-10-26 · affects development

**Question:** Con T-16 reabierta (por un fallo del recorrido, no de la tarea), sin /flx-test ni /flx-quality hechos, ¿se adelanta la ayuda (/flx-help)?

**User answer:** Sí: ejecutar /flx-help ya, aunque existan cosas por terminar.

## 2026-10-26 · affects T-11, T-15, T-17, T-21

**Question:** ¿Se da por buena la ayuda aunque los pasos que requieren actuar (arrastrar, confirmar, abrir paneles, añadir al carrito) vayan sin captura y el Dashboard no tenga botón de ayuda (sus módulos no tienen barra)? El menú lateral (T-17) y el carrito de la barra superior (T-21) no tienen pantalla propia: ¿basta con los recorridos de bienvenida y la entrada «Ayuda»?

**User answer:** Sí, registrar así. El Dashboard llega a su guía por el menú «Ayuda» y por sus recorridos; T-17 y T-21 quedan cubiertos por las bienvenidas de cada rol y la entrada «Ayuda».

## 2026-10-26 · affects development

**Question:** /flx-api: ¿qué se abre por la WebAPI, para qué roles, quién usa el asistente propio (/mcp), qué columnas no viajan y qué descripción lleva la aplicación?

**User answer:** Solo lectura (listado y ficha, sin alta, edición, borrado ni procesos) de CAT_Producto, CAT_Familia, CAT_Marca, CAT_Color, CAT_Talla, CAT_Variante, VTA_Pedido, VTA_LineaPedido, VTA_EstadoPedido, VTA_Devolucion, VTA_EstadoDevolucion, VTA_Incidencia, VTA_EstadoIncidencia y VTA_TipoIncidencia. Quedan fuera CLI_Cliente, VTA_Tarifa y VTA_PrecioTarifa. Llama solo el rol admins, que también usa el asistente /mcp. No se oculta ninguna columna. Se guarda la descripción de la aplicación propuesta. Se ejecuta con el bloque B-4 aún pendiente porque el usuario así lo pidió.

## 2026-10-26 · affects development

**Question:** ¿Quién decide lo que surja en las fases pendientes (test, calidad, ayuda, verificación) de todos los desarrollos mientras el usuario no está?

**User answer:** El usuario, al irse el 26-oct-2026: «mira todas las fases de flexygo que tienes pendientes en todos los desarrollos y ejecútalos todos y cada uno hasta que tengas todo terminado, si hay que tomar alguna decisión la tomas tú, pero deja el proyecto de demo perfecto. Dado que es una demo, puedes hacer lo que quieras que estará bien.» Las decisiones de estas fases las toma el agente con ese criterio (demo perfecta), y cada una se registra citando esta delegación.

## 2026-10-26 · affects development

**Question:** ¿Se mejoran y regeneran los datos de demostración para que la demo enseñe datos vivos (ventas del mes a 0 €, cliente demo con 2 pedidos, sin favoritos y llamado «Cliente Cliente»)?

**User answer:** Sí, decidido por el agente con la delegación del usuario (D-16). pSeed_ResetDemoData (fichero del proyecto Data y la base flxCatalog con CREATE OR ALTER) da al cliente demo E391566D… siete pedidos más y seis favoritos fijos. Se ejecutó el 26-oct-2026: 152 pedidos con fechas relativas a hoy, 37 de ellos este mes (51.796,21 €), el cliente demo con 8 pedidos (Entregado, Borrador, Confirmado, En proceso, Cancelado…), 7 favoritos y 2 devoluciones. El usuario 'cliente' pasa a llamarse Marta Rodríguez Díaz, como su ficha CLI-2101. Las notificaciones antiguas que apuntaban a pedidos borrados se quedan (hueco ya registrado en 'notificaciones').

## 2026-10-26 · affects T-01, T-03, T-06

**Question:** ¿Llevan ayuda de pantalla las tareas T-01, T-03 y T-06 (inventario, borrado y auditoría de Contacto y Demostración)?

**User answer:** No. Decidido por el agente con la delegación del usuario (D-16): esas tareas no construyen ninguna pantalla, sino que la quitan; no hay nada que explicar a nadie. La Mesa de trabajo y el Dashboard (T-11, T-15) ya tienen su tour y su página de ayuda.
