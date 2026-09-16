

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"PageName":"CAT_Catalogo_Publico",
	"TypeId":"generic",
	"LayoutName":"default",
	"Name":"Catálogo",
	"IconName":"box",
	"Descrip":"Catálogo público",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:39:00",
	"flxUpdatedDate":"2026-09-15T08:39:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Familia_List",
	"TypeId":"list",
	"ObjectName":"CAT_Familia",
	"LayoutName":"default",
	"Name":"Familias",
	"IconName":"flx-folder",
	"Descrip":"Listado de Familias",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:02:00",
	"flxUpdatedDate":"2026-09-15T08:02:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Familia_View",
	"TypeId":"view",
	"ObjectName":"CAT_Familia",
	"LayoutName":"default",
	"Name":"Familia",
	"IconName":"flx-folder",
	"Descrip":"Ficha de Familia",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:02:00",
	"flxUpdatedDate":"2026-09-15T08:02:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Marca_List",
	"TypeId":"list",
	"ObjectName":"CAT_Marca",
	"LayoutName":"default",
	"Name":"Marcas",
	"IconName":"fa-star",
	"Descrip":"Listado de Marcas",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Marca_View",
	"TypeId":"view",
	"ObjectName":"CAT_Marca",
	"LayoutName":"default",
	"Name":"Marca",
	"IconName":"fa-star",
	"Descrip":"Ficha de Marca",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Producto_List",
	"TypeId":"list",
	"ObjectName":"CAT_Producto",
	"LayoutName":"default",
	"Name":"Productos",
	"IconName":"box",
	"Descrip":"Listado de Productos",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-16T10:02:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CAT_Producto_View",
	"TypeId":"view",
	"ObjectName":"CAT_Producto",
	"LayoutName":"syslayout-6",
	"Name":"Producto",
	"IconName":"box",
	"Descrip":"Ficha de Producto",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CLI_Cliente_List",
	"TypeId":"list",
	"ObjectName":"CLI_Cliente",
	"LayoutName":"default",
	"Name":"Clientes",
	"IconName":"users",
	"Descrip":"Listado de Clientes",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-15T08:30:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"CLI_Cliente_View",
	"TypeId":"view",
	"ObjectName":"CLI_Cliente",
	"LayoutName":"default",
	"Name":"Cliente",
	"IconName":"users",
	"Descrip":"Ficha de Cliente",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-15T08:30:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"HOME",
	"TypeId":"generic",
	"LayoutName":"syslayout-20",
	"Name":"Panel de control",
	"IconName":"flx-desktop",
	"Descrip":"Panel de control",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:37:00",
	"flxUpdatedDate":"2026-09-15T08:37:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"VTA_Pedido_List",
	"TypeId":"list",
	"ObjectName":"VTA_Pedido",
	"LayoutName":"default",
	"Name":"Pedidos",
	"IconName":"cart",
	"Descrip":"Listado de Pedidos",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false
},{
	"PageName":"VTA_Pedido_View",
	"TypeId":"view",
	"ObjectName":"VTA_Pedido",
	"LayoutName":"syslayout-6",
	"Name":"Pedido",
	"IconName":"cart",
	"Descrip":"Ficha de Pedido",
	"ScriptActive":false,
	"RefreshInterval":0,
	"Sytem":false,
	"Generic":false,
	"Offline":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"FreeLayout":false}]')


