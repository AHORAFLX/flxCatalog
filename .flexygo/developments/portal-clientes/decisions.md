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

## 2026-10-26 · affects T-08, T-09, T-10, T-15, T-16

**Question:** ¿Cómo quedan probadas T-08, T-09, T-10, T-15 y T-16 de portal-clientes (catálogo, mis pedidos, mi ficha, seguridad de páginas y menú del cliente)?

**User answer:** Decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): las cubren los tests de interfaz de la batería, en verde el 26-oct, sin renombrarlos porque los números de tarea se repiten entre desarrollos: T-08 → ClienteCatalogoTests.Catalogo_MuestraProductosConFotoPrecioYPaginacion; T-09 → ClienteCarritoPedidosTests.MisPedidos_SoloMuestraLosPedidosDelClienteConectado y DetalleDePedido_MuestraSeguimientoLineasYSoloAccionesDeCliente; T-10 → ClienteCuentaTests.MiFicha_MuestraLosDatosDelClienteConectado; T-15 → ClienteCuentaTests.Seguridad_ElClienteNoAbrePantallasDeAdministracion y Seguridad_ElClienteNoVeElPanelDeControlDelNegocio; T-16 → ClienteNavegacionTests.MenuCliente_AbreSuPantalla y MenuCliente_NoOfreceOpcionesDeAdministracion.

## 2026-10-26 · affects T-15, T-16

**Question:** ¿Llevan ayuda propia T-15 (seguridad de páginas y módulos) y T-16 (menú del cliente) de portal-clientes?

**User answer:** No como pantalla, decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): la seguridad no se ve y el menú no es una pantalla. El menú del cliente ya lleva su entrada «Ayuda», que abre el índice «Ayuda del cliente», y la portada ofrece el recorrido de bienvenida tour-welcome-cliente, que enseña el menú.

## 2026-10-26 · affects development

**Question:** /flx-api de portal-clientes: ¿qué de lo construido sale por la WebAPI y para quién?

**User answer:** Nada nuevo: la exposición global decidida por el usuario el 26-oct (D-15 de pendientes-cliente-admin) deja fuera las tarifas y sus precios (VTA_Tarifa, VTA_PrecioTarifa) y los clientes (CLI_Cliente), que son lo que construyó este desarrollo; el rol cliente no está autorizado en la WebAPI. Llama solo admins.
