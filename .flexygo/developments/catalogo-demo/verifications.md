# Verifications — catalogo-demo

## 2026-09-15 · affects T-22

**Checked:** Panel de control (HOME): los 4 KPI muestran números reales, las dos gráficas pintan datos y la tabla de pedidos recientes muestra clientes/fechas/estados legibles. Se encontró un defecto en la gráfica "Ventas por familia" (el CASE de color usaba los nombres de familia padre en vez de los hijos reales, así que casi todas las porciones salían del mismo gris) y se corrigió en vivo cambiando el SQL del módulo a los 8 nombres de familia reales con una rampa de grises distinguible.

**Against what data:** Datos del seed: Ventas hoy 1.537€, Pedidos hoy 2, Pedidos pendientes 3, Clientes activos 5, 4 pedidos recientes visibles (PED-1039/1037/1041/1040) con estados Borrador/Confirmado/En proceso/Enviado/Entregado en colores distintos.

**Verdict:** passes

**Result:** Correcto tras el arreglo. KPIs con datos reales (no ceros). Gráfica "Ventas por mes" en negro sólido (coherente con la paleta neutra del skin, serie única, no es un defecto). Gráfica "Ventas por familia": antes todas las porciones del mismo gris (defecto), después de corregir el SQL cada familia tiene un tono distinto y la leyenda es legible. Pedidos recientes: fechas relativas ("hace un día"), cliente y estado con etiqueta y color, no ids en crudo. 0 errores de consola (1 aviso de deprecación de moment.js, ajeno a esta build). Aviso aparte: en la esquina inferior derecha de toda la pantalla aparece una marca de agua "LICENSE NOT ACTIVATED" — no es un defecto de lo construido, es una licencia de un componente de la plataforma (aparenta ser DevExpress) sin activar en este entorno; lo dejo anotado para quien gestione las licencias.

**Screenshot:** `screenshots/2026-09-15-t-22-1.png`

## 2026-09-15 · affects T-22

**Checked:** Comparación de diseño fila a fila del Panel de control contra la pantalla aprobada en Stitch, más las correcciones aplicadas en vivo.

**Against what data:** reference/panel-de-control.png/.html vs http://localhost:7111/Index con datos del seed.

**Verdict:** passes

**Result:** 12/12 filas cerradas: 4 same (list-row con fix:done, iconography y nav-and-branding con fix:none, record-card not-applicable), 1 raised/platform (palette, hueco paleta-skin2026), 6 raised/config con decisión D-7 (typography, badges, spacing, composition, density, module-chrome, toolbar-and-actions — D-7: mantener estándar Flexygo, sin más trabajo). Corregido en vivo: gráfica "Ventas por familia" (colores por familia real en vez de un CASE que no coincidía con ningún nombre), colisión de color entre badges "Confirmado" y "Enviado" (ahora clases propias), columnas y orden del widget "Pedidos recientes" (plantilla propia, ya no hereda del listado completo). Pendiente menor: no se pudo quitar el botón "+ Nuevo" del widget de pedidos recientes por un fallo del parámetro toolbarName vacío en la herramienta de módulos.

**Screenshot:** `screenshots/2026-09-15-t-22-2.png`

## 2026-09-15 · affects T-09

**Checked:** Listado de productos: filas con etiquetas (Familia/Marca/Estado resueltos, no ids), paginador con datos reales, comparación de diseño contra la pantalla aprobada.

**Against what data:** 8 productos del seed.

**Verdict:** passes

**Result:** Correcto. 12/12 filas de comparación de diseño cerradas (mismo patrón que Panel de control: paleta/tipografía/badges/cromado de módulo raised con D-7 o el hueco de skin2026; el resto same). Los estados se ven como texto con color (Activo/Novedad/Sin stock), no ids en crudo.

**Screenshot:** `screenshots/2026-09-15-t-09-3.png`

## 2026-09-15 · affects T-10

**Checked:** Uso real de los procesos Duplicar y Archivar sobre Producto (creación, ejecución de proceso y borrado, sin tocar datos del seed).

**Against what data:** Producto REF-1001 'Camiseta Urban' (existente) usado como origen; copia creada por Duplicar: REF-1001-COPIA con 4 variantes.

**Verdict:** passes

