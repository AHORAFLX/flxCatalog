# Plan — seguridad-acceso-publico

**Request:** Vale, pues sigue al siguiente paso (confirmando la propuesta de abrir /flx-new-development sobre el área 01 de la especificación: usuarios, accesos y seguridad — en concreto el acceso anónimo/público real del catálogo, del que dependen el carrito, los presupuestos y el resto de contenido web público, pendiente desde la decisión D-9 de catalogo-demo)

**State:** 4 block(s), 12 task(s)

## Assumptions

- [S-1] El precio público se muestra sin restricciones (no se implementa el conmutador 'mostrar precio / consultar precio / precio tras login' de la especificación) — el catálogo público sigue enseñando PrecioBase como ya lo hacía antes de este bloque. — affects T-04
- [S-2] No se construye una página pública de Familias separada en este bloque; la navegación por familia se resuelve dentro del propio catálogo (filtro), como ya estaba. — affects B-3
- [S-3] Los procesos Duplicar/Archivar/Confirmar/Cancelar/Generar PDF no se conceden a notRegistered en ningún punto de este bloque — quedan denegados por omisión, que es la posición segura para un rol que empieza con todo denegado. — affects B-2

## Screen behaviours

None declared. That is a claim, not a default: the four triggers — a control whose effect is not visible, a displayed value whose rule is not on the screen, a state the reference never shows, a navigation with no destination built — were looked for on every approved screen and none was found.

## Open points

None.

## Blocks

### B-1 · Interruptor de invitado

- [ ] T-01 · Activar el acceso anónimo (flexygo_set_setting AllowGuest=true, hoy en false: sin esto no hay invitado aunque todo lo demás esté concedido) y flexygo_reload_cache inmediatamente, porque el valor no llega a la aplicación en marcha hasta entonces.

### B-2 · Seguridad del catálogo para el invitado

- [x] T-02 · Conceder el objeto CAT_Producto de solo lectura a notRegistered: flexygo_set_object_security(canView:true, canViewCollection:true, canInsert:false, canEdit:false, canDelete:false, canPrint:false). El rol invitado parte de todo denegado, así que sin esta fila el listado público sale vacío y la ficha se deniega.
- [ ] T-03 [P] · Conceder CAT_Familia y CAT_Marca de solo lectura a notRegistered, mismo criterio que la tarea anterior, para que los filtros y combos del catálogo público no salgan vacíos. — ⚠️ failed 2026-09-15 · see execution.md
- [ ] T-04 · Conceder las propiedades públicas de CAT_Producto a notRegistered con flexygo_set_property_security: Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca, PrecioBase, IVA, Destacado, Novedad, Oferta, ImagenPrincipal. Deliberadamente NUNCA se concede Stock, Activo, CreatedBy, CreateDate, ModifiedBy, ModifiedDate: quedan denegadas al invitado.
- [ ] T-05 [P] · Conceder las propiedades públicas de CAT_Familia y CAT_Marca a notRegistered (Nombre y lo que el catálogo muestre de ellas), mismo criterio de solo lo necesario.

### B-3 · Página y módulos sin acciones de administración

- [ ] T-06 · Reducir la barra de herramientas del listado público: mod-cat-producto-publico-list usa hoy la barra compartida systb-list completa (Nuevo, Procesos, Configurar...). flexygo_delete_toolbar_button para quitar New, Processes (ObjectMenu) y Configure de la copia propia del módulo, dejando Filtro/Orden/Búsquedas guardadas/Imprimir/Exportar. No crea página.
- [ ] T-07 · Nueva ficha de producto pública de solo lectura: página CAT_Producto_Publico_View (type view, object CAT_Producto) con un módulo flx-view propio -no mod-cat-producto-view, que es del backoffice y carga Editar/Eliminar/Duplicar/Archivar-, sin esos botones, mostrando solo los campos concedidos en el bloque anterior. Punto de entrada: el enlace de fila del listado público, redirigido hacia esta página en la tarea siguiente (no lleva nodo de menú propio, es una ficha de detalle abierta desde su listado).
- [ ] T-08 · Redirigir la fila del listado público a la ficha pública: la plantilla flx-cat-producto-publico-list enlaza hoy a CAT_Producto_View (la ficha de backoffice); cambiar su flx-navbutton para que abra CAT_Producto_Publico_View. Esta es la tarea que le da su punto de entrada a la ficha pública de la tarea anterior.
- [ ] T-09 · Conceder la página pública y sus módulos a notRegistered: flexygo_set_page_security sobre CAT_Catalogo_Publico y CAT_Producto_Publico_View, y flexygo_set_module_security sobre mod-cat-producto-publico-list y el nuevo módulo de ficha, los cuatro con canView:true. Sin esto la página resuelve pero pinta vacía, aunque el objeto ya esté concedido. No crea páginas nuevas: CAT_Catalogo_Publico ya se alcanza por su nodo de menú (bloque siguiente) y CAT_Producto_Publico_View por el enlace de fila de la tarea anterior.

### B-4 · Shell y entrada del invitado

- [ ] T-10 · Nodo de navegación del catálogo bajo la raíz del invitado: flexygo_create_navigation_node bajo el root 8011c6f0-3336-4696-b510-aacbe239e2fe (Guest Users Main Menu, el que apunta NavigateId de webguest/mobileguest) hacia CAT_Catalogo_Publico, y flexygo_set_navigation_security(nodeId, notRegistered, canView:true) - un nodo sin esa fila está denegado igual que una página. Este nodo ES el punto de entrada del catálogo público para el invitado.
- [ ] T-11 · El invitado aterriza directo en el catálogo: flexygo_update_interface(interfaceName: webguest, startupPageName: CAT_Catalogo_Publico). MainNavigateId de webguest ya es NULL -sin barra lateral oscura, que es justo lo que D-9 pedía evitar- así que no hace falta tocarlo. No crea página: apunta el aterrizaje a la que ya tiene su nodo de la tarea anterior.
- [ ] T-12 · Verificación real en sesión anónima: flexygo_reload_cache final, y con el navegador SIN cookie de sesión: comprobar que aterriza en el catálogo, que el listado pinta con datos, que una ficha abre de solo lectura (sin Duplicar/Archivar/Editar visibles), y que una página del backoffice (p.ej. Clientes) sigue denegada con el aviso de credenciales insuficientes. No crea página.

## Impact on what exists

Pending evaluation.
