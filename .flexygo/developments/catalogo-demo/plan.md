# Plan — catalogo-demo

**Request:** Crear una aplicación pública de demostración construida íntegramente con Flexygo, que funcione como catálogo B2B/B2C y muestre de forma práctica las principales capacidades de la plataforma: gestión de usuarios y permisos, portal público, portal privado de clientes, backoffice administrativo, catálogo de productos con familias y variantes, tarifas y precios personalizados, pedidos con estados y workflows, documentos, notificaciones, dashboards, informes, automatizaciones, integraciones, gestión multimedia, responsive, auditoría, APIs y ejemplos de personalización visual. Especificación funcional completa en docs/funcionalidades/.

**State:** 4 block(s), 26 task(s)

## Assumptions

- [S-1] "Comercial" en Cliente es un campo de texto libre, no un enlace a los usuarios de seguridad de Flexygo. — affects T-12
- [S-2] El histórico de cambios de estado del pedido (línea de tiempo) se guarda en columnas propias del registro, sin una tabla de auditoría de estados separada. — affects T-13, T-18
- [S-3] Los enlaces públicos Marcas/Novedades/Ofertas/Ayuda/Contacto quedan inertes hasta que se planifiquen esas secciones. — affects T-24
- [S-4] El catálogo público se cuelga por ahora del mismo árbol de navegación que el backoffice (usuarios autenticados); el acceso anónimo real es una configuración de seguridad de un bloque posterior. — affects T-24, T-25
- [S-5] El objeto Producto conserva su nombre tal cual aparece en las pantallas aprobadas y en la especificación (no se renombra a "Artículo"). — affects T-07
- [S-6] Tallas, Colores, Pedidos_Estados y Tarifas no tienen pantalla de administración propia en este bloque: son catálogos fijos y pequeños que se mantienen por el stored procedure de datos de prueba; si más adelante hace falta editarlos desde pantalla, es una tarea propia con su entrada en el árbol de navegación. — affects T-03, T-04, T-05, T-06

## Screen behaviours

| Screen | Behaviour | Kind | Resolution | Affects |
|---|---|---|---|---|
| Catálogo público | Botón "Añadir al carrito" | control | asked-explained | T-24 |
| Catálogo público | Enlaces Marcas/Novedades/Ofertas/Ayuda/Contacto de la cabecera pública | navigation | asked-explained | T-24 |
| Ficha de pedido | Botones Confirmar/Cancelar y línea de tiempo de 5 estados | state | asked-explained | T-18 |
| Ficha de pedido | Botón Generar PDF | navigation | asked-explained | T-18 |
| Ficha de pedido | Box Documentos con Presupuesto.pdf/Albarán.pdf | state | asked-explained | T-18 |
| Ficha de producto | Botones Editar/Duplicar/Archivar | control | asked-explained | T-10 |
| Listado de productos | Botón Exportar | control | asked-explained | T-09 |
| Listado de clientes | Botón Exportar | control | asked-explained | T-15 |
| Listado de pedidos | Botón Exportar | control | asked-explained | T-17 |

## Open points

None.

## Blocks

### B-1 · Esquema y tablas maestras

