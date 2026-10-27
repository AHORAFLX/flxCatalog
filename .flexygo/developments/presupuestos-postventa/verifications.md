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

## 2026-10-13 · affects B-3

**Checked:** VTA_Devolucion_List del administrador.

**Against what data:** 14 devoluciones, usuario admin.

**Verdict:** passes

**Result:** OK tras las correcciones de hoy: «Cancelada» lleva distintivo y «En revisión» ya no se parte (la columna Estado se ha ensanchado). Queda visible un resto de test del 03/10 (PED-1097, motivo «ZZ08534785»), pendiente de que el usuario autorice borrarlo.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-8-verify-admin-vta-devolucion-list.png`

## 2026-10-13 · affects B-3

**Checked:** VTA_Devolucion_View (la comparten administrador y cliente).

**Against what data:** Primera devolución de la lista, usuario admin; y la del cliente desde «Mis devoluciones».

**Verdict:** passes

**Result:** OK tras corregir hoy: se ha quitado el pie de auditoría vacío («Creado por — ·») y el campo interno «Activo», que veía el cliente; el enlace de vuelta dice «← Volver a devoluciones», que vale para los dos roles. Estado «Cancelada» con distintivo.

**Screenshot:** `screenshots/verify/2026-10-13-b-3-9-verify-admin-vta-devolucion-view.png`

## 2026-10-13 · affects B-3

**Checked:** Mis devoluciones (VTA_Devolucion_List, rol cliente) y su ficha.

**Against what data:** Usuario Cliente, test Devolucion_SeSolicitaDesdeUnaLineaDelPedido_YElClienteLaCancela; también el rechazo de 999 unidades.

**Verdict:** passes

**Result:** OK: solicitar desde una línea, rechazo al pedir más unidades de las compradas y cancelar solo en estado Solicitada. En su lista aparece el resto de test del 03/10 (ZZ08534785).

**Screenshot:** `screenshots/verify/2026-10-13-b-3-10-verify-cliente-misdevoluciones.png`

## 2026-10-13 · affects B-3

**Checked:** Ficha de devolución vista por el cliente.

**Against what data:** Usuario Cliente, la devolución del 03/10 de su lista.

**Verdict:** passes

**Result:** OK con la plantilla corregida (sin «Activo» ni pie de auditoría vacío).

**Screenshot:** `screenshots/verify/2026-10-13-b-3-11-verify-cliente-misdevoluciones-vta-devolucion-view.png`

## 2026-10-13 · affects B-4

**Checked:** VTA_Incidencia_List del administrador.

**Against what data:** Incidencias de la demo, usuario admin.

**Verdict:** passes

**Result:** OK: «Cancelada» ya con distintivo. Queda visible el resto de test del 03/10 («Prueba ZZ08545467»).

**Screenshot:** `screenshots/verify/2026-10-13-b-4-12-verify-admin-vta-incidencia-list.png`

## 2026-10-13 · affects B-4

**Checked:** VTA_Incidencia_View: ficha, fotografías y comentarios internos.

**Against what data:** Primera incidencia de la lista, usuario admin; la misma página con el rol cliente.

**Verdict:** passes

**Result:** OK tras corregir hoy: «Volver a incidencias», neutro para los dos roles, y sin pie de auditoría vacío. La lista «Comentarios internos» se oculta ahora al rol cliente (seguridad de módulo, también en las fichas de pedido, producto y cliente). El botón «Nuevo comentario» de la plantilla todavía lo ve el cliente: queda como hallazgo abierto.

**Screenshot:** `screenshots/verify/2026-10-13-b-4-13-verify-admin-vta-incidencia-view.png`

## 2026-10-13 · affects B-4

**Checked:** Mis incidencias (rol cliente) y su ficha.

**Against what data:** Usuario Cliente, test Incidencia_SeAbreDesdeUnPedido_YElClienteLaCancela y PeticionYaTramitada_NoSePuedeCancelar.

**Verdict:** passes

**Result:** OK: abrir desde un pedido, cancelar solo si está abierta y el rechazo cuando ya está tramitada.

**Screenshot:** `screenshots/verify/2026-10-13-b-4-14-verify-cliente-misincidencias.png`

## 2026-10-13 · affects B-4

**Checked:** Ficha de incidencia vista por el cliente.

**Against what data:** Usuario Cliente, la incidencia de su lista.

**Verdict:** passes

**Result:** Vista antes de ocultar «Comentarios internos» al cliente: la captura aún muestra ese módulo vacío, y desde la seguridad de módulo de hoy ya no se pinta para el rol cliente.

**Screenshot:** `screenshots/verify/2026-10-13-b-4-15-verify-cliente-misincidencias-vta-incidencia-view.png`

## 2026-10-13 · affects B-2

**Checked:** VTA_MisDocumentos_List (Mis documentos del cliente).

**Against what data:** Usuario Cliente, test MisDocumentos_MuestraSusDocumentosYSuTarifa_SinListarPedidos.

**Verdict:** passes

**Result:** OK: sus documentos y su tarifa, sin la lista de pedidos. Detalle menor: en el estado vacío, el icono queda a la izquierda y el texto centrado.

**Screenshot:** `screenshots/verify/2026-10-13-b-2-16-verify-cliente-misdocumentos.png`

## 2026-10-26 · affects T-08, T-09, T-22, T-23, T-24, T-38

**Checked:** Las tablas de devoluciones e incidencias y sus maestros existen, tienen datos y están en el proyecto de datos

**Against what data:** flxCatalog el 26-oct tras el reinicio: sys.tables, sys.foreign_keys y maestros; flxCatalog.Data.Database/dbo/Tables

**Verdict:** passes

**Result:** OK: Devoluciones (13), Devoluciones_Estados (6: Solicitada, En revisión, Aceptada, Rechazada, Abonada, Cancelada), Incidencias (13), Incidencias_Tipos (6) e Incidencias_Estados (3: Abierta, Cerrada, Cancelada), con sus FKs a Pedidos, Pedidos_Lineas y maestros; las columnas Transportista, NumeroSeguimiento, UrlSeguimiento y FechaEntregaEstimada en Pedidos. Los cinco ficheros de tabla y las columnas nuevas de Pedidos.sql están en el proyecto SSDT.

## 2026-10-26 · affects T-10, T-11, T-12, T-14, T-21

**Checked:** El objeto devolución, con sus propiedades, filtros y relaciones, pinta su ficha

**Against what data:** Ficha de la devolución de Sudadera Light del pedido PED-1141 como admin (captura de la batería del 26-oct); flexygo_verify_object de VTA_Devolucion; relaciones VTA_Pedido→VTA_Devoluciones y VTA_EstadoDevolucion→VTA_Devoluciones

**Verdict:** passes

**Result:** OK: la ficha muestra «Volver a devoluciones», pedido, producto, estado Aceptada, cantidad, fecha de solicitud, motivo y comentario, y el recuadro de Fotografías y Documentos. El objeto pasa verify_object con un filtro configurado; las dos relaciones existen.

**Screenshot:** `screenshots/verify/2026-10-26-t-10-t-11-t-12-t-14-t-21-17-pp-devview.png`

## 2026-10-26 · affects T-25, T-26, T-27, T-28, T-30, T-31, T-37

**Checked:** El objeto incidencia, con sus maestros, propiedades, filtros, vista de detalle y relaciones, pinta su ficha

**Against what data:** Ficha de una incidencia como admin (captura de la batería del 26-oct); flexygo_verify_object de VTA_Incidencia; relaciones VTA_Pedido→VTA_Incidencias, VTA_TipoIncidencia→VTA_Incidencias y VTA_EstadoIncidencia→VTA_Incidencias

**Verdict:** passes

**Result:** OK: la ficha de incidencia se abre desde su listado con su pedido, tipo, estado y descripción; el objeto pasa verify_object con su vista de detalle y un filtro; las tres relaciones existen.

**Screenshot:** `screenshots/verify/2026-10-26-t-25-t-26-t-27-t-28-t-30-t-31-t-37-18-pp-incview.png`

## 2026-10-26 · affects T-20, T-36

**Checked:** Las entradas «Mis devoluciones» y «Mis incidencias» del menú del cliente abren sus listados acotados a la clienta

**Against what data:** Usuario cliente (Marta Rodríguez Díaz) el 26-oct; tests ClienteRecorridoPantallasTests.Lista_TieneFilas_YSuFilaAbreElRegistro (Mis devoluciones, Mis incidencias) y AdminVentasTests.Postventa_ElAdministradorVeTodasYAbreSuFicha en verde

**Verdict:** passes

**Result:** OK: las dos entradas abren VTA_Devolucion_List y VTA_Incidencia_List con solo lo suyo; el administrador ve todas. La captura es de antes de darle hoy a la clienta demo una incidencia resuelta, por eso sale el estado vacío («No hay incidencias todavía»), que también es correcto.

**Screenshot:** `screenshots/verify/2026-10-26-t-20-t-36-19-pp-misinc.png`

## 2026-10-26 · affects T-05, T-06, T-07, T-16, T-17, T-20, T-32, T-33, T-36

**Kind:** tests

**Checked:** Tests de interfaz de la batería que cubren documentos y postventa

**Against what data:** flxCatalog.InterfaceTest, pasada del 26-oct

**Verdict:** not verified — waived by D-7

**Result:** Cubiertas según D-7.

## 2026-10-26 · affects T-05, T-06, T-07

**Kind:** help

**Checked:** tour: tour-mis-documentos · page: VTA_MisDocumentos_List · help: Help_Flujo_MiCuenta

**Against what data:** Recorrido hecho como cliente el 26-oct (2 pasos sin saltos)

**Verdict:** passes

**Result:** OK: «Mis documentos» ofrece su recorrido y el botón Ayuda de «Mi tarifa» abre «Mi cuenta».

## 2026-10-26 · affects T-16, T-17, T-20

**Kind:** help

**Checked:** tour: tour-mis-devoluciones · page: VTA_Devolucion_List · help: Help_Pantalla_Postventa

**Against what data:** Recorrido del cliente (2 pasos) y del administrador (tour-devoluciones, 2 pasos) hechos el 26-oct, cada uno oculto al otro rol

**Verdict:** passes

**Result:** OK: la pantalla de devoluciones ofrece a cada rol su recorrido y el botón Ayuda abre la página que lleva a «Pedir una devolución o abrir una incidencia» o a «Tramitar una devolución».

## 2026-10-26 · affects T-32, T-33, T-36

**Kind:** help

**Checked:** tour: tour-mis-incidencias · page: VTA_Incidencia_List · help: Help_Pantalla_Postventa

**Against what data:** Recorrido del cliente (2 pasos) y del administrador (tour-incidencias, 2 pasos) hechos el 26-oct, cada uno oculto al otro rol

**Verdict:** passes

**Result:** OK: la pantalla de incidencias ofrece a cada rol su recorrido y el botón Ayuda abre la página que lleva a «Pedir una devolución o abrir una incidencia» o a «Resolver una incidencia».
