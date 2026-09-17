# Quality findings — portal-clientes

## 2026-09-17 · module `mod-cat-producto-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | open | Modules.Searcher = false (valor por defecto de flexygo_create_object_list_module, nunca activado). No se construyó ningún flexygo_create_filters para este listado. Con 140 productos y sin buscador ni filtro, la única forma de encontrar un producto concreto es pasar páginas de 50 en 50. | flexygo_update_object_list_module(moduleName:'mod-cat-producto-cliente-list', searcher:true) — el container es 'default', tiene .cntBodyHeader, así que el buscador sí pintaría. |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** list-no-searcher: Modules.Searcher = false (valor por defecto de flexygo_create_object_list_module, nunca activado). No se construyó ningún flexygo_create_filters para este listado. Con 140 productos y sin buscador ni filtro, la única forma de encontrar un producto concreto es pasar páginas de 50 en 50.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-17 · module `mod-vta-pedido-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | open | Modules.Searcher = false, sin filtro construido. Menos crítico que el catálogo (un cliente tendrá normalmente pocos pedidos), pero crece con el tiempo y hoy no hay forma de buscar por número de pedido. | flexygo_update_object_list_module(moduleName:'mod-vta-pedido-cliente-list', searcher:true). |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** list-no-searcher: Modules.Searcher = false, sin filtro construido. Menos crítico que el catálogo (un cliente tendrá normalmente pocos pedidos), pero crece con el tiempo y hoy no hay forma de buscar por número de pedido.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-17 · page `VTA_Pedido_Cliente_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | open | La página solo tiene el módulo mod-vta-pedido-cliente-view. No hay ningún módulo de enlace de vuelta, a diferencia de la ficha de pedido del backoffice (VTA_Pedido_View), que sí lleva su '← Volver a pedidos'. Se llega aquí solo desde el listado 'Mis pedidos', nunca desde el menú, así que la puerta de aplica. | flexygo_create_html_module(moduleName:'mod-vta-pedido-cliente-back-html', containerId:'none', htmlText:'<flx-navbutton type="openpagename" pagename="VTA_Pedido_Cliente_List" objectname="VTA_Pedido" targetid="current" class="flx-back-link">← Volver a mis pedidos</flx-navbutton>') + flexygo_add_page_module en TopPosition antes del módulo de ficha. |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** view-no-way-back: La página solo tiene el módulo mod-vta-pedido-cliente-view. No hay ningún módulo de enlace de vuelta, a diferencia de la ficha de pedido del backoffice (VTA_Pedido_View), que sí lleva su '← Volver a pedidos'. Se llega aquí solo desde el listado 'Mis pedidos', nunca desde el menú, así que la puerta de aplica.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-17 · page `CLI_Cliente_Mi_Ficha_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | open | La página solo tiene el módulo mod-cli-cliente-mi-ficha-view. No hay módulo de enlace de vuelta, a diferencia de la ficha de cliente del backoffice (CLI_Cliente_View), que sí lo lleva. Se llega aquí desde el listado 'Mi ficha' (que en la práctica solo tiene 1 fila, la propia), así que la puerta atrás sigue aplicando aunque el listado sea trivial. | flexygo_create_html_module(moduleName:'mod-cli-cliente-mi-ficha-back-html', containerId:'none', htmlText:'<flx-navbutton type="openpagename" pagename="CLI_Cliente_Mi_Ficha_List" objectname="CLI_Cliente" targetid="current" class="flx-back-link">← Volver</flx-navbutton>') + flexygo_add_page_module en TopPosition antes del módulo de ficha. |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** view-no-way-back: La página solo tiene el módulo mod-cli-cliente-mi-ficha-view. No hay módulo de enlace de vuelta, a diferencia de la ficha de cliente del backoffice (CLI_Cliente_View), que sí lo lleva. Se llega aquí desde el listado 'Mi ficha' (que en la práctica solo tiene 1 fila, la propia), así que la puerta atrás sigue aplicando aunque el listado sea trivial.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-17 · module `mod-cat-producto-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher = false (valor por defecto de flexygo_create_object_list_module, nunca activado). No se construyó ningún flexygo_create_filters para este listado. Con 140 productos y sin buscador ni filtro, la única forma de encontrar un producto concreto es pasar páginas de 50 en 50. | flexygo_update_object_list_module(moduleName:'mod-cat-producto-cliente-list', searcher:true). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-17 · module `mod-vta-pedido-cliente-list`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `list-no-searcher` | fixed | Modules.Searcher = false, sin filtro construido. | flexygo_update_object_list_module(moduleName:'mod-vta-pedido-cliente-list', searcher:true). |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-17 · page `VTA_Pedido_Cliente_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La página solo tenía el módulo de ficha, sin enlace de vuelta. | Módulo flx-html mod-vta-pedido-cliente-back-html (containerId:'none', flx-navbutton openpagename→VTA_Pedido_Cliente_List) colocado en TopPosition order 0, ficha movida a order 1. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.

## 2026-09-17 · page `CLI_Cliente_Mi_Ficha_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | La página solo tenía el módulo de ficha, sin enlace de vuelta. | Módulo flx-html mod-cli-cliente-mi-ficha-back-html (containerId:'none', flx-navbutton openpagename→CLI_Cliente_Mi_Ficha_List) colocado en TopPosition order 0, ficha movida a order 1. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.
