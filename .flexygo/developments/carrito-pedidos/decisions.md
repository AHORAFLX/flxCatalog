# Decisions — carrito-pedidos

## 2026-09-17 · affects development

**Question:** Development 'carrito-pedidos' created with 1 other development(s) unfinished

**User answer:** 'seguridad-acceso-publico' (1/12 task(s), last written 2026-09-16). Reason (in the user's own words): Acceso público para el final de todo el proyecto. Vamos a empezar el siguiente desarrollo.

## 2026-09-17 · affects plan

**Question:** Plan rewritten (was 6 block(s), 24 task(s))

**User answer:** Reason: El propio aviso de la primera escritura pedía indicar en la tarea de cada página cómo se alcanza (T-07, T-16, T-19); esta reescritura solo añade esa frase a esas tres tareas, sin cambiar bloques, tareas ni supuestos.

## 2026-09-17 · affects B-5

**Question:** Revision of assumption S-2: 'El comparador no persiste ninguna selección: compara solo lo que el usuario elige en cada visita, viajando por querystring, sin tabla nueva.'

**User answer:** Replaced by 'El comparador no persiste ninguna selección: compara solo lo que el usuario elige en cada visita, sin tabla nueva. Los productos elegidos viajan por sessionStorage del navegador (no por querystring): un IN(...) de varias filas pasado como objectWhere de una página tipo 'list' rompe en esta instalación con un 500, porque la plataforma intenta resolverlo como si identificara una única entidad.'. Reason: Al construir T-19 se probó primero pasar los ids seleccionados por querystring/objectWhere vía flexygo.nav.openPageName sobre una página tipo 'list'. Esta instalación de Flexygo lo rechaza con "Error Reading object CAT_Producto... Encontró más de un objeto para la misma condición de lectura" en cuanto el IN(...) resuelve a 2 o más filas. Se sustituyó por un módulo HTML standalone que lee los ids desde flexygo.storage.session, verificado en vivo con 2 y 3 productos sin errores.

## 2026-10-26 · affects T-01, T-02, T-03, T-05, T-06, T-07, T-09, T-11, T-12, T-16, T-19

**Question:** ¿Cómo quedan probadas las tareas de proceso y pantalla de carrito-pedidos (B-1, T-05, T-06, T-07, T-09, T-11, T-12, T-16, T-19)?

**User answer:** Decidido por el agente con la delegación del usuario (D-16 de pendientes-cliente-admin): las cubren de punta a punta los tests de interfaz de la batería, en verde el 26-oct, que ejecutan los procesos reales desde la pantalla del cliente: B-1 (propiedad en confirmar/cancelar) → ClienteCarritoPedidosTests.Pedido_ElClienteConfirmaSuCarrito_YElAdministradorLoCancela y ClienteCuentaTests.Seguridad_ElClienteNoVeElPedidoDeOtroCliente (además, la llamada directa del 26-oct con otro cliente respondió «No tienes permiso sobre este pedido.»); T-05/T-06/T-07 favoritos → ClienteCatalogoTests.Favoritos_SeMarcanDesdeElCatalogoYSeQuitanDesdeMisFavoritos; T-09/T-11/T-12/T-16 carrito → ClienteCarritoPedidosTests.Carrito_AñadirConVariante_CambiarCantidad_YQuitar; T-19 comparador → ClienteCatalogoTests.Comparador_ComparaLosProductosSeleccionados. No se escriben tests unitarios aparte ni se renombran, porque los números de tarea se repiten entre desarrollos.

## 2026-10-26 · affects development

**Question:** /flx-api de carrito-pedidos: ¿qué de lo construido sale por la WebAPI y para quién?

**User answer:** Los pedidos y sus líneas (VTA_Pedido, VTA_LineaPedido) en solo lectura, como decidió el usuario el 26-oct (D-15 de pendientes-cliente-admin); los favoritos (CAT_Favorito) y los procesos del carrito (pVTA_ActualizarLineaCarrito, pVTA_AnadirRapido, pVTA_AnadirConVariante, pCAT_ToggleFavorito) no se exponen: escriben datos y la decisión fue solo lectura. Llama solo el rol admins, también por /mcp.
