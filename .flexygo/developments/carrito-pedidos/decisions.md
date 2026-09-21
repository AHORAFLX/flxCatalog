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
