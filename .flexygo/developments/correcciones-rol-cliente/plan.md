# Plan — correcciones-rol-cliente

**Request:** Correcciones de rol cliente, listadas en docs/pending.md bajo "ROL CLIENTE": (1) el menú de cliente abre "Mi Catálogo" y "Mi ficha" como procesos en vez de navegación al List/View correspondiente; (2) "Mi Catálogo" debería llamarse "Catálogo"; (3) el view de producto muestra un botón "mi comentario" sin permisos que no gusta — diseñar un módulo HTML con reseñas de producto (listado de últimas reseñas + formulario para añadir una nueva); (4) "Mis Favoritos" debería ser una navegación al catálogo filtrada a favoritos, no un módulo aparte; (5) "Mis documentos" debería ser solo el listado de documentos de la gestión documental del cliente actual, sin ver pedidos; (6) el cliente no debe poder dar de alta/editar/borrar una devolución directamente — alta/edición/borrado deben ser solo de admin, y el cliente debe tener un proceso DLL "Solicitar" (artículo, cantidad validando que no supere las unidades ya devueltas, pedido, comentario, motivo) que cree la devolución en estado 'Solicitada'; el cliente solo puede Cancelar una devolución que esté en 'Solicitada', ninguna otra acción sobre otros estados; (7) lo mismo para incidencias; (8) icono de carrito en la barra superior con badge igual que el de notificaciones; (9) buscador de artículos en la barra superior.

**State:** 4 block(s), 16 task(s)

## Assumptions

- [S-1] El nodo de navegación admite ObjectWhere con tokens ({{currentReference}}) sobre una página tipo 'view' o 'list' de la misma forma que un módulo — no verificado directamente para nodos de menú, solo para módulos. — affects T-02
- [S-2] El buscador genérico de la barra superior (Main Search Control) puede no indexar productos hoy; si ya lo hace, la tarea se cierra sin cambios, solo verificando. — affects T-06

## Screen behaviours

| Screen | Behaviour | Kind | Resolution | Affects |
|---|---|---|---|---|
| P-RESEÑAS | Qué ocurre tras pulsar Publicar reseña | control | asked-placeholder | T-07 |
| P-RESEÑAS | Si un cliente puede dejar varias reseñas del mismo producto | control | asked-explained | T-07 |
| P-RESEÑAS | Orden de 'últimas reseñas' | derived-value | asked-placeholder | T-07 |
| P-RESEÑAS | El formulario de reseña solo puede usarse si el cliente ha comprado el producto | state | asked-explained | T-07 |

## Open points

- T-02 — No verificado si un nodo de navegación admite tokens ({{currentReference}}) en ObjectWhere igual que un módulo — solo confirmado para módulos.
- T-04 — No verificado si un nodo tipo 'page' admite ObjectWhere sobre una página de tipo list (solo hay precedente para 'view').
- T-11 — ¿Desde qué pantalla se dispara — un botón en el pedido del cliente (como ya existe para incidencias), o desde 'Mis devoluciones'? Puede resolverse en ejecución replicando el patrón ya construido para 'Crear incidencia' en VTA_Pedido_Cliente_View.

## Blocks

### B-1 · Navegación y menú de cliente

