# Verifications — pendientes-cliente-admin

## 2026-10-02 · affects T-08

**Checked:** Estructura del objeto VTA_MesaTrabajo (tablero único del kanban) con la comprobación de objeto; no es una verificación en pantalla.

**Against what data:** Un registro en MesasTrabajo; ninguna pantalla abierta, el Backend está parado y no se tiene la contraseña.

**Verdict:** passes

**Result:** Existe con 2 propiedades y 4 vistas. Fallan ficha de detalle, filtros y páginas de lista y ficha, y es esperado: es un tablero interno de un solo registro, sin lista ni ficha. NO se ha comprobado en pantalla que los tres kanban pinten sus tarjetas con la relación 1=1.

## 2026-10-02 · affects T-17

**Checked:** Comprobación de estructura de los seis maestros con página de lista nueva: CAT_Color, CAT_Talla, VTA_EstadoPedido, VTA_EstadoDevolucion, VTA_EstadoIncidencia y VTA_TipoIncidencia.

**Against what data:** Lectura de la configuración, sin abrir pantallas: el Backend está parado y no se tiene la contraseña.

**Verdict:** does NOT pass

**Result:** Los seis fallan igual: tienen lista (1 vista) pero ninguna vista de detalle con descriptores de campo, ni filtros, ni página de ficha. Una fila de esas listas puede no abrir su registro. Pasan existencia, propiedades y combos. Además falta el nodo de Tallas. La tarea vuelve a pendiente.

## 2026-10-02 · affects T-17

**Checked:** Estructura de los seis maestros tras completar ficha, filtros y página de ficha. Comprobación de configuración, no de pantalla.

**Against what data:** CAT_Talla y VTA_TipoIncidencia volvieron a comprobarse yo mismo con flexygo_verify_object. Los otros cuatro (CAT_Color, VTA_EstadoPedido, VTA_EstadoDevolucion, VTA_EstadoIncidencia) constan solo por el informe del agente constructor. Ninguna pantalla abierta.

**Verdict:** passes

**Result:** Los dos comprobados pasan 8 de 8 con el aviso opcional de traducción. Siguen sin verse en pantalla las listas, las fichas y el panel lateral completo. Sigue faltando el nodo «Tallas».

## 2026-10-13 · affects T-13, T-14, T-15

**Checked:** VTA_Dashboard_Page: es la página de entrada del administrador. Muestra los 5 indicadores (ventas del año, ventas del mes, pedidos pendientes, incidencias abiertas, devoluciones solicitadas) y los 4 rankings (más vendidos, más devueltos, clientes que más compran, clientes con más incidencias o devoluciones).

**Against what data:** Datos de demo de flxCatalog (pedidos de junio a septiembre de 2026), usuario admin, plataforma 10.0.0-beta.137. Test Login_AbreElDashboardConSusIndicadores en verde y captura del recorrido AdminRecorridoPantallasTests.

**Verdict:** passes

**Result:** OK tras dos correcciones de esta sesión. En beta.137 la etiqueta HTML del indicador salía como texto: pasada a texto plano. Las barras no empezaban en cero: corregido con beginAtZero, y paso 1 en los recuentos. Los rankings salen ordenados de mayor a menor. Ventas del mes = 0 € es real: no hay pedidos válidos en octubre de 2026 en la demo.

**Screenshot:** `screenshots/verify/2026-10-13-t-13-t-14-t-15-1-verify-admin-vta-dashboard-page.png`

## 2026-10-13 · affects T-08, T-09, T-10, T-11

**Checked:** VTA_MesaTrabajo_Page: las tres pestañas (incidencias, pedidos, devoluciones) muestran sus kanban con las tarjetas en su columna.

**Against what data:** Usuario admin, plataforma 10.0.0-beta.137, tablero MesasTrabajo IdMesa 7F3A2B10-5C4D-4E8A-9B61-0D2E4F6A8C01. Tests Pantalla_SeAbreConSusModulos(VTA_MesaTrabajo_Page) y MenuAdministrador_AbreSuPantalla(Mesa de trabajo).

