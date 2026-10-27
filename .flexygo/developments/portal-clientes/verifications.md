# Verifications — portal-clientes

## 2026-09-17 · affects T-18

**Checked:** Sesión real como cliente de prueba (rol cliente, Subreference apuntando al cliente F1E5A11A / CLI-0021): Mi catálogo (8 productos con precio de tarifa Mayorista), Mis pedidos (1 pedido propio, PED-1042), Mi ficha (1 registro, el propio), Home Cliente (saludo + tarifa + pedidos recientes). Y sesión real como admin: Clientes/Pedidos del backoffice con Nuevo/Editar/Confirmar/Cancelar/Generar PDF intactos, ficha de cliente y de pedido abren la página de backoffice (no la del portal).

**Against what data:** Cliente de prueba: usuario 'cliente', rol cliente, Subreference=F1E5A11A-76E8-495D-8F3D-338E749F4CF4 (CLI-0021, tarifa Mayorista). Admin: usuario 'admin', perfil '2026'/interfaz web2026. Capturas de snapshot de ambas sesiones en esta misma conversación (Mi catálogo: 8 productos; Mis pedidos: 1/1; Mi ficha: 1/1 CLI-0021; Home Cliente: saludo+tarifa Mayorista+PED-1042; backoffice Clientes: 6/6 con botón Nuevo; ficha de cliente backoffice: botón Editar presente; ficha de pedido backoffice: Editar/Confirmar/Cancelar/Generar PDF presentes).

**Verdict:** passes

**Result:** PASS, con 3 desviaciones encontradas y corregidas durante la propia verificación (no estaban previstas en el plan): (1) el filtro de seguridad de fila de VTA_Pedido usaba una columna IdCliente ambigua entre Pedidos y Clientes (rompía toda plantilla nueva de VTA_Pedido con error 500 disfrazado de "Error getting template"); se corrigió cualificándola como Pedidos.IdCliente. (2) el token usado en los filtros de seguridad y en el context variable era {{currentSubreference}}, pero el administrador guardó el IdCliente del usuario de prueba en el campo Referencia, no en Subreference; se cambiaron los 3 sitios (CLI_Cliente, VTA_Pedido, context variable currentClienteTarifaId) y el SQL del widget de bienvenida a {{currentReference}}. (3) al crear páginas 'view'/'list' propias para CLI_Cliente y VTA_Pedido, las plantillas ORIGINALES del backoffice (flx-cli-cliente-list, flx-vta-pedido-list) navegaban a la ficha por tipo genérico (pagetypeid=view), y con dos páginas 'view' candidatas para el mismo objeto Flexygo empezó a resolver la del portal también para el admin (sin botón Editar); se corrigió cambiando esas dos plantillas a navegación por nombre explícito (pagename=CLI_Cliente_View / VTA_Pedido_View), y se etiquetó InterfaceName en las 10 páginas implicadas (backoffice→web2026 no aplicado, se dejó sin tocar tras confirmar que el fix de plantilla ya bastaba; portal→webcliente) como refuerzo adicional.

## 2026-10-13 · affects B-1

**Checked:** VTA_Tarifa_List y su fila.

**Against what data:** Tarifas de la demo, usuario admin, test Lista_TieneFilas_YSuFilaAbreLaFicha(VTA_Tarifa_List) y circuito Tarifa_AltaModificacionYBorrado.

**Verdict:** passes

**Result:** OK: la lista abre la ficha, y el circuito de alta, modificación y borrado pasa. Sobria: solo enseña el nombre.

**Screenshot:** `screenshots/verify/2026-10-13-b-1-1-verify-admin-vta-tarifa-list.png`

## 2026-10-13 · affects B-1

**Checked:** VTA_Tarifa_View con sus precios por producto.

**Against what data:** Tarifa VIP (primera de la lista), usuario admin.

**Verdict:** passes

**Result:** Carga, pero la tarifa VIP no tiene ningún precio por producto: muestra el estado vacío «Sin precios todavia para esta tarifa», con la tilde de «todavía» ausente. Con esos datos solo se comprueba que la página carga. La falta de precios en la demo y la tilde quedan como observaciones.

**Screenshot:** `screenshots/verify/2026-10-13-b-1-2-verify-admin-vta-tarifa-view.png`

## 2026-10-13 · affects B-3

**Checked:** CAT_Producto_Cliente_List (Catálogo del cliente): tarjetas con foto, precio de su tarifa, favorito, comparar y añadir al carrito.