- [x] T-01 · Aplica las 7 variables de skin (NavColor, txtNavColor, HeaderColor, bgColor, OutstandingColor, PrimaryColor, NotifyColor) con los valores leídos de la pantalla aprobada P-RESEÑAS mediante flexygo_set_skin_variable. Coinciden con la paleta ya instalada (flexy2022: NavColor #1c1b1d, txtNavColor #ffffff, HeaderColor #ffffff, bgColor #FAFAFA, OutstandingColor #333234, PrimaryColor #000000, NotifyColor #4361ee), así que esta tarea confirma que siguen aplicadas, no las cambia. No crea página ninguna.
- [x] T-02 · "Mi ficha" pasa de proceso a navegación directa. El nodo de menú "Mi ficha" (Menú Cliente) es hoy TypeId='process', dispara el proceso pCLI_AbrirMiFicha para llegar a CLI_Cliente_Mi_Ficha_View. Cámbialo a navegación directa: TypeId='page' (o el equivalente openpagename), ObjectName='CLI_Cliente', ObjectWhere="(Clientes.IdCliente='{{currentReference}}')", PageTypeId='view', PageName='CLI_Cliente_Mi_Ficha_View', sin proceso. Verifica en pantalla que resuelve al mismo registro que hoy. Si el nodo no admite token en ObjectWhere, dilo y no lo dejes roto — vuelve al proceso existente. La página CLI_Cliente_Mi_Ficha_View ya existe y su única entrada sigue siendo este mismo nodo de menú "Mi ficha", solo cambia el mecanismo de navegación hacia ella, no se crea página nueva. — ⚠️ failed 2026-09-22 · see execution.md
      [CLARIFY: No verificado si un nodo de navegación admite tokens ({{currentReference}}) en ObjectWhere igual que un módulo — solo confirmado para módulos.]
- [x] T-03 [P] · Renombrar el nodo de menú "Mi catálogo" (e8ead8ba-559a-43b1-b772-cb9bd080c842, Menú Cliente) a "Catálogo". Ya es navegación directa (TypeId='page' a CAT_Producto_Cliente_List), no toca nada más ni crea página.
- [x] T-04 · "Mis favoritos" navega al catálogo filtrado, sin módulo aparte. Sustituye el nodo de menú "Mis favoritos" (hoy apunta a la página dedicada CAT_Favorito_Cliente_List) por una navegación a CAT_Producto_Cliente_List con un ObjectWhere que filtre a los productos favoritos del cliente actual: (Productos.IdProducto IN (SELECT IdProducto FROM Favoritos WHERE IdCliente='{{currentReference}}')). No construyas un módulo ni una página nueva — reutiliza el catálogo tal cual, y su entrada sigue siendo este mismo nodo de menú "Mis favoritos". Si el nodo no admite pasar ObjectWhere a una página tipo list, documenta por qué y propone la alternativa mínima. — ⚠️ failed 2026-09-22 · see execution.md
      [CLARIFY: No verificado si un nodo tipo 'page' admite ObjectWhere sobre una página de tipo list (solo hay precedente para 'view').]
- [x] T-05 · Icono de carrito con badge en la barra superior. Añade un icono de carrito con un badge mostrando el número de líneas del pedido "carrito" (estado Borrador) del cliente actual, replicando el mecanismo ya usado para el badge de notificaciones (vNet_Notices_Badge + job UpdateNoticeBadge): una vista/consulta que cuenta líneas del pedido en curso del usuario. Al pulsarlo, navega a la página ya existente "Mi carrito" (su entrada), no crea página. — ⚠️ failed 2026-09-22 · see execution.md
- [x] T-06 · Buscador de artículos en la barra superior. Comprueba si el buscador genérico de la barra superior (Main Search Control) ya indexa y encuentra productos por nombre/referencia. Si no lo hace, configúralo (o añade un buscador dedicado) para que buscar un artículo por nombre desde la barra superior lleve al catálogo filtrado o abra la ficha del producto — ambas páginas ya existentes. — ⚠️ failed 2026-09-22 · see execution.md

### B-2 · Reseñas de producto (pantalla P-RESEÑAS)

- [x] T-07 · Construir el módulo HTML de reseñas de producto sobre la plantilla de vista de producto del cliente (donde hoy está el botón "Nuevo comentario" sin permisos), según la referencia aprobada P-RESEÑAS: resumen de valoración media con estrellas, listado de las últimas reseñas (avatar/iniciales, nombre, estrellas, fecha relativa, texto, más recientes primero) y formulario "Escribe tu reseña" (estrellas seleccionables, textarea, botón "Publicar reseña"). Reutiliza el objeto COM_Comentario ya existente con EntidadTipo='Producto', EntidadId=IdProducto — no crees una entidad nueva. El formulario solo se ofrece si el cliente actual ha comprado ese producto (existe alguna línea de ese IdProducto en algún pedido con IdCliente='{{currentReference}}'); si no lo ha comprado, el formulario no se muestra o explica por qué. Tras publicar, la reseña aparece al instante en la lista. Ajusta la seguridad de COM_Comentario para el rol cliente: ver y crear sus propias reseñas de producto (no editar ni borrar). Quita el botón "Nuevo comentario" roto. La página de ficha de producto del cliente ya existe y se abre desde el propio catálogo; este módulo se añade dentro de ella, no crea página nueva.
- [x] T-08 · Añade a pSeed_ResetDemoData la generación de datos de demo para COM_Comentario con EntidadTipo='Producto', solo sobre productos que el cliente de demo (u otros clientes) tengan realmente comprados en sus pedidos generados — varias reseñas por producto, texto realista en español, fechas variadas, dentro del mismo procedimiento, no ad-hoc.

### B-3 · Devoluciones e incidencias del cliente: alta y cancelación controladas

- [x] T-09 · Añade una fila 'Cancelada' a Devoluciones_Estados y otra a Incidencias_Estados (GUID libre en ambos casos, ninguna propiedad los lleva como DefaultValue). Añade su seeding correspondiente a pSeed_ResetDemoData (unas pocas filas de ejemplo en ese estado, dentro de la distribución ya existente).
- [x] T-10 · En la seguridad de VTA_Devolucion y VTA_Incidencia, cambia create de True a False para el rol cliente (view/view list se quedan como están). Quita el botón "New" nativo de los listados de cliente si sigue resultando accesible (mismo patrón ya usado en comentarios: toolbar sin New).
- [x] T-11 · Proceso DLL "Solicitar devolución": recibe pedido/línea, artículo, cantidad, comentario y motivo; valida que la cantidad solicitada no supere las unidades del pedido menos lo ya devuelto para esa línea (sumando devoluciones previas no rechazadas ni canceladas); si es válido, crea la devolución con IdEstado='Solicitada' (GUID fijo CB6E0913-0A81-4C7B-BC78-925F53FCF836) y IdCliente/Comentario/Motivo. Si no es válido, devuelve un error claro, sin crear nada. Consulta flexygo_get_dotnet_process_guide antes de escribir el C#.
      [CLARIFY: ¿Desde qué pantalla se dispara — un botón en el pedido del cliente (como ya existe para incidencias), o desde 'Mis devoluciones'? Puede resolverse en ejecución replicando el patrón ya construido para 'Crear incidencia' en VTA_Pedido_Cliente_View.]
- [x] T-12 · Proceso 'Cancelar devolución' (stored procedure, mismo patrón que pVTA_CancelarPedido): cambia IdEstado a 'Cancelada' solo si el estado actual es 'Solicitada' y el IdCliente coincide con el usuario actual; en cualquier otro caso rechaza la acción con un mensaje claro. Visible solo desde la vista de cliente y solo cuando el estado es 'Solicitada'.
- [x] T-13 · Proceso DLL "Solicitar incidencia": mismo criterio que la devolución — tipo, pedido, descripción; crea la incidencia en su estado inicial ('Abierta'). Sustituye al alta directa actual (el botón 'Crear incidencia' en VTA_Pedido_Cliente_View hoy abre un flx-edit normal con create=True; ese acceso directo desaparece y pasa a disparar este proceso).
- [x] T-14 · Proceso 'Cancelar incidencia' (mismo patrón que 'Cancelar devolución'): solo si el estado actual es el inicial ('Abierta') y el IdCliente coincide con el usuario actual, pasa a 'Cancelada'.
- [x] T-15 · Coloca los botones de Solicitar/Cancelar en las pantallas de cliente: en VTA_Pedido_Cliente_View sustituye el acceso directo de creación por el botón que dispara el proceso 'Solicitar'; en la vista de cliente de VTA_Devolucion/VTA_Incidencia añade el botón 'Cancelar' visible solo cuando el registro está en su estado inicial. Ambas páginas ya existen y ya tienen su entrada de menú/navegación; esta tarea solo coloca botones dentro de ellas.

### B-4 · "Mis documentos": solo documentos, sin pedidos

- [x] T-16 · En VTA_MisDocumentos_List, quita el módulo 'Mis pedidos' (mod-vta-pedido-list-documentos). En su lugar, construye un listado (flx-sqllist, cruza Documents_Object con Pedidos) de los documentos adjuntos a los pedidos del cliente actual: JOIN de Documents_Object (ObjectName='VTA_Pedido') con Pedidos filtrando IdCliente='{{currentReference}}', mostrando nombre del documento, pedido al que pertenece y fecha, con enlace de descarga. Mantén el módulo 'Mi tarifa' tal cual está. La página VTA_MisDocumentos_List ya existe y su entrada sigue siendo el nodo de menú "Mis documentos"; esta tarea solo cambia sus módulos, no crea página.

## Impact on what exists

Pending evaluation.
