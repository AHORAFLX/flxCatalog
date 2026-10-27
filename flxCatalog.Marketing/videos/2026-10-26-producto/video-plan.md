# Vídeo del producto · Catálogo Flexygo · 2026-10-26

| Decisión | Respuesta del usuario |
|---|---|
| Alcance | El producto entero (`/flx-video product`) |
| Forma | Marketing de resumen de funcionalidades → `tour`: una funcionalidad construida por escena |
| Formatos | Todos: horizontal 1920x1080, vertical 1080x1920, cuadrado 1080x1080 |
| Tono | «Marketing» (dirección libre) → preset `app-store`: tarjetas de funcionalidad limpias, ritmo vivo |
| Duración | 30 s |
| Música / efectos | Sí / sí |
| Voz en off | No |
| Título | «Catálogo Flexygo» |

**Se construye sobre:** la lección del 23-oct (`2026-10-23-producto`), que el usuario juzgó peor que los `/brag` de
septiembre: recortes grises de capturas, fotos solo en el gancho, una historia en vez de un recorrido. Esta vez:
pantallas **recreadas** en HTML a tamaño de vídeo, con las fotos reales de producto, y una funcionalidad por escena
(la memoria `brag-video-style`). Los `/brag` de septiembre ya no están en disco; no hay render aprobado con el que comparar.

## Las nueve respuestas

| # | Pregunta | Respuesta | Fuente |
|---|---|---|---|
| 1 | Qué es | Un portal B2B/B2C completo hecho con Flexygo: el cliente compra en su catálogo y el negocio lo gestiona en su backoffice | `.flexygo/memory/project.md` |
| 2 | Lo más impresionante | Todo el ciclo en una aplicación: 140 productos con 624 variantes, carrito, pedido, seguimiento, reseñas, devoluciones, incidencias, tablero y dashboard | siete desarrollos cerrados (157 tareas) |
| 3 | El gancho visual | Las fotos del catálogo (Pexels): el muro de tarjetas con precio y «Añadir al carrito» turquesa | captura `prev-land-01-catalogo` |
| 4 | Qué UI enseñar | Tarjeta de catálogo, «Elige color y talla», «Mi carrito», «Seguimiento del pedido», «Reseñas de clientes», devoluciones/incidencias, «Mesa de trabajo», «Indicadores clave» | capturas de hoy y del 23 |
| 5 | Vídeo más corto que funciona | 30 s (pedido por el usuario): gancho 3 s + 8 funcionalidades x 3 s + cierre 3 s | |
| 6 | Tono | `app-store` con energía de anuncio: cada escena = número, título grande, una línea, la pantalla haciendo su trabajo | |
| 7 | Audio | Base animada (120 BPM), cortes en compás, un efecto por acción visible, campana en la marca | |
| 8 | Texto para compartir | `share-copy.txt` | |
| 9 | Flujo | catálogo → color y talla → carrito → confirmar → seguimiento → reseña; el negocio: postventa → tablero → indicadores | menú del cliente y del admin |

## Ángulo

«Todo lo que vende una tienda B2B, en una aplicación.» Un recorrido rápido en el orden en que lo vive el negocio:
primero lo que ve el cliente (cinco escenas), luego lo que ve quien lo gestiona (tres). Cada escena dice qué es en
dos o tres palabras y lo enseña funcionando: el cursor pulsa, el contador sube, la tarjeta cambia de columna.

## Guion gráfico (30 s · 30 fps · música 120 BPM desde el segundo 15 del tema: compás cada 2 s)

Cada escena de funcionalidad: arriba-izquierda el número (turquesa) y el título (Inter 800), debajo una línea; la
pantalla recreada ocupa el resto. Entrada de escena: barrido lateral 0,4 s (app-store).

