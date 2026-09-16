# Funcionalidades — índice

Este documento original, `../Catálogo Demo Flexygo - Funcionalidades.md` (101 secciones, ~2050 líneas),
se ha troceado por área funcional para que cada fase de planificación (`/flx-plan`, `/flx-discuss`)
pueda leer solo el bloque que necesita en lugar de cargar el documento completo. El original se
conserva íntegro como referencia y fuente de verdad; estos ficheros son un recorte literal de sus
secciones, agrupadas por tema.

| Fichero | Contenido | Secciones origen |
|---|---|---|
| [00-vision-general.md](00-vision-general.md) | Objetivo del proyecto, elementos de Flexygo a demostrar, filosofía | 1, 96, 101 |
| [01-usuarios-accesos-seguridad.md](01-usuarios-accesos-seguridad.md) | Tipos de usuario, roles, comercial, auditoría, seguridad de demo pública | 2, 59, 60, 61, 95 |
| [02-catalogo-productos.md](02-catalogo-productos.md) | Familias, productos, imágenes, variantes, atributos, etiquetas, buscador, filtros, stock | 4-13, 38, 39, 68-71 |
| [03-clientes-comercial.md](03-clientes-comercial.md) | Clientes, contactos, direcciones, perfil, gestión de clientes | 17, 18, 19, 47, 51 |
| [04-precios-tarifas-promociones.md](04-precios-tarifas-promociones.md) | Tarifas, tarifas por cliente, descuentos, promociones, códigos promocionales | 20-25 |
| [05-carrito-pedidos.md](05-carrito-pedidos.md) | Favoritos, listas, comparador, carrito, pedidos, workflow de pedidos | 14-16, 26-33, 37, 56, 57 |
| [06-presupuestos-postventa.md](06-presupuestos-postventa.md) | Presupuestos, productos personalizados, seguimiento, facturas, devoluciones, incidencias | 34-36, 40-44 |
| [07-notificaciones-comunicacion.md](07-notificaciones-comunicacion.md) | Notificaciones, email, contacto, formularios dinámicos, comentarios | 45, 46, 74, 75, 80 |
| [08-dashboards-informes.md](08-dashboards-informes.md) | Dashboard cliente y admin, gráficos, informes, generación de documentos, firma | 3, 49, 50, 88-90 |
| [09-administracion-backoffice.md](09-administracion-backoffice.md) | Gestión de productos, edición/importación masiva, histórico, tareas, aprobaciones, timeline, adjuntos, calendario, mapa | 48, 52-55, 58, 77-79, 81-83 |
| [10-contenido-web-publica.md](10-contenido-web-publica.md) | Multiidioma, responsive, tema, personalización, banners, landing, noticias, ayuda, menús | 62-67, 72, 73, 76, 97-99 |
| [11-automatizaciones-ia.md](11-automatizaciones-ia.md) | Automatizaciones (carrito abandonado, reposición, etc.), IA | 87, 91 |
| [12-integraciones-api.md](12-integraciones-api.md) | APIs, webhooks, integraciones externas | 84-86 |
| [13-datos-demo-modelo.md](13-datos-demo-modelo.md) | Datos demo, clientes demo, reset de la demo, modelo funcional principal | 92-94, 100 |

## Cómo usarlo

- Para planificar un bloque concreto, lee solo el fichero de esa área — no hace falta abrir el
  documento original completo.
- El **modelo funcional principal** (13) y la **visión general** (00) son los dos puntos de partida
  recomendados antes de proponer un modelo de datos, porque fijan las entidades principales y el
  criterio de diseño ("cada pantalla enseña algo de Flexygo").
- Dado el tamaño (más de 100 funcionalidades), este proyecto encaja con `/flx-build-product`
  (construcción de una aplicación completa, bloque a bloque) más que con un único plan monolítico.