**Verdict:** does NOT pass

**Result:** NO funciona. POST /api/Kanban/GetKanban responde 500 y la página muestra «VTA_MESATRABAJO Error Reading related Objects»: KeyNotFoundException en _buildRelatedObjectsWhere. En beta.137 los dos lados de la relación tienen que ser campos reales, y la relación constante '1=1' entre el tablero y las tarjetas ya no vale. Hace falta un campo compartido; por ejemplo, una columna Activo en MesasTrabajo y en Pedidos, con relación Activo=Activo. Esa DDL en tablas de negocio queda pendiente de la decisión del usuario.

**Screenshot:** `screenshots/verify/2026-10-13-t-08-t-09-t-10-t-11-2-verify-admin-vta-mesatrabajo-page.png`

## 2026-10-13 · affects T-17

**Checked:** CAT_Color_List y CAT_Color_View desde Maestros > Colores: la lista tiene filas y la fila abre la ficha.

**Against what data:** 14 colores de la demo, usuario admin, test Lista_TieneFilas_YSuFilaAbreLaFicha(CAT_Color_List).

**Verdict:** passes

**Result:** OK: 14 filas con muestra de color y código hex; la fila abre la ficha. Corregido en esta sesión: la ficha enseñaba el GUID como «Código» (quitado) y el enlace «Volver» pintaba «?» en lugar de «←». La lista no se ordena por la columna Orden (queda como hallazgo de calidad).

**Screenshot:** `screenshots/verify/2026-10-13-t-17-3-verify-admin-cat-color-list.png`

## 2026-10-13 · affects T-17

**Checked:** CAT_Color_View: la ficha de un color.

**Against what data:** Primer color de la lista, usuario admin.

**Verdict:** passes

**Result:** OK tras las correcciones: nombre, código hex y orden; sin GUID; enlace «← Volver a colores».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-4-verify-admin-cat-color-view.png`

## 2026-10-13 · affects T-17

**Checked:** CAT_Talla_List desde Maestros > Tallas (nodo añadido en esta sesión, faltaba).

**Against what data:** 14 tallas de la demo, usuario admin, tests MenuAdministrador_AbreSuPantalla(Tallas) y Lista_TieneFilas_YSuFilaAbreLaFicha(CAT_Talla_List).

**Verdict:** passes

**Result:** OK: el nodo Tallas existe bajo Maestros y abre la lista con 14 filas.

**Screenshot:** `screenshots/verify/2026-10-13-t-17-5-verify-admin-cat-talla-list.png`

## 2026-10-13 · affects T-17

**Checked:** CAT_Talla_View: ficha de una talla.

**Against what data:** Primera talla de la lista, usuario admin.

**Verdict:** passes

**Result:** OK tras corregir el GUID visible como «Código» y la flecha de «Volver».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-6-verify-admin-cat-talla-view.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoPedido_List y su fila.

**Against what data:** 6 estados de pedido, usuario admin.

**Verdict:** passes

**Result:** OK: 6 filas, la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-t-17-7-verify-admin-vta-estadopedido-list.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoPedido_View.

**Against what data:** Un estado de pedido, usuario admin.

**Verdict:** passes

**Result:** OK tras quitar el GUID como «Código» y corregir la flecha de «Volver».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-8-verify-admin-vta-estadopedido-view.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoDevolucion_List.

**Against what data:** 6 estados de devolución, usuario admin.

**Verdict:** passes

**Result:** OK: 6 filas, la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-t-17-9-verify-admin-vta-estadodevolucion-list.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoDevolucion_View.

**Against what data:** Un estado de devolución, usuario admin.

**Verdict:** passes

**Result:** OK tras quitar el GUID como «Código» y corregir la flecha de «Volver».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-10-verify-admin-vta-estadodevolucion-view.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoIncidencia_List.

**Against what data:** 3 estados de incidencia, usuario admin.

**Verdict:** passes

**Result:** OK: 3 filas, la fila abre la ficha. El orden no sigue la columna Orden (hallazgo de calidad).

**Screenshot:** `screenshots/verify/2026-10-13-t-17-11-verify-admin-vta-estadoincidencia-list.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_EstadoIncidencia_View.