MERGE INTO [Pages] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[PageName] nvarchar(100) '$.PageName'
,[TypeId] nvarchar(50) '$.TypeId'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[InterfaceName] nvarchar(100) '$.InterfaceName'
,[LayoutName] nvarchar(100) '$.LayoutName'
,[Name] nvarchar(255) '$.Name'
,[IconName] nvarchar(100) '$.IconName'
,[Descrip] nvarchar(100) '$.Descrip'
,[UrlRewrite] nvarchar(255) '$.UrlRewrite'
,[Script] nvarchar(max) '$.Script'
,[ScriptActive] bit '$.ScriptActive'
,[Style] nvarchar(max) '$.Style'
,[RefreshInterval] int '$.RefreshInterval'
,[Sytem] bit '$.Sytem'
,[Generic] bit '$.Generic'
,[BodyCssClass] nvarchar(200) '$.BodyCssClass'
,[Offline] bit '$.Offline'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
,[FreeLayout] bit '$.FreeLayout'
) 
) AS Source ([PageName],[TypeId],[ObjectName],[InterfaceName],[LayoutName],[Name],[IconName],[Descrip],[UrlRewrite],[Script],[ScriptActive],[Style],[RefreshInterval],[Sytem],[Generic],[BodyCssClass],[Offline],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId],[FreeLayout])
ON (Target.[PageName] = Source.[PageName])
WHEN MATCHED AND (
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[ObjectName], Target.[ObjectName]) IS NOT NULL OR NULLIF(Target.[ObjectName], Source.[ObjectName]) IS NOT NULL OR 
	NULLIF(Source.[InterfaceName], Target.[InterfaceName]) IS NOT NULL OR NULLIF(Target.[InterfaceName], Source.[InterfaceName]) IS NOT NULL OR 
	NULLIF(Source.[LayoutName], Target.[LayoutName]) IS NOT NULL OR NULLIF(Target.[LayoutName], Source.[LayoutName]) IS NOT NULL OR 
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[UrlRewrite], Target.[UrlRewrite]) IS NOT NULL OR NULLIF(Target.[UrlRewrite], Source.[UrlRewrite]) IS NOT NULL OR 
	NULLIF(Source.[Script], Target.[Script]) IS NOT NULL OR NULLIF(Target.[Script], Source.[Script]) IS NOT NULL OR 
	NULLIF(Source.[ScriptActive], Target.[ScriptActive]) IS NOT NULL OR NULLIF(Target.[ScriptActive], Source.[ScriptActive]) IS NOT NULL OR 
	NULLIF(Source.[Style], Target.[Style]) IS NOT NULL OR NULLIF(Target.[Style], Source.[Style]) IS NOT NULL OR 
	NULLIF(Source.[RefreshInterval], Target.[RefreshInterval]) IS NOT NULL OR NULLIF(Target.[RefreshInterval], Source.[RefreshInterval]) IS NOT NULL OR 
	NULLIF(Source.[Sytem], Target.[Sytem]) IS NOT NULL OR NULLIF(Target.[Sytem], Source.[Sytem]) IS NOT NULL OR 
	NULLIF(Source.[Generic], Target.[Generic]) IS NOT NULL OR NULLIF(Target.[Generic], Source.[Generic]) IS NOT NULL OR 
	NULLIF(Source.[BodyCssClass], Target.[BodyCssClass]) IS NOT NULL OR NULLIF(Target.[BodyCssClass], Source.[BodyCssClass]) IS NOT NULL OR 
	NULLIF(Source.[Offline], Target.[Offline]) IS NOT NULL OR NULLIF(Target.[Offline], Source.[Offline]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL OR 
	NULLIF(Source.[FreeLayout], Target.[FreeLayout]) IS NOT NULL OR NULLIF(Target.[FreeLayout], Source.[FreeLayout]) IS NOT NULL) THEN
 UPDATE SET
  [TypeId] = Source.[TypeId], 
  [ObjectName] = Source.[ObjectName], 
  [InterfaceName] = Source.[InterfaceName], 
  [LayoutName] = Source.[LayoutName], 
  [Name] = Source.[Name], 
  [IconName] = Source.[IconName], 
  [Descrip] = Source.[Descrip], 
  [UrlRewrite] = Source.[UrlRewrite], 
  [Script] = Source.[Script], 
  [ScriptActive] = Source.[ScriptActive], 
  [Style] = Source.[Style], 
  [RefreshInterval] = Source.[RefreshInterval], 
  [Sytem] = Source.[Sytem], 
  [Generic] = Source.[Generic], 
  [BodyCssClass] = Source.[BodyCssClass], 
  [Offline] = Source.[Offline], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId], 
  [FreeLayout] = Source.[FreeLayout]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([PageName],[TypeId],[ObjectName],[InterfaceName],[LayoutName],[Name],[IconName],[Descrip],[UrlRewrite],[Script],[ScriptActive],[Style],[RefreshInterval],[Sytem],[Generic],[BodyCssClass],[Offline],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId],[FreeLayout])
 VALUES(Source.[PageName],Source.[TypeId],Source.[ObjectName],Source.[InterfaceName],Source.[LayoutName],Source.[Name],Source.[IconName],Source.[Descrip],Source.[UrlRewrite],Source.[Script],Source.[ScriptActive],Source.[Style],Source.[RefreshInterval],Source.[Sytem],Source.[Generic],Source.[BodyCssClass],Source.[Offline],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId],Source.[FreeLayout])
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





