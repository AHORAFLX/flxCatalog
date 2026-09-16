

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"PageName":"CAT_Catalogo_Publico",
	"ModuleName":"mod-cat-producto-publico-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:39:00",
	"flxUpdatedDate":"2026-09-15T08:39:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Familia_List",
	"ModuleName":"mod-cat-familia-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-16T17:58:00",
	"flxUpdatedDate":"2026-09-16T17:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Familia_View",
	"ModuleName":"mod-cat-familia-back-html",
	"LayoutPositionId":"TopPosition",
	"Order":-1,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T18:10:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Familia_View",
	"ModuleName":"mod-cat-familia-view",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:02:00",
	"flxUpdatedDate":"2026-09-15T08:02:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Familia_View",
	"ModuleName":"mod-cat-producto-list-familia",
	"LayoutPositionId":"TopPosition",
	"Order":1,
	"Title":"Productos",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T11:30:00",
	"flxUpdatedDate":"2026-09-15T11:30:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Marca_List",
	"ModuleName":"mod-cat-marca-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Marca_View",
	"ModuleName":"mod-cat-marca-back-html",
	"LayoutPositionId":"TopPosition",
	"Order":-1,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T18:10:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Marca_View",
	"ModuleName":"mod-cat-marca-view",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Producto_List",
	"ModuleName":"mod-cat-producto-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Producto_View",
	"ModuleName":"cat_producto_gestion_doc_img",
	"LayoutPositionId":"RightPosition",
	"Order":0,
	"Title":"Imágenes",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Producto_View",
	"ModuleName":"mod-cat-producto-back-html",
	"LayoutPositionId":"TopPosition",
	"Order":-1,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T18:10:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Producto_View",
	"ModuleName":"mod-cat-producto-view",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CAT_Producto_View",
	"ModuleName":"mod-cat-variante-list-producto",
	"LayoutPositionId":"TopPosition",
	"Order":1,
	"Title":"Variantes",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CLI_Cliente_List",
	"ModuleName":"mod-cli-cliente-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-15T08:30:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"CLI_Cliente_View",
	"ModuleName":"mod-cli-cliente-back-html",
	"LayoutPositionId":"TopPosition",
	"Order":3,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T18:10:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"PositionX":0,
	"PositionY":13,
	"Width":12,
	"Height":2
},{
	"PageName":"CLI_Cliente_View",
	"ModuleName":"mod-cli-cliente-top-productos-echart",
	"LayoutPositionId":"TopPosition",
	"Order":1,
	"Title":"Artículos más comprados",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-16T13:48:00",
	"flxUpdatedDate":"2026-09-16T13:48:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"PositionX":6,
	"PositionY":0,
	"Width":6,
	"Height":8
},{
	"PageName":"CLI_Cliente_View",
	"ModuleName":"mod-cli-cliente-view",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:30:00",
	"flxUpdatedDate":"2026-09-15T08:30:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"PositionX":0,
	"PositionY":0,
	"Width":6,
	"Height":8
},{
	"PageName":"CLI_Cliente_View",
	"ModuleName":"mod-vta-pedido-list-cliente",
	"LayoutPositionId":"TopPosition",
	"Order":2,
	"Title":"Pedidos recientes",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-16T12:28:00",
	"flxUpdatedDate":"2026-09-16T12:28:00",
	"OriginAddonId":"Main",
	"OriginId":1,
	"PositionX":0,
	"PositionY":8,
	"Width":12,
	"Height":5
},{
	"PageName":"HOME",
	"ModuleName":"mod-home-banner-html",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:38:00",
	"flxUpdatedDate":"2026-09-15T08:38:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"HOME",
	"ModuleName":"mod-home-kpis-easyinfo",
	"LayoutPositionId":"TopPosition",
	"Order":1,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:38:00",
	"flxUpdatedDate":"2026-09-15T08:38:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"HOME",
	"ModuleName":"mod-home-ventas-familia-chart",
	"LayoutPositionId":"RightPosition",
	"Order":0,
	"Title":"Ventas por familia",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:38:00",
	"flxUpdatedDate":"2026-09-15T08:38:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"HOME",
	"ModuleName":"mod-home-ventas-mes-chart",
	"LayoutPositionId":"LeftPosition",
	"Order":0,
	"Title":"Ventas por mes",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:38:00",
	"flxUpdatedDate":"2026-09-15T08:38:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"HOME",
	"ModuleName":"mod-vta-pedido-recent-list",
	"LayoutPositionId":"BottomPosition",
	"Order":0,
	"Title":"Pedidos recientes",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:38:00",
	"flxUpdatedDate":"2026-09-15T08:38:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_List",
	"ModuleName":"mod-vta-pedido-list",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_View",
	"ModuleName":"mod-vta-lineapedido-list-pedido",
	"LayoutPositionId":"TopPosition",
	"Order":1,
	"Title":"Líneas del pedido",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_View",
	"ModuleName":"mod-vta-pedido-back-html",
	"LayoutPositionId":"TopPosition",
	"Order":-1,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T18:10:00",
	"flxUpdatedDate":"2026-09-15T18:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_View",
	"ModuleName":"mod-vta-pedido-fiscal-sqllist",
	"LayoutPositionId":"RightPosition",
	"Order":1,
	"Title":"Información fiscal",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:58:00",
	"flxUpdatedDate":"2026-09-15T17:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_View",
	"ModuleName":"mod-vta-pedido-view",
	"LayoutPositionId":"TopPosition",
	"Order":0,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"PageName":"VTA_Pedido_View",
	"ModuleName":"vta_pedido_gestion_doc_img",
	"LayoutPositionId":"RightPosition",
	"Order":0,
	"Title":"Documentos",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Pages_Modules] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[PageName] nvarchar(100) '$.PageName'
