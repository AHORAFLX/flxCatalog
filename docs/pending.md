# ROL CLIENTE

 - [x] En el menú de cliente, "Mi Catalogo" y "Mi ficha" son procesos. Deberian ser navegación al List y al View correspondientes.
- [x] Mi Catalogo deberia llamarse catalogo.
- [x] El view de un producto muestra un botón mi comentario que no tiene permisos. No me gusta nada. Diseña un modulo HTML con stick para que los usuarios puedan poner reseñas en los articulos donde se vean las ultimas reseñas y se pueda añadir una nueva, simplemente rellenando el formulario y dandole a enviar.
- [x] El botón de Mis Favoritos, deberia ser  una navegación al catalogo, pero con el where de mostrar solo aquellos que esten en favoritos, no hace falta un nuevo modulo.
- [x] Mis documentos deberia ser simplemente un listado de los documentos que tiene asociada la gestión documental de el cliente actual. No quiero ver la opción de pedidos.
- [x] Cuando el usuario Cliente solicita una devoución no deberia de poder dar de alta una nueva. Alta/Edicion/Borrado deberia ser un proceso solo de admin, el usuario deberia tener un proceso de "Solicitar" escrito en DLL donde seleccione Articulo, Cantidad (controlando que no supere las unidades ya devueltas), Pedido, Comentario y Motivo. Y eso crear una nueva en estado "Solicitada" un usuario normal solo puede Cancelar una que esté "solicitada". Si ya está en otro estado no puede hacer nada con ella y desde luego no puede editar.
- [x] Lo mismo con las incidencias.
- [ ] Quiero un icono en la barra superior igual que el del badge de noticias que muestre los elementos en el carrito.
- [x] Configura la barra superior para que se pueda buscar por articulos.

# ROL Administrador
- [ ] Añadir una pantalla de trabajo que tenga 3 modulos de tipo kanban dentro de un separador (usando el kanban de flexygo). Uno para las incidencias, otro para los pedidos y otro para las devoluciones.
- [ ] Añadir un dashboard con los articulos más devueltos, los más vendidos, los clientes que más compran, los clientes que más problemas dan, ventas del año, ventas del mes, etc.
- [ ] Quita las colecciones que tienen marcada el show in menu y añade los accesos directos como corresponde en el menú de nodos lateral izquierdo.
- [ ] Borra todo lo que tiene que ver con "Contacto" y "Demostracion" no lo quiero.

# TESTING
- [ ] Construir circuitos de test de interfaz para Realizar un pedido.
- [ ] Construir circuitos de test de interfaz para realizar una devolución.
- [ ] Construir circuitos de test de interfaz para reportar una incidencia.
- [ ] Construir circuitos de test de interfaz para dar de alta/modificar/borrar un articulo.
- [ ] Construir circuitos de test de interfaz para dar de alta/modificar/borrar un cliente.
- [ ] Construir circuitos de test de interfaz para dar de alta/modificar/borrar una tarifa.