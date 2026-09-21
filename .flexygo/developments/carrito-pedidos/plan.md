# Plan — carrito-pedidos

**Request:** Carrito y pedidos: completar el carrito real para el cliente autenticado (añadir desde Mi catálogo, checkout que genera un Pedido de verdad — ahora es solo un botón deshabilitado), más favoritos y comparador. El acceso público/anónimo (guest) se deja explícitamente para el final de todo el proyecto.

**State:** 6 block(s), 24 task(s)

## Assumptions

- [S-1] Favoritos no lleva pantalla de administración en el backoffice; solo existe la vista del cliente, y el alta/baja se hace exclusivamente a través del proceso de marcar/desmarcar. — affects B-2
- [S-2] El comparador no persiste ninguna selección: compara solo lo que el usuario elige en cada visita, sin tabla nueva. Los productos elegidos viajan por sessionStorage del navegador (no por querystring): un IN(...) de varias filas pasado como objectWhere de una página tipo 'list' rompe en esta instalación con un 500, porque la plataforma intenta resolverlo como si identificara una única entidad. — affects B-5

## Open points

None.

## Blocks

### B-1 · Seguridad de los procesos existentes

- [x] T-01 · Añadir comprobación de propiedad a pVTA_ConfirmarPedido: parámetros ocultos @CurrentRole y @CurrentReference (por defecto {{currentRole}} y {{currentReference}}); si el rol es 'cliente' y el pedido no pertenece a ese cliente, RAISERROR y no confirmar.
- [x] T-02 [P] · Misma comprobación de propiedad en pVTA_CancelarPedido.
- [x] T-03 · Publicar flxCatalog.Data.Database y comprobar que Confirmar/Cancelar pedido desde el backoffice (rol admin) siguen funcionando igual que antes.

### B-2 · Favoritos

- [x] T-04 · Tabla Favoritos (IdFavorito PK, IdCliente FK a Clientes, IdProducto FK a Productos, FechaAlta) con índice único por (IdCliente, IdProducto).
- [x] T-05 · Objeto CAT_Favorito/CAT_Favoritos: propiedades, vista de lista y filtros. Sin ficha propia de alta/edición: se gestiona solo a través del proceso de marcar/desmarcar, nunca por formulario.
- [x] T-06 · Proceso pCAT_ToggleFavorito (SP): añade el producto a favoritos del cliente actual si no está, lo quita si ya está; usa {{currentReference}} para la propiedad, vinculado a CAT_Producto.
- [x] T-07 · Página 'Mis favoritos' (cliente): lista de CAT_Favoritos filtrada al cliente actual, con botón para quitar de favoritos. Se alcanza por la entrada de menú de la siguiente tarea (único punto de entrada).
- [x] T-08 · Entrada de menú 'Mis favoritos' en la navegación del cliente.

### B-3 · Carrito: líneas del pedido en borrador, con variantes

- [x] T-09 · Proceso pVTA_ActualizarLineaCarrito (SP): localiza o crea el pedido en estado Borrador del cliente actual ({{currentReference}}); recibe IdProducto, IdVariante (opcional, NULL si el producto no tiene variantes) y Cantidad; añade, actualiza o quita (Cantidad=0) la línea de ese producto+variante; calcula el precio con la tarifa del cliente igual que CAT_ProductoClienteList (Tarifas_Precios si existe, si no PrecioBase); recalcula el Total del pedido.
- [x] T-10 · Columna calculada TieneVariantes en la vista de Mi catálogo (EXISTS sobre Productos_Variantes por producto).
- [x] T-11 · Proceso pVTA_AnadirRapido: mismo procedimiento almacenado, sin parámetro de variante visible (un clic, sin ventana emergente) — para productos sin variantes.
- [x] T-12 · Proceso pVTA_AnadirConVariante: mismo procedimiento almacenado, con combo de variante (Color/Talla, filtrado por el producto) y cantidad como parámetros visibles — abre la ventana de selección antes de añadir, para productos con variantes.
- [x] T-13 · Plantilla de Mi catálogo: botón 'Añadir al carrito' que lanza pVTA_AnadirConVariante cuando TieneVariantes=1 y pVTA_AnadirRapido cuando TieneVariantes=0.

### B-4 · Mi carrito

- [x] T-14 · Conceder al rol cliente ver VTA_LineaPedido (view y view list): hoy está denegado, así que sin este cambio el cliente no vería ninguna línea de su carrito.
- [x] T-15 · Vista y módulo de líneas para Mi carrito, mostrando Color/Talla legibles (join con Colores y Tallas) además de producto, cantidad, precio y subtotal, con edición de cantidad y botón 'Quitar' (usa pVTA_ActualizarLineaCarrito con Cantidad=0).
- [x] T-16 · Página 'Mi carrito': ficha del pedido en Borrador del cliente actual, con sus líneas, el total, botón 'Confirmar pedido' (usando pVTA_ConfirmarPedido ya asegurado en B-1) y un estado vacío ('Tu carrito está vacío') cuando no tiene ningún Borrador. Se alcanza por la entrada de menú de la siguiente tarea (único punto de entrada).
- [x] T-17 · Entrada de menú 'Mi carrito' en la navegación del cliente.

### B-5 · Comparador simple

- [x] T-18 · Selección de 2-3 productos en Mi catálogo mediante casillas y botón 'Comparar'.
- [x] T-19 · Página de comparación en HTML (sin tabla nueva, no persistente, los productos elegidos viajan por querystring): nombre, precio, familia, marca, stock e imagen de cada producto seleccionado, en columnas. Se alcanza únicamente desde el botón 'Comparar' de Mi catálogo (tarea anterior); no lleva entrada de menú propia.

### B-6 · Verificación con el cliente de prueba

- [x] T-20 · Flujo completo: añadir al carrito un producto con variante y otro sin variante, cambiar cantidad, quitar una línea, comprobar que el total de Mi carrito es correcto.
- [x] T-21 · Confirmar el pedido desde Mi carrito y comprobar que pasa a Confirmado y aparece en Mis pedidos.
- [x] T-22 · Marcar y desmarcar favoritos y comprobar que la lista 'Mis favoritos' refleja los cambios.
- [x] T-23 · Probar el comparador con 2 productos.
- [x] T-24 · Prueba de seguridad: comprobar que el cliente de prueba NO puede confirmar ni cancelar un pedido que pertenece a otro cliente, usando los procesos corregidos en B-1.

## Impact on what exists

Añade seguridad de propiedad a pVTA_ConfirmarPedido y pVTA_CancelarPedido (ya existentes, del bloque de gestión de pedidos). Añade una tabla nueva (Favoritos) y un objeto nuevo (CAT_Favorito). Añade 4 procesos nuevos sobre VTA_Pedido/CAT_Producto. Cambia la seguridad del rol cliente sobre VTA_LineaPedido (de denegado a permitido). No toca el modelo de Productos, Clientes ni Pedidos existente.
