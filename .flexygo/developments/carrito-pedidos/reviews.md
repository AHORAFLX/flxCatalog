# Reviews — carrito-pedidos

## 2026-09-17 · affects B-1

**Agreed:** Añadir parámetros ocultos @CurrentRole y @CurrentReference a pVTA_ConfirmarPedido y pVTA_CancelarPedido, bloqueando la operación si el rol es 'cliente' y el pedido no es suyo; publicar y comprobar que el backoffice (admin) sigue funcionando igual.

**Found:** Ambas stored procedures tienen la comprobación de propiedad. Verificado en vivo en B-6/T-24: el cliente de prueba no pudo confirmar ni cancelar un pedido de otro cliente (mensaje "No tienes permiso sobre este pedido."), y el estado del pedido ajeno no cambió. El flujo de admin no se ha visto afectado.

**Deviation:** Ninguna.

## 2026-09-17 · affects B-2

**Agreed:** Tabla Favoritos, objeto CAT_Favorito/CAT_Favoritos sin ficha propia de alta/edición ("nunca por formulario"), proceso pCAT_ToggleFavorito, página 'Mis favoritos' y entrada de menú.

**Found:** Todo presente: tabla con índice único, objeto sin vista de edición propia, proceso de marcar/desmarcar vinculado tanto a CAT_Producto como a CAT_Favorito, página y menú funcionando. Verificado en vivo en B-6/T-22: marcar y desmarcar reflejado correctamente en Mis favoritos, con refresco automático.

**Deviation:** Menor: el toolbar de mod-cat-favorito-cliente-list conserva el botón "New" de la barra estándar systb-list (no se recortó explícitamente). El efecto acordado —que no se pueda dar de alta un favorito por formulario— se logra igualmente, porque el rol cliente tiene create=False a nivel de seguridad sobre CAT_Favorito, así que el botón no puede completar ninguna alta aunque siga presente en la configuración.

## 2026-09-17 · affects B-3

**Agreed:** Proceso pVTA_ActualizarLineaCarrito (SP) compartido; pVTA_AnadirRapido (sin variante, sin ventana) y pVTA_AnadirConVariante (con combo de variante y cantidad); botón de Mi catálogo que lanza uno u otro según TieneVariantes.

**Found:** La SP y ambos procesos existen y calculan el precio con la tarifa del cliente correctamente. El botón "Añadir al carrito" bifurca según TieneVariantes: quick-add directo para productos sin variante, ventana emergente propia (color/talla + cantidad) para productos con variante. Verificado en vivo en B-3 y en B-6/T-20 con ambos casos.

**Deviation:** Real: pVTA_AnadirRapido y pVTA_AnadirConVariante NO están "vinculados" en el sentido que entiende la plataforma — flexygo_audit_origin los marca como "registrados y no vinculados", porque se invocan exclusivamente mediante flexygo.nav.execProcessObj desde JavaScript propio (el popup de variante y el quick-add), no mediante un enlace de objeto o botón de toolbar nativo. Este diseño es la salida a una limitación real de la plataforma con controles dbcombo en parámetros de proceso (probada exhaustivamente y registrada como missing capability durante este mismo bloque). Funciona correctamente en pantalla, pero es invisible para cualquier auditoría o navegación que busque un menú de proceso nativo sobre estos dos procesos.

## 2026-09-17 · affects B-4

**Agreed:** Conceder al rol cliente ver VTA_LineaPedido; vista/módulo de líneas con color/talla legibles, edición de cantidad y botón Quitar; página 'Mi carrito' con total y botón Confirmar pedido; entrada de menú.

**Found:** Seguridad concedida exactamente como se pidió (view=True, view list=True, resto False). Página, módulo de líneas y cabecera funcionando: cambio de cantidad, quitar línea y confirmar pedido, todo con refresco automático verificado en vivo en B-4 y B-6/T-20-T-21, incluido el caso límite de carrito vacío.

**Deviation:** Misma familia que B-3: pVTA_ActualizarCarrito tampoco aparece "vinculado" para la plataforma (se invoca solo desde el JS del plugin del carrito), por la misma limitación de dbcombo. Funciona, pero es invisible a una auditoría o navegación nativa.

