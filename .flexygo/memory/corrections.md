# User corrections

What the user has corrected the agent on. **Unverified**: they are the user's own statements, not checked facts — they are recorded because they are knowledge the agent was missing.

## 2026-09-16 · project (this client only)

**The agent said:** Tras el barrido de /flx-quality, di por hecho que la ausencia de un buscador de texto libre en los listados era un hueco a cerrar (catálogo de calidad, entrada list-no-searcher), y activé searcher:true en los 6 listados principales más una regla CSS de plugin para que la plataforma dejara de ocultarlo.

**The user corrects:** Añade como error, lo que has hecho para que sea visible el buscador del propio modulo que has arreglado en flexygo, deshazlo. No lo quiero, me vale con los filtros que ya hay configurado.

## 2026-09-16 · platform (good for any project)

**The agent said:** Que un flx-objectlist no tiene ningún lever para un orden por defecto fiable, porque su vista (Objects_Views) no admite ORDER BY en la sentencia SQL — y que por eso había que elegir entre el botón "Nuevo" nativo (object-list) o un orden fiable (sqllist con ORDER BY en la propia consulta), sin poder tener ambas cosas a la vez.

**The user corrects:** "Ya está, no se porque te era complicado, en Objects_Views, flexygo tiene un campo para ello, lo he rellenado y listo." — la pantalla de administración de Objects_Views tiene un campo separado "Ordenar por" (columna OrderBy), distinto de la Sentencia SQL, donde se escribe literalmente "ORDER BY Familias.OrdenJerarquico" y la plataforma lo aplica igual.

## 2026-09-17 · platform (good for any project)

**The agent said:** Al arreglar la ambigüedad de página (dos páginas 'view' para el mismo objeto), cambié varias plantillas de listado de usar `type="openpage" pagetypeid="view" objectname="X" objectwhere="..."` a `type="openpagename" pagename="X_View" objectwhere="..."`, sin incluir `objectname` — y di por buena esa forma porque ya la había visto en otra plantilla construida en esta misma sesión, sin comprobar contra la referencia de sintaxis de plantillas, que documenta objectname como parte obligatoria del patrón de navegación de fila.

**The user corrects:** "El error es porque todas las plantillas de lista que has hecho, usan un componente <flx-navbutton> que tienen pagename, tienen objectwhere pero no tienen objectname. Te ha pasado en muchos sitios de la aplicacion y es un fallo bastante gordo gordo, deberias dejarlo apuntado para que se arregle además de revisarte todas las plantillas que has creado tu (originid 1) y ver si tiene el objectname o no y se lo pongas según corresponda."

## 2026-09-17 · platform (good for any project)

**The agent said:** Registré como hueco de plataforma (área 'module-tokens') que el token {{ParentPK}} en el objectFilter de un módulo relacionado (flx-objectlist/flx-echart) no se resolvía nunca en tiempo de ejecución, con "pruebas" de red que mostraban el token sin sustituir en la respuesta del servidor.

**The user corrects:** El usuario señaló que el problema real era que las plantillas de listado que edité (flx-cli-cliente-list, flx-vta-pedido-list) usaban <flx-navbutton> con pagename y objectwhere pero SIN objectname. Al añadir objectname a la fila que abre la ficha del cliente, el token {{IdCliente}} de los módulos hermanos (Pedidos recientes, Artículos más comprados) empezó a resolver solo, sin ningún cambio en esos módulos. Es decir: no hay ningún fallo de plataforma en la resolución de tokens de módulos relacionados — el objectname del navbutton que abre la página es lo que establece el contexto de registro que esos módulos necesitan, y mi plantilla no lo llevaba.
