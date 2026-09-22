# Plan — notificaciones-comunicacion

**Request:** Área 07 de la especificación funcional: Notificaciones y comunicación (centro de notificaciones, email automático, página de contacto, formularios dinámicos, comentarios internos) — docs/funcionalidades/07-notificaciones-comunicacion.md

**State:** 5 block(s), 10 task(s)

## Assumptions

- [S-1] El objeto nativo sysNoticeUser no admite edición inline de IsRead para el rol cliente (canEdit=NO por defecto de plataforma) — la página 'Mis notificaciones' es de solo lectura/navegación, sin acción explícita de 'marcar como leída'; el badge se limpia solo cuando el mecanismo nativo de Flexygo las marca leídas por su propio camino. — affects B-1
- [S-2] B-4 (formularios dinámicos) usa un objeto Flexygo independiente, COM_SolicitudDemo, sobre la misma tabla SolicitudesContacto que COM_SolicitudContacto (patrón "dos objetos, una tabla" ya usado en el proyecto), en vez de reutilizar el objeto COM_SolicitudContacto tal cual. 'Campos configurables desde admin' se resuelve con las propiedades normales del objeto, no con un motor de formularios genérico. — affects T-08

## Open points

None.

## Blocks

### B-1 · Centro de notificaciones

- [x] T-01 · Añadir columna de seguimiento UltimoEstadoNotificado (NVARCHAR(50) NULL) a Pedidos, Devoluciones e Incidencias, para no re-notificar el mismo estado.
- [x] T-02 · Escribir y dar de alta en Notices_Sentences (objeto nativo sysNotice/sysNoticeUser de Flexygo, tabla Notices/Notices_Users en la IC) tres reglas declarativas — Pedido, Devolución, Incidencia — que generan un aviso 'app' al cliente dueño del pedido en cada cambio de estado (excluyendo el estado inicial de cada entidad), con enlace directo al registro. Activar el job BuildMailsandnotifications (viene apagado de fábrica).
- [x] T-03 · Construir la página 'Mis notificaciones' en el portal del cliente: módulo de lista sobre el objeto nativo sysNoticeUser (join a Notices), filtrado por {{currentUserId}}, con enlace de cada fila al registro relacionado. Entrada de menú bajo 'Menú Cliente', junto a Mis pedidos/Mis devoluciones/Mis incidencias. El badge de no leídas ya existe en la plataforma (campana de cabecera + job UpdateNoticeBadge, ya activo) — no se construye de nuevo.

### B-2 · Email automático

- [x] T-04 · Extender las tres reglas de Notices_Sentences del bloque B-1 (columnas MailSentence/UpdateMailSentence) para que, en el mismo cambio de estado, además encolen un email en Mails_Outbox (objeto nativo sysOutboxMail) dirigido al email del cliente. El envío real depende de que MailSettings esté configurado; el mecanismo de cola es el mismo, ya activo (job SendOutBoxEmails).

### B-3 · Página de contacto

- [x] T-05 · Tabla y objeto COM_SolicitudContacto (Nombre, Empresa, Email, Telefono, Motivo, Mensaje, IdEstado FK a maestro COM_EstadoSolicitud, FechaAlta, IdCliente FK a Clientes) más maestro COM_EstadoSolicitud (Nueva/En proceso/Resuelta) y maestro COM_TipoSolicitud (Contacto/Demostración) para distinguir B-3 de B-5.
- [x] T-06 · Página 'Contacto' en el portal del cliente (formulario nuevo: Motivo, Mensaje — Nombre/Email ya conocidos del cliente logueado) que crea una COM_SolicitudContacto de tipo Contacto, visible en admin. Alcanzable desde una entrada de menú propia bajo 'Menú Cliente'.
- [x] T-07 · Listado admin de solicitudes de contacto (ambos tipos), alcanzable desde el árbol de navegación de administración junto a los demás listados del proyecto.

### B-4 · Formulario dinámico "Solicita una demostración"

- [x] T-08 · Página 'Solicita una demostración' en el portal del cliente (detrás del login, decisión D-5), formulario sobre COM_SolicitudContacto con tipo Demostración; los campos configurables desde admin quedan como el propio formulario estándar del objeto (los campos que admin decida activar como propiedades), no un motor de formularios genérico. Alcanzable desde una entrada de menú propia bajo 'Menú Cliente'. — ⚠️ failed 2026-09-22 · see execution.md

### B-5 · Comentarios internos

- [x] T-09 · Tabla y objeto COM_Comentario (Texto, Autor, Fecha, EntidadTipo NVARCHAR — Cliente/Pedido/Producto/Incidencia —, EntidadId NVARCHAR): referencia genérica sin relación formal de Flexygo (apunta a 4 tablas distintas), filtrada en la vista de cada lista relacionada, no con flexygo_create_relation.
- [x] T-10 · Lista relacionada de comentarios en las fichas admin de Cliente, Pedido, Producto e Incidencia (mod-*-comentarios-list por entidad, mismo objeto COM_Comentario filtrado por EntidadTipo+EntidadId), con alta de comentario nuevo. Visible solo para roles admin/comercial, no para el cliente.

## Impact on what exists

Pending evaluation.
