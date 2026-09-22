# Reviews — notificaciones-comunicacion

## 2026-09-22 · affects B-1

**Agreed:** Centro de notificaciones usando el mecanismo nativo de Flexygo (Notices/Notices_Users), no una tabla propia; página 'Mis notificaciones' filtrada por usuario.

**Found:** 3 reglas en Notices_Sentences dadas de alta y probadas (job BuildMailsandnotifications activado); página COM_MisNotificaciones_List construida y alcanzable desde 'Menú Cliente'; verificado en pantalla con datos reales (4 notificaciones generadas tras reiniciar el Backend).

**Deviation:** Ninguna.

## 2026-09-22 · affects B-2

**Agreed:** Las mismas reglas de B-1 encolan también un email en Mails_Outbox (sysOutboxMail), reutilizando el cron ya activo.

**Found:** MailSentence/UpdateMailSentence añadidos a las 3 reglas; probado en solo lectura y en vivo (4 filas en Mails_Outbox tras el reinicio, Status=-1 solo por falta de SMTP configurado — mensaje de error exactamente 'The SMTP host was not specified').

**Deviation:** Ninguna. El envío real depende de MailSettings, fuera del alcance de este desarrollo.

## 2026-09-22 · affects B-3

**Agreed:** COM_SolicitudContacto + maestros COM_EstadoSolicitud/COM_TipoSolicitud; página 'Contacto' en el portal del cliente (solo Motivo/Mensaje visibles); listado admin de solicitudes.

**Found:** Construido tal cual. Verificado end-to-end: solicitud real guardada desde el portal del cliente, IdTipo correcto (Contacto), visible en el listado admin. flexygo_verify_object: PASS 8/8.

**Deviation:** Ninguna.

## 2026-09-22 · affects B-4

**Agreed:** Página 'Solicita una demostración' sobre COM_SolicitudContacto con tipo Demostración, campos configurables como propiedades normales del objeto.

**Found:** Construido como objeto independiente COM_SolicitudDemo sobre la misma tabla SolicitudesContacto (revisión de la asunción S-2, decisión registrada), tras comprobar que un flx-edit se dibuja desde las propiedades del OBJETO y no admite dos valores por defecto distintos en la misma propiedad oculta desde dos módulos. flexygo_audit_origin marca esto como 'Twin objects' (dos objetos sobre una tabla) — es el patrón deliberado y documentado del propio proyecto (ya usado, p. ej. CAT_Producto/CAT_Producto_Cliente), no un esquema corrupto. Verificado en pantalla: solicitud real guardada con IdTipo=Demostración correcto; confirmado además que el formulario de Contacto (B-3) no se vio afectado.

**Deviation:** Desviación del plan original (objeto compartido) a un objeto independiente, ya registrada como revisión de S-2 con su razón técnica en decisions.md el 2026-09-22.

## 2026-09-22 · affects B-5

**Agreed:** COM_Comentario genérico (EntidadTipo/EntidadId, sin relación formal) con lista relacionada en las 4 fichas admin, alta de comentario nuevo, oculto para el cliente.

**Found:** Objeto y 4 módulos de lista construidos. El botón 'Nuevo' genérico del listado no llevaba contexto (defecto real, corregido: EntidadTipo/EntidadId se rellenaban vacíos). Primer intento de arreglo (módulo HTML independiente con linkedObjectName) reveló un hueco de plataforma — {{Token}} no se sustituye ahí pese a que la documentación de la tool dice que sí — registrado con flexygo_record_missing_capability. Solución final: el botón se movió a la propia plantilla de vista de cada objeto padre, mismo patrón ya probado de 'Crear incidencia'. Verificado en las 4 páginas (Cliente/Pedido/Producto/Incidencia) con un comentario real por cada una, EntidadTipo/EntidadId correctos en los 4 casos, luego borrados. Seguridad: fila explícita denegando el objeto entero al rol cliente.

**Deviation:** El botón de alta no vive donde el plan lo daba por hecho implícitamente (en el propio listado) sino en la ficha del padre — necesario por el hueco de plataforma encontrado, no por elección. Un módulo huérfano que quedó de un intento intermedio (mod-com-comentario-add-incidencia) se detectó por flexygo_audit_origin y se borró.