**Against what data:** Un estado de incidencia, usuario admin.

**Verdict:** passes

**Result:** OK tras quitar el GUID como «Código».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-12-verify-admin-vta-estadoincidencia-view.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_TipoIncidencia_List.

**Against what data:** 6 tipos de incidencia, usuario admin.

**Verdict:** passes

**Result:** OK: 6 filas, la fila abre la ficha.

**Screenshot:** `screenshots/verify/2026-10-13-t-17-13-verify-admin-vta-tipoincidencia-list.png`

## 2026-10-13 · affects T-17

**Checked:** VTA_TipoIncidencia_View.

**Against what data:** Un tipo de incidencia, usuario admin.

**Verdict:** passes

**Result:** OK tras quitar el GUID como «Código» y corregir la flecha de «Volver».

**Screenshot:** `screenshots/verify/2026-10-13-t-17-14-verify-admin-vta-tipoincidencia-view.png`

## 2026-10-13 · affects T-21, T-22

**Checked:** El icono «Mi carrito» de la barra superior y del menú del cliente lleva un contador con las unidades del carrito, solo lo ve el rol cliente y lleva al carrito.

**Against what data:** Usuario Cliente (CLI-2101). El test Carrito_AñadirConVariante_CambiarCantidad_YQuitar añade 2 unidades de un producto con variante y espera el número en el nodo visible «Mi carrito» (refresco cada 15 s). El test MenuAdministrador_NoMuestraElMenuDelCliente comprueba que el administrador no ve «Mi carrito». Captura de la portada del cliente con el carrito vacío.

**Verdict:** passes

**Result:** OK. El contador, que faltaba en la entrega parcial del 02/10, se ha añadido hoy con el badge SQL de los nodos (SUM(Cantidad) del pedido en Borrador del cliente, sin número si es 0). Con el carrito vacío no se pinta ningún número, que es lo esperado. El administrador no ve el nodo.

**Screenshot:** `screenshots/verify/2026-10-13-t-21-t-22-15-verify-cliente-homecliente.png`

## 2026-10-13 · affects T-23, T-24, T-25, T-26, T-27, T-28

**Checked:** Los circuitos de test de interfaz (pedido, devolución, incidencia y alta/modificación/borrado de artículo, cliente y tarifa) se ejecutan contra la aplicación en marcha.

**Against what data:** dotnet test flxCatalog.InterfaceTest contra http://localhost:7111 con Backend en Development, plataforma 10.0.0-beta.137, usuarios admin y Cliente de appsettings.local.json.

**Verdict:** passes

**Result:** Batería completa: 86 de 92 en verde antes de las correcciones finales. Los fallos eran tests desfasados (HOME en lugar del dashboard, «Email» en lugar de «Correo», el primer pedido sin líneas, el aviso de privacidad nuevo de beta.137, el nodo «Mi carrito» duplicado) y la mesa de trabajo (defecto real, T-08..T-11 reabiertas). Tests corregidos y añadidos: recorrido de pantallas de administrador y cliente con captura, y comprobación del contador del carrito. Todos los circuitos T-23..T-28 pasan.

## 2026-10-13 · affects T-08, T-11

**Checked:** VTA_MesaTrabajo_Page, pestaña Incidencias: el kanban pinta cada incidencia en la columna de su estado.

**Against what data:** Incidencias activas: Abierta 6, Cerrada 4, Cancelada 3 (consulta a la base de datos). Usuario admin, test MesaDeTrabajo_CadaPestañaPintaSusTarjetas(Incidencias).

**Verdict:** passes

**Result:** OK: 6, 4 y 3 tarjetas, que coinciden con la base de datos; sin errores 500.

**Screenshot:** `screenshots/verify/2026-10-13-t-08-t-11-16-verify-admin-vta-mesatrabajo-page.png`

## 2026-10-13 · affects T-09

**Checked:** VTA_MesaTrabajo_Page, pestaña Pedidos: el kanban pinta cada pedido en la columna de su estado.