**Result:** Correcto. Duplicar creó el producto copia con sus 4 variantes (comprobado por SQL: Activo=False, Stock=0 en todas). Archivar sobre la copia actualizó ModifiedDate (comprobado por SQL). Registro y variantes de prueba borrados al terminar.

## 2026-09-15 · affects T-12

**Checked:** Listado de clientes: columnas resueltas, estado con color, comparación de diseño completa.

**Against what data:** 6 clientes del seed.

**Verdict:** passes

**Result:** Correcto. 12/12 filas de comparación cerradas, mismo patrón que las pantallas anteriores.

**Screenshot:** `screenshots/2026-09-15-t-12-4.png`

## 2026-09-15 · affects T-18

**Checked:** Uso real de Confirmar, Generar PDF y Cancelar sobre un pedido existente, revertido al terminar.

**Against what data:** PED-1037 (Moda Sur S.L.), estado original Borrador.

**Verdict:** passes

**Result:** Correcto los tres. Confirmar: Borrador→Confirmado (SQL). Generar PDF: descarga real de 32KB, contenido correcto (cliente, CIF, dirección, email, líneas, total 389,10€). Cancelar: →Cancelado (SQL). Pedido devuelto a Borrador al terminar.

## 2026-09-15 · affects T-01

**Checked:** Ficha y listado de Familias muestran el nombre de la familia padre resuelto, no el GUID.

**Against what data:** Familia 'Camisetas', padre 'Ropa'.

**Verdict:** passes

**Result:** Correcto tras el arreglo. Listado: columna 'Familia padre' = 'Ropa' con indicador ↳ en el nombre del hijo. Ficha: campo 'Familia padre' = 'Ropa'.

**Screenshot:** `screenshots/2026-09-15-t-01-5.png`

## 2026-09-15 · affects T-02

**Checked:** Listado de marcas: nombres y estado correctos, sin ids en crudo.

**Against what data:** 2 marcas del seed (Trailmark, Norden).

**Verdict:** passes

**Result:** Correcto.

**Screenshot:** `screenshots/2026-09-15-t-02-6.png`

## 2026-09-15 · affects T-12

**Checked:** Ficha de cliente: todos los campos fiscales (razón social, CIF, dirección, email) y Tarifa resuelta a nombre, no en crudo.

**Against what data:** Cliente CLI-0021, Comercial Ibérica de Distribución S.L.

**Verdict:** passes

**Result:** Correcto. Tarifa muestra 'Mayorista' (combo resuelto), todos los campos con datos reales.

**Screenshot:** `screenshots/2026-09-15-t-12-7.png`

## 2026-09-15 · affects B-1

**Checked:** Barrido final de cierre: catálogos maestros sin pantalla propia (por S-6), comprobados por estructura ya que no tienen ficha de usuario. Objetos: CAT_Talla/CAT_Tallas (tabla Tallas), CAT_Color/CAT_Colores (tabla Colores), VTA_EstadoPedido/VTA_EstadosPedido (tabla Pedidos_Estados), VTA_Tarifa/VTA_Tarifas (tabla Tarifas). Vistas por defecto CAT_TallaDefaultList, CAT_ColorDefaultList, VTA_EstadoPedidoDefaultList, VTA_TarifaDefaultList. Se usan como combos (Talla, Color, Estado, Tarifa) en Producto/Variante/Cliente/Pedido y se mantienen solo por el stored procedure de datos de prueba, tal y como se decidió.

**Against what data:** 4 tablas maestras, 4 objetos + 4 colecciones, datos del seed: 4 tallas, 3 colores, 6 estados de pedido, 5 tarifas.

**Verdict:** passes

**Result:** Correcto. Los 4 combos que los consumen (Talla y Color en Variante; Estado en Pedido; Tarifa en Cliente) resuelven a nombre en pantalla, comprobado en las fichas de Producto (variantes), Pedido y Cliente ya verificadas.

## 2026-09-15 · affects B-2

**Checked:** Barrido final de cierre: objeto CAT_Variante/CAT_Variantes (tabla Productos_Variantes), vistas CAT_VarianteDefaultList y CAT_VarianteList, módulos mod-cat-variante-list (huérfano reutilizado) y mod-cat-variante-list-producto (listado relacionado), plantilla flx-cat-variante-list, filtro 'Buscar variantes'.

**Against what data:** 7 variantes del seed, visibles en la ficha de Camiseta Urban (4) y en Zapatilla Runner/Zapatilla Casual.

