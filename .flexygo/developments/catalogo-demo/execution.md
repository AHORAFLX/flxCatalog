# Execution — catalogo-demo

## 2026-09-15 · T-01 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters, flexygo_create_default_view, flexygo_create_object_list_module, flexygo_create_object_view_module, flexygo_create_page_batch, flexygo_compose_page_batch`

**Result:** Tabla Familias creada (IdFamilia GUID PK, autorreferencia IdFamiliaPadre nullable). Objeto CAT_Familia/CAT_Familias con 10 propiedades (Icono como custom/syscombo-icon, Imagen como image, IdFamiliaPadre como dbcombo self-join). Vista de listado sin JOIN a sí misma: el validador de vistas rechaza alias de tabla, y un autojoin de Familias contra Familias necesita alias — se dejó el nombre de la familia padre fuera del listado (solo aparece en la ficha, como valor crudo IdFamiliaPadre; no se resuelve a texto ahí tampoco por el mismo motivo). Página de listado y ficha compuestas con layout 'default'. flexygo_verify_object: PASS (8/8, 1 warning de traducción, esperado y no bloqueante). Punto de entrada: pendiente del árbol de navegación (tarea T-25).

## 2026-09-15 · T-02 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters, flexygo_create_default_view, flexygo_create_object_list_module, flexygo_create_object_view_module, flexygo_create_page_batch, flexygo_compose_page_batch`

**Result:** Tabla Marcas creada (IdMarca GUID PK, Nombre, Activo). Objeto CAT_Marca/CAT_Marcas con 3 propiedades. Listado y ficha con plantilla por defecto, páginas compuestas con layout 'default'. flexygo_verify_object: PASS (8/8, 1 warning de traducción esperado). Sin desviaciones. Punto de entrada: pendiente del árbol de navegación (T-25).

## 2026-09-15 · T-03 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view`

**Result:** Tabla Tallas creada (IdTalla GUID PK, Nombre, Orden). Objeto CAT_Talla/CAT_Tallas con 3 propiedades y vista de listado. Sin ficha, sin filtros, sin páginas: alcance decidido en el plan (catálogo fijo sembrado por T-26). flexygo_verify_object: 5 PASS, 3 FAIL esperados (Detail view, Filters, Pages) — no son defectos, es el alcance acordado.

## 2026-09-15 · T-04 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view`

**Result:** Tabla Colores creada (IdColor GUID PK, Nombre, CodigoHex, Orden). Objeto CAT_Color/CAT_Colores con 4 propiedades (CodigoHex como typeId 'color') y vista de listado. Sin ficha, sin filtros, sin páginas: mismo alcance que Tallas. flexygo_verify_object: 5 PASS, 3 FAIL esperados (Detail view, Filters, Pages).

## 2026-09-15 · T-05 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view`

**Result:** Tabla Pedidos_Estados creada (IdEstado GUID PK, Nombre, Orden). Objeto VTA_EstadoPedido/VTA_EstadosPedido con 3 propiedades y vista de listado. Sin ficha, sin filtros, sin páginas: los 6 estados se siembran en T-26, no se administran por pantalla en este bloque. flexygo_verify_object: 5 PASS, 3 FAIL esperados (Detail view, Filters, Pages).

## 2026-09-15 · T-06 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view`

**Result:** Tabla Tarifas creada (IdTarifa GUID PK, Nombre). Objeto VTA_Tarifa/VTA_Tarifas con 2 propiedades y vista de listado. Sin ficha, sin filtros, sin páginas: las 5 tarifas se siembran en T-26. flexygo_verify_object: 5 PASS, 3 FAIL esperados (Detail view, Filters, Pages).

## 2026-09-15 · T-07 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters, flexygo_create_default_view`

**Result:** Tabla Productos creada (IdProducto GUID PK, FK IdFamilia/IdMarca, PrecioBase, IVA, Stock, Activo, y además Destacado/Novedad/Oferta — no estaban en el texto literal de la tarea pero las piden las pantallas aprobadas L-P y el catálogo público P para las píldoras de estado; columnas de auditoría CreatedBy/CreateDate/ModifiedBy/ModifiedDate con PersistDefaultValue false/false/true/true). Objeto CAT_Producto/CAT_Productos con 17 propiedades, vista de listado con LEFT JOIN a Familias y Marcas, filtros (Nombre, Familia, Marca, Activo, fecha de alta) y ficha base. flexygo_verify_object: 7 PASS, 1 FAIL esperado (Pages, las construye T-09/T-10). Sin páginas todavía.

