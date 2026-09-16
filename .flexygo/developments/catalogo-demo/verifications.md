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