**Verdict:** passes

**Result:** Correcto. El listado relacionado dentro de la ficha de Producto muestra Talla/Color/Referencia/Stock resueltos, fila clicable a la ficha del producto padre.

## 2026-09-15 · affects B-3

**Checked:** Barrido final de cierre: objeto VTA_LineaPedido/VTA_LineasPedido (tabla Pedidos_Lineas), vistas VTA_LineaPedidoDefaultList, módulos mod-vta-lineapedido-list (huérfano reutilizado) y mod-vta-lineapedido-list-pedido (listado relacionado), plantilla flx-vta-lineapedido-list.

**Against what data:** 13 líneas del seed, visibles en la ficha de PED-1042 (2 líneas: Sudadera Basic, Camiseta Urban).

**Verdict:** passes

**Result:** Correcto. Listado relacionado dentro de la ficha de Pedido muestra Producto/Cantidad/Precio/Subtotal.

## 2026-09-15 · affects T-10

**Checked:** Barrido final de cierre: procesos pCAT_ArchivarProducto y pCAT_DuplicarProducto (objeto CAT_Producto), ya probados en vivo (ver verificación anterior sobre REF-1001-COPIA).

**Against what data:** Producto REF-1001 Camiseta Urban.

**Verdict:** passes

**Result:** Correcto, remite a la verificación funcional ya registrada.

## 2026-09-15 · affects T-18

**Checked:** Barrido final de cierre: procesos pVTA_ConfirmarPedido, pVTA_CancelarPedido y pVTA_GenerarPdfPedido (objeto VTA_Pedido), ya probados en vivo (ver verificación anterior sobre PED-1037).

**Against what data:** Pedido PED-1037 Moda Sur S.L.

**Verdict:** passes

**Result:** Correcto, remite a la verificación funcional ya registrada.

## 2026-09-15 · affects T-22

**Checked:** Página HOME (Panel de control): abierta, KPIs y gráficas correctas tras las correcciones.

**Against what data:** Datos del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-01

**Checked:** Página CAT_Familia_List abierta: jerarquía, buscador y orden por columna funcionando.

**Against what data:** 11 familias del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-01

**Checked:** Página CAT_Familia_View abierta: Familia padre resuelta, listado de Productos y enlace de vuelta funcionando.

**Against what data:** Familia Camisetas.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-02

**Checked:** Página CAT_Marca_List abierta: buscador y orden por columna funcionando.

**Against what data:** 2 marcas del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-02

**Checked:** Página CAT_Marca_View abierta: enlace de vuelta funcionando.

**Against what data:** Marca Trailmark.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-09

**Checked:** Página CAT_Producto_List abierta: buscador (probado con 'Gorra') y orden por columna (probado con Precio) funcionando de verdad.

**Against what data:** 8 productos del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-10

**Checked:** Página CAT_Producto_View abierta: Duplicar/Archivar probados en vivo, enlace de vuelta funcionando.

**Against what data:** Producto REF-1001 Camiseta Urban.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-12

**Checked:** Página CLI_Cliente_List abierta: buscador y orden por columna funcionando.

**Against what data:** 6 clientes del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-12

**Checked:** Página CLI_Cliente_View abierta: datos fiscales completos, tarifa resuelta, enlace de vuelta funcionando.

**Against what data:** Cliente CLI-0021.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-13

**Checked:** Página VTA_Pedido_List abierta: buscador y orden por columna funcionando.

**Against what data:** 6 pedidos del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-18

**Checked:** Página VTA_Pedido_View abierta: Confirmar/Cancelar/Generar PDF probados en vivo, panel de Información fiscal y enlace de vuelta funcionando.

**Against what data:** Pedido PED-1042 / PED-1037.

**Verdict:** passes

**Result:** Correcto.

## 2026-09-15 · affects T-24

**Checked:** Página CAT_Catalogo_Publico abierta: 8 fotos de producto cargando, buscador funcionando, botón Añadir al carrito deshabilitado a propósito (D-4).

**Against what data:** 8 productos activos del seed.

**Verdict:** passes

**Result:** Correcto.

## 2026-10-13 · affects B-2

**Checked:** CAT_Producto_List: lista de productos del administrador; la fila abre la ficha.

**Against what data:** 141 productos de la demo, usuario admin, test Lista_TieneFilas_YSuFilaAbreLaFicha(CAT_Producto_List).