## 2026-09-17 · affects B-5

**Agreed:** Selección de 2-3 productos en Mi catálogo con casillas y botón 'Comparar'; página de comparación en HTML sin tabla nueva, no persistente, con los productos elegidos viajando por querystring; nombre, precio, familia, marca, stock e imagen en columnas; alcanzable solo desde el botón de Mi catálogo.

**Found:** Selección con casillas (máximo 3, con aviso) y barra "Comparar/Cancelar" funcionando. Página de comparación sin tabla nueva ni entrada de menú propia, mostrando nombre, precio, familia, marca y stock (imagen cuando el producto tiene una) en columnas. Verificado en vivo con 2 y con 3 productos reales.

**Deviation:** Real: los productos elegidos NO viajan por querystring sino por sessionStorage del navegador. Se probó primero la vía de querystring/objectWhere (un IN(...) de varias filas pasado a una página tipo 'list' vía flexygo.nav.openPageName), y esta instalación de Flexygo la rechaza con un 500 ("Encontró más de un objeto para la misma condición de lectura"): la plataforma intenta resolver el objectWhere de una página de lista como si identificara una única entidad, y una selección de 2-3 filas rompe esa resolución. El efecto que pedía el plan —nada persistente en servidor, se pierde al cambiar de pestaña o cerrar el navegador— se cumple igual con sessionStorage, pero el mecanismo concreto es distinto al descrito.

## 2026-09-17 · affects B-6

**Agreed:** Flujo completo (añadir con/sin variante, cambiar cantidad, quitar línea, comprobar total), confirmar pedido y verlo en Mis pedidos, marcar/desmarcar favoritos, probar el comparador con 2 productos, y prueba de seguridad cruzada entre clientes.

**Found:** Las 5 comprobaciones se hicieron en vivo, con datos reales del cliente de prueba (Norte Almacenes S.L.) y de otros clientes para la prueba cruzada, cada una registrada con flexygo_record_verification y flexygo_record_execution.

**Deviation:** Ninguna.

## 2026-09-17 · affects T-17

**Agreed:** Entrada de menú 'Mi carrito' en la navegación del cliente, creada después de 'Mi catálogo'.

**Found:** La entrada existe y funciona bajo 'Menú Cliente'. En la barra lateral en vivo, "Mi carrito" aparece siempre como primer elemento, antes que "Mi catálogo", aunque se creó en segundo lugar.

**Deviation:** Cosmética: el orden visual no coincide con el de creación. No afecta a la funcionalidad; se puede corregir con flexygo_update_navigation_node si se quiere el orden "Mi catálogo, Mi carrito, Mis pedidos, Mi ficha, Mis favoritos".

## 2026-09-17 · affects B-6

**Agreed:** Nada: estos hallazgos de flexygo_audit_origin no corresponden a ninguna tarea de este plan.

**Found:** La página "Home Cliente" (d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86) es inalcanzable (sin nodo de menú ni objeto que la abra); una fila de Tours_Steps apunta a un objeto 'Account' que ya no existe (origin 0, viene del propio instalador); 8 páginas del backoffice (CAT_Catalogo_Publico, CAT_Familia_List, CAT_Marca_List, CAT_Producto_List, CLI_Cliente_List, HOME, VTA_Pedido_List, VTA_Tarifa_List) cuelgan a la vez de "Work Area" y de "Barra lateral 2026"; 4 módulos huérfanos (mod-cat-variante-list, mod-cli-cliente-top-productos-sqllist, mod-vta-lineapedido-list, mod-vta-preciotarifa-list) no están colocados en ninguna página.

**Deviation:** Ninguno de estos elementos fue tocado por ninguna tarea de carrito-pedidos (T-01 a T-24): son preexistentes, de desarrollos anteriores del proyecto. Se documentan aquí porque flexygo_audit_origin los sacó a la luz durante esta revisión, pero quedan fuera del alcance de este plan y no se tocan salvo que el usuario lo pida expresamente.