- [x] T-01 · Crear la tabla maestra Familias (IdFamilia GUID PK, Nombre, Descripcion, Imagen, Icono, IdFamiliaPadre autorreferencia, Orden, Visible, Destacada, Activo) y el objeto Flexygo CAT_Familia/CAT_Familias: propiedades, vista de listado, filtros y ficha de detalle, aspecto por defecto de Flexygo (sin pantalla aprobada para esta entidad). Punto de entrada: nodo "Familias" del árbol de navegación (lo crea la tarea del árbol de navegación).
- [x] T-02 · Crear la tabla maestra Marcas (IdMarca GUID PK, Nombre, Activo) y el objeto CAT_Marca/CAT_Marcas: propiedades, vista, filtros y ficha, aspecto por defecto. Punto de entrada: nodo "Marcas" del árbol de navegación.
- [x] T-03 · Crear la tabla maestra Tallas (IdTalla GUID PK, Nombre, Orden) y el objeto CAT_Talla/CAT_Tallas: solo objeto, propiedades y vista por defecto (la que necesita el combo de los filtros de Variantes). Sin página ni módulo propios en este bloque: es un catálogo fijo de 6 valores que se mantiene por el stored procedure de datos de prueba, no por pantalla.
- [x] T-04 · Crear la tabla maestra Colores (IdColor GUID PK, Nombre, CodigoHex, Orden) y el objeto CAT_Color/CAT_Colores: solo objeto, propiedades y vista por defecto. Sin página ni módulo propios en este bloque, mismo criterio que Tallas.
- [x] T-05 · Crear la tabla maestra Pedidos_Estados (IdEstado GUID PK, Nombre, Orden) y el objeto VTA_EstadoPedido/VTA_EstadosPedido: solo objeto, propiedades y vista por defecto. Sin página ni módulo propios en este bloque: los 6 estados del workflow (Borrador, Confirmado, En proceso, Enviado, Entregado, Cancelado) se siembran por el stored procedure de datos de prueba (pedir confirmación antes de insertar), no se administran por pantalla.
- [x] T-06 · Crear la tabla maestra Tarifas (IdTarifa GUID PK, Nombre) y el objeto VTA_Tarifa/VTA_Tarifas: solo objeto, propiedades y vista por defecto. Sin página ni módulo propios en este bloque: las 5 tarifas del modelo (Público, Distribuidor, Profesional, Mayorista, VIP) se siembran por el stored procedure de datos de prueba (pedir confirmación antes de insertar), no se administran por pantalla.

### B-2 · Producto, Variante y catálogo interno

- [x] T-07 · Crear la tabla Productos (IdProducto GUID PK, Referencia, Nombre, DescripcionCorta, IdFamilia FK, IdMarca FK, PrecioBase, IVA, Stock, Activo, CreatedBy, CreateDate, ModifiedBy, ModifiedDate) y el objeto CAT_Producto/CAT_Productos: propiedades, vista, filtros y ficha base (sin plantilla todavía, la construye la tarea de la ficha).
- [x] T-08 · Crear la tabla Productos_Variantes (IdVariante GUID PK, IdProducto FK, IdTalla FK, IdColor FK, Referencia, Stock) y el objeto CAT_Variante/CAT_Variantes: propiedades, vista y filtros.
- [x] T-09 [P] · Construir la página y el módulo de listado de Productos (pantalla aprobada L-P): filtros por Familia/Marca/Estado y fecha de alta, buscador, exportación estándar de Flexygo, paginador, botón "Nuevo producto". Punto de entrada: nodo "Productos" del árbol de navegación.
- [x] T-10 [P] · Construir la página y el módulo de ficha de Producto (pantalla aprobada F-P): cabecera con acciones Editar (formulario estándar), Duplicar (clona el producto sin variantes y lo deja Activo=0 hasta revisión) y Archivar (Activo=0); detalles; listado embebido de Variantes; box de Imágenes. Punto de entrada: se abre desde cada fila del listado de Productos (navbutton propio del objeto).
- [x] T-11 · Crear las relaciones del bloque: Familias→Productos, Marcas→Productos, Productos→Productos_Variantes, Tallas→Productos_Variantes, Colores→Productos_Variantes.

### B-3 · Clientes y Pedidos