## 2026-09-15 · T-08 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters`

**Result:** Tabla Productos_Variantes creada (IdVariante GUID PK, FK IdProducto/IdTalla/IdColor, Referencia, Stock). Objeto CAT_Variante/CAT_Variantes con 6 propiedades, vista de listado con LEFT JOIN a Productos/Tallas/Colores, y filtros. Sin ficha ni páginas propias: se gestiona como listado embebido en la ficha de Producto (T-10), no como pantalla independiente. flexygo_verify_object: 6 PASS, 2 FAIL esperados (Detail view, Pages).

## 2026-09-15 · T-09 · OK

**Tool:** `flexygo_update_view, flexygo_create_object_list_module, flexygo_create_page, flexygo_add_page_module`

**Result:** Vista de listado ampliada con una columna calculada EstadoCodigo (CASE sobre Stock/Novedad/Oferta/Activo) para poder pintar la píldora de estado de la pantalla L-P con un solo switch. Módulo de listado con plantilla a medida (Referencia, Nombre, Familia, Marca, Precio, Stock, Estado con píldora de color, menú de acciones por fila). Página CAT_Producto_List compuesta con layout 'default'. Punto de entrada: nodo "Productos" del árbol de navegación (pendiente de T-25). Botón "Nuevo producto" y exportación quedan con el toolbar estándar systb-list de Flexygo (decisión: usar el estándar de la plataforma).

## 2026-09-15 · T-10 · OK

**Tool:** `flexygo_create_object_view_module, flexygo_create_object_doc_and_image_manager, flexygo_create_object_list_module, flexygo_create_related_list_module, flexygo_create_page, flexygo_compose_page_batch`

**Result:** Ficha de producto con plantilla a medida (cabecera con referencia/nombre/estado, detalles, descripción). Gestor de documentos e imágenes de Flexygo añadido (cat_producto_gestion_doc_img) para el box "Imágenes" — sustituye a los nombres de fichero ilustrativos del mockup por el gestor real de adjuntos. Listado embebido de Variantes (mod-cat-variante-list-producto) como related list, reutilizando un módulo de listado propio de CAT_Variante creado para ello. Página CAT_Producto_View compuesta con layout syslayout-6 (vista + variantes en TopPosition, imágenes en RightPosition). Las acciones Editar/Duplicar/Archivar de la cabecera aprobada quedan como trabajo pendiente de un toolbar/proceso a medida — no implementadas todavía en la plantilla de esta pasada, solo el toolbar estándar systb-edit; abierto para revisar en /flx-review. flexygo_verify_object CAT_Producto: PASS 8/8. CAT_Variante: 6 PASS, 2 FAIL esperados (Detail view/Pages, sin pantalla propia por diseño) y un WARN de "raw value" sobre IdProducto — revisado: ese campo solo se usa dentro del atributo objectwhere del navbutton para volver al producto padre, nunca se imprime en pantalla; no es un defecto real.

## 2026-09-15 · T-11 · OK

**Tool:** `flexygo_create_relation_batch`

**Result:** 5 relaciones creadas: Familias→Productos, Marcas→Productos, Productos→Variantes, Tallas→Variantes, Colores→Variantes. Todas correctas a la primera.

## 2026-09-15 · T-12 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters, flexygo_create_default_view`

**Result:** Tabla Clientes creada, ampliada según decisión D-3/D-4: RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono además de CodigoCliente/IdTarifa/Comercial/Activo. Objeto CLI_Cliente/CLI_Clientes con 15 propiedades, vista de listado con LEFT JOIN a Tarifas, filtros y ficha base. flexygo_verify_object: 7 PASS, 1 FAIL esperado (Pages, las construye T-15/T-16).

## 2026-09-15 · T-13 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view, flexygo_create_filters, flexygo_create_default_view`

