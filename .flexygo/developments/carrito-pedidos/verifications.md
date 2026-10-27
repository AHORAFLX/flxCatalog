# Verifications — carrito-pedidos

## 2026-09-17 · affects T-15, T-16

**Checked:** Quitar la última línea del carrito refresca automáticamente, sin recargar la página, tanto la cabecera (mod-vta-pedido-carrito-view) como el listado de líneas (mod-vta-lineapedido-carrito-list)

**Against what data:** Pedido CARR-20260917220149 (Borrador) del cliente de prueba, con 1 línea restante: Camiseta Manga Larga Basic, Amarillo Mostaza S, cantidad 1, 83,90 €

**Verdict:** passes

**Result:** Correcto: tras confirmar "¿Quitar este producto del carrito?" el listado pasó a mostrar "Tu carrito está vacío" y la cabecera actualizó Base imponible y Total pedido a 0 €, ambos sin recargar la página. Confirma que el fix de doble refresco (mod-vta-pedido-carrito-view + mod-vta-lineapedido-carrito-list) en flxcatalog-carrito.js funciona también en el caso límite de carrito vacío.

## 2026-09-17 · affects T-13, T-16

**Checked:** El botón "Confirmar pedido" de Mi carrito ejecuta pVTA_ConfirmarPedido de extremo a extremo: pasa el pedido de Borrador a Confirmado, y la propia SP bloquea una segunda confirmación

**Against what data:** Pedido CARR-20260917220149 del cliente de prueba, con 1 línea (Gorra Trail, 15,90 €)

**Verdict:** passes

**Result:** Correcto: al confirmar, el estado pasó de "Borrador" a "Confirmado" en pantalla sin recargar, con Base imponible y Total pedido correctos (15,90 €). Al pulsar el mismo botón una segunda vez, la SP rechazó la operación con el mensaje "Solo se puede confirmar un pedido en Borrador (estado actual: Confirmado)" y el estado no cambió: la validación de estado en pVTA_ConfirmarPedido protege incluso cuando el botón de toolbar (sqlEnabled) no se re-evalúa visualmente tras el refresco sin recarga de página — anotado como comportamiento menor a tener en cuenta, no bloqueante.

## 2026-09-17 · affects T-24

**Checked:** El cliente de prueba (Norte Almacenes S.L.) NO puede confirmar ni cancelar un pedido que pertenece a otro cliente, usando pVTA_ConfirmarPedido y pVTA_CancelarPedido asegurados en B-1

**Against what data:** Intento de cancelar PED-1090 (Confirmado, cliente Pedro Muñoz Fernández) e intento de confirmar PED-1109 (Borrador, cliente Central Moda S.L.U.), ambos ejecutados desde la sesión del cliente de prueba vía flexygo.nav.execProcessObj

**Verdict:** passes

**Result:** Correcto: ambos intentos fueron rechazados con el mensaje "No tienes permiso sobre este pedido." Se comprobó en base de datos tras cada intento que el estado del pedido ajeno no cambió (PED-1090 sigue Confirmado, PED-1109 sigue Borrador). La comprobación de propiedad (@CurrentRole/@CurrentReference) añadida en B-1 funciona correctamente end-to-end.

## 2026-09-17 · affects T-20

**Checked:** Flujo completo de carrito: añadir un producto con variante y otro sin variante, cambiar cantidad de una línea, quitar la otra línea, comprobar que el total de Mi carrito es correcto en todo momento

**Against what data:** Pedido CARR-20260917230224: Gorra Trail (sin variante, quick-add) + Camiseta Manga Larga Basic Blanco/L (con variante, popup, cantidad 2)

**Verdict:** passes

**Result:** Correcto en cada paso: tras añadir ambas líneas el total fue 183,70 € (15,90 + 167,80); tras cambiar la cantidad de Gorra Trail a 3, el total pasó a 215,50 € (47,70 + 167,80) sin recargar la página; tras quitar la línea de la camiseta, el total quedó en 47,70 € (solo Gorra Trail x3), también sin recargar. Todos los cálculos verificados a mano contra los importes mostrados.

## 2026-09-17 · affects T-21

**Checked:** Confirmar el pedido desde Mi carrito y comprobar que pasa a Confirmado y aparece correctamente en Mis pedidos

**Against what data:** Pedido CARR-20260917230224 (Gorra Trail x3, 47,70 €)

**Verdict:** passes

**Result:** Correcto: tras confirmar, el estado pasó de Borrador a Confirmado en pantalla sin recargar, y "Mis pedidos" muestra la fila CARR-20260917230224 con estado Confirmado y total 47,70 €, junto con los demás pedidos del cliente (incluyendo el confirmado anteriormente en B-4).

## 2026-09-17 · affects T-22

**Checked:** Marcar y desmarcar favoritos, comprobando que la lista "Mis favoritos" refleja los cambios sin recargar la página

