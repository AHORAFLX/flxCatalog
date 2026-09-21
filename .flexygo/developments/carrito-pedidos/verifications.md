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