**Result:** Tabla Pedidos creada (IdPedido GUID PK, Numero, FK IdCliente/IdEstado, Fecha, DireccionEntrega, FormaPago, Total). Objeto VTA_Pedido/VTA_Pedidos con 8 propiedades, vista de listado con LEFT JOIN a Clientes y Pedidos_Estados, filtros y ficha base. flexygo_verify_object: 7 PASS, 1 FAIL esperado (Pages, las construye T-17/T-18).

## 2026-09-15 · T-14 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_object, flexygo_create_properties_batch, flexygo_create_view`

**Result:** Tabla Pedidos_Lineas creada (IdLinea GUID PK, FK IdPedido/IdProducto/IdVariante nullable, Cantidad, Precio, Subtotal). Objeto VTA_LineaPedido/VTA_LineasPedido con 7 propiedades y vista de listado con LEFT JOIN a Productos y Productos_Variantes (IdPedido queda en crudo en la vista, es solo para el filtro del listado embebido en la ficha de pedido, nunca se imprime). Sin ficha, filtros ni páginas propias: se gestiona como listado embebido en la ficha de Pedido (T-18). flexygo_verify_object: 5 PASS, 3 FAIL esperados (Detail view, Filters, Pages).

## 2026-09-15 · T-15 · OK

**Tool:** `flexygo_create_object_list_module, flexygo_create_page, flexygo_add_page_module`

**Result:** Módulo de listado con plantilla a medida siguiendo L-C (Código, Razón social, CIF, Tarifa, Comercial, Estado con píldora Activo/Bloqueado reutilizando el mismo bit Activo). Página CLI_Cliente_List compuesta. Punto de entrada: nodo "Clientes" del árbol de navegación (pendiente de T-25).

## 2026-09-15 · T-16 · OK

**Tool:** `flexygo_create_object_view_module, flexygo_update_view, flexygo_update_template, flexygo_create_page, flexygo_add_page_module`

**Result:** Ficha de cliente con plantilla genérica por defecto (sin mockup aprobado). Desviación: la vista base no incluía el nombre de la Tarifa (solo el IdTarifa crudo) — corregido añadiendo el LEFT JOIN a Tarifas con flexygo_update_view y actualizando la plantilla para usar el nombre en vez del GUID, antes de dar la tarea por cerrada. flexygo_verify_object CLI_Cliente: PASS 8/8. Punto de entrada: se abre desde cada fila del listado de Clientes (navbutton).

## 2026-09-15 · T-17 · OK

**Tool:** `flexygo_create_object_list_module, flexygo_update_template, flexygo_create_page, flexygo_add_page_module`

**Result:** Módulo de listado con plantilla a medida siguiendo L-PE (Número, Cliente, Fecha relativa, Estado con píldora de color por cada uno de los 6 estados, Total). Página VTA_Pedido_List compuesta. Punto de entrada: nodo "Pedidos" del árbol de navegación (pendiente de T-25).

## 2026-09-15 · T-18 · OK

**Tool:** `flexygo_create_object_doc_and_image_manager, flexygo_create_object_list_module, flexygo_create_related_list_module, flexygo_create_object_view_module, flexygo_create_page, flexygo_compose_page_batch`

**Result:** Ficha de pedido con plantilla a medida: cabecera (número, cliente, píldora de estado con los 6 colores), detalles (cliente/fecha/forma de pago/dirección), base imponible calculada por subconsulta (SUM de Pedidos_Lineas.Subtotal) y total, progreso del pedido con 5 pasos (Realizado/Confirmado/En proceso/Enviado/Entregado) resaltando el paso alcanzado según el Estado actual. Líneas del pedido embebidas como related list (producto, variante, cantidad, precio, subtotal). Gestor de documentos e imágenes de Flexygo para el box "Documentos" (sustituye los nombres de fichero ilustrativos del mockup, según el supuesto registrado en el plan). Página compuesta con layout syslayout-6. 

ABIERTO, no implementado en esta pasada: los botones Confirmar/Cancelar (cambio real de IdEstado) y Generar PDF (decidido en D-4 como "ya, básico") son toolbar estándar de momento, no procesos a medida — requieren un proceso Dll o stored procedure que esta pasada no ha construido. Igual que en T-10 (Editar/Duplicar/Archivar de Producto), queda anotado para /flx-review en vez de dejarlo a medias silenciosamente.

