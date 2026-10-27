
## 2026-10-26 · Reseñas de producto (P-RESEÑAS)

**Measured against:** reference/p-resenas.png (y su fuente p-resenas.html medida con la sonda v3 a 1440 px) frente a screenshots/verify/2026-10-26-t-06-t-07-t-08-8-resenas-after.png, sobre la ficha del producto «Abrigo Niño Deluxe» (REF-2138) abierta desde el catálogo por la cliente Marta Rodríguez Díaz, con 1 reseña de Nacional Retail S.L.U.

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | similar | Botón «Publicar reseña»: original #000000, construido #000000 (antes #616e7c de la skin; fijado en el CSS del bloque). Estrellas: #f59e0b en ambos. Fondo del resumen: #f9f9fa en ambos. Lo que difiere es el tono de texto que da la skin del usuario: título #1a1c1d en el original frente a #1d2429 construido, texto apagado #5d5e66 frente a #555e6c. La skin2026 del usuario no toma las variables de paleta. | raised | platform |  |
| `typography` | similar | Tamaños y pesos ya iguales, medidos en ambos lados: título 20px/600, nota 20px, nombre 14px/500, texto 14px con interlineado 1,625, «Escribe tu reseña» 14px/500 y «Tu puntuación» 12px. Solo difiere la familia: Inter en el original y Geist en el construido, que es la de toda la aplicación. | raised | scope | D-13 |
| `list-row` | same | Cada reseña muestra avatar de 32px con iniciales y borde, nombre, estrellas, fecha relativa a la derecha y texto sangrado 44px, igual que en el original. Antes la fecha salía vacía y el avatar medía 40px. | done |  |  |
| `record-card` | different | La cabecera de la ficha difiere. Original: REF y la píldora «Activo» en una línea y el nombre en un h1 de 40px. Construido: REF, nombre en h3 y píldora debajo. Además los valores de Detalles van a 13,5px/400, frente a 14px/500 del original. Es la plantilla de producto de catalogo-demo, compartida con la ficha del administrador. | raised | scope | D-13 |
| `kpi-tile` | notapplicable | La pantalla no tiene ningún indicador. El resumen «5,0 ★ (1 reseña)» es un distintivo del bloque y está medido en spacing. |  |  |  |
| `badges` | similar | La píldora «Activo» es verde con punto en ambos. El original usa texto #047857 sobre #ecfdf5 y el construido el estado de éxito de la skin, en un tono más oscuro. Sale de la plantilla de producto de catalogo-demo. | raised | scope | D-13 |
| `spacing` | same | Medido igual en ambos lados. Resumen: relleno 6px 12px, separación 12px, radio 4px. Área de texto: radio 4px, relleno 8px 12px, alto mínimo 96px. Botón: relleno 8px 24px, radio 4px. Antes había 10px, 8px y 10px 20px. | done |  |  |
| `iconography` | similar | Las estrellas de valoración son el glifo relleno ★ en el construido y la estrella Material de contorno en el original. Se mantiene el glifo relleno porque el relleno parcial de la media se pinta superponiendo estrellas rellenas recortadas. | raised | template | D-13 |
| `composition` | same | El orden coincide: detalles, separador, cabecera «Reseñas de clientes» con el resumen a la derecha, lista, separador, «Escribe tu reseña» con «Tu puntuación» a la derecha, área de texto y botón alineado a la derecha. | none |  |  |
| `density` | same | El bloque de reseñas reparte el espacio en la misma proporción: una fila por reseña, con separadores de 1px. | none |  |  |
| `nav-and-branding` | notapplicable | El original es una ventana suelta sin la estructura de la aplicación. No hay panel ni marca que comparar. |  |  |  |
| `module-chrome` | different | El original solo tiene la barra de la ventana con el título y los iconos de ventana. El construido añade dentro del diálogo la cabecera del visor genérico de la plataforma, que repite el título y lleva el menú ⋮. Ese visor es de la plataforma y lo comparten todas las fichas. | raised | scope | D-13 |
| `toolbar-and-actions` | same | La única acción es el botón principal «Publicar reseña», abajo a la derecha. El original no tiene barra de herramientas ni paginador. | none |  |  |

**What the screen does not show** (K-51)

| What | Kind | Resolution |
|---|---|---|
| El formulario de reseña solo aparece si el cliente ha comprado ese producto. Si no, se muestra «Solo puedes escribir una reseña de un producto que hayas comprado.» | derived-value | read-from-source |
| Un producto sin reseñas muestra «Todavía no hay reseñas para este producto.» y el resumen «Todavía no tiene reseñas». | state | read-from-source |
| Publicar sin puntuación o sin texto avisa y no guarda nada. | control | read-from-source |

**Does not meet it yet:** palette (similar); record-card (different); badges (similar); iconography (similar); module-chrome (different)

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** composition: El orden coincide: detalles, separador, cabecera «Reseñas de clientes» con el resumen a la derecha, lista, separador, «Escribe tu reseña» con «Tu puntuación» a la derecha, área de texto y botón alineado a la derecha.; density: El bloque de reseñas reparte el espacio en la misma proporción: una fila por reseña, con separadores de 1px.; toolbar-and-actions: La única acción es el botón principal «Publicar reseña», abajo a la derecha. El original no tiene barra de herramientas ni paginador.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).

## 2026-10-26 · P-RESEÑAS

