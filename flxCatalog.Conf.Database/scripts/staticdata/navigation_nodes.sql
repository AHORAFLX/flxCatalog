

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"NodeId":"7F24A892-E754-4561-B8CB-0530BB284056",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"FD58AD03-BA2D-4616-9989-068841B32882",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"FEC9BBB6-7047-4FB5-9DEF-2FF117A78600",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
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
	"NodeId":"EF2191D0-7313-49F2-8479-7DE4FEC457B6",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"2C593F11-B3D5-410E-8D48-8DB78AEE582E",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"NodeId":"9B809AA0-16D0-48E5-B571-BBFBED6099D8",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
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
	"NodeId":"DF19F897-C2D5-479E-B69F-E899150D9556",
	"ParentNodeId":"95CCFB38-0087-43DA-A5F8-6F4BFABE631A",
	"Order":7,
	"Title":"Catálogo",
	"IconName":"box",
	"Descrip":"Catálogo",
	"TypeId":"page",
	"TargetId":"current",
	"PageName":"CAT_Catalogo_Publico",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:40:00",
	"flxUpdatedDate":"2026-09-15T08:40:00",
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
	"PageName":"CAT_Catalogo_Publico",
	"BadgeRefresh":0,
	"Enabled":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:41:00",
	"flxUpdatedDate":"2026-09-15T08:41:00",
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