flexygo_verify_object VTA_Pedido: PASS 8/8. VTA_LineaPedido: 5 PASS, 3 FAIL esperados (sin ficha/filtros/páginas propias, por diseño).

## 2026-09-15 · T-19 · OK

**Tool:** `flexygo_create_relation_batch`

**Result:** 5 relaciones creadas: Tarifas→Clientes, Clientes→Pedidos, Pedidos_Estados→Pedidos, Pedidos→Pedidos_Lineas, Productos→Pedidos_Lineas. Todas correctas a la primera.

## 2026-09-15 · T-20 · OK

**Tool:** `flexygo_script_data_structure`

**Result:** 16 ficheros escritos en flxCatalog.Data.Database/dbo (12 tablas, incluye las 11 de este desarrollo más la SampleTable de la plantilla). El esquema ya viaja al proyecto SSDT para publicarse en cualquier instalación.

## 2026-09-15 · T-21 · OK

**Tool:** `flexygo_set_skin_variable`

**Result:** 6 variables de skin aplicadas con los valores leídos de las pantallas aprobadas: NavColor #1c1b1d, txtNavColor #ffffff, HeaderColor #ffffff, bgColor #FAFAFA, OutstandingColor #333234 (derivado del resalte del ítem activo del menú, ya que el diseño no usa un acento saturado), PrimaryColor #000000. NotifyColor no aparece en ningún diseño aprobado, se deja sin tocar tal y como decía el plan.

## 2026-09-15 · T-22 · OK

**Tool:** `flexygo_register_project_plugin, flexygo_create_html_module, flexygo_create_easy_info_module, flexygo_create_chart_module, flexygo_update_chart_module, flexygo_create_object_list_module, flexygo_create_page, flexygo_compose_page_batch`

**Result:** Panel de control (página HOME, syslayout-20, 5 módulos): plugin flx-dashboard.css registrado (PARTE 1 del recetario, deshace mayúsculas y doble tarjeta del skin — no hace falta la PARTE 2 porque hay diseño aprobado); banner HTML; 4 KPI (Ventas hoy, Pedidos hoy, Pedidos pendientes, Clientes activos); gráfico de barras "Ventas por mes" (6 meses) y donut "Ventas por familia" (coloreado por las 3 familias de nivel superior del modelo: Ropa/Calzado/Accesorios — a definir así en el seed de T-26); segundo listado de Pedidos (últimos 60 días) reutilizando la plantilla de L-PE, en la posición inferior. Desviación: el objectFilter de un gráfico se guardó primero con "&gt;" en vez de ">" (error de escapado en la llamada), detectado y corregido con flexygo_update_chart_module antes de cerrar la tarea. Recuerda: el plugin nuevo necesita reiniciar Backend y Frontend para verse.

## 2026-09-15 · T-23 · OK

**Tool:** `flexygo_update_interface`

**Result:** Interfaz 'webdefault' (skin flexy2022, la que llevan los 6 colores aplicados en T-21) fijada con StartupPageName=HOME. Ninguna interfaz tenía IsDefault=true; se asume que webdefault es la que usa esta aplicación por ser la única sobre flexy2022 sin marcar como guest/mobile — a confirmar en /flx-verify si el login no abre ahí. Su MainNavigateId sigue apuntando al root "Work Area" de la plantilla (vacío para esta app); T-25 lo redirige al árbol propio.

## 2026-09-15 · T-24 · OK

**Tool:** `flexygo_execute_ddl, flexygo_create_properties, flexygo_create_object_list_module, flexygo_create_page, flexygo_add_page_module`

**Result:** Añadida la columna ImagenPrincipal a Productos (no estaba en T-07; la rejilla pública la necesita y el gestor de documentos/imágenes de la ficha no sirve para esto — sus enlaces caducan en una hora, según la guía de esquema y semillas). Propiedad CAT_Producto.ImagenPrincipal creada (typeId image). Módulo de listado con plantilla de tarjetas (list-cards adaptada): foto cuadrada, familia·marca, nombre, precio, píldora Sin stock/Novedad/Oferta, botón "Añadir al carrito" deshabilitado (decisión D-4: placeholder visual, sin persistencia). objectFilter Activo=1 para no publicar productos inactivos. Página CAT_Catalogo_Publico (genérica) con el módulo.