**Against what data:** Producto Camiseta Manga Larga Basic, marcado desde el menú ⋮ de Mi catálogo y desmarcado desde el menú ⋮ de Mis favoritos

**Verdict:** passes

**Result:** Correcto: tras marcar como favorito desde Mi catálogo, "Mis favoritos" mostró el producto correctamente; el menú contextual pasó a mostrar "Quitar de favoritos" en lugar de "Añadir/quitar de favoritos" al reabrirlo sobre un ítem ya favorito; tras desmarcarlo desde ahí, la lista se refrescó sola al estado vacío "Todavía no tienes productos favoritos", con mensaje de confirmación "Quitado de favoritos."

## 2026-09-17 · affects T-23

**Checked:** Probar el comparador con 2 productos, desde la selección de casillas en Mi catálogo hasta el resultado en la página del comparador

**Against what data:** Mochila Style (28,90 €) y Sandalia Premium (78,90 €)

**Verdict:** passes

**Result:** Correcto: la barra mostró "2 productos seleccionados", y al pulsar Comparar la página mostró ambos productos en columnas con Precio, Familia, Marca y Stock correctos, sin errores de consola. Durante esta prueba se detectó y corrigió un fallo real: cliCompareSelected (variable JS global del plugin) no se reiniciaba entre visitas a Mi catálogo, así que una selección de una prueba anterior (con la página ya recargada y las casillas visualmente desmarcadas) seguía contando para el límite de 3 productos. Corregido añadiendo un MutationObserver que reinicia cliCompareSelected cada vez que el listado de Mi catálogo (identificado por la reaparición de #cli-compare-bar) se renderiza de nuevo. Reverificado tras el fix: selección limpia, sin avisos falsos.

## 2026-10-13 · affects B-4

**Checked:** VTA_Pedido_MiCarrito_View (Mi carrito): líneas editables, cambio de cantidad, quitar y estado vacío.

**Against what data:** Usuario Cliente, tests Carrito_AñadirConVariante_CambiarCantidad_YQuitar y Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela; captura con el carrito vacío.

**Verdict:** passes

**Result:** OK: se añade con variante, se cambia la cantidad (2 a 3), se quita la línea y se confirma el pedido; con el carrito vacío dice «Tu carrito está vacío». Corregido hoy el botón «Quitar», que pintaba «?» (ahora ✕).

**Screenshot:** `screenshots/verify/2026-10-13-b-4-1-verify-cliente-micarrito.png`

## 2026-10-13 · affects B-5

**Checked:** CAT_Producto_Comparador_List: compara los productos marcados en el catálogo.

**Against what data:** Usuario Cliente, los dos primeros productos del catálogo, test Comparador_ComparaLosProductosSeleccionados.

**Verdict:** passes

**Result:** OK: 2 columnas con foto, precio, familia, marca y stock de los productos elegidos.

**Screenshot:** `screenshots/verify/2026-10-13-b-5-2-verify-cliente-comparador.png`

## 2026-10-13 · affects B-2

**Checked:** Mis favoritos: el nodo abre el catálogo filtrado a los favoritos del cliente; marcar y desmarcar desde la tarjeta.

**Against what data:** Usuario Cliente, test Favoritos_SeMarcanDesdeElCatalogoYSeQuitanDesdeMisFavoritos (marca y desmarca uno); captura tras el test, sin favoritos.

**Verdict:** passes

**Result:** OK: se marca desde el catálogo, aparece en «Mis favoritos» y se quita. Sin favoritos, la pantalla dice «Todavía no hay productos en tu catálogo» con el título «Catálogo»: es el catálogo filtrado que pidió el usuario («sin módulo nuevo»), aunque el texto no menciona los favoritos.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-3-verify-cliente-favoritos.png`

## 2026-10-13 · affects B-2

**Checked:** Ficha de producto del cliente (CAT_Producto_View en ventana) con sus reseñas.

**Against what data:** Usuario Cliente, primer producto del catálogo, tests FichaDeProducto_SeAbreEnVentanaConSusReseñas y Reseña_ProductoComprado_SePublicaYApareceEnLaLista.

**Verdict:** passes

**Result:** OK: la ficha se abre en ventana con la valoración, las últimas reseñas y el formulario. Una reseña de un producto comprado se publica y aparece en la lista; el test la borra después como administrador.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-4-verify-cliente-fichaproducto.png`

## 2026-10-26 · affects T-01, T-02

**Checked:** Confirmar y cancelar pedido comprueban que el pedido es del cliente que lo pide

**Against what data:** flexygo_execute_procedure el 26-oct sobre PED-1009 (Borrador, de Central Retail S.L.) con @CurrentRole='cliente' y @CurrentReference = la clienta demo Marta Rodríguez Díaz

**Verdict:** passes

**Result:** OK: pVTA_ConfirmarPedido y pVTA_CancelarPedido responden los dos «No tienes permiso sobre este pedido.» y PED-1009 sigue en Borrador. Con su propio carrito, el test Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela (en verde hoy) confirma como cliente y cancela como administrador.

## 2026-10-26 · affects T-03

**Checked:** Desde el backoffice, el administrador sigue pudiendo confirmar y cancelar pedidos

**Against what data:** Test Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela y AdminVentasTests.Pedido_FichaConLineasInformacionFiscalYProcesos, en verde el 26-oct; ficha de pedido del admin capturada por la batería

**Verdict:** passes

**Result:** OK: la ficha de pedido del administrador ofrece Confirmar, Cancelar y Generar PDF y el test cancela como admin un pedido que el cliente acaba de confirmar.

**Screenshot:** `screenshots/verify/2026-10-26-t-03-5-cp-admin-pedido.png`

## 2026-10-26 · affects T-04, T-05, T-06, T-07, T-08

**Checked:** Los favoritos se marcan desde el catálogo y se ven en «Mis favoritos»

**Against what data:** Clienta demo Marta Rodríguez Díaz con 7 favoritos del reinicio del 26-oct; test ClienteCatalogoTests.Favoritos_SeMarcanDesdeElCatalogoYSeQuitanDesdeMisFavoritos en verde hoy

**Verdict:** passes

**Result:** OK: «Mis favoritos» abre el catálogo filtrado con sus 7 productos, cada uno con la estrella roja marcada; el test marca uno desde el catálogo (pCAT_ToggleFavorito), lo ve aparecer y lo quita. La tabla Favoritos tiene su índice único por cliente y producto.

**Screenshot:** `screenshots/verify/2026-10-26-t-04-t-05-t-06-t-07-t-08-6-cp-favoritos.png`

## 2026-10-26 · affects T-09, T-10, T-11, T-12, T-14, T-17

**Checked:** Añadir al carrito con y sin variante, cambiar cantidad, quitar y ver «Mi carrito»

**Against what data:** Clienta demo; test ClienteCarritoPedidosTests.Carrito_AñadirConVariante_CambiarCantidad_YQuitar en verde el 26-oct; captura de Mi carrito con el carrito CARR-20261026184134

**Verdict:** passes

**Result:** OK: Mi carrito (entrada de menú con contador 26) muestra 5 líneas con foto, talla y color legibles, cantidad editable, subtotal y la X para quitar, más Base imponible y Total 1.799,81 € y el botón «Confirmar pedido». El test añade un producto con variante (ventana de talla/color) y otro sin variante (un clic), cambia la cantidad y quita una línea.

**Screenshot:** `screenshots/verify/2026-10-26-t-09-t-10-t-11-t-12-t-14-t-17-7-cp-micarrito.png`

## 2026-10-26 · affects T-18, T-19

**Checked:** Marcar dos productos en el catálogo y compararlos

**Against what data:** Clienta demo; test ClienteCatalogoTests.Comparador_ComparaLosProductosSeleccionados en verde el 26-oct; comparación de Abrigo Niño Deluxe y Pantalón Niño Pro

**Verdict:** passes

**Result:** OK: con dos casillas marcadas, «Comparar» abre CAT_Producto_Comparador_List (página genérica desde hoy) con dos columnas: foto, precio de su tarifa (79,71 € y 34,11 €), familia, marca y stock.

**Screenshot:** `screenshots/verify/2026-10-26-t-18-t-19-8-cp-comparador.png`

## 2026-10-26 · affects T-01, T-02, T-03, T-05, T-06, T-07, T-09, T-11, T-12, T-16, T-19

**Kind:** tests

**Checked:** Tests de interfaz de la batería que ejecutan estos procesos y pantallas

**Against what data:** flxCatalog.InterfaceTest, pasada del 26-oct

**Verdict:** not verified — waived by D-4

**Result:** Cubiertas según D-4.

## 2026-10-26 · affects T-16

**Kind:** help

**Checked:** tour: tour-mi-carrito · page: VTA_Pedido_MiCarrito_View · help: Help_Flujo_HacerPedido

**Against what data:** Recorrido hecho como cliente el 26-oct (2 pasos sin saltos)

**Verdict:** passes

**Result:** OK: Mi carrito ofrece su recorrido y el botón Ayuda de «Mis productos» abre «Hacer un pedido».

## 2026-10-26 · affects T-07, T-19

**Kind:** help

**Checked:** tour: tour-catalogo-cliente · page: CAT_Producto_Cliente_List · help: Help_Flujo_HacerPedido

**Against what data:** Recorrido hecho como cliente el 26-oct (4 pasos, uno de ellos «Favoritos y comparar»)

**Verdict:** passes

**Result:** OK: «Mis favoritos» abre el catálogo filtrado y el comparador se lanza desde el catálogo; los dos se explican en el recorrido del catálogo, y su botón Ayuda abre «Hacer un pedido».
