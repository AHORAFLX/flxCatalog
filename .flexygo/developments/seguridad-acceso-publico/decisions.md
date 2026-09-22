# Decisions — seguridad-acceso-publico

## 2026-09-15 · affects plan

**Question:** Plan rewritten (was 4 block(s), 12 task(s))

**User answer:** Reason: Aclarar el punto de entrada de cada página en el propio texto de la tarea, tal y como pidió el aviso de flexygo_write_plan (T-07, T-09, T-10, T-11, T-12) — sin cambiar el alcance ni el orden del plan.

## 2026-09-21 · affects development

**Question:** B-1 (activar AllowGuest/invitado anónimo) sigue bloqueado por el modo automático. ¿Activamos el acceso invitado, o dejamos el catálogo público como algo que solo ve el cliente autenticado?

**User answer:** Se deja parado B-1 (no se activa AllowGuest por ahora). Cambio de rumbo: todo lo que iba a ser de acceso público/anónimo pasa a estar detrás del login del cliente — no se construye ningún acceso invitado ni pantallas de solo-lectura públicas separadas.