| # | Tiempo | Título / línea (en pantalla) | Pantalla recreada y acción | Horizontal | Vertical | Cuadrado | Sonido |
|---|---|---|---|---|---|---|---|
| 1 Gancho | 0–3 | **Catálogo Flexygo** / «Catálogo, pedidos y postventa en una sola aplicación.» + cifras «140 productos · 624 variantes · 110 clientes» | 12 tarjetas reales del catálogo (foto, familia·marca, nombre, precio, «Añadir al carrito», «Novedad») caen en cascada | título a la izquierda, muro de tarjetas inclinado a la derecha | título arriba, muro 2 columnas debajo | título arriba, muro 3 columnas | entrada de la música; golpe suave en el título |
| 2 Catálogo | 3–6 | **01 Catálogo con fotos** / «Familias, marcas, novedades y favoritos.» | 3 tarjetas grandes (Malla Deportiva Prime 34,90 €, Pack Ropa Interior Basic 43,90 € «Novedad», Falda Basic 40,90 € «Novedad») llegan una a una; el cursor marca la estrella ☆→★ de la primera | 3 tarjetas en fila | 2 tarjetas apiladas (como el móvil, 2 col.) + la estrella | 3 tarjetas pequeñas | tarjetas: deslizamiento; clic en la estrella |
| 3 Tallas | 6–9 | **02 Tallas y colores** / «624 variantes, cada una con su stock.» | Diálogo «Elige color y talla» sobre la foto de la Malla: el desplegable se abre (Rosa / XL, Blanco / XXL, Marrón / XL, Marrón / XXL, Beige / S, Blanco / S), elige «Rosa / XL», Cantidad 1→2, clic «Añadir» | foto a la izquierda, diálogo a la derecha | foto arriba, diálogo debajo a ancho completo | foto detrás, diálogo delante | clic, clic |
| 4 Carrito | 9–12 | **03 Carrito y pedido** / «Del catálogo al pedido en dos clics.» | «Mi carrito» CARR-20261013180858 · «Borrador»; «Mis productos»: Pantalón Cargo Nova (Blanco XXL, 1, 69,90 €) y Malla Deportiva Prime (Rosa XL, 2, 69,80 €); «Total pedido» cuenta hasta 139,70 €; clic «Confirmar pedido» → «¿Confirmar este pedido?» → clic «Sí» | tarjeta ancha | líneas apiladas, total grande | igual que vertical, compacto | contador (fichas), clic, clic |
| 5 Seguimiento | 12–15 | **04 Seguimiento del pedido** / «Paso a paso, con su recibo en PDF.» | «Detalle de mi pedido» PED-1097; la barra Borrador → Confirmado → En proceso → Enviado → Entregado se enciende paso a paso; la píldora pasa a «Entregado»; botones «Imprimir Recibo» y «Abrir incidencia» | barra horizontal ancha | barra en vertical (pasos uno bajo otro) | barra horizontal compacta | ticks en cada paso, golpe en Entregado |
| 6 Reseñas | 15–18 | **05 Reseñas de clientes** / «Solo de quien lo ha comprado.» | Foto de la Malla + «Reseñas de clientes 4,3 ★★★★★ (3 reseñas)»; llegan las tres reseñas (Nacional Almacenes S.L.U. ★4, Litoral Confección S.L.U. ★5, Norte Distribución S.L. ★4) | foto izquierda, reseñas derecha | foto arriba, reseñas debajo | foto + 2 reseñas | deslizamientos suaves |
| 7 Postventa | 18–21 | **06 Devoluciones e incidencias** / «La postventa, dentro del mismo portal.» | «Devoluciones»: 4 filas reales con su píldora (Solicitada, En revisión, Aceptada, Abonada); una fila avanza Solicitada → Aceptada. «Listado de incidencias»: 3 filas (Abierta, Cerrada) | dos tarjetas lado a lado | apiladas | apiladas, 3 filas cada una | interruptor al cambiar estado |
| 8 Mesa | 21–24 | **07 Mesa de trabajo** / «Pedidos, incidencias y devoluciones, en un tablero.» | Kanban con pestañas Incidencias · **Pedidos** · Devoluciones; columnas BORRADOR 15, CONFIRMADO 29, EN PROCESO 30, ENVIADO 30, ENTREGADO 28, CANCELADO 14; la tarjeta PED-1031 · 607,16 € pasa de Confirmado a En proceso (29→28, 30→31) | 6 columnas | 2 columnas (Confirmado, En proceso) | 3 columnas | deslizamiento + colocación |
| 9 Indicadores | 24–27 | **08 Indicadores clave** / «Todo el negocio, de un vistazo.» | «Ventas del año» cuenta hasta 162.849,58 €; Pedidos pendientes 59 · Incidencias abiertas 6 · Devoluciones solicitadas 6; «Artículos más vendidos»: las barras crecen (Pack de Calcetines Essential, Zapatilla Niño Essential, Bolso Nova, Malla Deportiva Prime, Pack Ropa Interior Basic) | KPIs arriba, barras abajo | cifra grande, 3 KPIs, barras | igual compacto | fichas en el contador, golpe al cerrar |
| 10 Cierre | 27–30 | **Catálogo Flexygo** / «Catálogo, pedidos y postventa.» / «Hecho con» + logotipo de Flexygo | fila de fotos de producto que se desliza detrás; la marca aterriza en compás | centrado | centrado, más grande | centrado | campana en la marca; la música se desvanece |