**Against what data:** Pedidos activos por estado (Borrador 15, Confirmado 30, En proceso 30, Enviado 30, Entregado…), usuario admin, test MesaDeTrabajo_CadaPestañaPintaSusTarjetas(Pedidos).

**Verdict:** passes

**Result:** OK: los recuentos de cada columna coinciden. La captura es anterior al ajuste de la tarjeta; la tercera línea, con el importe, salía cortada y ya va junto al número.

**Screenshot:** `screenshots/verify/2026-10-13-t-09-17-verify-admin-vta-mesatrabajo-page-pedidos.png`

## 2026-10-13 · affects T-10

**Checked:** VTA_MesaTrabajo_Page, pestaña Devoluciones: tarjetas en su columna, y arrastrar una tarjeta guarda su nuevo estado.

**Against what data:** Devoluciones activas: Solicitada 6, En revisión 4, Aceptada 1, Rechazada 0, Abonada 1, Cancelada 2. Test ArrastrarUnaDevolucion_GuardaSuNuevoEstado (Solicitada → En revisión → recarga → vuelta a Solicitada); recuentos idénticos en la base de datos antes y después.

**Verdict:** passes

**Result:** OK: las columnas coinciden con la base de datos; el arrastre se guarda con el mecanismo de la propia plataforma, sobrevive a la recarga y se revierte limpio.

**Screenshot:** `screenshots/verify/2026-10-13-t-10-18-verify-admin-vta-mesatrabajo-page-devoluciones.png`

## 2026-10-13 · affects T-09

**Checked:** Tarjeta del kanban de pedidos tras ajustar su plantilla.

**Against what data:** Usuario admin, pestaña Pedidos de la mesa de trabajo (test MesaDeTrabajo_CadaPestañaPintaSusTarjetas).

**Verdict:** passes

**Result:** OK: número e importe en la primera línea y cliente en la segunda; ya no se corta ninguna línea.

**Screenshot:** `screenshots/verify/2026-10-13-t-09-19-verify-admin-vta-mesatrabajo-page-pedidos.png`

## 2026-10-26 · affects T-16

**Checked:** Walk T-16-vta-mesatrabajo-page.walk.json («T-16: VTA_MesaTrabajo_Page opens from its menu and paints its modules», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs, mod-vta-mesa-incidencias-kanban, mod-vta-mesa-pedidos-kanban, mod-vta-mesa-devoluciones-kanban) replayed by flexygo_run_tests at 15:50:51.854

**Against what data:** the demo data, read and not changed

**Verdict:** does NOT pass

**Result:** Fails at step 3 (module): Timeout 20000ms exceeded..

## 2026-10-26 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 15:52:19 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (first baseline), pedidos (first baseline), devoluciones (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-20-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-26 · affects T-19