DESVIACIÓN IMPORTANTE, no resuelta: la pantalla aprobada P tiene una cabecera PÚBLICA propia (clara, sin la barra lateral oscura del backoffice, con nav Marcas/Novedades/Ofertas/Ayuda/Contacto, buscador, carrito, Iniciar sesión). Esta página vive por ahora dentro del mismo árbol de navegación que el backoffice (supuesto A4 del plan), así que se pintará con la MISMA barra lateral oscura que el resto de la aplicación, no con la cabecera clara del mockup — construir esa cabecera distinta exige una interfaz propia (posiblemente 'webguest') y no estaba en el alcance decidido. Lo marco explícitamente para que /flx-verify lo compare contra la referencia y el usuario decida si hace falta un bloque de "acceso público" separado.

## 2026-09-15 · T-25 · OK

**Tool:** `flexygo_get_profiles, flexygo_update_interface, flexygo_create_navigation_node`

**Result:** DESVIACIÓN IMPORTANTE encontrada y corregida a tiempo: el perfil "default" (que usa la interfaz webdefault/flexy2022, donde T-21 aplicó la paleta y T-23 fijó la página de arranque) tiene 0 usuarios. El único perfil con un usuario real asignado es "2026", que usa la interfaz web2026 (skin2026), distinta de la que configuré. Corregido: fijé también HOME como startupPageName de web2026 (antes tenía su propia página de arranque 'syspage-arranque-2026', que ganaba a la del perfil).

Árbol de navegación construido en el orden aprobado (Panel de control, Productos, Familias, Marcas, Clientes, Pedidos, Catálogo) como hijos de AMBAS raíces existentes: "Barra lateral 2026" (95ccfb38…, la que ve el usuario real de web2026) y "Work Area" (25a4b4d5…, la de webdefault) — 14 nodos en total, por si se usa cualquiera de las dos interfaces. No sustituí MainNavigateId de ninguna interfaz: añadí los nodos a los árboles ya existentes en vez de reemplazarlos, para no perder la funcionalidad de plataforma que cuelga de esas raíces (Seguridad, Sistema, etc.), según recomienda la referencia del shell.

ABIERTO, no resuelto: la paleta de 6 colores de T-21 (flexygo_set_skin_variable) solo escribe en el skin 'flexy2022'. El usuario real está en skin2026, que probablemente tenga sus propias variables — no hay herramienta para tocarlas desde aquí. El panel de control y las pantallas construidas pueden verse con el aspecto por defecto de skin2026 en vez de la paleta aprobada, hasta que esto se revise en /flx-verify.

## 2026-09-15 · T-26 · OK

**Tool:** `flexygo_execute_ddl (CREATE PROCEDURE), flexygo_execute_dml, flexygo_record_missing_capability`

**Result:** Stored procedure dbo.pSeed_ResetDemoData creado (vacía las 11 tablas de este desarrollo y las recarga con datos realistas: 11 familias jerárquicas, 2 marcas, 4 tallas, 3 colores, 5 tarifas, 6 estados de pedido, 8 productos con 7 variantes, 6 clientes, 6 pedidos con 13 líneas — coherente con las pantallas aprobadas D/L-P/F-P/L-C/L-PE/F-PE/P). 

DESVIACIÓN: no existe ninguna herramienta MCP para ejecutar (EXEC) un stored procedure — flexygo_execute_dml lo rechaza explícitamente por tipo de sentencia no permitido. Registrado como capacidad ausente (gaps.md, área datos-semilla). El procedimiento queda creado en la base para reutilizarlo manualmente en el futuro; para sembrar los datos AHORA (con permiso explícito del usuario) ejecuté directamente las mismas sentencias de su cuerpo vía flexygo_execute_dml, con GUID literales en vez de variables. 46 filas insertadas/actualizadas en la última tanda, sin errores.

