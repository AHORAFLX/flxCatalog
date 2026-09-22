# Execution — seguridad-acceso-publico

## 2026-09-15 · T-02 · OK

**Tool:** `flexygo_set_object_security`

**Result:** CAT_Producto concedido a notRegistered: canView=true, canViewCollection=true, canInsert/canEdit/canDelete/canPrint=false. No había fila previa (el invitado parte de todo denegado), así que esta fila es la que abre el objeto. Pendiente de flexygo_reload_cache al cierre del bloque B-2/B-3 antes de verificar.

## 2026-09-15 · T-03 · FALLO

**Tool:** `flexygo_set_object_security`

**Result:** Parcial: CAT_Familia concedido a notRegistered (canView/canViewCollection=true, resto false). CAT_Marca quedó SIN conceder: el clasificador de modo autónomo de Claude Code bloqueó la llamada dos veces ([Permission Grant] / [Security Weaken]) por ser una concesión de permisos, y no se ha forzado. Pendiente de que el usuario apruebe explícitamente esta y el resto de llamadas de concesión de seguridad del bloque (T-01, T-04, T-05, T-09 y la parte de navegación de T-10), que probablemente topen con el mismo filtro.

## 2026-09-16 · T-01 · FALLO

**Tool:** `flexygo_set_setting`

**Result:** Bloqueado: flexygo_set_setting(AllowGuest, true) fue denegado por el clasificador de modo automático de Claude Code con motivo [Security Weaken]. No se trata de un error transitorio ni lógico del tool — es el mismo bloqueo de permisos ya documentado en T-03 (2026-09-15), que solo se levanta con aprobación explícita del usuario (regla de Bash/permisos en su configuración) o ejecutando la llamada fuera de modo automático. No se reintentó, según el protocolo (reintentar no cambia el resultado de un bloqueo de política). flexygo_reload_cache no se llegó a invocar porque no tiene sentido recargar un valor que no se llegó a escribir. AllowGuest sigue en false. Pendiente de que el usuario apruebe esta llamada (y previsiblemente las de T-04, T-05, T-09 y la parte de navegación de T-10, de la misma familia de concesiones de seguridad/invitado).

## 2026-09-21 · T-01 · FALLO

**Tool:** `flexygo_set_setting`

**Result:** Bloqueado de nuevo: flexygo_set_setting(AllowGuest, true) denegado por el clasificador de modo automático de Claude Code, motivo [Security Weaken]. Tercer intento con el mismo bloqueo (ver 2026-09-16). No se reintenta sin aprobación explícita del usuario. AllowGuest sigue en false. Además, se detecta que B-3 de este plan (T-06, T-08, T-09) depende de la página CAT_Catalogo_Publico y del módulo mod-cat-producto-publico-list, que fueron borrados el 2026-09-18 al fusionar "Catálogo Público" con "Mi catálogo" (desarrollo carrito-pedidos / trabajo ad-hoc posterior) — ese bloque necesita replanificarse antes de ejecutarse.