**Verdict:** passes

**Result:** OK. Referencia, nombre, familia, marca, precio, stock y estado con distintivo; corregido hoy «Inactivo», que salía como texto plano y ahora lleva distintivo rojo.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-38-verify-admin-cat-producto-list.png`

## 2026-10-13 · affects B-2

**Checked:** CAT_Producto_View: ficha de producto del administrador.

**Against what data:** Primer producto de la lista, usuario admin.

**Verdict:** passes

**Result:** OK en datos y navegación, con el enlace «← Volver a productos» corregido. Detalle visual: la tarjeta «Ficha de producto» recorta su última línea porque las tarjetas de la fila tienen la misma altura. Queda como hallazgo de calidad.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-39-verify-admin-cat-producto-view.png`

## 2026-10-13 · affects B-2

**Checked:** CAT_Familia_List y su fila.

**Against what data:** 34 familias jerarquizadas, usuario admin.

**Verdict:** passes

**Result:** OK: jerarquía, número de productos y estado bien formateados; la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-40-verify-admin-cat-familia-list.png`

## 2026-10-13 · affects B-2

**Checked:** CAT_Familia_View con su lista de productos.

**Against what data:** Primera familia, 44 productos relacionados, usuario admin.

**Verdict:** passes

**Result:** OK: la lista de productos de la familia pagina; «Inactivo» ya con distintivo; enlace «← Volver a familias».

**Screenshot:** `screenshots/verify/2026-10-13-b-2-41-verify-admin-cat-familia-view.png`

## 2026-10-13 · affects B-2

**Checked:** CAT_Marca_List y su fila.

**Against what data:** 18 marcas, usuario admin.

**Verdict:** passes

**Result:** OK: 18 filas, «Activo» con distintivo, la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-42-verify-admin-cat-marca-list.png`

## 2026-10-13 · affects B-2

**Checked:** CAT_Marca_View con sus productos.

**Against what data:** Primera marca, 7 productos, usuario admin.

**Verdict:** passes

**Result:** OK: ficha y lista de productos de la marca; enlace «← Volver a marcas» corregido.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-43-verify-admin-cat-marca-view.png`

## 2026-10-13 · affects B-3

**Checked:** CLI_Cliente_List y su fila.

**Against what data:** Clientes de la demo, usuario admin, test Lista_TieneFilas_YSuFilaAbreLaFicha(CLI_Cliente_List).

**Verdict:** passes

**Result:** OK: lista con comercial, tarifa y estado; la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-44-verify-admin-cli-cliente-list.png`

## 2026-10-13 · affects B-3

**Checked:** CLI_Cliente_View: ficha, gráfico de artículos comprados, pedidos recientes y comentarios internos.

**Against what data:** Central Boutique S.L. (CLI-2003), usuario admin.

**Verdict:** passes

**Result:** OK tras corregir hoy el gráfico. Decía «top 5» con un TOP sin ORDER BY, que devolvía 5 artículos cualesquiera, y usaba una serie por producto que descolocaba las barras. Ahora muestra todos los artículos comprados en una sola serie y sin el título duplicado. Detalle: la tarjeta de la ficha recorta el distintivo «Activo» (misma altura de fila); queda como hallazgo de calidad.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-45-verify-admin-cli-cliente-view.png`

## 2026-10-13 · affects B-3

**Checked:** VTA_Pedido_List del administrador y su fila.

**Against what data:** 152 pedidos, 4 páginas, usuario admin.

**Verdict:** passes

**Result:** OK: estados con distintivo, importes y paginador. Observaciones de calidad: la lista no tiene un orden por fecha por defecto, y los carritos en Borrador (CARR-…) aparecen mezclados con los pedidos.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-46-verify-admin-vta-pedido-list.png`

## 2026-10-13 · affects B-3

**Checked:** VTA_Pedido_View del administrador: cabecera, seguimiento, líneas y comentarios.

**Against what data:** Primer pedido de la lista, usuario admin.

**Verdict:** passes

