# Decisions — notificaciones-comunicacion

## 2026-09-21 · affects development

**Question:** Development 'notificaciones-comunicacion' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-21). Reason (authorship not stated): Se descartó el acceso anónimo/invitado (decisión D-2 de seguridad-acceso-publico, 2026-09-21: todo pasa a estar tras el login del cliente), por lo que las 11 tareas restantes de 'seguridad-acceso-publico' probablemente quedaron obsoletas en gran parte. Se abre este nuevo desarrollo en su lugar; revisar seguridad-acceso-publico más adelante para decidir si se cierra o se reduce su alcance.

## 2026-09-22 · affects development

**Question:** ¿Qué prefijo de entidad se usa para notificaciones-comunicacion, dado que el proyecto ya mezcla CAT_/VTA_/CLI_?

**User answer:** COM_ — prefijo nuevo para esta área transversal (Notificación, Comentario, Solicitud de contacto), que no pertenece al ciclo de ventas (VTA_), al catálogo (CAT_) ni es el cliente en sí (CLI_).

## 2026-09-22 · affects development

**Question:** ¿Se diseñan antes las pantallas de notificaciones-comunicacion con Stitch, o se construye directo con el aspecto propio de la plataforma?

**User answer:** Construir directo, sin diseño previo — mismo criterio que carrito-pedidos, portal-clientes y presupuestos-postventa, sin pasar por Stitch ni aprobación de pantallas.

## 2026-09-22 · affects development

**Question:** B-2 · Email automático: ¿simulado con una tabla propia, o conectado a algo real?

**User answer:** Usar el mecanismo nativo de Flexygo: el objeto sysOutboxMail (tabla Mails_Outbox) y su cron SendOutBoxEmails, ya habilitado. Los procesos que cambian estado (confirmar/enviar pedido, actualizar devolución/incidencia) insertan una fila en el outbox; el envío real depende de que MailSettings esté configurado, pero el mecanismo de cola es el de la plataforma, no una tabla nueva.

## 2026-09-22 · affects development

**Question:** B-4 · Formularios dinámicos ("Solicita una demostración"): ¿público y anónimo, o detrás del login del cliente?

**User answer:** Detrás del login del cliente, igual que el resto de este desarrollo — coherente con la decisión D-2 de seguridad-acceso-publico (todo el acceso pasa a estar detrás del login, sin acceso anónimo).

## 2026-09-22 · affects T-08

**Question:** Revision of assumption S-2: 'B-4 (formularios dinámicos) reutiliza COM_SolicitudContacto con un TipoSolicitud distinto en vez de construir un motor de campos configurables genérico — 'campos configurables desde admin' se resuelve con las propiedades normales del objeto, no con un formulario dinámico de verdad.'

**User answer:** Replaced by 'B-4 (formularios dinámicos) usa un objeto Flexygo independiente, COM_SolicitudDemo, sobre la misma tabla SolicitudesContacto que COM_SolicitudContacto (patrón "dos objetos, una tabla" ya usado en el proyecto), en vez de reutilizar el objeto COM_SolicitudContacto tal cual. 'Campos configurables desde admin' se resuelve con las propiedades normales del objeto, no con un motor de formularios genérico.'. Reason: Un flx-edit se dibuja íntegramente desde las propiedades del OBJETO (Objects_Properties), sin plantilla propia por módulo/colocación — DefaultValue, hide y las dependencias de propiedad son siempre a nivel de objeto, nunca por página o módulo. Reutilizar COM_SolicitudContacto para el formulario de demostración habría guardado IdTipo='Contacto' en el 100% de las solicitudes de demostración, silenciosamente. Verificado leyendo Objects_Properties y la propia documentación de flexygo_create_edit_module antes de construir nada.
