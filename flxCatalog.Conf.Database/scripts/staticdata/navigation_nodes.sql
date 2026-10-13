

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"NodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":9,
	"Title":"Maestros",
	"IconName":"flx-database",
	"Descrip":"Maestros",
	"TypeId":"text",
	"TargetId":"current",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-10-06T00:00:00",
	"flxUpdatedDate":"2026-10-06T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"CBB70670-77B9-4A65-B499-01930A455ACA",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":6,
	"Title":"Devoluciones",
	"IconName":"return",
	"Descrip":"Devoluciones",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Devolucion_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:54:00",
	"flxUpdatedDate":"2026-10-02T19:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"FD58AD03-BA2D-4616-9989-068841B32882",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":3,
	"Title":"Pedidos",
	"IconName":"cart",
	"Descrip":"Pedidos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Pedido_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"C96488D9-3CFC-46E1-9C6F-0EC8A60B0561",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":8,
	"Title":"Tipos de incidencia",
	"IconName":"flx-folder",
	"Descrip":"Tipos de incidencia",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_TipoIncidencia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"FEC9BBB6-7047-4FB5-9DEF-2FF117A78600",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":4,
	"Title":"Clientes",
	"IconName":"users",
	"Descrip":"Clientes",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CLI_Cliente_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"6F38509E-D939-45C2-8C4C-3B5E0B37CE85",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":5,
	"Title":"Estados de pedido",
	"IconName":"flx-folder",
	"Descrip":"Estados de pedido",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_EstadoPedido_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"4B9E7144-2FAB-4E5A-ADF8-3C1DFF8CD997",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":2,
	"Title":"Marcas",
	"IconName":"fa-star",
	"Descrip":"Marcas",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Marca_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:54:00",
	"flxUpdatedDate":"2026-10-02T19:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"64860B6E-0BDB-489B-B54A-437CCEAE59D0",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":3,
	"Title":"Familias",
	"IconName":"flx-folder",
	"Descrip":"Familias",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Familia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"663876E7-0914-4A7B-8CE6-480E73B34217",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":3,
	"Title":"Colores",
	"IconName":"flx-folder",
	"Descrip":"Colores",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Color_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"EAF2C216-983C-457A-9D34-53E6ADC21437",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":5,
	"Title":"Incidencias",
	"IconName":"warning-1",
	"Descrip":"Incidencias",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Incidencia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:54:00",
	"flxUpdatedDate":"2026-10-02T19:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"18E3F773-0703-4E6D-A498-566DFDDC9BFD",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":1,
	"Title":"Mi carrito",
	"IconName":"cart",
	"Descrip":"Mi carrito",
	"TypeId":"process",
	"TargetId":"current",
	"ProcessName":"pVTA_AbrirMiCarrito",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T22:32:00",
	"flxUpdatedDate":"2026-09-17T22:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"85D18AB1-3DD4-4DAC-B7E0-5942C39FF34D",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":2,
	"Title":"Productos",
	"IconName":"box",
	"Descrip":"Productos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Producto_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"6DACE786-2B4C-4392-8A1A-5D9CA40FD62B",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":2,
	"Title":"Mesa de trabajo",
	"IconName":"tasks",
	"Descrip":"Mesa de trabajo",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_MesaTrabajo_Page",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:54:00",
	"flxUpdatedDate":"2026-10-02T19:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"2FB0BABB-8FF4-4ED0-9497-67996257CFDD",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":6,
	"Title":"Mis devoluciones",
	"IconName":"return",
	"Descrip":"Mis devoluciones",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Devolucion_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T11:58:00",
	"flxUpdatedDate":"2026-09-21T11:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"26295D67-1F80-4DA5-8AA1-696127447C91",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":7,
	"Title":"Estados de incidencia",
	"IconName":"flx-folder",
	"Descrip":"Estados de incidencia",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_EstadoIncidencia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"29707FA2-E44D-4CF3-969E-6DC50EFC98AF",
	"ParentNodeId":"5290BFAF-50CF-4BBA-9194-D42D96229629",
	"Order":9,
	"Title":"Mi carrito",
	"IconName":"cart",
	"Descrip":"Mi carrito",
	"TypeId":"process",
	"TargetId":"current",
	"ProcessName":"pVTA_AbrirMiCarrito",
	"BadgeRefresh":0,
	"Enabled":true,
	"SQLEnabledDescrip":"Solo el rol cliente ve el icono del carrito; administradores y resto de roles no.",
	"SQLEnabled":"select case when ''{{currentRoleId}}''=''cliente'' then 1 else 0 end",
	"ConnStringId":"ConfConnectionString",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T20:00:00",
	"flxUpdatedDate":"2026-10-02T20:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"86F4A4FC-C6AC-4539-8DE0-7E0B344049E2",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":1,
	"Title":"Dashboard",
	"IconName":"chart-111",
	"Descrip":"Dashboard",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Dashboard_Page",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:53:00",
	"flxUpdatedDate":"2026-10-02T19:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":0,
	"Title":"Menú Cliente",
	"IconName":"noicon",
	"Descrip":"Menú Cliente",
	"TypeId":"text",
	"TargetId":"current",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-17T12:05:00",
	"flxUpdatedDate":"2026-09-17T12:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"975EA251-EDEB-4F5E-87FC-8BDFB40B5170",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":8,
	"Title":"Tarifas",
	"IconName":"tags",
	"Descrip":"Tarifas",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Tarifa_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T09:35:00",
	"flxUpdatedDate":"2026-09-17T09:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"70AA7C57-C1F3-45D3-92E4-8E84573D0271",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":8,
	"Title":"Tarifas",
	"IconName":"tags",
	"Descrip":"Tarifas",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Tarifa_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-28T01:13:00",
	"flxUpdatedDate":"2026-09-28T01:13:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"FCD42F91-9C30-46DD-8F89-8F4D83820D86",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":4,
	"Title":"Mis favoritos",
	"IconName":"heart-1",
	"Descrip":"Mis favoritos",
	"TypeId":"page",
	"TargetId":"current",
	"PageTypeId":"list",
	"PageName":"CAT_Producto_Cliente_List",
	"ObjectName":"CAT_Productos",
	"ObjectWhere":"(Productos.IdProducto IN (SELECT IdProducto FROM Favoritos WHERE IdCliente=''{{currentReference}}''))",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T21:01:00",
	"flxUpdatedDate":"2026-09-17T21:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"042C02B7-0FDD-4E34-B06F-92E0C638B3A2",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":3,
	"Title":"Mi ficha",
	"IconName":"users",
	"Descrip":"Mi ficha",
	"TypeId":"page",
	"TargetId":"current",
	"PageTypeId":"view",
	"PageName":"CLI_Cliente_Mi_Ficha_View",
	"ObjectName":"CLI_Cliente",
	"ObjectWhere":"(Clientes.IdCliente=''{{currentReference}}'')",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T10:07:00",
	"flxUpdatedDate":"2026-09-17T10:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"BA5DF261-8FC3-4A75-9EC0-99F09D266388",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":8,
	"Title":"Mis notificaciones",
	"IconName":"flx-bell",
	"Descrip":"Mis notificaciones",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"COM_MisNotificaciones_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-22T09:56:00",
	"flxUpdatedDate":"2026-09-22T09:56:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"1585A904-11A5-42E3-88A5-9F3AF0081E75",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":2,
	"Title":"Mis pedidos",
	"IconName":"cart",
	"Descrip":"Mis pedidos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Pedido_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T10:07:00",
	"flxUpdatedDate":"2026-09-17T10:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"78FFADA8-8F56-45EF-8F6D-B781B6B3D7C3",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":4,
	"Title":"Marcas",
	"IconName":"fa-star",
	"Descrip":"Marcas",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Marca_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"684882F1-584C-48DC-9B78-B9D51F0C255D",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":5,
	"Title":"Mis documentos",
	"IconName":"document",
	"Descrip":"Mis documentos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_MisDocumentos_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T11:43:00",
	"flxUpdatedDate":"2026-09-21T11:43:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"9B809AA0-16D0-48E5-B571-BBFBED6099D8",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":7,
	"Title":"Productos",
	"IconName":"box",
	"Descrip":"Productos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Producto_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"59AAE59D-1C30-4E49-A9C7-C9BB2E73FB92",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":1,
	"Title":"Panel de control",
	"IconName":"flx-desktop",
	"Descrip":"Panel de control",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"HOME",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"D933D797-74D4-4A8A-9D3A-CA5FEA8B59DF",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":6,
	"Title":"Pedidos",
	"IconName":"cart",
	"Descrip":"Pedidos",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Pedido_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"E8EAD8BA-559A-43B1-B772-CB9BD080C842",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":1,
	"Title":"Catálogo",
	"IconName":"box",
	"Descrip":"Catálogo",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Producto_Cliente_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T10:07:00",
	"flxUpdatedDate":"2026-09-17T10:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"F2A30872-716A-4E3F-9A50-D7E12F5987E6",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":5,
	"Title":"Clientes",
	"IconName":"users",
	"Descrip":"Clientes",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CLI_Cliente_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"84817E32-A0B6-43AC-B9B7-EE8943277E17",
	"ParentNodeId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"Order":7,
	"Title":"Mis incidencias",
	"IconName":"warning-1",
	"Descrip":"Mis incidencias",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_Incidencia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T12:43:00",
	"flxUpdatedDate":"2026-09-21T12:43:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"42BBFD1E-EBBD-479C-828D-F7CA02DEAB71",
	"ParentNodeId":"25A4B4D5-44AE-4CF1-8733-568F00F31520",
	"Order":7,
	"Title":"Catálogo",
	"IconName":"box",
	"Descrip":"Catálogo",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Producto_Cliente_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"BB497776-43BB-4BA1-8098-FAA001627D83",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":6,
	"Title":"Estados de devolución",
	"IconName":"flx-folder",
	"Descrip":"Estados de devolución",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"VTA_EstadoDevolucion_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"D57B094F-499A-462A-907B-FE66E22F4B59",
	"ParentNodeId":"3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B",
	"Order":1,
	"Title":"Familias",
	"IconName":"flx-folder",
	"Descrip":"Familias",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Familia_List",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:54:00",
	"flxUpdatedDate":"2026-10-02T19:54:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Navigation_Nodes] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[NodeId] uniqueidentifier '$.NodeId'
