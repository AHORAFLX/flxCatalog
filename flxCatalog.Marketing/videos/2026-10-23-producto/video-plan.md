# Vídeo del producto · flxCatalog · 2026-10-23

Alcance: el producto entero (`/flx-video product`). Formatos: horizontal 1920x1080 y vertical 1080x1920.
Tono: `app-store` (el de un producto completo), sin locución, con música.

## Las nueve respuestas

| Pregunta | Respuesta | De dónde sale |
|---|---|---|
| Qué es y para quién | Un catálogo B2B/B2C completo: portal del cliente y backoffice. Sirve para enseñar a empresas lo que es tener su propio portal de pedidos | `.flexygo/memory/project.md` |
| Qué entrega | Catálogo con tallas y colores, carrito, pedidos con seguimiento, devoluciones, incidencias, documentos; dashboard y mesa de trabajo en kanban | los siete desarrollos cerrados, la ayuda |
| Las palabras del usuario | Las de las pantallas, literales: «Catálogo», «Añadir al carrito», «Elige color y talla», «Mi carrito», «Confirmar pedido», «¿Confirmar este pedido?», «Seguimiento del pedido», «Borrador · Confirmado · En proceso · Enviado · Entregado», «Mesa de trabajo», «Indicadores clave», «Ventas del año» | capturas del 23-oct |
| El aspecto | Inter, acento negro, menú #1c1b1d, fondo de la app #EEF1F4, botones turquesa #2db7b0 (el del logotipo de Flexygo) | `DESIGN.md`, skin flexy2022, `logo.svg` del paquete Flexygo.Frontend 10.0.0-beta.137 |
| Las pantallas reales | Rodadas hoy, cuenta cliente y cuenta admin de demo, a 1920x1080 y a móvil 412x915 @2.625 | `assets/screens/` |
| El flujo | El cliente elige en el catálogo → color y talla → su carrito → el administrador lo ve en su mesa de trabajo → se confirma → seguimiento hasta Entregado → el negocio en el dashboard | guía «Hacer un pedido» y «Seguimiento» de la ayuda |
| El ángulo | Un pedido, a dos lados (mezcla de las propuestas A y B que eligió el usuario) | respuesta del usuario |
| El gancho | El muro de fotos del catálogo con «Tu catálogo. Sus pedidos.» ya en pantalla en el fotograma 0 | |
| El cierre | «flxCatalog», «Catálogo, pedidos y postventa», «Hecho con» + logotipo de Flexygo | |

## El hilo

Un mismo carrito de **139,70 €** (Malla Deportiva Prime x2 + Pantalón Cargo Nova x1) recorre el vídeo:
nace en la tarjeta del catálogo, pasa por «Elige color y talla», llega a «Mi carrito» y aparece en la
columna Borrador del tablero del administrador como CARR-20261013180858 · 139,70 €. Las columnas del tablero
son los mismos estados que el cliente ve en su seguimiento.

## Guion gráfico (22,5 s · 30 fps · música a 120 BPM, cortes en múltiplos de 0,5 s)

| # | Tiempo | Horizontal | Vertical | Texto en pantalla | Sonido |
|---|---|---|---|---|---|
| 1 Gancho | 0,0–3,0 | Las 12 tarjetas reales del catálogo (2 filas) aparecen en diagonal; el título en una banda blanca a la izquierda | Las tarjetas del catálogo de móvil (2 columnas) bajo el título | «Tu catálogo. Sus pedidos.» | entra la música en un compás fuerte |
| 2 Elegir | 3,0–6,0 | La cámara entra en la tarjeta Malla Deportiva Prime (x2); el cursor pulsa «Añadir al carrito»; el botón se convierte en el diálogo «Elige color y talla»; pulsa «Añadir» | El diálogo de móvil, a ancho completo | (los de la pantalla) | dos clics |
| 3 Carrito | 6,0–9,0 | «Mi carrito» con sus dos líneas y Total pedido 139,70 € | El carrito de móvil | (los de la pantalla) | barrido |
| 4 Dos lados | 9,0–13,0 | Pantalla partida: a la izquierda el carrito del cliente, a la derecha la columna Borrador del tablero, con la tarjeta CARR · 139,70 € marcada. Luego el cliente pulsa «Sí» en «¿Confirmar este pedido?» | Apilado: carrito arriba, columna Borrador abajo; luego el diálogo de confirmar | «Tu cliente lo pide» / «Tú lo ves al momento» | pop en la tarjeta, clic |
| 5 Seguimiento | 13,0–16,0 | La barra «Seguimiento del pedido» se ilumina de Borrador a Entregado | La misma barra, de móvil | «Hasta su puerta» | ticks suaves |
| 6 Negocio | 16,0–19,0 | «Indicadores clave» (Ventas del año 162.849,58 €) y el tablero entero de la mesa de trabajo | Los indicadores de móvil | «Todo el negocio, de un vistazo» | barrido |
| 7 Cierre | 19,0–22,5 | Fondo de la app; «flxCatalog» letra a letra; debajo la línea y «Hecho con» + logotipo de Flexygo | Igual, apilado | «Catálogo, pedidos y postventa» | golpe en la marca, la música cierra en compás |

## Identidad visual

- Fondo: el gris claro de la propia app (#EEF1F4) y tarjetas blancas; nunca un fondo oscuro vacío.
- Tinta #1c1b1d; acento turquesa #2db7b0 racionado: el anillo de la tarjeta CARR, el paso Entregado, el logotipo.
- Inter 700 para títulos (≈7 % del alto del cuadro), 500 para las etiquetas.
- Las pantallas son las capturas reales, recortadas a la pieza que usa cada plano y mostradas a 1,3–2x.

## Datos y lo que no se enseña

- Todo es dato de demo generado por la carga de demostración (`pSeed_ResetDemoData`): clientes, importes, pedidos.
  No hay ninguna persona ni empresa real. Ninguna cadena de conexión ni nombre de servidor aparece.
- El carrito se llenó con permiso del usuario solo para rodar y se vació después (verificado en base: 0 líneas, 0,00 €).
  El pedido nunca se confirmó; el «Sí» del plano 4 es el paso que la guía de ayuda documenta.
- La barra de seguimiento es la de un pedido entregado (PED-1097); se recorta sin el número para no presentarla como el mismo pedido.

## Lo que hubo que esquivar (hallazgos, no arreglos)

- Marca de agua «LICENSE NOT ACTIVATED» de la plataforma abajo a la derecha de cada pantalla: todos los recortes la dejan fuera; no se tapa.
- La ayuda dice «Mi catálogo» y el menú dice «Catálogo»: la ayuda está desactualizada.
- En la tarjeta del tablero, el número CARR-20261013180858 y su importe se parten en dos líneas.
- Abrir «Mi carrito» lanza un aviso «Proceso ejecutado con éxito» sin que el usuario haga nada.
- Abrir la página del carrito por nombre, sin el filtro del menú, la muestra vacía aunque tenga líneas.

Todo esto va al siguiente desarrollo por `/flx-plan`; aquí no se toca la aplicación.

## Audio

- Música: «Happy Beats / Business Moves vol. 1», de ende.app, incluida en el plugin `brag`. El README del plugin pide
  verificar sus términos antes de redistribuirla: **confirmarlos antes de publicar el vídeo**.
- Efectos: Kenney.nl, CC0 (clic, pop, barrido, golpe).

## Texto para compartir

En `share-copy.txt`.
