# Plan — presupuestos-postventa

**Request:** Área 06 de la especificación funcional (docs/funcionalidades/06-presupuestos-postventa.md): presupuestos, productos personalizados, seguimiento, facturas, devoluciones e incidencias — propuesto por el agente como siguiente fase tras cerrar carrito-pedidos, aceptado por el usuario ("vale").

**State:** 4 block(s), 38 task(s)

## Assumptions

- [S-1] Una devolución se solicita sobre una línea de pedido concreta (producto+cantidad), no sobre el pedido completo — según los campos Pedido/Línea/Cantidad que indica la especificación. — affects B-3
- [S-2] Los estados de Devoluciones e Incidencias son fijos (tablas maestras sembradas), sin pantalla propia para que el usuario los edite — igual que EstadoPedido ya construido. — affects B-3
- [S-3] El listado 'Mis documentos' no incluye generación de un PDF propio para devoluciones/incidencias, solo reutiliza el PDF de pedido ya existente. — affects B-2

## Open points

- T-07 — Confirmo que 'Mis documentos' se limita a Pedidos (factura/PDF) y Tarifas — albaranes, certificados, contratos y fichas técnicas quedan fuera por no corresponder a nada del modelo de datos actual.

## Blocks

### B-1 · Seguimiento del pedido

- [x] T-01 · Añadir a la tabla Pedidos las columnas Transportista (nvarchar), NumeroSeguimiento (nvarchar), UrlSeguimiento (nvarchar), FechaEntregaEstimada (datetime, nullable) mediante flexygo_execute_ddl.
- [x] T-02 · Crear en el objeto VTA_Pedido las propiedades Transportista, NumeroSeguimiento, UrlSeguimiento y FechaEntregaEstimada, y colocarlas en la vista de detalle existente.
- [x] T-03 · Añadir esas propiedades a la vista de detalle del pedido para el cliente (o al módulo que ya pinta el seguimiento del estado), como datos de solo lectura una vez el pedido está en tránsito.
- [x] T-04 · Construir un indicador visual de progreso (los estados de EstadoPedido en orden, con el actual resaltado) en la ficha de pedido del cliente, reutilizando la tabla de estados ya existente.

### B-2 · Mis documentos

- [x] T-05 · Crear la página 'Mis documentos' del cliente, con un listado de sus propios Pedidos y acceso de descarga al PDF de cada uno mediante el proceso pVTA_GenerarPdfPedido ya existente. Se alcanza por la entrada de navegación que crea la siguiente tarea de este bloque.
- [x] T-06 · Añadir a esa misma página un listado de las Tarifas visibles para el cliente (reutilizando VTA_Tarifa) como documento de referencia de precios.
- [x] T-07 · Dar de alta la entrada de navegación 'Mis documentos' en el menú del cliente, apuntando a la página nueva.
      [CLARIFY: Confirmo que 'Mis documentos' se limita a Pedidos (factura/PDF) y Tarifas — albaranes, certificados, contratos y fichas técnicas quedan fuera por no corresponder a nada del modelo de datos actual.]

### B-3 · Devoluciones

- [x] T-08 · Crear la tabla maestra Devoluciones_Estados (IdEstado, Nombre) y sembrar sus filas: Solicitada, En revisión, Aceptada, Rechazada, Abonada.
- [x] T-09 · Crear la tabla Devoluciones (IdDevolucion PK, IdPedido FK, IdLinea FK a Pedidos_Lineas, Cantidad, Motivo, Comentario, IdEstado FK, FechaSolicitud, Activo, CreatedBy/CreateDate/ModifiedBy/ModifiedDate).
- [x] T-10 · Crear el objeto VTA_EstadoDevolucion sobre Devoluciones_Estados.
- [x] T-11 · Crear el objeto VTA_Devolucion sobre Devoluciones.
- [x] T-12 · Crear las propiedades de VTA_Devolucion.
- [x] T-13 [P] · Crear la vista de lista de VTA_Devolucion.
- [x] T-14 [P] · Crear los filtros de VTA_Devolucion.
- [x] T-15 [P] · Crear la vista de detalle de VTA_Devolucion.
- [x] T-16 · Crear las páginas de lista y detalle de VTA_Devolucion. La de lista se alcanza para el administrador por el bloque automático de menú (showInMenu por defecto) y para el cliente por la entrada de navegación 'Mis devoluciones' que crea una tarea posterior de este bloque; la de detalle se alcanza desde esa lista y desde el botón 'Solicitar devolución' de la tarea de más abajo.
- [x] T-17 · Componer los módulos de lista y edición de VTA_Devolucion en una única pantalla compartida admin+cliente, con seguridad de fila igual que la usada en VTA_Pedido (el cliente solo ve las suyas).
- [x] T-18 · Añadir el gestor de imágenes ('Fotografías') a VTA_Devolucion.
- [x] T-19 · Añadir un botón 'Solicitar devolución' en la línea de pedido del cliente que abra la creación de una Devolución ligada a ese pedido y esa línea.
- [x] T-20 · Dar de alta una entrada de navegación 'Mis devoluciones' visible para el cliente, apuntando a la página de lista de VTA_Devolucion ya acotada por seguridad de fila.
- [x] T-21 · Crear las relaciones Pedido→Devoluciones y Devolución→Estado (al final, según el orden de construcción).

