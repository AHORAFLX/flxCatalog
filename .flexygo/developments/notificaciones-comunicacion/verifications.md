# Verifications — notificaciones-comunicacion

## 2026-09-22 · affects T-07

**Checked:** Listado admin de solicitudes de contacto: filas legibles (nombre, tipo·motivo, fecha, badge de estado), clic abre la ficha, contraste y usabilidad medidos con script

**Against what data:** 2 filas reales (Contacto y Demostración de Marta Gutiérrez Alonso). Legibilidad: bad=15 entradas, todas de la cabecera/menú de la plataforma (ya existentes, no de este desarrollo) salvo la fecha de lista a 11px (patrón ya usado en Pedidos/Devoluciones); unknown=11, todas oklch de badges/chrome de plataforma, comprobadas a ojo en la captura — "Nueva" se lee bien (rojo oscuro sobre rosa claro). Usabilidad: small=4 (todos chrome de plataforma: icono grid, flechas de sidebar), overflow=null, clipped=[], broken=[].

**Verdict:** passes

**Result:** PASS. Sin defectos nuevos de este desarrollo. Los "unknown"/"bad" que aparecen son o bien cromado de la plataforma (menú, versión, avatar) ya presente en el resto de la aplicación, o el mismo patrón de fecha a 11px que ya usan Pedidos y Devoluciones — no algo introducido aquí.

**Screenshot:** `screenshots/2026-09-22-t-07-2.png` — same bytes as `screenshots/solicitudcontacto-list.png`

## 2026-09-22 · affects T-06

**Checked:** Página 'Contacto' del portal cliente: solo Motivo/Mensaje visibles, resto oculto y defaulteado; alta real desde el navegador

**Against what data:** Formulario visto en pantalla (captura adjunta) y, antes de esta pasada formal, un alta real hecha como cliente (Marta Gutiérrez Alonso) con Motivo="Duda sobre plazos de entrega": fila comprobada en base de datos con IdCliente y IdTipo (Contacto, ...101) correctos.

**Verdict:** passes

**Result:** PASS. Formulario limpio (solo Motivo/Mensaje como campos reales), guarda correctamente escopado al cliente logueado.

**Screenshot:** `screenshots/2026-09-22-t-06-4.png` — same bytes as `screenshots/contacto-form.png`

## 2026-09-22 · affects T-08

**Checked:** Página 'Solicita una demostración': mismo patrón que Contacto pero IdTipo default distinto (Demostración); alta real desde el navegador

**Against what data:** Formulario visto en pantalla (captura adjunta) y, antes de esta pasada formal, un alta real hecha como cliente con Motivo="Demo para el equipo de compras": fila comprobada en base de datos con IdTipo=...102 (Demostración) correcto, y confirmado por separado que el formulario de Contacto no se vio afectado (sigue guardando ...101).

**Verdict:** passes

**Result:** PASS.

**Screenshot:** `screenshots/2026-09-22-t-08-6.png` — same bytes as `screenshots/demo-form.png`

## 2026-09-22 · affects T-10

**Checked:** Lista relacionada de comentarios en ficha de Incidencia (admin): botón 'Nuevo comentario' en la ficha, panel con estado vacío correcto

**Against what data:** Ficha de incidencia real (PED-1053, Incidencia de Facturación). Alta real de comentario probada antes de esta pasada en las 4 páginas (Cliente/Pedido/Producto/Incidencia): EntidadTipo/EntidadId correctos en los 4 casos, comprobado en base de datos, luego borrados.

**Verdict:** passes

**Result:** PASS. El botón "Nuevo" genérico del listado (systb-list) se quitó del toolbar (tb-vta-lineapedido-detalle-list, sin New) precisamente porque no llevaba contexto — solo el botón de la ficha (correctamente escopado) crea comentarios.

**Screenshot:** `screenshots/2026-09-22-t-10-8.png` — same bytes as `screenshots/incidencia-comentarios.png`

## 2026-09-22 · affects T-03

**Checked:** Página 'Mis notificaciones' del cliente: lista correctamente escopada al usuario logueado, badge de la campana, enlace de cada fila al pedido correspondiente

**Against what data:** 4 notificaciones reales (generadas por el job tras el reinicio del Backend), badge muestra "4", clic en la primera fila abre correctamente VTA_Pedido_Cliente_View del pedido PED-1145 (IdPedido=10E85BE3-...). Antes de esta captura se habían limpiado 4 notificaciones de error SMTP que se habían colado (hallazgo ya corregido y registrado en el review de B-1/B-2).

**Verdict:** passes

**Result:** PASS.

**Screenshot:** `screenshots/2026-09-22-t-03-10.png` — same bytes as `screenshots/mis-notificaciones.png`

## 2026-09-22 · affects T-02

**Checked:** Reglas Notices_Sentences: se disparan solas en cada cambio de estado de pedido, sin repetirse

**Against what data:** Tras activar el job y reiniciar el Backend, Notices pasó de 0 a 4 filas automáticamente (sin intervención manual), una por cada pedido de Marta en estado distinto de Borrador. Contenido correcto: "Tu pedido PED-1145 ha pasado a estado "Enviado"." etc. UltimoEstadoNotificado quedó marcado en los 4 pedidos, evitando repetición en la siguiente pasada del job (verificado por SQL: 0 filas nuevas en una segunda comprobación).

**Verdict:** passes

**Result:** PASS.

## 2026-09-22 · affects T-04

**Checked:** Cola de email (Mails_Outbox) se puebla desde las mismas reglas, en el mismo disparo

**Against what data:** 4 filas reales en Mails_Outbox tras el reinicio, destinatario marta.gutierrez@outlook.es, asunto y cuerpo correctos por pedido. Status=-1 (Error) en las 4, con ErrorMsg='The SMTP host was not specified' — el job SendOutBoxEmails intentó enviarlas de verdad y falló solo por falta de configuración SMTP (MailSettings.Host vacío), no por un fallo del mecanismo.

**Verdict:** passes

**Result:** PASS con limitación conocida y esperada: el encolado funciona correctamente; el envío real requiere que el usuario configure MailSettings, fuera del alcance de este desarrollo.