,[ModuleName] nvarchar(100) '$.ModuleName'
,[LayoutPositionId] nvarchar(50) '$.LayoutPositionId'
,[RelationWhere] nvarchar(1000) '$.RelationWhere'
,[Order] int '$.Order'
,[SQlEnabled] nvarchar(max) '$.SQlEnabled'
,[SQLEnabledDescrip] nvarchar(250) '$.SQLEnabledDescrip'
,[Title] nvarchar(250) '$.Title'
,[IconName] nvarchar(100) '$.IconName'
,[HeaderClass] nvarchar(50) '$.HeaderClass'
,[ModuleClass] nvarchar(50) '$.ModuleClass'
,[ConnStringID] nvarchar(50) '$.ConnStringID'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
,[PositionX] smallint '$.PositionX'
,[PositionY] smallint '$.PositionY'
,[Width] smallint '$.Width'
,[Height] smallint '$.Height'
) 
) AS Source ([PageName],[ModuleName],[LayoutPositionId],[RelationWhere],[Order],[SQlEnabled],[SQLEnabledDescrip],[Title],[IconName],[HeaderClass],[ModuleClass],[ConnStringID],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId],[PositionX],[PositionY],[Width],[Height])
ON (Target.[PageName] = Source.[PageName] AND Target.[ModuleName] = Source.[ModuleName])
WHEN MATCHED AND (
	NULLIF(Source.[LayoutPositionId], Target.[LayoutPositionId]) IS NOT NULL OR NULLIF(Target.[LayoutPositionId], Source.[LayoutPositionId]) IS NOT NULL OR 
	NULLIF(Source.[RelationWhere], Target.[RelationWhere]) IS NOT NULL OR NULLIF(Target.[RelationWhere], Source.[RelationWhere]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[SQlEnabled], Target.[SQlEnabled]) IS NOT NULL OR NULLIF(Target.[SQlEnabled], Source.[SQlEnabled]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabledDescrip], Target.[SQLEnabledDescrip]) IS NOT NULL OR NULLIF(Target.[SQLEnabledDescrip], Source.[SQLEnabledDescrip]) IS NOT NULL OR 
	NULLIF(Source.[Title], Target.[Title]) IS NOT NULL OR NULLIF(Target.[Title], Source.[Title]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[HeaderClass], Target.[HeaderClass]) IS NOT NULL OR NULLIF(Target.[HeaderClass], Source.[HeaderClass]) IS NOT NULL OR 
	NULLIF(Source.[ModuleClass], Target.[ModuleClass]) IS NOT NULL OR NULLIF(Target.[ModuleClass], Source.[ModuleClass]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringID], Target.[ConnStringID]) IS NOT NULL OR NULLIF(Target.[ConnStringID], Source.[ConnStringID]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL OR 
	NULLIF(Source.[PositionX], Target.[PositionX]) IS NOT NULL OR NULLIF(Target.[PositionX], Source.[PositionX]) IS NOT NULL OR 
	NULLIF(Source.[PositionY], Target.[PositionY]) IS NOT NULL OR NULLIF(Target.[PositionY], Source.[PositionY]) IS NOT NULL OR 
	NULLIF(Source.[Width], Target.[Width]) IS NOT NULL OR NULLIF(Target.[Width], Source.[Width]) IS NOT NULL OR 
	NULLIF(Source.[Height], Target.[Height]) IS NOT NULL OR NULLIF(Target.[Height], Source.[Height]) IS NOT NULL) THEN
 UPDATE SET
  [LayoutPositionId] = Source.[LayoutPositionId], 
  [RelationWhere] = Source.[RelationWhere], 
  [Order] = Source.[Order], 
  [SQlEnabled] = Source.[SQlEnabled], 
  [SQLEnabledDescrip] = Source.[SQLEnabledDescrip], 
  [Title] = Source.[Title], 
  [IconName] = Source.[IconName], 
  [HeaderClass] = Source.[HeaderClass], 
  [ModuleClass] = Source.[ModuleClass], 
  [ConnStringID] = Source.[ConnStringID], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId], 
  [PositionX] = Source.[PositionX], 
  [PositionY] = Source.[PositionY], 
  [Width] = Source.[Width], 
  [Height] = Source.[Height]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([PageName],[ModuleName],[LayoutPositionId],[RelationWhere],[Order],[SQlEnabled],[SQLEnabledDescrip],[Title],[IconName],[HeaderClass],[ModuleClass],[ConnStringID],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId],[PositionX],[PositionY],[Width],[Height])
 VALUES(Source.[PageName],Source.[ModuleName],Source.[LayoutPositionId],Source.[RelationWhere],Source.[Order],Source.[SQlEnabled],Source.[SQLEnabledDescrip],Source.[Title],Source.[IconName],Source.[HeaderClass],Source.[ModuleClass],Source.[ConnStringID],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId],Source.[PositionX],Source.[PositionY],Source.[Width],Source.[Height])
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