**Measured against:** reference/p-resenas.png (y su fuente p-resenas.html medida con la sonda v3 a 1440 px) frente a screenshots/verify/2026-10-26-t-06-t-07-t-08-8-resenas-after.png, sobre la ficha del producto «Abrigo Niño Deluxe» (REF-2138) abierta desde el catálogo por la cliente Marta Rodríguez Díaz, con 1 reseña de Nacional Retail S.L.U. (Misma comparación que la entrada anterior «Reseñas de producto (P-RESEÑAS)», registrada con el nombre exacto de la referencia.)

**Deviations:** not recorded — the comparator's count for this screen was not passed, so this pass cannot be subtracted from another.

| Row | Verdict | Note | Fix | Cause | Decision |
|---|---|---|---|---|---|
| `palette` | similar | Botón «Publicar reseña»: original #000000, construido #000000 (antes #616e7c de la skin; fijado en el CSS del bloque). Estrellas: #f59e0b en ambos. Fondo del resumen: #f9f9fa en ambos. Lo que difiere es el tono de texto que da la skin del usuario: título #1a1c1d en el original frente a #1d2429 construido, texto apagado #5d5e66 frente a #555e6c. La skin2026 del usuario no toma las variables de paleta. | raised | platform |  |
| `typography` | similar | Tamaños y pesos ya iguales, medidos en ambos lados: título 20px/600, nota 20px, nombre 14px/500, texto 14px con interlineado 1,625, «Escribe tu reseña» 14px/500 y «Tu puntuación» 12px. Solo difiere la familia: Inter en el original y Geist en el construido, que es la de toda la aplicación. | raised | scope | D-13 |
| `list-row` | same | Cada reseña muestra avatar de 32px con iniciales y borde, nombre, estrellas, fecha relativa a la derecha y texto sangrado 44px, igual que en el original. Antes la fecha salía vacía y el avatar medía 40px. | done |  |  |
| `record-card` | different | La cabecera de la ficha difiere. Original: REF y la píldora «Activo» en una línea y el nombre en un h1 de 40px. Construido: REF, nombre en h3 y píldora debajo. Además los valores de Detalles van a 13,5px/400, frente a 14px/500 del original. Es la plantilla de producto de catalogo-demo, compartida con la ficha del administrador. | raised | scope | D-13 |
| `kpi-tile` | notapplicable | La pantalla no tiene ningún indicador. El resumen «5,0 ★ (1 reseña)» es un distintivo del bloque y está medido en spacing. |  |  |  |
| `badges` | similar | La píldora «Activo» es verde con punto en ambos. El original usa texto #047857 sobre #ecfdf5 y el construido el estado de éxito de la skin, en un tono más oscuro. Sale de la plantilla de producto de catalogo-demo. | raised | scope | D-13 |
| `spacing` | same | Medido igual en ambos lados. Resumen: relleno 6px 12px, separación 12px, radio 4px. Área de texto: radio 4px, relleno 8px 12px, alto mínimo 96px. Botón: relleno 8px 24px, radio 4px. | done |  |  |
| `iconography` | similar | Las estrellas de valoración son el glifo relleno ★ en el construido y la estrella Material de contorno en el original. Se mantiene el glifo relleno porque el relleno parcial de la media se pinta superponiendo estrellas rellenas recortadas. | raised | template | D-13 |
| `composition` | same | El orden coincide: detalles, cabecera «Reseñas de clientes» con el resumen a la derecha, lista, «Escribe tu reseña» con «Tu puntuación» a la derecha, área de texto y botón alineado a la derecha. | none |  |  |
| `density` | same | El bloque de reseñas reparte el espacio en la misma proporción: una fila por reseña, con separadores de 1px. | none |  |  |
| `nav-and-branding` | notapplicable | El original es una ventana suelta sin la estructura de la aplicación. No hay panel ni marca que comparar. |  |  |  |
| `module-chrome` | different | El original solo tiene la barra de la ventana con el título y los iconos de ventana. El construido añade dentro del diálogo la cabecera del visor genérico de la plataforma, que repite el título y lleva el menú ⋮. Ese visor es de la plataforma y lo comparten todas las fichas. | raised | scope | D-13 |
| `toolbar-and-actions` | same | La única acción es el botón principal «Publicar reseña», abajo a la derecha. El original no tiene barra de herramientas ni paginador. | none |  |  |

**What the screen does not show** (K-51)

| What | Kind | Resolution |
|---|---|---|
| El formulario de reseña solo aparece si el cliente ha comprado ese producto. Si no, se muestra «Solo puedes escribir una reseña de un producto que hayas comprado.» | derived-value | read-from-source |
| Un producto sin reseñas muestra «Todavía no hay reseñas para este producto.» y el resumen «Todavía no tiene reseñas». | state | read-from-source |
| Publicar sin puntuación o sin texto avisa y no guarda nada. | control | read-from-source |

**Does not meet it yet:** palette (similar); typography (similar); record-card (different); badges (similar); iconography (similar); module-chrome (different)

**CLOSED on the rows.** Every one is `same`, `not-applicable` with its reason, or `raised` with its class of cause.

**Declared as nothing-to-close (fix: none):** composition: El orden coincide: detalles, cabecera «Reseñas de clientes» con el resumen a la derecha, lista, «Escribe tu reseña» con «Tu puntuación» a la derecha, área de texto y botón alineado a la derecha.; density: El bloque de reseñas reparte el espacio en la misma proporción: una fila por reseña, con separadores de 1px.; toolbar-and-actions: La única acción es el botón principal «Publicar reseña», abajo a la derecha. El original no tiene barra de herramientas ni paginador.. Read the notes — a note that names a difference is a parked row by doctrine (§5-bis).