**Against what data:** Usuario Cliente (CLI-2101), 141 productos en 3 páginas, tests Catalogo_MuestraProductosConFotoPrecioYPaginacion y ClienteRecorridoPantallasTests.

**Verdict:** passes

**Result:** OK tras dos correcciones de hoy: el botón de favorito pintaba «?» (ahora ★/☆, como el JavaScript) y el precio se partía en dos líneas cuando la tarjeta lleva distintivo (white-space: nowrap en el plugin flxcatalog-portal.css).

**Screenshot:** `screenshots/verify/2026-10-13-b-3-3-verify-cliente-catalogo.png`

## 2026-10-13 · affects B-3

**Checked:** CLI_Cliente_Mi_Ficha_View (Mi ficha).

**Against what data:** Usuario Cliente, ficha de Marta Rodríguez Díaz (CLI-2101), test MiFicha_MuestraLosDatosDelClienteConectado.

**Verdict:** passes

**Result:** OK: datos del cliente conectado, tarifa coherente con la portada y sin botón de editar.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-4-verify-cliente-mificha.png`

## 2026-10-13 · affects B-3

**Checked:** Mis pedidos (VTA_Pedido_List con el rol cliente): solo los suyos, y la fila abre su ficha.

**Against what data:** Usuario Cliente, tests MisPedidos_SoloMuestraLosPedidosDelClienteConectado y Seguridad_ElClienteNoVeElPedidoDeOtroCliente.

**Verdict:** passes

**Result:** OK: solo sus pedidos, y no puede abrir el de otro cliente. Observación de calidad: los carritos en Borrador (CARR-…) aparecen en «Mis pedidos» y la lista no se ordena por fecha.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-5-verify-cliente-mispedidos.png`

## 2026-10-13 · affects B-3

**Checked:** VTA_Pedido_Cliente_View (ficha de mi pedido).

**Against what data:** Usuario Cliente, primer pedido de su lista (un carrito en borrador sin líneas).

**Verdict:** passes