Lecturas: los títulos (2-3 palabras) se asientan en 0,4 s y duran la escena entera (≈2,5 s); la línea (≤ 7 palabras)
llega a los 0,5 s y dura ≈ 2,3 s ≥ 0,3 s/palabra.

## Identidad visual

- Fondo: el gris de la app #EEF1F4; tarjetas blancas, radio 16 px, sombra suave; tinta #1C1B1D; texto secundario #71717A.
- Acento: el turquesa de los botones del producto (#2DB7B0, de `flexy2022`/logotipo Flexygo): botones, números de escena,
  la estrella marcada, el paso actual. Estados con los colores del producto: éxito #16A34A, aviso #CA8A04, peligro #DC2626.
- Las barras del dashboard: índigo #6366F1, como en la pantalla.
- Inter 800 títulos, 600 etiquetas, 400 texto. Tamaños mínimos: 28 px de interfaz en horizontal, 34 px en vertical.
- Color de las escenas: las fotos reales de producto (17 fotos de Pexels del propio producto, `assets/photos/`).

## Datos y lo que no se enseña

- Todo es dato de la carga de demostración (`pSeed_ResetDemoData`): clientes, importes, pedidos, reseñas. Ninguna persona
  ni empresa real; ninguna cadena de conexión, servidor ni URL.
- Las cifras salen de la base de demo y de las pantallas de hoy (26-oct): 140 productos, 624 variantes, 110 clientes,
  162.849,58 € de ventas del año, 59 pedidos pendientes, 6 incidencias abiertas, 6 devoluciones solicitadas, columnas
  del tablero 15/29/30/30/28/14.
- No se escribió nada en la base para rodar. El carrito de 139,70 € es el de la captura del 23-oct (se vació después);
  el paso «Sí» y el avance de PED-1031 a «En proceso» y de una devolución a «Aceptada» son estados **recreados** en el
  vídeo, que la aplicación permite (botón «Confirmar pedido», tablero kanban, estados de devolución), sin escribirlos.
- Las barras de «Artículos más vendidos» siguen el orden y las longitudes que pinta el dashboard.

## Lo que hubo que esquivar (hallazgos, no arreglos)

- La marca de agua «LICENSE NOT ACTIVATED» en todas las pantallas: no aparece porque las pantallas se recrean.
- La contraseña de admin se dio dos días antes del rodaje; la aplicación se había parado entre medias (no es un fallo del producto).
- La ficha de producto de admin dice «Imágenes 0» aunque el producto tiene foto principal: la foto vive en
  `ImagenPrincipal`, no en el gestor de imágenes. Lo ve el admin; va al siguiente desarrollo por `/flx-plan`.
- Siguen vigentes los del 23-oct: aviso «Proceso ejecutado con éxito» al abrir «Mi carrito»; CARR-… partido en dos líneas en
  la tarjeta del tablero.

## Audio

- Música: «Happy Beats / Business Moves vol. 1», de ende.app, incluida en el plugin `brag` (120,19 BPM), desde el 15,0 s del
  tema para que sus tiempos caigan en x,0 / x,5 del vídeo. El README del plugin pide **verificar sus términos de licencia
  antes de publicar**. Sin verificar, el vídeo no se publica con ella.
- Efectos: Kenney.nl, CC0: `click_002`, `mouseclick1`, `drop_002`, `card-slide-2`, `card-place-1`, `chips-stack-2`,
  `rollover2`, `impactSoft_medium_001`, `impactBell_heavy_000`; volumen 0,55–0,8.
- Reactivo al audio: ninguno. Cada escena ya tiene su acción (cursor, contador, tarjeta que cambia de columna) y un
  movimiento más competiría con la lectura de la pantalla recreada.

## Texto para compartir

En `share-copy.txt`.
