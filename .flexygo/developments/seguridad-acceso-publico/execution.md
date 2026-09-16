# Execution — seguridad-acceso-publico

## 2026-09-15 · T-02 · OK

**Tool:** `flexygo_set_object_security`

**Result:** CAT_Producto concedido a notRegistered: canView=true, canViewCollection=true, canInsert/canEdit/canDelete/canPrint=false. No había fila previa (el invitado parte de todo denegado), así que esta fila es la que abre el objeto. Pendiente de flexygo_reload_cache al cierre del bloque B-2/B-3 antes de verificar.

## 2026-09-15 · T-03 · FALLO

**Tool:** `flexygo_set_object_security`

**Result:** Parcial: CAT_Familia concedido a notRegistered (canView/canViewCollection=true, resto false). CAT_Marca quedó SIN conceder: el clasificador de modo autónomo de Claude Code bloqueó la llamada dos veces ([Permission Grant] / [Security Weaken]) por ser una concesión de permisos, y no se ha forzado. Pendiente de que el usuario apruebe explícitamente esta y el resto de llamadas de concesión de seguridad del bloque (T-01, T-04, T-05, T-09 y la parte de navegación de T-10), que probablemente topen con el mismo filtro.