**Checked:** Baseline of walk T-19-vta-dashboard-page.walk.json («T-19: el administrador abre el Dashboard desde su menú lateral, que ya no tiene Solicitudes de contacto», page VTA_Dashboard_Page, modules mod-dash-top-clientes-echart, mod-dash-clientes-problemas-echart, mod-dash-top-vendidos-echart, mod-dash-top-devueltos-echart, mod-dash-kpis-easyinfo) accepted at 15:52:20 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-19-21-t-19-vta-dashboard-page-screen.png`

## 2026-10-26 · affects T-01

**Checked:** El inventario de Contacto y Demostración era completo: ningún otro objeto ni código de la base de datos dependía de las tablas maestras de estados y tipos de solicitud

**Against what data:** Consultas a la base de datos de flxCatalog: sys.tables LIKE 'SolicitudesContacto%' → 0 filas; sys.sql_modules cuya definición menciona SolicitudesContacto → 0 (pSeed_ResetDemoData incluido); catálogo de objetos del origen 1 → 20 objetos, ninguno sobre esas tablas; auditoría del origen → «Referencias que ya no apuntan a nada: ninguna»

**Verdict:** passes

**Result:** OK: tras borrar todo lo inventariado no queda ninguna referencia rota ni ningún objeto o procedimiento que las usara, así que el inventario no se dejó nada.

## 2026-10-26 · affects T-02

**Checked:** Los nodos «Contacto» y «Solicita una demostración» (Menú Cliente) y «Solicitudes de contacto» (Work Area y Barra lateral 2026) ya no existen ni se ven en ningún menú

**Against what data:** Árbol de navegación buscando «contacto» y «demostraci» → ningún nodo. Recorrido T-02 como usuario cliente: inicio del cliente, comprobación de que no aparecen «Solicita una demostración» ni «Solicitudes de contacto»; recorrido T-19 como admin, sin «Solicitudes de contacto» en el menú lateral

**Verdict:** passes

**Result:** OK: menú del cliente con Catálogo, Mi carrito, Mis pedidos, Mi ficha, Mis favoritos, Mis documentos, Mis devoluciones, Mis incidencias y Mis notificaciones; menú del administrador sin solicitudes. Ningún nodo huérfano.

**Screenshot:** `screenshots/verify/2026-10-26-t-02-22-screen.png`

## 2026-10-26 · affects T-04

**Checked:** Los objetos COM_SolicitudDemo, COM_SolicitudContacto, COM_EstadoSolicitud y COM_TipoSolicitud ya no existen

**Against what data:** Catálogo de objetos del origen 1: 40 objetos sobre 20 tablas; de COM_ solo queda COM_Comentario / COM_Comentarios

**Verdict:** passes

**Result:** OK: los cuatro objetos y sus colecciones han desaparecido; la auditoría no encuentra objetos gemelos ni referencias rotas.

## 2026-10-26 · affects T-05

**Checked:** Las tablas SolicitudesContacto, SolicitudesContacto_Estados y SolicitudesContacto_Tipos no existen y pSeed_ResetDemoData ya no las toca

**Against what data:** SELECT name FROM sys.tables WHERE name LIKE 'SolicitudesContacto%' → 0 filas; definición de pSeed_ResetDemoData con LIKE '%SolicitudesContacto%' → 0; ningún módulo SQL de la base de datos las menciona

**Verdict:** passes

**Result:** OK: las tres tablas están borradas y el procedimiento de datos de demo no las referencia.

## 2026-10-26 · affects T-06

**Checked:** La auditoría del origen no encuentra nada huérfano por el borrado de Contacto y Demostración

**Against what data:** Auditoría del origen 1 (26-oct-2026): objetos gemelos ✓, objetos sin propiedades ✓, filtros que no encuentran nada ✓, referencias rotas ✓; la caché del Backend (arrancado a las 13:25, después del último cambio) conoce los objetos

**Verdict:** passes

**Result:** OK: nada huérfano del borrado. La única página inalcanzable que señala la auditoría es «Home Cliente», que es la página de inicio del perfil Cliente y sí se abre al entrar (vista en el recorrido T-02).

## 2026-10-26 · affects T-07

**Checked:** Las columnas de los tres kanban corresponden a los estados reales de incidencias, pedidos y devoluciones

**Against what data:** Tablas Pedidos_Estados (Borrador, Confirmado, En proceso, Enviado, Entregado, Cancelado) y Devoluciones_Estados (Solicitada, En revisión, Aceptada, Rechazada, Abonada, Cancelada) frente a las capturas de las tres pestañas de la Mesa de trabajo con los datos de demo

**Verdict:** passes

**Result:** OK: incidencias en Abierta 6 / Cerrada 4 / Cancelada 2; pedidos en Borrador 15, Confirmado 29, En proceso 30, Enviado 30…; devoluciones en Solicitada 6, En revisión 4, Aceptada 1, Rechazada 0…, en el orden de cada tabla de estados.

**Screenshot:** `screenshots/verify/2026-10-26-t-07-23-pedidos.png`

## 2026-10-26 · affects T-12

**Checked:** Las consultas definidas para los indicadores del dashboard cuadran con los datos

**Against what data:** Dashboard con datos de demo frente a la base de datos: pedidos de octubre de 2026 → 1, el carrito CARR-20261013180858 en Borrador con 0 €; incidencias abiertas y devoluciones solicitadas frente a las columnas del kanban

**Verdict:** passes

**Result:** OK: Ventas del mes 0 € (en octubre solo hay un carrito sin importe: los pedidos de demo acaban el 28-sep porque los datos se generaron el 13-oct); Incidencias abiertas 6 = columna Abierta 6; Devoluciones solicitadas 6 = columna Solicitada 6.

**Screenshot:** `screenshots/verify/2026-10-26-t-12-24-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-19-21-t-19-vta-dashboard-page-screen.png`

## 2026-10-26 · affects T-18

**Checked:** Ninguna colección sale sola en el menú: el administrador llega a Productos desde el árbol propio de la barra lateral

**Against what data:** Auditoría: interfaz web2026, panel lateral «Barra lateral 2026» con 17 nodos propios y «el bloque automático lista 0 colecciones del origen 1»; recorrido T-18 como admin: menú → Productos → listado de productos

**Verdict:** passes

**Result:** OK: el menú lateral muestra solo el árbol propio (Dashboard, Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas, Maestros) y Productos abre su listado. El listado no declara orden; eso se registra aparte como defecto anterior a este desarrollo.

**Screenshot:** `screenshots/verify/2026-10-26-t-18-25-screen.png`

## 2026-10-26 · affects T-20

**Checked:** Lo que se averiguó sobre la barra superior se cumple en pantalla: el cliente ve el carrito arriba y el administrador no

**Against what data:** Recorrido T-02 como cliente (barra superior con notificaciones y «Mi carrito»; carrito CARR-20261013180858 con 0 líneas) y recorrido T-19 como admin (barra superior con buscador, notificaciones y ajustes, sin carrito)

**Verdict:** passes

**Result:** OK: el nodo del carrito sale solo para el rol cliente, junto a la campana de notificaciones; sin contador porque el carrito está vacío.

**Screenshot:** `screenshots/verify/2026-10-26-t-20-26-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-02-22-screen.png`

## 2026-10-26 · affects T-18

**Checked:** Los listados salen en un orden que el usuario entiende

**Against what data:** Listado de productos (vista CAT_ProductoDefaultList) e inicio del cliente (vista VTA_PedidoHomeList) con datos de demo; ninguna de las dos vistas declara orden

**Verdict:** does NOT pass — outside the block: Ambos listados se construyeron en desarrollos anteriores (catálogo y portal de clientes); este desarrollo no los tocó

**Result:** Falla: los productos salen como los guarda la tabla (REF-2115, REF-2021, REF-2079…), ni por referencia ni por nombre; los pedidos del inicio del cliente salen del más antiguo al más reciente (PED-1097 de hace 3 meses antes que el carrito de hace 13 días).

**Screenshot:** `screenshots/verify/2026-10-26-t-18-27-screen.png` — same bytes as `screenshots/verify/2026-10-26-t-18-25-screen.png`

## 2026-10-26 · affects T-03

**Checked:** Consulta de las tablas de configuración (Pages, Modules, Processes, Objects_Templates): no queda ningún registro de Contacto ni Demostración

**Against what data:** Lectura de las 41 filas de Pages del origen 1 y de todos los procesos registrados: ninguno con COM_Solicitud, Contacto o Demo en el nombre; auditoría del origen: «Referencias que ya no apuntan a nada: ninguna»; los 11 módulos sin colocar son de otros objetos

**Verdict:** passes

**Result:** OK: las tablas de configuración ya no tienen nada de Contacto ni Demostración.

## 2026-10-26 · affects T-11

**Kind:** help

**Checked:** tour: tour-mesa-trabajo · page: VTA_MesaTrabajo_Page · help: Help_Flujo_AvanzarPedido

**Against what data:** Recorrido de 4 pasos hecho como admin hasta el final sin pasos saltados; botón Ayuda en la barra de los tres kanban (en Más opciones), probado en Devoluciones; guías de pedidos, incidencias y devoluciones con sus capturas cargadas

**Verdict:** passes

**Result:** OK: el tour se ofrece en la página y llega al final; el botón abre la guía del tablero activo con sus imágenes.

## 2026-10-26 · affects T-15

**Kind:** help

**Checked:** tour: tour-dashboard · page: VTA_Dashboard_Page · help: Help_Flujo_EmpezarElDia

**Against what data:** Recorrido de 6 pasos y bienvenida de 7 pasos recorridos como admin; guía abierta desde el menú Ayuda; sin botón porque ningún módulo del Dashboard tiene barra

**Verdict:** not verified — waived by D-14

**Result:** Exenta del botón por decisión del usuario D-14; tour y guía en su sitio.

## 2026-10-26 · affects T-17

**Kind:** help

**Checked:** tour: tour-welcome-admin · page: VTA_Dashboard_Page · help: Help_Indice_Administrador

**Against what data:** El menú lateral no tiene pantalla propia: lo explica el paso «Tu menú» de la bienvenida del administrador, y la entrada Ayuda (entre Tarifas y Maestros) abre el índice

**Verdict:** not verified — waived by D-14

**Result:** Cubierto por la bienvenida y la entrada Ayuda (decisión D-14).

## 2026-10-26 · affects T-21

**Kind:** help

**Checked:** tour: tour-welcome-cliente · page: d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86 · help: Help_Flujo_HacerPedido

**Against what data:** El carrito de la barra superior no tiene pantalla propia: lo explica el paso «Avisos y carrito» de la bienvenida del cliente (7 pasos, recorrida como cliente) y el paso 3 de «Hacer un pedido»

**Verdict:** not verified — waived by D-14

**Result:** Cubierto por la bienvenida del cliente y la guía de pedido (decisión D-14).

## 2026-10-26 · affects T-01, T-03, T-06, T-11, T-15

**Kind:** tests

**Checked:** dotnet test flxCatalog.InterfaceTest --filter "FullyQualifiedName~PendientesClienteAdminTests" at 18:19:52: PendientesClienteAdminTests.T01_ContactoYDemostracion_NoQuedaNadaEnElMenuDelAdministrador; PendientesClienteAdminTests.T03_ContactoYDemostracion_NoQuedaNadaEnNingunMenu; PendientesClienteAdminTests.T06_TrasElBorrado_LasPantallasDelAdministradorSiguenAbriendo; PendientesClienteAdminTests.T11_MesaDeTrabajo_SusTresPestañasPintanTarjetas; PendientesClienteAdminTests.T15_Dashboard_EsElInicioYMuestraIndicadoresYGraficos

**Against what data:** run by the server: the databases this workspace points at; each test creates and deletes its own TEST rows

**Verdict:** passes

**Result:** Total: 5, passed: 5, failed: 0. All the tests of these tasks passed.

## 2026-10-26 · affects T-18

**Checked:** Walk T-18-cat-producto-list.walk.json («T-18: CAT_Producto_List opens from its menu and paints its modules», page CAT_Producto_List, modules mod-cat-producto-list) replayed by flexygo_run_tests at 18:22:53.140

**Against what data:** the demo data, read and not changed

**Verdict:** does NOT pass

**Result:** Fails at step 2 (module): Timeout 20000ms exceeded..

## 2026-10-26 · affects T-18

**Checked:** Baseline of walk T-18-cat-producto-list.walk.json («T-18: CAT_Producto_List opens from its menu and paints its modules», page CAT_Producto_List, modules mod-cat-producto-list) accepted at 18:24:21 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-18-28-t-18-cat-producto-list-screen.png`