**Result:** OK: fechas, importes, progreso y líneas; «—» en la variante de un producto sin variantes, que es lo esperado. Enlace «← Volver a pedidos» corregido.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-47-verify-admin-vta-pedido-view.png`

## 2026-10-13 · affects B-4

**Checked:** HOME (panel de control antiguo).

**Against what data:** Usuario admin, abierta por nombre: ya no está en el menú del administrador.

**Verdict:** does NOT pass — outside the block: Sustituida por VTA_Dashboard_Page en pendientes-cliente-admin T-15; decidir si se retira o se arregla

**Result:** Defectos visibles. La leyenda de «Ventas por familia» (unas 30 entradas) tapa el donut. Hay títulos técnicos («Cabecera del panel de control», «Indicadores del panel de control») encima de los propios. Los gráficos salen en negro y gris. La página la ha sustituido VTA_Dashboard_Page (pendientes-cliente-admin, T-15) y solo sigue como página de inicio de la interfaz antigua webdefault.

**Screenshot:** `screenshots/verify/2026-10-13-b-4-48-verify-admin-home.png`

## 2026-10-13 · affects B-4

**Checked:** HOME (Resumen comercial) tras arreglarla por decisión del usuario.

**Against what data:** Usuario admin, abierta por nombre (test Pantalla_SeAbreConSusModulos(HOME)); datos de demo de junio a septiembre de 2026.

**Verdict:** passes

**Result:** OK. Título «Resumen comercial», que ya no choca con el nodo «Panel de control» de administración, y la cabecera sin el nombre técnico del módulo. Indicadores de hoy alineados con el dashboard: sin borradores ni cancelados, y pendientes = Confirmado + En proceso (D-10). Barras de ventas por mes en índigo. El donut de familias agrupa por las 6 familias principales con colores propios (vista VTA_DashVentasFamiliaPrincipal), y la leyenda ya no lo tapa.

**Screenshot:** `screenshots/verify/2026-10-13-b-4-49-verify-admin-home.png`

## 2026-10-26 · affects T-03, T-04, T-05, T-06

**Checked:** Las tablas maestras Tallas, Colores, Pedidos_Estados y Tarifas existen, tienen datos y alimentan los combos y relaciones que las usan

**Against what data:** Base flxCatalog tras pSeed_ResetDemoData del 26-oct: consulta a sys.tables y sys.foreign_keys; relaciones Flexygo leídas con flexygo_get_object_relations

**Verdict:** passes

**Result:** OK: Tallas 14 filas (XS…XXL y 38…45), Colores 14, Pedidos_Estados 6 (Borrador, Confirmado, En proceso, Enviado, Entregado, Cancelado), Tarifas 5 (Público, Distribuidor, Profesional, Mayorista, VIP). FKs FK_Variantes_Talla, FK_Variantes_Color, FK_Pedidos_Estado y FK_Clientes_Tarifa en su sitio; relaciones CAT_Talla→CAT_Variantes, CAT_Color→CAT_Variantes, VTA_EstadoPedido→VTA_Pedidos y VTA_Tarifa→CLI_Clientes. Desde pendientes-cliente-admin además tienen pantalla propia de maestros (S-6 quedó superada).

## 2026-10-26 · affects T-11, T-19

**Checked:** Las relaciones del modelo existen en la base de datos y en Flexygo

**Against what data:** sys.foreign_keys de flxCatalog y flexygo_get_object_relations de CAT_Familia, CAT_Marca, CAT_Producto, CAT_Talla, CAT_Color, VTA_Tarifa, CLI_Cliente, VTA_EstadoPedido y VTA_Pedido

**Verdict:** passes

**Result:** OK: las diez relaciones pedidas están en los dos lados. En base de datos: FK_Productos_Familia, FK_Productos_Marca, FK_Variantes_Producto/Talla/Color, FK_Clientes_Tarifa, FK_Pedidos_Cliente/Estado y FK_Lineas_Pedido/Producto. En Flexygo: Familia→Productos, Marca→Productos, Producto→Variantes, Talla→Variantes, Color→Variantes, Tarifa→Clientes, Cliente→Pedidos, EstadoPedido→Pedidos, Pedido→Líneas y Producto→Líneas, todas con su campo de enlace (IdX=IdX).

## 2026-10-26 · affects T-07, T-08, T-14

**Checked:** Las tablas Productos, Productos_Variantes y Pedidos_Lineas existen con sus claves y su objeto Flexygo pasa la verificación

**Against what data:** flxCatalog tras el reinicio del 26-oct: Productos 140, Productos_Variantes 624, Pedidos_Lineas 675 filas; flexygo_verify_object de CAT_Producto, CAT_Variante y VTA_LineaPedido

**Verdict:** passes

**Result:** OK: tablas con sus FKs y datos. CAT_Producto pasa (lista, ficha, filtros, combos). CAT_Variante y VTA_LineaPedido marcan «sin vista de detalle» y VTA_LineaPedido «sin filtros», pero son hijos que se editan en línea dentro del producto y del pedido (el propio verify lo reconoce: «a page of its own is optional»). Las pantallas se ven funcionando en los tests de interfaz (listado y ficha de productos con variantes, ficha de pedido con líneas).

## 2026-10-26 · affects T-20, T-26

**Checked:** El esquema está en el proyecto SSDT y el procedimiento de datos de prueba regenera la demo de forma repetible

**Against what data:** flxCatalog.Data.Database/dbo/Tables (11 ficheros .sql); ejecución de dbo.pSeed_ResetDemoData el 26-oct-2026 con flexygo_execute_procedure

**Verdict:** passes

**Result:** OK: los 11 ficheros de tabla están en el proyecto (Clientes, Colores, Familias, Marcas, Pedidos, Pedidos_Estados, Pedidos_Lineas, Productos, Productos_Variantes, Tallas, Tarifas). El procedimiento respondió «Datos de demostración regenerados correctamente.» y dejó 34 familias, 18 marcas, 140 productos, 624 variantes, 110 clientes, 152 pedidos (37 de este mes) y 675 líneas, con el cliente demo CLI-2101 conservando su GUID fijo.

## 2026-10-26 · affects T-21

**Checked:** La paleta aprobada está aplicada en el skin flexy2022

**Against what data:** Barrido de la base de configuración del 26-oct (flexygo_recall_decisions, «Measured now»): variables del skin flexy2022

**Verdict:** passes

**Result:** OK: NavColor #1c1b1d, txtNavColor #ffffff, HeaderColor #ffffff, bgColor #FAFAFA, OutstandingColor #333234, PrimaryColor #000000 y NotifyColor #4361ee sin tocar, exactamente lo que pedía la tarea. Desde entonces el administrador y el cliente usan las interfaces web2026 y webcliente con skin2026 (decisión de desarrollos posteriores); flexy2022 queda para webdefault y webguest.

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 19:10:48.278

**Against what data:** the demo data, read and not changed

**Verdict:** does NOT pass

**Result:** Fails at step 2 (click): Timeout 30000ms exceeded..

## 2026-10-26 · affects T-15

**Checked:** Baseline of walk T-15-cli-cliente-list.walk.json («T-15: CLI_Cliente_List opens from its menu and paints its modules», page CLI_Cliente_List, modules mod-cli-cliente-list) accepted at 19:13:51 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-15-50-t-15-cli-cliente-list-screen.png`

