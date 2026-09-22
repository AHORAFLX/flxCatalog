# Verifications — presupuestos-postventa

## 2026-09-21 · affects T-01, T-02

**Checked:** La ficha admin de pedido en edición muestra las 4 propiedades de seguimiento (Transportista, Número de seguimiento, URL de seguimiento, Fecha estimada de entrega), bien etiquetadas y sin solaparse con el resto del formulario.

**Against what data:** Pedido PED-1017, 148→134 pedidos tras el reseed de datos.

**Verdict:** passes

**Result:** Correcto. Las 4 propiedades aparecen en la fila 3-4 del grid, vacías (nunca rellenadas), sin overlaps.

**Screenshot:** `screenshots/2026-09-21-t-01-t-02-1.png`

## 2026-09-21 · affects T-03, T-04

**Checked:** La ficha de pedido del cliente (VTA_Pedido_Cliente_View) pinta el indicador de progreso de 5 pasos y la sección 'Envío' con las propiedades de seguimiento.

**Against what data:** Pedido PED-1145, estado Enviado.

**Verdict:** passes

**Result:** Correcto: Borrador/Confirmado/En proceso pintan check verde-azulado, Enviado pinta el paso actual (círculo relleno), Entregado pinta pendiente (círculo vacío) — coincide con el estado real del pedido. Sección Envío muestra los 4 campos con '—' al estar vacíos, tal como se documentó como desviación menor en la revisión.

**Screenshot:** `screenshots/2026-09-21-t-03-t-04-2.png`

## 2026-09-21 · affects T-05, T-06, T-07

**Checked:** La página 'Mis documentos' lista los pedidos con botón de descarga de PDF por fila, y debajo el listado de Tarifas.

**Against what data:** 134 pedidos, 5 tarifas.

**Verdict:** passes

**Result:** Correcto: lista de pedidos con Número/Fecha/Estado (badges coloreados por estado)/Total/enlace 'Descargar PDF' por fila, paginada (3 páginas); debajo, módulo Tarifas con las 5 filas (VIP, Mayorista, Profesional, Público, Distribuidor). No se probó el propio botón 'Descargar PDF' (dispara una descarga de fichero, no verificable por captura).

**Screenshot:** `screenshots/2026-09-21-t-05-t-06-t-07-3.png`

## 2026-09-21 · affects T-13, T-15, T-16, T-17, T-18

**Checked:** Lista y ficha de VTA_Devolucion: filas con etiquetas legibles, colores de estado correctos, ficha con todas las propiedades y gestor de fotos/documentos.

**Against what data:** 12 devoluciones sembradas tras corregir el bug de aleatoriedad — productos, motivos y pedidos ya variados de verdad.

**Verdict:** passes

**Result:** Correcto en ambas. Lista: 12 filas, columnas Pedido/Producto/Cantidad/Motivo/Fecha/Estado, badges por color (Solicitada=ámbar, En revisión=rosa, Aceptada=gris, Rechazada=rojo, Abonada=verde). Ficha: Cantidad/Fecha de solicitud/Activo/Motivo/Comentario/Creado-Modificado, gestor de Fotografías y Documentos visible en panel derecho (0/0, correcto sin adjuntos).

**Screenshot:** `screenshots/2026-09-21-t-13-t-15-t-16-t-17-t-18-4.png`

## 2026-09-21 · affects T-19

**Checked:** El botón 'Solicitar devolución' de una línea de pedido del cliente abre el alta de una Devolución con Pedido y Línea de pedido precargados.

**Against what data:** Línea 'Pantalón Classic (x2)' del pedido PED-1145.

**Verdict:** passes

**Result:** Correcto: abre un formulario de ALTA (no de edición) con Pedido='PED-1145' y Línea de pedido='Pantalón Classic (x2)' ya rellenos y bloqueados salvo el combo. Estado por defecto 'Solicitada'. Hallazgo menor: el título del diálogo muestra literalmente '{{Motivo}}' sin resolver (normal en un registro nuevo vacío, no se ha corregido). Cerrado sin guardar, sin dejar rastro.

**Screenshot:** `screenshots/2026-09-21-t-19-5.png`

## 2026-09-21 · affects T-29, T-32, T-33, T-34

**Checked:** Lista de VTA_Incidencia: filas con etiquetas legibles y colores de estado correctos.

**Against what data:** 11 incidencias sembradas.

**Verdict:** passes

**Result:** Correcto: 11 filas, columnas Pedido/Tipo/Descripción/Fecha/Estado, badges Abierta=ámbar / Cerrada=verde, tipos variados (Facturación, Producto defectuoso, Producto incorrecto, Consulta general, Problema de entrega).

**Screenshot:** `screenshots/2026-09-21-t-29-t-32-t-33-t-34-6.png`

## 2026-09-21 · affects T-35

**Checked:** El botón 'Crear incidencia' de la ficha de pedido del cliente abre el alta de una Incidencia con el Pedido precargado.

**Against what data:** Pedido PED-1145.

**Verdict:** passes

**Result:** Correcto: abre un formulario de ALTA con Pedido='PED-1145' ya relleno y bloqueado. Mismo hallazgo menor del título sin resolver ('{{Descripcion}}') y 'Creado por'/'Modificado por' mostrando '0' en vez de vacío en un registro nuevo. Cerrado sin guardar.

**Screenshot:** `screenshots/2026-09-21-t-35-7.png`
