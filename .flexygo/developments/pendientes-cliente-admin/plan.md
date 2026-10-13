# Plan — pendientes-cliente-admin

**Request:** Sigue con los puntos que faltan de pending.md, tanto los de cliente como los de administrador.

**State:** 6 block(s), 28 task(s)

## Assumptions

- [S-1] Las tablas maestras de estados y tipos de solicitud solo las usan Contacto y Demostración, así que se borran con ellos. — affects T-04, T-05
- [S-2] El administrador entra por la interfaz web2026 (panel lateral «Barra lateral 2026»), no por webdefault. — affects B-4
- [S-3] El carrito es un pedido del cliente en un estado concreto, de modo que el contador se puede calcular con una consulta sobre Pedidos y Pedidos_Lineas. — affects T-21, T-22
- [S-4] La raíz de la barra superior permite visibilidad por rol mediante una consulta, como ya hace el nodo «Develop Mode». — affects T-21
- [S-5] El dashboard sustituye a HOME como página de inicio del administrador en web2026. — affects T-15

## Open points

None.

## Blocks

### B-1 · Borrar Contacto y Demostración

- [x] T-01 · Inventariar todo lo que cuelga de Contacto y Demostración (solo lectura): configuración completa de los objetos COM_SolicitudContacto, COM_SolicitudDemo, COM_EstadoSolicitud y COM_TipoSolicitud; sus páginas, módulos, botones, procesos, relaciones, vistas y seguridad; nodos de menú; y referencias en procesos C#, plugins y en el procedimiento pSeed_ResetDemoData. Comprobar también que ningún otro objeto usa las tablas maestras de estados y tipos.
- [x] T-02 · Borrar los nodos de menú: «Contacto» y «Solicita una demostración» (Menú Cliente) y «Solicitudes de contacto» (Work Area y Barra lateral 2026).
- [x] T-03 · Borrar las páginas, módulos, plantillas, botones de barra y procesos asociados a Contacto y Demostración.
- [x] T-04 · Borrar los objetos Flexygo COM_SolicitudDemo, COM_SolicitudContacto, COM_EstadoSolicitud y COM_TipoSolicitud con sus propiedades, relaciones y vistas.
- [x] T-05 · Eliminar las tablas SolicitudesContacto, SolicitudesContacto_Estados y SolicitudesContacto_Tipos de la base de datos y quitar sus datos del procedimiento pSeed_ResetDemoData (consultas parametrizadas). Cada escritura directa por SQL se registra como carencia del servidor.
- [x] T-06 · Recargar la caché y auditar el origen para confirmar que no queda ningún objeto, página ni nodo huérfano.

### B-2 · Mesa de trabajo del administrador (3 kanban en separador)

- [x] T-07 · Leer la configuración de VTA_Incidencia, VTA_Pedido y VTA_Devolucion (estados, campos, claves) y la guía de módulos kanban para decidir columnas y tarjetas.
- [x] T-08 [P] · Crear el módulo kanban de incidencias, con una columna por estado.
- [x] T-09 [P] · Crear el módulo kanban de pedidos, con una columna por estado.
- [x] T-10 [P] · Crear el módulo kanban de devoluciones, con una columna por estado.
- [x] T-11 · Crear el módulo de separadores con los tres kanban como pestañas, la página «Mesa de trabajo» que lo aloja y restringir su acceso al rol administrador. Se llega a ella desde un nodo del menú lateral (tarea T-17).

### B-3 · Dashboard del administrador

- [x] T-12 · Leer la referencia de dashboards y definir las consultas de cada indicador y gráfico sobre las tablas reales (Pedidos, Pedidos_Lineas, Devoluciones, Incidencias, Clientes, Productos).
- [x] T-13 [P] · Crear los indicadores (KPI): ventas del año, ventas del mes, pedidos pendientes, incidencias abiertas y devoluciones solicitadas.
- [x] T-14 [P] · Crear los gráficos: artículos más vendidos, artículos más devueltos, clientes que más compran y clientes con más incidencias o devoluciones. — ⚠️ failed 2026-10-02 · see execution.md
- [x] T-15 · Componer la página «Dashboard» con su disposición, limitarla al rol administrador y fijarla como página de inicio de la interfaz web2026 (flexygo_update_interface con startupPageName) en lugar de HOME. Se llega a ella desde el inicio de la aplicación y desde un nodo del menú lateral (tarea T-17).

### B-4 · Menú lateral de administración con accesos directos

- [x] T-16 · Listar qué colecciones tienen marcado «mostrar en menú» y qué nodos tiene hoy la raíz «Barra lateral 2026».
- [x] T-17 · Construir en «Barra lateral 2026» el árbol propio de accesos directos: Dashboard, Mesa de trabajo, Pedidos, Clientes, Incidencias, Devoluciones, Productos, Tarifas y los Maestros agrupados; retirar los nodos duplicados que ya no hagan falta. El menú lateral de la interfaz web2026 apunta a esta raíz, así que es el menú del administrador.
- [x] T-18 · Desmarcar «mostrar en menú» en todas las colecciones de la aplicación, para que el árbol propio sea el único menú.
- [x] T-19 · Recargar la caché y comprobar con la auditoría que cada página sigue teniendo al menos una entrada y que el panel lateral no queda vacío.

### B-5 · Icono del carrito en la barra superior del cliente

- [x] T-20 · Inspeccionar cómo funciona el badge del nodo «Notices» de la barra superior (contador, icono, visibilidad) y qué hace hoy el nodo «Mi carrito» del Menú Cliente.
- [x] T-21 · Crear en la barra superior un nodo con icono de carrito y contador de líneas del carrito del cliente actual, que navegue al carrito, visible solo para el rol cliente (la raíz de la barra superior la comparten web2026 y webcliente). — ⚠️ failed 2026-10-02 · see execution.md
- [x] T-22 · Comprobar que el icono aparece con su contador para el cliente, que se actualiza al añadir un artículo y que el administrador no lo ve.

### B-6 · Circuitos de test de interfaz

- [x] T-23 [P] · Construir el circuito de test de interfaz para realizar un pedido.
- [x] T-24 [P] · Construir el circuito de test de interfaz para realizar una devolución.
- [x] T-25 [P] · Construir el circuito de test de interfaz para reportar una incidencia.
- [x] T-26 [P] · Construir el circuito de test de interfaz para dar de alta, modificar y borrar un artículo.
- [x] T-27 [P] · Construir el circuito de test de interfaz para dar de alta, modificar y borrar un cliente.
- [x] T-28 [P] · Construir el circuito de test de interfaz para dar de alta, modificar y borrar una tarifa.

## Impact on what exists

Se borran cuatro objetos, tres tablas y sus páginas, módulos y nodos de menú, sin afectar al resto del catálogo. Se añaden tres módulos kanban, un módulo de separadores, indicadores y gráficos, dos páginas nuevas y un nodo de barra superior. Cambian el menú lateral de administración y la página de inicio de web2026, y se desmarcan las colecciones del menú automático. No se tocan los desarrollos cerrados ni las filas de seguridad de notRegistered.