## 2026-10-26 · affects T-17

**Checked:** Baseline of walk T-17-vta-pedido-list.walk.json («T-17: VTA_Pedido_List opens from its menu and paints its modules», page VTA_Pedido_List, modules mod-vta-pedido-list) accepted at 19:13:51 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-17-51-t-17-vta-pedido-list-screen.png`

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 19:14:29.042

**Against what data:** the demo data, read and not changed

**Verdict:** does NOT pass

**Result:** Fails at step 3 (module): Timeout 20000ms exceeded..

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) replayed by flexygo_run_tests at 19:14:56.599

**Against what data:** the demo data, read and not changed

**Verdict:** does NOT pass

**Result:** Fails at step 8 (shot): the screen fails its checks (1): contrast 2.47:1 on «Nuevo comentario» in mod-cli-cliente-view.

## 2026-10-26 · affects T-16

**Checked:** Baseline of walk T-16-cli-cliente-view.walk.json («T-16: CLI_Cliente_View opens from its menu and paints its modules», page CLI_Cliente_View, modules mod-cli-cliente-back-html, mod-cli-cliente-view, mod-cli-cliente-top-productos-echart, mod-vta-pedido-list-cliente, mod-com-comentario-list-cliente) accepted at 19:15:43 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-52-t-16-cli-cliente-view-screen.png`

## 2026-10-26 · affects T-23, T-25

**Checked:** El Panel de control (HOME) se abre con sus indicadores, gráficos y pedidos recientes, y la interfaz webdefault arranca en él con el árbol de navegación aprobado

