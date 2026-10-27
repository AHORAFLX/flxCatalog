# Verifications — correcciones-rol-cliente

## 2026-10-13 · affects B-1

**Checked:** Portada del cliente, página d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86 (Home Cliente): saludo, tarifa y últimos pedidos al entrar.

**Against what data:** Usuario Cliente (tarifa VIP), test Portada_SeAbreAlEntrar y Login_AbreLaPortadaDelCliente.

**Verdict:** passes

**Result:** OK: entra en su portada con el saludo, la tarifa asignada y sus pedidos; en la barra superior están el aviso de notificaciones y «Mi carrito». Observación: la lista enseña los carritos CARR-… cancelados que deja cada ejecución del test de confirmar pedido.

**Screenshot:** `screenshots/verify/2026-10-13-b-1-1-verify-cliente-homecliente.png`

## 2026-10-13 · affects B-1

**Checked:** CAT_Favorito_Cliente_List: la página de favoritos anterior, a la que ya no lleva ningún menú («Mis favoritos» abre ahora el catálogo filtrado).

**Against what data:** Usuario Cliente sin favoritos, abierta por nombre (test PaginaSinMenu_SeAbrePorNombre).

**Verdict:** passes

**Result:** OK: abre sin errores y con su estado vacío «Todavía no tienes productos favoritos». Queda huérfana: ningún nodo la usa.

**Screenshot:** `screenshots/verify/2026-10-13-b-1-2-verify-cliente-cat-favorito-cliente-list.png`

## 2026-10-13 · affects B-1

**Checked:** CLI_Cliente_Mi_Ficha_List: la lista de «Mi ficha», a la que ya no lleva ningún menú («Mi ficha» abre la ficha directamente).

**Against what data:** Usuario Cliente (CLI-2101), abierta por nombre.

**Verdict:** passes

**Result:** OK: una sola fila, la del cliente conectado, con código, razón social, tarifa y estado. Es el destino del enlace «← Volver» de Mi ficha.

**Screenshot:** `screenshots/verify/2026-10-13-b-1-3-verify-cliente-cli-cliente-mi-ficha-list.png`

## 2026-10-26 · affects T-01, T-02, T-03, T-04, T-05

**Checked:** Aspecto y menú del cliente: paleta, Catálogo, Mi ficha y Mis favoritos por navegación directa, e icono del carrito con contador

**Against what data:** Usuario cliente (Marta Rodríguez Díaz) el 26-oct; tests ClienteNavegacionTests.MenuCliente_AbreSuPantalla (Catálogo, Mi ficha, Mis favoritos…) en verde; captura de «Mis favoritos»

**Verdict:** passes

**Result:** OK: menú lateral oscuro de skin2026 con acento turquesa; «Catálogo» (antes «Mi catálogo»); «Mi ficha» abre directamente su ficha CLI-2101; «Mis favoritos» abre el catálogo filtrado a sus 7 favoritos (estrella roja); arriba, «Mi carrito» con el contador 26 y la campana de avisos.

**Screenshot:** `screenshots/verify/2026-10-26-t-01-t-02-t-03-t-04-t-05-4-cr-fav.png`

## 2026-10-26 · affects T-06, T-07, T-08

**Checked:** Buscador de productos y reseñas en la ficha de producto del cliente

**Against what data:** Usuario cliente el 26-oct; 150 reseñas del reinicio de demo; tests ClienteCatalogoTests.Buscador_EncuentraUnProductoYAbreSuFicha, FichaDeProducto_SeAbreEnVentanaConSusReseñas, Reseña_ProductoNoComprado_ExplicaPorQueNoSePuedeEscribir y Reseña_ProductoComprado_SePublicaYApareceEnLaLista en verde

**Verdict:** passes

**Result:** OK: la ficha de Abrigo Niño Deluxe abre en ventana con «Reseñas de clientes», nota media 5,0 (1 reseña de Nacional Retail S.L.U.) y el bloque «Escribe tu reseña» con puntuación por estrellas y «Publicar reseña»; el buscador de la barra superior encuentra productos y abre su ficha.

**Screenshot:** `screenshots/verify/2026-10-26-t-06-t-07-t-08-5-cr-ficha.png`

## 2026-10-26 · affects T-09, T-10, T-11, T-12, T-13, T-14, T-15

**Checked:** Devoluciones e incidencias del cliente: alta solo por proceso, validaciones y cancelación controlada

**Against what data:** Usuario cliente el 26-oct, después de recompilar los procesos; ClientePostventaTests (6) y ClienteCarritoPedidosTests (5) en verde (11/11); pedido PED-1146 (Entregado) y su carrito CARR-… (Borrador)

**Verdict:** passes