- [x] T-12 · Crear la tabla Clientes (IdCliente GUID PK, CodigoCliente, RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono, IdTarifa FK, Comercial texto libre, Activo, CreatedBy, CreateDate, ModifiedBy, ModifiedDate) y el objeto CLI_Cliente/CLI_Clientes: propiedades, vista, filtros y ficha base.
- [x] T-13 · Crear la tabla Pedidos (IdPedido GUID PK, Numero, IdCliente FK, IdEstado FK, Fecha, DireccionEntrega, FormaPago, Total) y el objeto VTA_Pedido/VTA_Pedidos: propiedades, vista, filtros y ficha base.
- [x] T-14 · Crear la tabla Pedidos_Lineas (IdLinea GUID PK, IdPedido FK, IdProducto FK, IdVariante FK nullable, Cantidad, Precio, Subtotal) y el objeto VTA_LineaPedido/VTA_LineasPedido: propiedades y vista.
- [x] T-15 [P] · Construir la página y el módulo de listado de Clientes (pantalla aprobada L-C): filtros por Tarifa/Estado/Comercial y fecha de alta, buscador, exportación estándar, paginador, botón "Nuevo cliente". Punto de entrada: nodo "Clientes" del árbol de navegación.
- [x] T-16 [P] · Construir la página y el módulo de ficha de Cliente (sin pantalla aprobada, aspecto por defecto de Flexygo) para que el objeto quede completo. Punto de entrada: se abre desde cada fila del listado de Clientes (navbutton propio del objeto).
- [x] T-17 [P] · Construir la página y el módulo de listado de Pedidos (pantalla aprobada L-PE): filtros por Estado/Cliente y fecha, buscador, exportación estándar, paginador, botón "Nuevo pedido". Punto de entrada: nodo "Pedidos" del árbol de navegación.
- [x] T-18 [P] · Construir la página y el módulo de ficha de Pedido (pantalla aprobada F-PE): cabecera con acciones Confirmar/Cancelar (workflow lineal Borrador→Confirmado→En proceso→Enviado→Entregado; Cancelar disponible salvo en Entregado/Cancelado) y Generar PDF (PDF básico del pedido); detalles; líneas del pedido embebidas con desglose de base imponible e IVA; línea de tiempo de 5 estados; box de Documentos con el gestor de documentos de Flexygo para adjuntos libres. Punto de entrada: se abre desde cada fila del listado de Pedidos (navbutton propio del objeto).
- [x] T-19 · Crear las relaciones del bloque: Tarifas→Clientes, Clientes→Pedidos, Pedidos_Estados→Pedidos, Pedidos→Pedidos_Lineas, Productos→Pedidos_Lineas.
- [x] T-20 · Llevar el esquema completo de este desarrollo (las 11 tablas creadas en los bloques 1 a 3) al proyecto de datos SSDT con flexygo_script_data_structure, para que viaje a cualquier instalación en vez de quedarse solo en esta base de datos.

### B-4 · Navegación, aspecto, panel de control y catálogo público

- [x] T-21 · Aplicar la paleta leída de las pantallas aprobadas: NavColor #1c1b1d, txtNavColor #ffffff, HeaderColor #ffffff, bgColor #FAFAFA, OutstandingColor #333234, PrimaryColor #000000. NotifyColor no aparece en ningún diseño aprobado y se deja sin tocar.
- [x] T-22 [P] · Construir el Panel de control (pantalla aprobada D): 4 KPI (ventas hoy, pedidos hoy, pedidos pendientes, clientes activos), gráfico de barras "Ventas por mes", gráfico donut "Ventas por familia", tabla "Pedidos recientes" — con datos reales de las tablas ya creadas. Punto de entrada: nodo raíz "Panel de control" del árbol de navegación (y página de arranque, ver tarea siguiente).
- [x] T-23 · Fijar el Panel de control como página de arranque de la interfaz (startupPageName).
- [x] T-24 [P] · Construir la página y el módulo del catálogo público (pantalla aprobada P): cabecera pública propia (no la barra lateral del backoffice), con enlaces Marcas/Novedades/Ofertas/Ayuda/Contacto visibles pero sin página de destino todavía; filtros y buscador; rejilla de productos con foto, nombre, precio y botón "Añadir al carrito" (visual, sin persistencia). Punto de entrada: nodo "Catálogo" del árbol de navegación.
- [x] T-25 · Construir el árbol de navegación propio, en el orden aprobado: Panel de control (raíz/home) → Productos → Familias → Marcas → Clientes → Pedidos → Catálogo (público). Todos los objetos creados en los bloques anteriores pasan a showInMenu=false.
- [x] T-26 · Construir el stored procedure de datos de prueba: vacía todas las tablas de este desarrollo y recrea datos demo realistas y coherentes (maestras, incluidas Tallas/Colores/Pedidos_Estados/Tarifas que no tienen pantalla propia; productos y variantes; clientes; pedidos y líneas), ejecutable y repetible. Pedir confirmación antes de la primera ejecución.

## Impact on what exists

Proyecto nuevo, sin objetos ni páginas previas en el origen activo. Este plan crea el primer bloque completo de la aplicación (esquema, catálogo, clientes, pedidos, navegación y panel de control) sin tocar nada existente.