## 2026-10-26 · affects T-02

**Checked:** Baseline of walk T-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86.walk.json («T-02: el cliente entra en su inicio y su menú ya no ofrece Contacto ni Demostración», page d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86, modules mod-home-cliente-saludo-html, mod-vta-pedido-home-list) accepted at 18:24:22 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (first baseline).

**Screenshot:** `screenshots/verify/2026-10-26-t-02-29-t-02-d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86-screen.png`

## 2026-10-26 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 18:24:22 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (changed 7.11 % of the pixels, 4 line(s) of text), pedidos (changed 11.75 % of the pixels, 4 line(s) of text), devoluciones (changed 6.10 % of the pixels, 4 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-30-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-26 · affects T-19

**Checked:** Baseline of walk T-19-vta-dashboard-page.walk.json («T-19: el administrador abre el Dashboard desde su menú lateral, que ya no tiene Solicitudes de contacto», page VTA_Dashboard_Page, modules mod-dash-top-clientes-echart, mod-dash-clientes-problemas-echart, mod-dash-top-vendidos-echart, mod-dash-top-devueltos-echart, mod-dash-kpis-easyinfo) accepted at 18:24:27 after looking at its capture(s) of the screen: screen

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — screen (changed 22.65 % of the pixels, 8 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-19-31-t-19-vta-dashboard-page-screen.png`

## 2026-10-26 · affects T-18

**Checked:** Los listados salen en un orden que el usuario entiende (defecto anotado antes fuera del bloque, ya arreglado)

**Against what data:** Listado de productos como admin (140 productos de demo) e inicio del usuario cliente (sus 2 pedidos), recorridos T-18-cat-producto-list y T-02 reproducidos el 26-oct

**Verdict:** passes

**Result:** OK: los productos salen por nombre (Abrigo Niño Deluxe, Abrigo Niño Prime, Abrigo Niño Trail, Bolso Basic…) y los pedidos del inicio del cliente del más reciente al más antiguo (carrito de hace 13 días antes que PED-1097 de hace 3 meses). Arreglado con el orden por defecto de las vistas CAT_ProductoDefaultList (Nombre Asc) y VTA_PedidoHomeList (Fecha Desc, sin el TOP 5). Capturas aceptadas como línea base de los dos recorridos.

## 2026-10-26 · affects T-01, T-03, T-06, T-11, T-15

**Kind:** tests

**Checked:** dotnet test flxCatalog.InterfaceTest --filter "FullyQualifiedName~PendientesClienteAdminTests|FullyQualifiedName~AdminMesaTrabajoTests" at 18:30:51: PendientesClienteAdminTests.T01_ContactoYDemostracion_NoQuedaNadaEnElMenuDelAdministrador; PendientesClienteAdminTests.T03_ContactoYDemostracion_NoQuedaNadaEnNingunMenu; PendientesClienteAdminTests.T06_TrasElBorrado_LasPantallasDelAdministradorSiguenAbriendo; PendientesClienteAdminTests.T11_MesaDeTrabajo_SusTresPestañasPintanTarjetas; PendientesClienteAdminTests.T15_Dashboard_EsElInicioYMuestraIndicadoresYGraficos

**Against what data:** run by the server: the databases this workspace points at; each test creates and deletes its own TEST rows

**Verdict:** passes

**Result:** Total: 6, passed: 6, failed: 0. All the tests of these tasks passed.

## 2026-10-26 · affects T-16

**Checked:** Baseline of walk T-16-vta-mesatrabajo-page.walk.json («T-16: el administrador abre la Mesa de trabajo desde su menú lateral y recorre sus tres kanban», page VTA_MesaTrabajo_Page, modules mod-vta-mesa-trabajo-tabs) accepted at 18:31:19 after looking at its capture(s) of the screen: incidencias, pedidos, devoluciones

**Against what data:** the demo data, read and not changed

**Verdict:** passes

**Result:** OK: every step passed with no JavaScript error; the captures were looked at and accepted — incidencias (changed 3.39 % of the pixels, 34 line(s) of text), pedidos (changed 3.60 % of the pixels, 626 line(s) of text), devoluciones (changed 1.07 % of the pixels, 24 line(s) of text).

**Screenshot:** `screenshots/verify/2026-10-26-t-16-32-t-16-vta-mesatrabajo-page-incidencias.png`

## 2026-10-26 · affects T-01, T-03, T-06

**Kind:** help

**Checked:** tour: — · page: — · help: — (tareas de borrado, sin pantalla)

**Against what data:** none

**Verdict:** not verified — waived by D-18

**Result:** Sin ayuda por decisión D-18: las tareas quitan Contacto y Demostración y no construyen pantalla.
