# Decisions — portal-clientes

## 2026-09-17 · affects development

**Question:** Development 'portal-clientes' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-16). Reason (in the user's own words): El usuario decide aparcar el acceso público/invitado (desarrollo 'seguridad-acceso-publico', bloque B-1 bloqueado por el clasificador de seguridad al intentar activar AllowGuest) y pide en su lugar un rol 'Cliente' autenticado, distinto en naturaleza (login con IdCliente en subreference, no acceso anónimo).

## 2026-09-17 · affects plan

**Question:** Plan rewritten (was 5 block(s), 18 task(s))

**User answer:** Reason: Aclarar el punto de entrada de cada página nueva en el propio texto de la tarea, tal y como pidió el aviso de flexygo_write_plan (T-08, T-09, T-10 explícitas; T-15/T-16/T-17 aclaradas como que no crean página) — sin cambiar el alcance ni el orden del plan.

## 2026-09-17 · affects T-06

**Question:** T-06: AspNetUsers.Subreference es donde Flexygo guarda el dato que alimenta {{currentSubreference}} (y, tras la corrección de hoy, se usa {{currentReference}}). Crear el login de cada cliente y rellenar ese campo es un paso manual en la pantalla de Usuarios de Flexygo — no hay ninguna tool que lo haga desde aquí. ¿Se acepta este paso manual como parte del procedimiento de alta de cada cliente?

**User answer:** Sí, aceptado. El usuario ya lo ha hecho él mismo para el cliente de prueba usado en la verificación (T-18), usando el campo Referencia en vez de Subreference — por eso los filtros y el context variable de tarifa se cambiaron de {{currentSubreference}} a {{currentReference}}. Cada alta futura de cliente seguirá este mismo paso manual: crear el login en la pantalla de Usuarios, rol Cliente, perfil Cliente, y el IdCliente en el campo Referencia.

## 2026-09-17 · affects B-3

**Question:** Revision of assumption S-2: ''Mis últimas compras' se resuelve con la propia página 'Mis pedidos' (mismo listado, sin un widget de resumen aparte) — no se construye un dashboard adicional para el cliente en este bloque.'

**User answer:** Replaced by ''Mis últimas compras' se resuelve con la propia página 'Mis pedidos', PERO durante T-18 el usuario creó a mano una página de inicio en blanco ('Home Cliente') como StartupPageName del perfil 'Cliente', y pidió que se rellenara con un resumen básico (saludo, tarifa asignada, últimos 5 pedidos) — así que sí existe un pequeño dashboard para el cliente, añadido fuera del plan original a petición directa del usuario.'. Reason: El usuario creó la página 'Home Cliente' él mismo en la pantalla de Flexygo mientras se coordinaba T-18, y al preguntarle si la dejábamos vacía o le añadíamos contenido, pidió explícitamente un resumen básico. No es un hallazgo de ejecución que refute la asunción por error de planificación, sino una decisión del usuario tomada después de escribir el plan.