**Against what data:** Test Pantalla_SeAbreConSusModulos(HOME) de la batería de interfaz del 26-oct (captura verify-admin-HOME, como admin, datos de demo del reinicio de hoy); flexygo_list_interfaces y el subárbol «Work Area» leídos el mismo día

**Verdict:** passes

**Result:** OK: HOME «Resumen comercial» pinta Ventas hoy 2.122,46 €, Pedidos hoy 2, Pendientes 62, Clientes activos 106, los gráficos de ventas por mes (06/2026 a 10/2026) y por familia, y los pedidos recientes paginados (88). webdefault tiene StartupPageName = HOME y su raíz Work Area cuelga Panel de control → Productos → Familias → Marcas → Clientes → Pedidos → Catálogo (+ Tarifas). Hoy nadie entra por webdefault (perfil 'default', 0 usuarios): el administrador usa web2026, que la sustituyó con el Dashboard y la Barra lateral 2026 (pendientes-cliente-admin).

**Screenshot:** `screenshots/verify/2026-10-26-t-23-t-25-53-catalogo-demo-home.png`

## 2026-10-26 · affects T-05, T-06, T-09, T-10, T-15, T-16, T-17, T-18, T-21, T-22, T-24

**Kind:** tests

**Checked:** Tests de la batería de interfaz que cubren las tareas (sin su número en el nombre)

**Against what data:** flxCatalog.InterfaceTest, pasada del 26-oct

**Verdict:** not verified — waived by D-12

**Result:** Cubiertas por los tests citados en D-12, en verde el 26-oct.

## 2026-10-26 · affects T-09, T-10

**Kind:** help

**Checked:** tour: tour-productos · page: CAT_Producto_List · help: Help_Flujo_MantenerCatalogo

**Against what data:** Recorrido hecho como admin el 26-oct (3 pasos sin saltos); guía con 8 pasos y 6 capturas sobre los datos de demo

**Verdict:** passes

**Result:** OK: el listado de Productos ofrece su recorrido y el botón Ayuda (Más opciones) abre «Mantener el catálogo».

## 2026-10-26 · affects T-15, T-16

**Kind:** help

**Checked:** tour: tour-clientes · page: CLI_Cliente_List · help: Help_Flujo_AtenderCliente

**Against what data:** Recorrido hecho como admin el 26-oct (3 pasos sin saltos); guía con 8 pasos y 5 capturas, ejemplo con Marta Rodríguez Díaz (CLI-2101)

**Verdict:** passes

**Result:** OK: el listado de Clientes ofrece su recorrido y el botón Ayuda abre «Atender a un cliente».

## 2026-10-26 · affects T-17, T-18

**Kind:** help

**Checked:** tour: tour-pedidos · page: VTA_Pedido_List · help: Help_Pantalla_Pedidos

**Against what data:** Recorrido hecho como admin el 26-oct (3 pasos sin saltos); la página de ayuda enlaza la guía del cliente (Hacer un pedido) y la del administrador (Hacer avanzar un pedido)

**Verdict:** passes

**Result:** OK: el listado de Pedidos ofrece su recorrido al administrador (oculto al rol cliente, que comparte la pantalla como «Mis pedidos») y el botón Ayuda abre la página que reparte a cada guía.

## 2026-10-26 · affects T-06

**Kind:** help

**Checked:** tour: tour-tarifas · page: VTA_Tarifa_List · help: Help_Flujo_AtenderCliente

**Against what data:** Recorrido hecho como admin el 26-oct (2 pasos sin saltos)

**Verdict:** passes

**Result:** OK: el listado de Tarifas ofrece su recorrido y el botón Ayuda abre «Atender a un cliente», que explica tarifas y precios por producto.

## 2026-10-26 · affects T-24

**Kind:** help

**Checked:** tour: tour-catalogo-cliente · page: CAT_Producto_Cliente_List · help: Help_Flujo_HacerPedido

**Against what data:** Recorrido hecho el 26-oct (4 pasos sin saltos)

**Verdict:** passes

**Result:** OK: el catálogo del cliente ofrece su recorrido y el botón Ayuda abre «Hacer un pedido».

## 2026-10-26 · affects T-05, T-21, T-22

**Kind:** help

**Checked:** tour: — · page: — · help: — (maestro técnico, paleta y portada de una interfaz sin usuarios)

**Against what data:** none

**Verdict:** not verified — waived by D-13

**Result:** Sin ayuda propia por decisión D-13.