### B-4 · Incidencias

- [x] T-22 · Crear la tabla maestra Incidencias_Tipos (IdTipo, Nombre) y sembrar sus filas: Producto incorrecto, Producto defectuoso, Falta material, Problema de entrega, Facturación, Consulta general.
- [x] T-23 · Crear la tabla maestra Incidencias_Estados (IdEstado, Nombre) y sembrar sus filas: Abierta, Cerrada.
- [x] T-24 · Crear la tabla Incidencias (IdIncidencia PK, IdPedido FK, IdTipo FK, IdEstado FK, Descripcion, FechaAlta, Activo, CreatedBy/CreateDate/ModifiedBy/ModifiedDate).
- [x] T-25 [P] · Crear el objeto VTA_TipoIncidencia sobre Incidencias_Tipos.
- [x] T-26 [P] · Crear el objeto VTA_EstadoIncidencia sobre Incidencias_Estados.
- [x] T-27 · Crear el objeto VTA_Incidencia sobre Incidencias.
- [x] T-28 · Crear las propiedades de VTA_Incidencia.
- [x] T-29 [P] · Crear la vista de lista de VTA_Incidencia.
- [x] T-30 [P] · Crear los filtros de VTA_Incidencia.
- [x] T-31 [P] · Crear la vista de detalle de VTA_Incidencia.
- [x] T-32 · Crear las páginas de lista y detalle de VTA_Incidencia. La de lista se alcanza para el administrador por el bloque automático de menú y para el cliente por la entrada de navegación 'Mis incidencias' que crea una tarea posterior de este bloque; la de detalle se alcanza desde esa lista y desde el botón 'Crear incidencia' de la tarea de más abajo.
- [x] T-33 · Componer los módulos de lista y edición de VTA_Incidencia en una única pantalla compartida admin+cliente, con seguridad de fila igual que la usada en VTA_Pedido.
- [x] T-34 · Añadir el gestor de imágenes a VTA_Incidencia.
- [x] T-35 · Añadir un botón 'Crear incidencia' en la ficha de pedido del cliente que abra la creación de una Incidencia ligada a ese pedido.
- [x] T-36 · Dar de alta una entrada de navegación 'Mis incidencias' visible para el cliente, apuntando a la página de lista de VTA_Incidencia ya acotada por seguridad de fila.
- [x] T-37 · Crear las relaciones Pedido→Incidencias, Incidencia→Tipo e Incidencia→Estado (al final).
- [x] T-38 · Llevar el esquema nuevo (Devoluciones_Estados, Devoluciones, Incidencias_Tipos, Incidencias_Estados, Incidencias y las columnas añadidas a Pedidos) al proyecto de datos SSDT con flexygo_script_data_structure, para que viaje a cualquier otra instalación.

## Impact on what exists

Extiende VTA_Pedido (nuevas columnas y propiedades de seguimiento) y añade cuatro entidades nuevas (Devoluciones y su estado, Incidencias y sus tipos/estado) bajo el prefijo VTA_, cada una con su propia entrada de menú para el cliente. No toca Presupuestos, descartado por decisión del usuario. No hay pantallas aprobadas que comparar: construcción directa sobre el aspecto ya instalado de la plataforma (decisión D-3).
