# WebAPI exposure

## 2026-10-26

**Decided by:** D-15
**Probe:** role admins (usuario admin), WebAPI en http://localhost:7111: GET /webapi/list/CAT_Productos?page=0&pagesize=1000 leyó 140 filas, VTA_Pedidos 146 filas, VTA_Devoluciones 13 filas; GET /webapi/list/CLI_Clientes refused with HTTP 403 «Unauthorized collection CLI_Clientes»; POST /webapi/object/CAT_Producto refused with HTTP 403 «Unauthorized objectCAT_Producto» (solo lectura confirmada). /mcp con el token del mismo usuario: initialize 200 (serverInfo flxCatalog 1.0.6-beta.1), tools/list devolvió 17 herramientas (flexygo_list, flexygo_get, flexygo_catalog…); after /mcp flexygo_list CAT_Producto devolvió total 140 filas; flexygo_list CLI_Cliente refused «Unauthorized collection CLI_Clientes» (flexygo/status 403). No se hizo el consentimiento OAuth en navegador: la sesión no puede completar OAuth; se entró a /mcp con el token de /token, que la referencia indica que también entra.

```
WebAPI_Enabled: true
MCP_Enabled: true
Platform: the platform that runs refuses by role on the WebAPI (10.0: « for role » is in bin\flxUI.dll)
MCP sign-in: clients register only by DCR: this platform predates CIMD (FG-1), so a client that only offers its metadata document does not get in

Objects:
  CAT_Color | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  CAT_Familia | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  CAT_Marca | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  CAT_Producto | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  CAT_Talla | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  CAT_Variante | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_Devolucion | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_EstadoDevolucion | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_EstadoIncidencia | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_EstadoPedido | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_Incidencia | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_LineaPedido | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_Pedido | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes
  VTA_TipoIncidencia | canView: True | canViewCollection: True | canInsert: False | canEdit: False | canDelete: False | canPrint: False | AIDescrip: yes

Views:
  (none)

Processes:
  (none)

Users authorized:
  (none)

Roles authorized (grants, not the roles the platform has — flexygo_list_roles lists those; a role missing here may still exist):
  admins | authorized: True | mcp: True

the connector will guess on 0 of 14 exposed object(s) — the ones without AIDescrip.
```