## 2026-09-15 · T-26 · OK

**Tool:** `flexygo_execute_dml + flexygo_execute_ddl`

**Result:** Añadidas fotos reales a los 8 productos demo, a petición del usuario durante /flx-verify. Descargadas 8 fotos de Wikimedia Commons (CC0/CC BY/CC BY-SA, créditos en flxCatalog.Frontend/wwwroot/flxCatalog/images/productos/CREDITS.md), copiadas a esa misma carpeta y asignadas a Productos.ImagenPrincipal con un UPDATE (ruta relativa /flxCatalog/images/productos/<slug>.jpg). pSeed_ResetDemoData se actualizó (CREATE OR ALTER) para que un futuro reset de datos demo vuelva a dejar estas mismas rutas, en vez de NULL, y así el mecanismo siga siendo reutilizable. Dos fotos (gorra-classic.jpg, chaqueta-trail.jpg) muestran marca real de terceros visible en la prenda (NY Giants / Gore-Tex) — anotado en CREDITS.md, sustituibles si el usuario lo pide. Pendiente de confirmar en pantalla que {{ImagenPrincipal|url}} renderiza bien una ruta relativa de sitio (no se ha podido comprobar visualmente, sin navegador en esta sesión).

## 2026-09-15 · T-01 · OK

**Tool:** `flexygo_update_view + flexygo_update_template + flexygo_create_related_list_module + flexygo_add_page_module`

**Result:** Mejora pedida por el usuario durante /flx-verify, al ver el listado de Familias en pantalla: (1) la jerarquía no se veía — se añadió una columna "Familia padre" (resuelta a nombre, no al id crudo) a la vista CAT_FamiliaDefaultList mediante una subconsulta correlacionada de una sola tabla (SELECT ... FROM Familias p WHERE p.IdFamilia = Familias.IdFamiliaPadre); esto SÍ lo acepta el validador de vistas — a diferencia del intento anterior de un self-join con alias en el FROM/JOIN principal, que seguía rechazado. La plantilla de listado ahora muestra esa columna y añade un indicador "↳" delante del nombre de las familias hijas. (2) Al entrar en una familia no se veía su listado de productos — se creó un related-list module (mod-cat-producto-list-familia, reutilizando la vista/plantilla ya existente de CAT_Producto) y se colocó en CAT_Familia_View, TopPosition order=1, layout 'default' sin cambios (una sola lista adicional cabe en el mismo slot). flexygo_verify_object CAT_Familia: PASS 8/8. Pendiente: los cambios de vista y plantilla no se ven hasta reiniciar Backend+Frontend (caché de plantillas) — se pide permiso al usuario antes de reiniciar, ya que está verificando en vivo.

## 2026-09-15 · T-10 · OK

**Tool:** `flexygo_execute_ddl + flexygo_create_process + flexygo_create_menu + flexygo_link_process_to_object + flexygo_add_toolbar_button + flexygo_update_process_parameter`

**Result:** A petición del usuario durante /flx-verify (hallazgo ya abierto en /flx-review), se construyeron de verdad los dos procesos que faltaban en la ficha de Producto: pCAT_ArchivarProducto (SP, pone Activo=0) y pCAT_DuplicarProducto (SP, clona el producto con sus variantes, referencia+"-COPIA", nombre+" (copia)", creado desactivado y con stock a 0). Registrados como procesos tipo 0, con menú y enlazados al objeto CAT_Producto, botones añadidos a la barra de la ficha (tb-cat-producto-view, clon de systb-view). El parámetro IdProducto de ambos se configuró con defaultValue={{IdProducto}} y hide=true para que no pida el id a mano. Probado en vivo: Duplicar sobre 'Camiseta Urban' creó REF-1001-COPIA con sus 4 variantes; Archivar sobre esa copia actualizó ModifiedDate. Registro de prueba borrado (variantes + producto) para no dejar rastro. 'Editar' ya funcionaba de antes (CRUD estándar). Pendiente: la barra sigue teniendo el resto de botones estándar de Flexygo (New/Delete/Templates/...) además de los dos nuevos — no se pidió recortarla.

## 2026-09-15 · T-18 · OK