,[ParentNodeId] uniqueidentifier '$.ParentNodeId'
,[Order] int '$.Order'
,[Title] nvarchar(255) '$.Title'
,[IconName] nvarchar(100) '$.IconName'
,[Descrip] nvarchar(100) '$.Descrip'
,[TypeId] nvarchar(50) '$.TypeId'
,[Params] nvarchar(255) '$.Params'
,[Url] nvarchar(max) '$.Url'
,[TargetId] nvarchar(50) '$.TargetId'
,[ProcessName] nvarchar(255) '$.ProcessName'
,[PageTypeId] nvarchar(50) '$.PageTypeId'
,[PresetName] nvarchar(50) '$.PresetName'
,[PageName] nvarchar(100) '$.PageName'
,[ReportName] nvarchar(200) '$.ReportName'
,[HelpId] nvarchar(50) '$.HelpId'
,[ReportWhere] nvarchar(1000) '$.ReportWhere'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[ObjectWhere] nvarchar(1000) '$.ObjectWhere'
,[Defaults] varchar(2000) '$.Defaults'
,[SQLSentence] nvarchar(max) '$.SQLSentence'
,[SQLConStringId] nvarchar(50) '$.SQLConStringId'
,[WebComponent] nvarchar(1000) '$.WebComponent'
,[TableName] nvarchar(250) '$.TableName'
,[BadgeClass] nvarchar(100) '$.BadgeClass'
,[BadgeSQL] nvarchar(max) '$.BadgeSQL'
,[BadgeConStringId] nvarchar(50) '$.BadgeConStringId'
,[BadgeRefresh] int '$.BadgeRefresh'
,[Enabled] bit '$.Enabled'
,[cssClass] nvarchar(250) '$.cssClass'
,[SQLEnabledDescrip] nvarchar(250) '$.SQLEnabledDescrip'
,[SQLEnabled] nvarchar(max) '$.SQLEnabled'
,[ConnStringId] nvarchar(50) '$.ConnStringId'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([NodeId],[ParentNodeId],[Order],[Title],[IconName],[Descrip],[TypeId],[Params],[Url],[TargetId],[ProcessName],[PageTypeId],[PresetName],[PageName],[ReportName],[HelpId],[ReportWhere],[ObjectName],[ObjectWhere],[Defaults],[SQLSentence],[SQLConStringId],[WebComponent],[TableName],[BadgeClass],[BadgeSQL],[BadgeConStringId],[BadgeRefresh],[Enabled],[cssClass],[SQLEnabledDescrip],[SQLEnabled],[ConnStringId],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[NodeId] = Source.[NodeId])
WHEN MATCHED AND (
	NULLIF(Source.[ParentNodeId], Target.[ParentNodeId]) IS NOT NULL OR NULLIF(Target.[ParentNodeId], Source.[ParentNodeId]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[Title], Target.[Title]) IS NOT NULL OR NULLIF(Target.[Title], Source.[Title]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[Params], Target.[Params]) IS NOT NULL OR NULLIF(Target.[Params], Source.[Params]) IS NOT NULL OR 
	NULLIF(Source.[Url], Target.[Url]) IS NOT NULL OR NULLIF(Target.[Url], Source.[Url]) IS NOT NULL OR 
	NULLIF(Source.[TargetId], Target.[TargetId]) IS NOT NULL OR NULLIF(Target.[TargetId], Source.[TargetId]) IS NOT NULL OR 
	NULLIF(Source.[ProcessName], Target.[ProcessName]) IS NOT NULL OR NULLIF(Target.[ProcessName], Source.[ProcessName]) IS NOT NULL OR 
	NULLIF(Source.[PageTypeId], Target.[PageTypeId]) IS NOT NULL OR NULLIF(Target.[PageTypeId], Source.[PageTypeId]) IS NOT NULL OR 
	NULLIF(Source.[PresetName], Target.[PresetName]) IS NOT NULL OR NULLIF(Target.[PresetName], Source.[PresetName]) IS NOT NULL OR 
	NULLIF(Source.[PageName], Target.[PageName]) IS NOT NULL OR NULLIF(Target.[PageName], Source.[PageName]) IS NOT NULL OR 
	NULLIF(Source.[ReportName], Target.[ReportName]) IS NOT NULL OR NULLIF(Target.[ReportName], Source.[ReportName]) IS NOT NULL OR 
	NULLIF(Source.[HelpId], Target.[HelpId]) IS NOT NULL OR NULLIF(Target.[HelpId], Source.[HelpId]) IS NOT NULL OR 
	NULLIF(Source.[ReportWhere], Target.[ReportWhere]) IS NOT NULL OR NULLIF(Target.[ReportWhere], Source.[ReportWhere]) IS NOT NULL OR 
	NULLIF(Source.[ObjectName], Target.[ObjectName]) IS NOT NULL OR NULLIF(Target.[ObjectName], Source.[ObjectName]) IS NOT NULL OR 
	NULLIF(Source.[ObjectWhere], Target.[ObjectWhere]) IS NOT NULL OR NULLIF(Target.[ObjectWhere], Source.[ObjectWhere]) IS NOT NULL OR 
	NULLIF(Source.[Defaults], Target.[Defaults]) IS NOT NULL OR NULLIF(Target.[Defaults], Source.[Defaults]) IS NOT NULL OR 
	NULLIF(Source.[SQLSentence], Target.[SQLSentence]) IS NOT NULL OR NULLIF(Target.[SQLSentence], Source.[SQLSentence]) IS NOT NULL OR 
	NULLIF(Source.[SQLConStringId], Target.[SQLConStringId]) IS NOT NULL OR NULLIF(Target.[SQLConStringId], Source.[SQLConStringId]) IS NOT NULL OR 
	NULLIF(Source.[WebComponent], Target.[WebComponent]) IS NOT NULL OR NULLIF(Target.[WebComponent], Source.[WebComponent]) IS NOT NULL OR 
	NULLIF(Source.[TableName], Target.[TableName]) IS NOT NULL OR NULLIF(Target.[TableName], Source.[TableName]) IS NOT NULL OR 
	NULLIF(Source.[BadgeClass], Target.[BadgeClass]) IS NOT NULL OR NULLIF(Target.[BadgeClass], Source.[BadgeClass]) IS NOT NULL OR 
	NULLIF(Source.[BadgeSQL], Target.[BadgeSQL]) IS NOT NULL OR NULLIF(Target.[BadgeSQL], Source.[BadgeSQL]) IS NOT NULL OR 
	NULLIF(Source.[BadgeConStringId], Target.[BadgeConStringId]) IS NOT NULL OR NULLIF(Target.[BadgeConStringId], Source.[BadgeConStringId]) IS NOT NULL OR 
	NULLIF(Source.[BadgeRefresh], Target.[BadgeRefresh]) IS NOT NULL OR NULLIF(Target.[BadgeRefresh], Source.[BadgeRefresh]) IS NOT NULL OR 
	NULLIF(Source.[Enabled], Target.[Enabled]) IS NOT NULL OR NULLIF(Target.[Enabled], Source.[Enabled]) IS NOT NULL OR 
	NULLIF(Source.[cssClass], Target.[cssClass]) IS NOT NULL OR NULLIF(Target.[cssClass], Source.[cssClass]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabledDescrip], Target.[SQLEnabledDescrip]) IS NOT NULL OR NULLIF(Target.[SQLEnabledDescrip], Source.[SQLEnabledDescrip]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabled], Target.[SQLEnabled]) IS NOT NULL OR NULLIF(Target.[SQLEnabled], Source.[SQLEnabled]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringId], Target.[ConnStringId]) IS NOT NULL OR NULLIF(Target.[ConnStringId], Source.[ConnStringId]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ParentNodeId] = Source.[ParentNodeId], 
  [Order] = Source.[Order], 
  [Title] = Source.[Title], 
  [IconName] = Source.[IconName], 
  [Descrip] = Source.[Descrip], 
  [TypeId] = Source.[TypeId], 
  [Params] = Source.[Params], 
  [Url] = Source.[Url], 
  [TargetId] = Source.[TargetId], 
  [ProcessName] = Source.[ProcessName], 
  [PageTypeId] = Source.[PageTypeId], 
  [PresetName] = Source.[PresetName], 
  [PageName] = Source.[PageName], 
  [ReportName] = Source.[ReportName], 
  [HelpId] = Source.[HelpId], 
  [ReportWhere] = Source.[ReportWhere], 
  [ObjectName] = Source.[ObjectName], 
  [ObjectWhere] = Source.[ObjectWhere], 
  [Defaults] = Source.[Defaults], 
  [SQLSentence] = Source.[SQLSentence], 
  [SQLConStringId] = Source.[SQLConStringId], 
  [WebComponent] = Source.[WebComponent], 
  [TableName] = Source.[TableName], 
  [BadgeClass] = Source.[BadgeClass], 
  [BadgeSQL] = Source.[BadgeSQL], 
  [BadgeConStringId] = Source.[BadgeConStringId], 
  [BadgeRefresh] = Source.[BadgeRefresh], 
  [Enabled] = Source.[Enabled], 
  [cssClass] = Source.[cssClass], 
  [SQLEnabledDescrip] = Source.[SQLEnabledDescrip], 
  [SQLEnabled] = Source.[SQLEnabled], 
  [ConnStringId] = Source.[ConnStringId], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([NodeId],[ParentNodeId],[Order],[Title],[IconName],[Descrip],[TypeId],[Params],[Url],[TargetId],[ProcessName],[PageTypeId],[PresetName],[PageName],[ReportName],[HelpId],[ReportWhere],[ObjectName],[ObjectWhere],[Defaults],[SQLSentence],[SQLConStringId],[WebComponent],[TableName],[BadgeClass],[BadgeSQL],[BadgeConStringId],[BadgeRefresh],[Enabled],[cssClass],[SQLEnabledDescrip],[SQLEnabled],[ConnStringId],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[NodeId],Source.[ParentNodeId],Source.[Order],Source.[Title],Source.[IconName],Source.[Descrip],Source.[TypeId],Source.[Params],Source.[Url],Source.[TargetId],Source.[ProcessName],Source.[PageTypeId],Source.[PresetName],Source.[PageName],Source.[ReportName],Source.[HelpId],Source.[ReportWhere],Source.[ObjectName],Source.[ObjectWhere],Source.[Defaults],Source.[SQLSentence],Source.[SQLConStringId],Source.[WebComponent],Source.[TableName],Source.[BadgeClass],Source.[BadgeSQL],Source.[BadgeConStringId],Source.[BadgeRefresh],Source.[Enabled],Source.[cssClass],Source.[SQLEnabledDescrip],Source.[SQLEnabled],Source.[ConnStringId],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
WHEN NOT MATCHED BY SOURCE AND TARGET.OriginId = 1 THEN 
 DELETE
;
END TRY
BEGIN CATCH
    DECLARE @ERRORNUMBER	INT,@ERRORMSG		VARCHAR(MAX),@ERRORSTATE		INT
    SELECT @ERRORNUMBER = 50000 + ERROR_NUMBER(),@ERRORMSG = ERROR_MESSAGE(), @ERRORSTATE = ERROR_STATE();
    THROW @ERRORNUMBER, @ERRORMSG, @ERRORSTATE
END CATCH
GO





