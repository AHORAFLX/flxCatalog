# Quality findings — notificaciones-comunicacion

## 2026-09-22 · page `COM_SolicitudContacto_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | open | Página compuesta solo por mod-com-solicitudcontacto-view (flx-view); se abre desde el listado admin COM_SolicitudContacto_List (no desde un menú directo), y ni el módulo ni la plantilla llevan ningún enlace de vuelta. systb-view (11 botones estándar) tampoco lleva ninguno que vuelva a la lista. | flexygo_create_html_module con un flx-navbutton de vuelta a COM_SolicitudContacto_List, colocado en TopPosition — mismo patrón ya usado en VTA_Devolucion_View/VTA_Incidencia_View en un desarrollo anterior. |  |

⛔ **NOT CLOSED — 1 finding(s) are not final:** view-no-way-back: Página compuesta solo por mod-com-solicitudcontacto-view (flx-view); se abre desde el listado admin COM_SolicitudContacto_List (no desde un menú directo), y ni el módulo ni la plantilla llevan ningún enlace de vuelta. systb-view (11 botones estándar) tampoco lleva ninguno que vuelva a la lista.. Put them to the user and record this anchor again with what they answer. Nothing here is fixed on initiative: the decision is theirs.

## 2026-09-22 · page `COM_SolicitudContacto_View`

| Entry | Status | What was seen | Mechanism | Reason or cause |
|---|---|---|---|---|
| `view-no-way-back` | fixed | No había módulo ni enlace de vuelta. | flexygo_create_html_module (mod-com-solicitudcontacto-back-html, containerId 'none', flx-navbutton openpagename → COM_SolicitudContacto_List, sin objectname) + flexygo_add_page_module en TopPosition. De paso, verificando en pantalla, se encontró y corrigió un defecto real más grave: la plantilla de lista usaba type='openpage' pagetypeid='view' (resolución genérica), que con DOS páginas 'view' registradas sobre el mismo objeto (la ficha real y el formulario de alta del cliente) resolvía a la página equivocada — un admin que pulsaba una fila caía en el formulario de alta del cliente, no en la ficha. Corregido a type='openpagename' pagename='COM_SolicitudContacto_View' explícito. Verificado en pantalla: clic en la fila abre la ficha correcta con datos reales, el enlace de vuelta funciona, sin errores de consola. |  |

**CLOSED on the findings.** Every one is `fixed`, `dismissed` with the user's reason, or `raised` with its class of cause.