**Result:** OK: «Este pedido no tiene líneas» y guiones en los campos vacíos, que es lo esperado en un borrador. Enlace «← Volver a mis pedidos» corregido.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-6-verify-cliente-mispedidos-vta-pedido-cliente-view.png`

## 2026-10-26 · affects T-01, T-02, T-04

**Checked:** La tabla Tarifas_Precios existe con su restricción única, está en el proyecto de datos y tiene precios de demo

**Against what data:** flxCatalog el 26-oct: sys.indexes de Tarifas_Precios y recuento por tarifa; flxCatalog.Data.Database/dbo/Tables

**Verdict:** passes

**Result:** OK: PK_Tarifas_Precios y UQ_Tarifas_Precios_Tarifa_Producto (única por tarifa y producto); 140 precios en Distribuidor, Mayorista, Profesional y, desde hoy, VIP (−20 %, que antes se quedaba sin precios y pagaba el precio base como Público); Público sin filas a propósito. El fichero de la tabla está en el proyecto SSDT.

## 2026-10-26 · affects T-03

**Checked:** La ficha de una tarifa muestra y deja mantener sus precios por producto

**Against what data:** Tarifa Profesional como admin, captura de la batería del 26-oct (140 precios en 3 páginas)

**Verdict:** passes

**Result:** OK: la ficha de tarifa lleva «Volver a tarifas», su nombre y el listado «Precios por producto» ordenado por producto (Abrigo Niño Deluxe 79,71 €…) con Nuevo, filtro y paginador.

**Screenshot:** `screenshots/verify/2026-10-26-t-03-7-pc-tarifa.png`

## 2026-10-26 · affects T-05, T-06, T-07, T-08

**Checked:** El rol cliente ve el catálogo con el precio de su tarifa

**Against what data:** Usuario cliente (Marta Rodríguez Díaz, rol cliente, tarifa Profesional) el 26-oct; precios de la tarifa Profesional consultados en la base de datos

**Verdict:** passes

**Result:** OK: el Catálogo muestra Abrigo Niño Deluxe a 79,71 € y Pantalón Niño Pro a 34,11 €, que son exactamente sus precios en la tarifa Profesional (precio base 83,90 € y 35,90 €): la variable de contexto de la tarifa y la vista CAT_ProductoClienteList funcionan. El rol cliente existe (flexygo_list_roles).

**Screenshot:** `screenshots/verify/2026-10-26-t-05-t-06-t-07-t-08-8-pc-catalogo.png`

## 2026-10-26 · affects T-09, T-12

**Checked:** Mis pedidos muestra solo los pedidos de la clienta conectada

**Against what data:** Usuario cliente (Marta Rodríguez Díaz) el 26-oct; tests MisPedidos_SoloMuestraLosPedidosDelClienteConectado y Seguridad_ElClienteNoVeElPedidoDeOtroCliente en verde

**Verdict:** passes

**Result:** OK: 9 pedidos, todos suyos (8 del reinicio y su carrito), del más reciente al más antiguo, con su estado coloreado y su total; el pedido de otro cliente no se abre.

**Screenshot:** `screenshots/verify/2026-10-26-t-09-t-12-9-pc-mispedidos.png`

## 2026-10-26 · affects T-10, T-11

**Checked:** Mi ficha muestra solo los datos de la clienta conectada, con su tarifa

**Against what data:** Usuario cliente (Marta Rodríguez Díaz, CLI-2101) el 26-oct; test MiFicha_MuestraLosDatosDelClienteConectado en verde

**Verdict:** passes

**Result:** OK: su razón social, CLI-2101, CIF, correo, teléfono, dirección fiscal, tarifa Profesional y Activo Sí, sin botón de editar ni de borrar.

**Screenshot:** `screenshots/verify/2026-10-26-t-10-t-11-10-pc-mificha.png`

## 2026-10-26 · affects T-13, T-14, T-15, T-16, T-17

**Checked:** El cliente entra por su interfaz, con su menú, y no alcanza las pantallas ni los objetos de administración

**Against what data:** Usuario cliente el 26-oct; tests ClienteNavegacionTests.MenuCliente_* y ClienteCuentaTests.Seguridad_ElClienteNoAbrePantallasDeAdministracion (CLI_Cliente_List, CAT_Producto_List, VTA_Tarifa_List, VTA_Dashboard_Page, VTA_MesaTrabajo_Page) en verde; flexygo_list_interfaces

**Verdict:** passes

**Result:** OK: el login del cliente aterriza en su portada (interfaz webcliente, raíz «Menú Cliente» con Catálogo, Mi carrito, Mis pedidos, Mi ficha, Mis favoritos, Mis documentos, Mis devoluciones, Mis incidencias, Mis notificaciones y Ayuda); las cinco pantallas de administración se le niegan por su dirección y no salen en su menú.

**Screenshot:** `screenshots/verify/2026-10-26-t-13-t-14-t-15-t-16-t-17-11-pc-home.png`

## 2026-10-26 · affects T-08, T-09, T-10, T-15, T-16

**Kind:** tests

**Checked:** Tests de interfaz de la batería que cubren el portal del cliente

**Against what data:** flxCatalog.InterfaceTest, pasada del 26-oct

**Verdict:** not verified — waived by D-5

**Result:** Cubiertas según D-5.

## 2026-10-26 · affects T-08

**Kind:** help

**Checked:** tour: tour-catalogo-cliente · page: CAT_Producto_Cliente_List · help: Help_Flujo_HacerPedido

**Against what data:** Recorrido hecho como cliente el 26-oct (4 pasos sin saltos)

**Verdict:** passes

**Result:** OK: el Catálogo ofrece su recorrido y su botón Ayuda abre «Hacer un pedido».

## 2026-10-26 · affects T-09

**Kind:** help

**Checked:** tour: tour-mis-pedidos · page: VTA_Pedido_List · help: Help_Pantalla_Pedidos

**Against what data:** Recorrido hecho como cliente el 26-oct (2 pasos sin saltos); oculto al administrador

**Verdict:** passes

**Result:** OK: «Mis pedidos» ofrece al cliente su propio recorrido y el botón Ayuda abre la página que le lleva a «Hacer un pedido».

## 2026-10-26 · affects T-10

**Kind:** help

**Checked:** tour: tour-mi-ficha · page: CLI_Cliente_Mi_Ficha_View · help: Help_Flujo_MiCuenta

**Against what data:** Recorrido hecho como cliente el 26-oct (1 paso)

**Verdict:** passes

**Result:** OK: «Mi ficha» ofrece su recorrido y su botón Ayuda abre «Mi cuenta».

## 2026-10-26 · affects T-15, T-16

**Kind:** help

**Checked:** tour: — · page: — · help: — (seguridad y menú, sin pantalla propia)

**Against what data:** none

**Verdict:** not verified — waived by D-6

**Result:** Sin ayuda propia por D-6.
