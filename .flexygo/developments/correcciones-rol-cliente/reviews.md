# Reviews — correcciones-rol-cliente

## 2026-09-25 · affects T-01

**Agreed:** Aplicar las 7 variables de skin (NavColor, txtNavColor, HeaderColor, bgColor, OutstandingColor, PrimaryColor, NotifyColor) con los valores de la pantalla aprobada P-RESEÑAS.

**Found:** Skin flexy2022 con esos 7 valores ya aplicados, coincidentes con lo instalado (NavColor #1c1b1d, txtNavColor #ffffff, HeaderColor #ffffff, bgColor #FAFAFA, OutstandingColor #333234, PrimaryColor #000000, NotifyColor #4361ee).

**Deviation:** Ninguna.

## 2026-09-25 · affects T-02

**Agreed:** "Mi ficha" pasa de proceso a navegación directa a CLI_Cliente_Mi_Ficha_View con ObjectWhere filtrando por el cliente actual.

**Found:** Confirmado en el árbol de navegación: nodo "Mi ficha" (042c02b7-...) con page=CLI_Cliente_Mi_Ficha_View, sin proceso. El proceso antiguo pCLI_AbrirMiFicha sigue registrado pero ya no está enlazado a ningún nodo (aparece como "proceso registrado y no enlazado" en la auditoría de origen) — residuo esperado del cambio, no un fallo.

**Deviation:** Ninguna funcional. Queda el proceso pCLI_AbrirMiFicha huérfano; se puede borrar si se quiere limpiar, no es obligatorio.

## 2026-09-25 · affects T-03

**Agreed:** Renombrar el nodo de menú "Mi catálogo" a "Catálogo".

**Found:** Nodo e8ead8ba-... se llama "Catálogo" en el árbol de navegación actual.

**Deviation:** Ninguna.

## 2026-09-25 · affects T-04

**Agreed:** "Mis favoritos" navega al catálogo compartido CAT_Producto_Cliente_List filtrado a favoritos del cliente actual, sin módulo ni página nueva.

**Found:** Nodo "Mis favoritos" (fcd42f91-...) apunta a CAT_Producto_Cliente_List, mismo mecanismo de ObjectWhere que T-02. Es la causa de que la auditoría de navegación marque esa página como alcanzable desde 3 nodos distintos (incluyendo 2 bajo "Menú Cliente": "Catálogo" sin filtrar y "Mis favoritos" filtrado) — intencionado por diseño.

**Deviation:** Ninguna.

## 2026-09-25 · affects T-05

**Agreed:** Icono de carrito con badge mostrando el número de líneas del pedido en curso, replicando el mecanismo del badge de notificaciones.

**Found:** El nodo "Mi carrito" existe en el menú de cliente con su icono, sin contador.

**Deviation:** Sí: decisión del usuario del 22-09 tras conocer que un contador dinámico exigiría tocar Interfaces.Script (recurso compartido de toda la instalación, no solo de este proyecto) — se quedó solo con el icono.

## 2026-09-25 · affects T-06

**Agreed:** El buscador genérico de la barra superior encuentra productos por nombre/referencia y navega a su ficha o al catálogo filtrado.

**Found:** Funciona: fila añadida a Objects_Search (flxCatalog_IC) por SQL directo (gap MCP, sin tool para esa tabla), verificado en navegador como cliente — buscar "Bota Casual" encuentra el producto y navega a su ficha correctamente.

**Deviation:** Cosmética, sin bloquear: la cabecera de grupo del resultado de búsqueda muestra literalmente "Producto {{Nombre}}1" en vez de un texto resuelto — un token sin sustituir, ya anotado en su momento, sin investigar a fondo.

## 2026-09-25 · affects T-07

**Agreed:** Módulo HTML de reseñas de producto (media con estrellas, últimas reseñas, formulario condicionado a haber comprado el producto) sobre COM_Comentario, quitando el botón "Nuevo comentario" roto.

**Found:** Construido y verificado en su momento en pantalla, con un caso de cliente que había comprado el producto y otro que no.

**Deviation:** Ninguna registrada. No se ha vuelto a verificar visualmente en esta sesión.

## 2026-09-25 · affects T-08

**Agreed:** Datos de demo para COM_Comentario (EntidadTipo='Producto'): varias reseñas por producto, solo sobre productos realmente comprados en los pedidos de demo.

**Found:** Solo existen 2 reseñas en toda la base de demo (ambas sobre "Chaqueta Cortavientos Essential"), porque solo 2 productos distintos aparecen comprados en las 146 líneas de pedido generadas.

**Deviation:** Sí, material, pero la causa no es T-08: es un CROSS APPLY (SELECT TOP 1 IdProducto FROM Productos ... ORDER BY NEWID()) sin correlacionar en la generación de líneas de pedido (pSeed_ResetDemoData, selección de producto por línea), que SQL Server puede evaluar una sola vez y reutilizar en todas las filas — el mismo patrón de riesgo ya documentado en memoria del proyecto (colapso de NEWID() no correlacionado), aquí materializado. T-08 hizo bien su parte (reseñas solo sobre lo comprado); el pool de "lo comprado" es artificialmente pequeño por un defecto anterior a este plan.

## 2026-09-25 · affects T-09

**Agreed:** Añadir fila 'Cancelada' a Devoluciones_Estados e Incidencias_Estados, con su seeding.

**Found:** 'Cancelada' presente en ambas tablas de estados, junto a los demás estados ya poblados (Solicitada, Abonada, En revisión, Aceptada, Rechazada / Abierta, Cerrada).

**Deviation:** Ninguna.

## 2026-09-25 · affects T-10

**Agreed:** create=False para el rol cliente en VTA_Devolucion y VTA_Incidencia, quitando el botón "New" nativo de los listados de cliente.

**Found:** canInsert=NO confirmado en ambos objetos para el rol cliente, con filtros de view/viewCollection correctos (solo devoluciones/incidencias de pedidos propios). El botón "New" está ausente del toolbar del listado de cliente (tb-vta-lineapedido-detalle-list, sin entrada New).

**Deviation:** Hallazgo a verificar, no confirmado como fallo: junto a canInsert=NO hay un InsertFilter='1=1' almacenado en la misma fila de seguridad. La referencia de seguridad de la plataforma documenta que un filtro presente ANULA el flag para CanView (no verificado explícitamente para CanInsert) — si el mismo comportamiento aplica, el bloqueo real dependería solo de que el botón no está en la UI y no de la seguridad de backend. No se ha probado en runtime (llamada directa al endpoint de alta), queda para /flx-verify.

## 2026-09-25 · affects T-11

**Agreed:** Proceso DLL "Solicitar devolución" con validación de cantidad disponible, creando la devolución en estado 'Solicitada'.

**Found:** pVTA_SolicitarDevolucion registrado y cableado al botón "Solicitar devolución" por línea de pedido (flx-vta-lineapedido-detalle-list), ya decidido con el usuario (D-11) como punto de entrada correcto en vez de un botón a nivel de pedido.

**Deviation:** Ninguna.

## 2026-09-25 · affects T-12

**Agreed:** Proceso 'Cancelar devolución' visible solo cuando el estado es 'Solicitada', que rechaza en cualquier otro caso.

**Found:** pVTA_CancelarDevolucion rechaza correctamente cuando el estado actual no es 'Solicitada' (verificado leyendo el SP). El botón "Cancelar" está siempre visible, no oculto según el estado.

**Deviation:** Sí, ya registrada como gap de plataforma: ToolBars_Buttons.SQLEnabled con ConnStringId nunca sustituye el token {{IdEstado}} (probadas 5 sintaxis distintas) — solo puede dar siempre oculto o siempre visible, nunca reaccionar al registro real. Se dejó SQLEnabled con ConnStringId=NULL (visible siempre) y el control real recae en el SP, que sí funciona.

## 2026-09-25 · affects T-13

**Agreed:** Proceso DLL "Solicitar incidencia" sustituye el alta directa del botón "Crear incidencia" en VTA_Pedido_Cliente_View.

**Found:** pVTA_SolicitarIncidencia registrado y cableado; el botón antiguo (alta directa) se sustituyó y su texto pasó de "Crear incidencia" a "Solicitar incidencia".

**Deviation:** Ninguna registrada. No se ha vuelto a verificar visualmente en esta sesión.

## 2026-09-25 · affects T-14

**Agreed:** Proceso 'Cancelar incidencia' visible solo cuando el estado es 'Abierta'.

**Found:** pVTA_CancelarIncidencia creado con el mismo patrón que pVTA_CancelarDevolucion.

**Deviation:** Mismo gap de plataforma que T-12 (SQLEnabled+ConnStringId no reacciona al estado real): el botón queda siempre visible, el control real recae en el SP.

## 2026-09-25 · affects T-15

**Agreed:** Colocar los botones Solicitar/Cancelar en las 4 pantallas de cliente correspondientes.

**Found:** Los 4 botones colocados: Solicitar devolución (por línea), Solicitar incidencia (por pedido), Cancelar devolución y Cancelar incidencia (en sus vistas respectivas).

**Deviation:** Ninguna adicional a lo ya recogido en T-11/T-12/T-13/T-14.

## 2026-09-25 · affects T-16

**Agreed:** VTA_MisDocumentos_List sin el módulo 'Mis pedidos', con un listado real de documentos adjuntos a los pedidos del cliente actual, manteniendo 'Mi tarifa'.

**Found:** Módulo 'Mis pedidos' retirado; nuevo módulo mod-vta-pedido-documentos-cliente-sqllist construido y colocado, verificado hoy en pantalla como cliente (pinta correctamente su estado vacío). 'Mi tarifa' intacto.

**Deviation:** No hay datos de demo de documentos de pedido, así que no se ha podido verificar visualmente la fila con datos ni el enlace de descarga — ya anotado en la ejecución de la tarea.