**Result:** OK: desde la ficha de un pedido entregado salen «Imprimir Recibo», «Abrir incidencia» y «Solicitar devolución» en cada línea; la devolución con más unidades de las compradas se rechaza sin crear nada; lo ya tramitado no se cancela; el cliente no puede dar de alta directamente. CORRECCIÓN de hoy: el carrito (Borrador) ofrecía «Solicitar devolución»; ahora los procesos rechazan devolver lo no entregado y abrir incidencia sobre un Borrador, y el botón de devolución solo sale en pedidos entregados (en el carrito, 0 botones; en PED-1146, uno por línea). Estados «Cancelada» presentes en devoluciones e incidencias.

**Screenshot:** `screenshots/verify/2026-10-26-t-09-t-10-t-11-t-12-t-13-t-14-t-15-6-cr-pedido-entregado.png`

## 2026-10-26 · affects T-16

**Checked:** Mis documentos muestra solo documentos (no pedidos) y la tarifa del cliente

**Against what data:** Usuario cliente el 26-oct; test MisDocumentos_MuestraSusDocumentosYSuTarifa_SinListarPedidos en verde

**Verdict:** passes

**Result:** OK: no hay listado de pedidos; el bloque de documentos y «Mi tarifa» (Profesional). La clienta demo no tiene documentos adjuntos tras el reinicio de hoy (los documentos viven en la base de configuración y no los crea el reinicio). Captura tomada antes de restaurar el texto vacío original «Aún no tienes documentos».

**Screenshot:** `screenshots/verify/2026-10-26-t-16-7-cr-docs.png`

## 2026-10-26 · affects T-06, T-07, T-08

**Checked:** Bloque de reseñas de la ficha de producto ajustado al original P-RESEÑAS

**Against what data:** Usuaria cliente Marta Rodríguez Díaz, producto Abrigo Niño Deluxe (REF-2138), 1 reseña de Nacional Retail S.L.U.

**Verdict:** passes

**Result:** OK: título 20px/600, resumen 5,0 con fondo #f9f9fa y radio 4px, avatar 32px con borde, nombre 14px/500, texto sangrado 44px, fecha relativa «hace 2 meses» (antes salía vacía: el script no leía el formato /Date(ms)/ que entrega la vista; corregido en flxcatalog-cat-reviews.js), «Escribe tu reseña» 14px/500, área de texto radio 4px y 96px, botón «Publicar reseña» negro #000000 con relleno 8px 24px.

**Screenshot:** `screenshots/verify/2026-10-26-t-06-t-07-t-08-8-resenas-after.png`

## 2026-10-26 · affects T-01, T-02, T-03, T-04, T-05, B-2, T-11, T-12, T-13, T-14, T-15, T-16

**Kind:** tests

**Checked:** Tests propios de correcciones-rol-cliente

**Against what data:** Cubiertos por las pruebas de interfaz existentes del portal de clientes (ClienteNavegacionTests, ClienteCatalogoTests, ClientePostventaTests, Mis documentos)

**Verdict:** not verified — waived by D-14

**Result:** Sin tests nuevos con estos identificadores por decisión D-14

## 2026-10-26 · affects T-15

**Kind:** help

**Checked:** tour: tour-pedido-cliente · page: VTA_Pedido_Cliente_View · help: Help_Flujo_Postventa

**Against what data:** Ficha de mi pedido (cliente) con los botones Solicitar devolución / Abrir incidencia

**Verdict:** passes

**Result:** Tour recorrido sin pasos saltados; el botón de ayuda abre el flujo de postventa

## 2026-10-26 · affects T-02

**Kind:** help

**Checked:** tour: tour-mi-ficha · page: CLI_Cliente_Mi_Ficha_View · help: Help_Flujo_MiCuenta

**Against what data:** Mi ficha, ahora alcanzada por navegación directa desde el menú

**Verdict:** passes

**Result:** Tour de Mi ficha y ayuda «Mi cuenta» en su botón

## 2026-10-26 · affects T-03, T-04, B-2

**Kind:** help

**Checked:** tour: tour-catalogo-cliente · page: CAT_Producto_Cliente_List · help: Help_Flujo_HacerPedido

**Against what data:** Catálogo del cliente (renombrado), el filtro de favoritos sobre el mismo catálogo y las reseñas de la ficha de producto que se abre desde él

**Verdict:** passes

**Result:** Tour del catálogo y ayuda «Hacer un pedido» en su botón

## 2026-10-26 · affects T-05

**Kind:** help

**Checked:** tour: tour-mi-carrito · page: VTA_Pedido_MiCarrito_View · help: Help_Flujo_HacerPedido

**Against what data:** Icono «Mi carrito» con contador en la barra superior, que abre el carrito

**Verdict:** passes

**Result:** Tour del carrito y ayuda «Hacer un pedido» en su botón

## 2026-10-26 · affects T-16

**Kind:** help

**Checked:** tour: tour-mis-documentos · page: VTA_MisDocumentos_List · help: Help_Flujo_MiCuenta

