# flxCatalog — using it from outside

<!-- flexygo:generated:start -->
_Written by the Flexygo server each time what goes out is recorded (/flx-api). Everything outside these two markers is yours._

## Where

- **WebAPI**: `http://localhost:7111/webapi/...` — sign in with `POST http://localhost:7111/token` (`grant_type=password&username=…&password=…`), then send `Authorization: Bearer <access_token>` on every call.
- Routes: `GET /webapi/list/{Object}`, `GET /webapi/list/{Object}/{View}`, `GET /webapi/object/{Object}/{Id}`, `POST /webapi/object/{Object}`, `PUT /webapi/object/{Object}/{Id}`, `POST /webapi/exec/{Process}/{Object}/{Id}`, `GET /webapi/context` (who the token says you are). Each answers only what is open below.
- **The application's assistant (MCP)**: `http://localhost:7111/mcp`, signing in by OAuth in the browser — clients register only by DCR: this platform predates CIMD (FG-1), so a client that only offers its metadata document does not get in.

## Connecting an AI assistant

- **Claude Code**: `claude mcp add --transport http localhost-7111 http://localhost:7111/mcp`, then `/mcp` and sign in as your user.
- **claude.ai, Claude desktop, ChatGPT**: add a custom connector pointing to `https://<public address>/mcp`; they reach the application only on a public https address.
- The assistant sees exactly what is open below, with the security of the role you sign in with, and only while `MCP_Enabled` is on and your role or user is allowed the assistant.

## What is open, and for whom

_Decided by D-16, recorded 2026-10-26. Last check from outside: role admins (usuario admin), medido el 26-oct en http://localhost:7111 con token de /token: WebAPI GET /webapi/list/VTA_Pedidos leyó 154 filas, VTA_Devoluciones 13, VTA_Incidencias 13 y CAT_Productos 140; GET /webapi/list/COM_Comentarios refused with HTTP 403 «Unauthorized collection COM_Comentarios»; GET /webapi/list/CLI_Clientes refused with HTTP 403 «Unauthorized collection CLI_Clientes»; POST /webapi/object/CAT_Producto refused with HTTP 403 «Unauthorized objectCAT_Producto». After /mcp con el token del mismo usuario: tools/list respondió con las herramientas flexygo_*; flexygo_list VTA_Pedido devolvió total 154; flexygo_list CLI_Cliente refused «Unauthorized collection CLI_Clientes». Sin consentimiento OAuth en navegador (la sesión no puede completarlo); se entró a /mcp con el token de /token.._

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
<!-- flexygo:generated:end -->