**Tool:** `flexygo_execute_ddl (2 SP) + flexygo_create_process (2 SP + 1 DLL con QuestPDF) + flexygo_create_menu + flexygo_link_process_to_object + flexygo_add_toolbar_button + flexygo_update_process_parameter`

**Result:** A petición del usuario durante /flx-verify (hallazgo ya abierto en /flx-review y en D-4, que pedía explícitamente el PDF y se había quedado sin construir), se construyeron los tres procesos que faltaban en la ficha de Pedido: pVTA_ConfirmarPedido (SP, Borrador→Confirmado, rechaza si no está en Borrador), pVTA_CancelarPedido (SP, →Cancelado, rechaza si Entregado/Cancelado), pVTA_GenerarPdfPedido (proceso DLL en flxCatalog.Processes/VtaPedidos.cs, usa QuestPDF — ya viene transitivo con Flexygo.Library — para generar un PDF básico con cliente, líneas y totales, descargado vía blob JS). Los tres con botón en la barra de la ficha, parámetro IdPedido con defaultValue={{IdPedido}} oculto, y los dos SP con sqlEnabled condicionado al estado actual (Confirmar solo si Borrador, Cancelar solo si no Entregado/Cancelado). Compilar el proceso DLL exigió parar Backend+Frontend (bloquean las DLLs) y volver a levantarlos. Probado en vivo sobre PED-1037 (Moda Sur, estaba en Borrador): Confirmar lo pasó a Confirmado (comprobado por SQL), Generar PDF descargó un PDF real de 32KB con los datos correctos (cliente, CIF, líneas, total 389,10€), Cancelar lo pasó a Cancelado (comprobado por SQL). Al terminar, devuelto a su estado original (Borrador) por UPDATE directo, ya que era un registro del seed y no uno creado por mí.

## 2026-09-15 · T-18 · OK

**Tool:** `flexygo_create_sql_list_module + flexygo_add_page_module`

**Result:** A petición del usuario, añadido el panel "Información fiscal" que faltaba en la ficha de pedido (dato ya existía en Cliente desde D-3, solo faltaba mostrarlo aquí). Módulo SQL list de una fila (mod-vta-pedido-fiscal-sqllist), objectFilter por Clientes.IdCliente={{IdCliente}}, colocado en RightPosition order=1 debajo de Imágenes/Documentos. Comprobado en pantalla sobre PED-1042 (Comercial Ibérica): muestra razón social, CIF, dirección fiscal y email correctos.

## 2026-09-15 · T-01 · OK

**Tool:** `flexygo_update_view + flexygo_update_template`

**Result:** Cierra del todo el defecto original de 'familia padre' (arrastrado desde el bloque B-1): el listado ya se había arreglado con una subconsulta, pero la FICHA seguía mostrando el GUID en crudo porque su plantilla (flx-cat-familia-view) imprimía {{IdFamiliaPadre}} directamente en vez de un nombre resuelto — el dbcombo en modo lectura no resuelve por sí solo si la plantilla no usa una columna ya resuelta. Añadida la misma subconsulta correlacionada a la vista CAT_FamiliaDefaultView (columna FamiliaPadreNombre) y la plantilla actualizada para usarla. Comprobado en pantalla sobre 'Camisetas': ahora muestra 'Ropa' en vez del GUID.

## 2026-10-26 · T-16 · UNDONE

**Reason:** It did not pass verification: Fails at step 2 (click): Timeout 30000ms exceeded..

## 2026-10-26 · T-16 · OK

**Tool:** `flexygo_update_template`

**Result:** Corrección del 26-oct: el recorrido T-16-cli-cliente-view falló por contraste 2,47:1 en el botón «Nuevo comentario» de la ficha de cliente (texto con el color de acento #2db7b0 sobre blanco). La plantilla flx-cli-cliente-view pinta ahora ese texto con var(--txt-color) y conserva el contorno. Repetido el recorrido: abre la ficha desde el listado de Clientes con sus cinco módulos (volver, ficha, artículos más comprados, pedidos recientes, comentarios internos); captura aceptada como línea base. Queda sin tocar: la tarjeta de la ficha tiene scroll interno porque comparte fila con el gráfico.