**Against what data:** Mis documentos, solo documentos adjuntos y la tarifa

**Verdict:** passes

**Result:** Tour de Mis documentos y ayuda «Mi cuenta» en su botón

## 2026-10-26 · affects T-01

**Kind:** help

**Checked:** Ayuda de la paleta de la skin

**Against what data:** Variables de color, sin pantalla propia

**Verdict:** not verified — waived by D-15

**Result:** Sin ayuda propia por D-15

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 20:45:24.369 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-9-t-16-cli-cliente-view-screen.png`

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 20:47:09.949 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-10-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-16-9-t-16-cli-cliente-view-screen.png`

## 2026-10-26 · affects T-02

**Checked:** Baseline of walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) accepted at 20:47:20 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 1.45 % of the pixels, 33 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-02-11-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-26 · affects T-15

**Checked:** Baseline of walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) accepted at 20:47:20 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 0.03 % of the pixels, 14 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-15-12-t-15-cli-cliente-list-screen.png`

## 2026-10-26 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 20:47:25 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (changed 1.82 % of the pixels, 39 line(s) of text), pedidos (changed 3.73 % of the pixels, 803 line(s) of text), devoluciones (changed 1.47 % of the pixels, 60 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-13-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-27 · affects T-15

**Checked:** Walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) replayed by flexygo_run_tests at 08:05:25.980 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-14-t-15-cli-cliente-list-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-15-12-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 08:05:25.980 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-15-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-16-10-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-02

**Checked:** Walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) replayed by flexygo_run_tests at 08:06:39.108 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.09 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-02-16-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-27 · affects T-15

**Checked:** Walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) replayed by flexygo_run_tests at 08:06:39.108 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-17-t-15-cli-cliente-list-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-15-12-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 08:06:39.108 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-18-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-16-10-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-02

**Checked:** Walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) replayed by flexygo_run_tests at 08:08:03.546 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.10 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-02-19-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-27 · affects T-15

**Checked:** Walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) replayed by flexygo_run_tests at 08:08:03.546 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-20-t-15-cli-cliente-list-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-15-12-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 08:08:03.546 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-21-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-16-10-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 08:08:12 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (changed 0.00 % of the pixels, 0 line(s) of text), pedidos (changed 0.04 % of the pixels, 6 line(s) of text), devoluciones (changed 0.00 % of the pixels, 0 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-22-t-16-vta-mesatrabajo-page-incidencias.png` — same bytes as `screenshots/verify/2026-10-26-t-16-13-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-27 · affects T-02

**Checked:** Walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) replayed by flexygo_run_tests at 08:08:59.727 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.09 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-02-23-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-27 · affects T-15

**Checked:** Walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) replayed by flexygo_run_tests at 08:08:59.727 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-24-t-15-cli-cliente-list-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-15-12-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 08:08:59.727 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.02 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-25-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-16-10-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) replayed by flexygo_run_tests at 08:08:59.727 against its accepted baseline: 3 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-26-t-16-vta-mesatrabajo-page-incidencias.png` — same bytes as `screenshots/verify/2026-10-26-t-16-13-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-27 · affects T-02

**Checked:** Baseline of walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) accepted at 08:36:29 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 0.71 % of the pixels, 22 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-27-t-02-27-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-27 · affects T-15

**Checked:** Baseline of walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) accepted at 08:36:29 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 8.53 % of the pixels, 442 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-28-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Baseline of walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) accepted at 08:36:29 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 4.72 % of the pixels, 31 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-29-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 08:36:30 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (changed 2.66 % of the pixels, 44 line(s) of text), pedidos (changed 3.60 % of the pixels, 825 line(s) of text), devoluciones (changed 1.30 % of the pixels, 60 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-30-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-27 · affects T-02

**Checked:** Walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) replayed by flexygo_run_tests at 08:37:17.813 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-02-31-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-27 · affects T-15

**Checked:** Walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) replayed by flexygo_run_tests at 08:37:17.813 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-15-32-t-15-cli-cliente-list-screen.png` — same bytes as `screenshots/verify/2026-10-27-t-15-28-t-15-cli-cliente-list-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 08:37:17.813 against its accepted baseline: 1 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.00 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-33-t-16-cli-cliente-view-screen.png` — same bytes as `screenshots/verify/2026-10-27-t-16-29-t-16-cli-cliente-view-screen.png`

## 2026-10-27 · affects T-16

**Checked:** Walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) replayed by flexygo_run_tests at 08:37:17.813 against its accepted baseline: 3 capture(s) of the screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error, and every capture is within its threshold (largest change 0.43 % of the pixels, the text identical outside what it declares volatile; contrast, raw identifiers, broken images and sideways scroll measured clean).

**Screenshot:** `screenshots/verify/2026-10-27-t-16-34-t-16-vta-mesatrabajo-page-incidencias.png`
