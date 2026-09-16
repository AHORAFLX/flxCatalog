# Decisions — catalogo-demo

## 2026-09-14 · affects development

**Question:** Modelo del primer bloque (Cliente, Producto+Variante, Pedido, maestras Familia/Marca/Talla/Color/EstadoPedido/Tarifa): ¿correcto para empezar? ¿Se generan datos de prueba?

**User answer:** Modelo aprobado tal cual. Sí a datos de prueba, pero implementados como un stored procedure ejecutable que primero vacía toda la base de datos y luego recrea los datos demo (mecanismo de reset reutilizable, no un INSERT suelto de una vez).

## 2026-09-14 · affects development

**Question:** ¿Qué proyecto y sistema de diseño de Stitch se usó para dibujar las pantallas web de flxCatalog?

**User answer:** Proyecto Stitch "flxCatalog": projects/15428611361078160014. Sistema de diseño de escritorio (desktop): assets/94f3f699a84b47b8a536af88cfb017db, derivado del DESIGN.md del proyecto (sin identidad de marca propia decidida — paleta neutra elegida por el generador). Reutilizar este mismo assetId en desarrollos futuros del mismo producto en vez de generar un sistema nuevo.

## 2026-09-14 · affects development

**Question:** Decisión 1 (L-P/L-C/L-PE): los listados añadieron botones "Limpiar filtros" y "Exportar" no pedidos explícitamente. Decisión 2 (F-P): la ficha de producto añade una nota de ayuda bajo las miniaturas de imagen. Decisión 3 (F-PE): la ficha de pedido añade un bloque "Información fiscal" del cliente no presente en el modelo original.

**User answer:** 1: Usar los estándares de Flexygo (se mantienen "Limpiar filtros" y "Exportar" en los tres listados, son mobiliario habitual de listado). 2: A criterio del equipo de diseño (se mantiene la nota de ayuda de formatos/tamaño de imagen, es una ayuda de UX de bajo riesgo). 3: Ampliar el modelo — el objeto Cliente incorpora razón social completa, CIF/NIF, dirección fiscal y email como propiedades propias, no como una invención aislada de la ficha de pedido.

## 2026-09-14 · affects development

**Question:** Alcance de tres comportamientos que las pantallas aprobadas no pueden mostrar por sí solas: el botón "Añadir al carrito" del catálogo público, "Generar PDF" en la ficha de pedido, y "Exportar" en los listados.

**User answer:** Carrito: placeholder por ahora — el botón existe visualmente pero no persiste nada; el carrito funcional (sesión, líneas, checkout) es un desarrollo propio posterior, fuera de este bloque. Generar PDF: se construye ya, un PDF básico de la ficha de pedido. Exportar: se deja el estándar de Flexygo (la capacidad de exportación nativa de un listado), sin construir nada a medida.

## 2026-09-14 · affects development

**Question:** ¿Qué convención de nombres usan las tablas SQL y sus claves en este proyecto (en vez de la convención por defecto del servidor)?

**User answer:** Tablas siempre en plural. Las tablas relacionadas/hijas se nombran con el prefijo de la tabla principal + guion bajo + palabra: Pedidos, Pedidos_Estados, Pedidos_Lineas, Productos, Productos_Variantes. Las columnas identificador (clave primaria y claves foráneas) se llaman "Id" + nombre de la entidad en singular: IdPedido, IdEstado, IdLinea, IdProducto, IdArticulo — nunca "Id" a secas ni con el sufijo "Id" al final (nunca "ProductoId"). Esta convención sustituye a la genérica de Flexygo para todo este proyecto.

## 2026-09-14 · affects plan

**Question:** Plan rewritten (was 4 block(s), 26 task(s))

**User answer:** Reason: Ajuste tras el aviso del propio plan al escribirse: faltaba declarar el punto de entrada de cada página, y cuatro tablas maestras (Tallas, Colores, Pedidos_Estados, Tarifas) se habrían quedado con página construida pero sin ningún nodo de navegación que la abriera — se descartan sus páginas por ahora y se añaden los puntos de entrada explícitos al resto.

## 2026-09-15 · affects T-22

**Question:** Comparando el Panel de control con la pantalla aprobada en Stitch: el original es un dashboard sin cromado (sin cabecera ni iconos de herramientas por tarjeta, tipografía Inter, menos padding); lo construido usa el cromado estándar de Flexygo (cabecera con icono + 3 iconos de herramientas por módulo, tipografía de la skin, más denso). Afecta a 6 de las 12 filas de comparación de diseño (typography, badges, spacing, composition, density, module-chrome). ¿Se invierte en replicar el aspecto sin cromar, o se mantiene el estándar de Flexygo?

**User answer:** Mantener el estándar de Flexygo. Sin trabajo adicional: la cabecera de cada tarjeta, sus 3 iconos de herramientas (refrescar/configurar/menú) y la tipografía de la skin se quedan como están — coherente con la decisión D1 ya tomada para los listados ("usa los estándares de flexygo").

## 2026-09-15 · affects T-10

**Question:** La Ficha de producto aprobada en Stitch muestra un panel de imágenes con galería real (miniaturas + botón subir). El componente estándar de Flexygo (doc/image manager) solo puede mostrar un contador '0 Imágenes / 0 Documentos', nunca miniaturas — una galería real sería una pantalla a medida. ¿Se construye ahora o se deja pendiente?

**User answer:** Se deja pendiente por ahora. El usuario priorizó construir ya los procesos Duplicar y Archivar (que sí tienen un camino directo); la galería de imágenes es un desarrollo mayor (pantalla a medida) que se queda para una fase posterior.

## 2026-09-15 · affects T-24

**Question:** El Catálogo público aprobado en Stitch tiene una cabecera pública propia (menú Catálogo/Marcas/Novedades/Ofertas/Ayuda/Contacto, carrito, Iniciar sesión, sin barra lateral oscura). Lo construido cuelga del mismo árbol de navegación y cabecera que el backoffice (barra lateral oscura con Seguridad/Centinela/Modo Desarrollo visibles) — esto ya estaba anotado como asunción S-4 ('el acceso anónimo real es una configuración de seguridad de un bloque posterior'), sin una decisión formal D-n asociada. Se decide de forma autónoma (sesión desatendida): ¿construir ya la cabecera pública con acceso anónimo real, o mantener S-4 tal cual?

**User answer:** Mantener S-4 tal cual. Construir un acceso anónimo real (interfaz webguest, seguridad de objetos/páginas separada del backoffice, cabecera pública sin la barra lateral de administración) es un desarrollo de seguridad propio, no una tarea de plantilla o CSS — no se improvisa sin usuario presente. Queda como hallazgo abierto para un desarrollo posterior dedicado a la seguridad del catálogo público.
