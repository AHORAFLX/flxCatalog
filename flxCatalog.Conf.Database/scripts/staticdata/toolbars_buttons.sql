

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ButtonId":"027EFD68-F6B1-44CA-8DDA-FF0C1C1325EE",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":19,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Print & Export Separator",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"0524E7AE-2E1B-442F-9494-2A457D1DD05B",
	"ToolbarName":"tb-cat-producto-view",
	"Order":22,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:35:00",
	"flxUpdatedDate":"2026-09-15T17:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"14D1A18C-6266-4DCB-9FEF-38DC5BA00614",
	"ToolbarName":"tb-cat-producto-view",
	"Order":20,
	"TypeId":"Print",
	"PositionId":"Toolbar",
	"Text":"Print",
	"Tooltip":"Print",
	"IconName":"flx-print",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"16FD50A0-78D3-4EF5-B866-6588BC6C78DC",
	"ToolbarName":"tb-cat-producto-view",
	"Order":3,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Separator",
	"Tooltip":"Separator",
	"HideText":false,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"1BEF0095-95A3-42DF-9700-4CDC24BF26A9",
	"ToolbarName":"tb-cat-producto-view",
	"Order":21,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Print & Export Separator",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"1FEAEB74-F02D-4D0F-8D9A-D15CD12F6BC3",
	"ToolbarName":"tb-cat-producto-view",
	"Order":19,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Print & Export Separator",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"20DCD990-662E-432F-AEDA-2098F9749F25",
	"ToolbarName":"tb-cat-producto-view",
	"Order":6,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Configure",
	"Tooltip":"Configure",
	"IconName":"settings-2",
	"HideText":true,
	"CssClass":"btnConfig",
	"ProcessName":"ConfigureEditView",
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"26AE42AD-CA63-4693-8F25-CAA0C9236FFA",
	"ToolbarName":"tb-cat-producto-view",
	"Order":10,
	"TypeId":"Help",
	"PositionId":"Toolbar",
	"Text":"Help",
	"Tooltip":"Help",
	"IconName":"help-2",
	"HideText":true,
	"TargetId":"popup",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"29A55AC9-B862-4646-B687-1ECF14981735",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":1,
	"TypeId":"Edit",
	"PositionId":"Toolbar",
	"Text":"Edit",
	"Tooltip":"Edit",
	"IconName":"flx-pencil",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"2CC10C84-A6B6-4A2D-969F-CD8E6915DE08",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":20,
	"TypeId":"Print",
	"PositionId":"Toolbar",
	"Text":"Print",
	"Tooltip":"Print",
	"IconName":"flx-print",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"341BEC69-1234-43BE-9868-2032F99FC75A",
	"ToolbarName":"tb-cat-producto-view",
	"Order":23,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Duplicar",
	"Tooltip":"Duplicar",
	"IconName":"copy-1",
	"HideText":false,
	"ProcessName":"pCAT_DuplicarProducto",
	"TargetId":"slideright",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:35:00",
	"flxUpdatedDate":"2026-09-15T17:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"35ADC416-E7D9-4085-97EB-161260D646BD",
	"ToolbarName":"tb-cat-producto-view",
	"Order":4,
	"TypeId":"Templates",
	"PositionId":"Toolbar",
	"Text":"Templates",
	"Tooltip":"Templates",
	"IconName":"templates",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"3BD08A3C-249B-46E9-B75B-069897F1318E",
	"ToolbarName":"tb-cat-producto-view",
	"Order":5,
	"TypeId":"ObjectMenu",
	"PositionId":"Toolbar",
	"Text":"Processes",
	"Tooltip":"Processes",
	"IconName":"bullet-list-3",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"44FD13FD-1158-4037-9A53-5FDFEF7B1156",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":0,
	"TypeId":"New",
	"PositionId":"Toolbar",
	"Text":"New",
	"Tooltip":"New",
	"IconName":"document-add",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"528EC7B7-EA80-4F05-B16C-59724F959105",
	"ToolbarName":"tb-cat-producto-view",
	"Order":2,
	"TypeId":"Delete",
	"PositionId":"Toolbar",
	"Text":"Delete",
	"Tooltip":"Delete",
	"IconName":"delete-2",
	"HideText":true,
	"CssClass":"txt-danger",
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"58926CAA-9F52-481D-8AF7-83A0B5117D34",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":22,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:53:00",
	"flxUpdatedDate":"2026-09-15T17:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"5D003AB7-0F51-439A-A88D-156EFBF5591F",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":24,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Cancelar",
	"Tooltip":"Cancelar",
	"IconName":"close-1",
	"HideText":false,
	"ProcessName":"pVTA_CancelarPedido",
	"TargetId":"slideright",
	"Disabled":false,
	"SQLEnabledDescrip":"No se puede cancelar un pedido entregado o ya cancelado",
	"SQLEnabled":"SELECT CASE WHEN (SELECT Nombre FROM Pedidos_Estados WHERE IdEstado=''{{IdEstado}}'') NOT IN (''Entregado'',''Cancelado'') THEN 1 ELSE 0 END",
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:53:00",
	"flxUpdatedDate":"2026-09-15T17:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"6C025474-6BBB-42A6-83CD-127B1E7B5720",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":23,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Confirmar",
	"Tooltip":"Confirmar",
	"IconName":"check",
	"HideText":false,
	"ProcessName":"pVTA_ConfirmarPedido",
	"TargetId":"slideright",
	"Disabled":false,
	"SQLEnabledDescrip":"Solo se puede confirmar un pedido en Borrador",
	"SQLEnabled":"SELECT CASE WHEN (SELECT Nombre FROM Pedidos_Estados WHERE IdEstado=''{{IdEstado}}'') = ''Borrador'' THEN 1 ELSE 0 END",
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:53:00",
	"flxUpdatedDate":"2026-09-15T17:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"73B3472A-F437-45B7-9228-B1887F279E03",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":4,
	"TypeId":"Templates",
	"PositionId":"Toolbar",
	"Text":"Templates",
	"Tooltip":"Templates",
	"IconName":"templates",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"80050763-F6D1-4D3B-860E-E71AE5FD6970",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":21,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Print & Export Separator",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"8A4AE444-CFB6-42F9-99CF-1796DB8311A5",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":10,
	"TypeId":"Help",
	"PositionId":"Toolbar",
	"Text":"Help",
	"Tooltip":"Help",
	"IconName":"help-2",
	"HideText":true,
	"TargetId":"popup",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"988CBCCE-E850-453A-96DD-3726C20EA60C",
	"ToolbarName":"tb-cat-producto-view",
	"Order":0,
	"TypeId":"New",
	"PositionId":"Toolbar",
	"Text":"New",
	"Tooltip":"New",
	"IconName":"document-add",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"9A719AA9-4991-4DC7-A36C-76C2C6D0B55C",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":25,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Generar PDF",
	"Tooltip":"Generar PDF",
	"IconName":"pdf",
	"HideText":false,
	"ProcessName":"pVTA_GenerarPdfPedido",
	"TargetId":"slideright",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:54:00",
	"flxUpdatedDate":"2026-09-15T17:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"BE697F9B-EF0B-4C61-90BA-88F0EC9A053E",
	"ToolbarName":"tb-cat-producto-view",
	"Order":1,
	"TypeId":"Edit",
	"PositionId":"Toolbar",
	"Text":"Edit",
	"Tooltip":"Edit",
	"IconName":"flx-pencil",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"C8708A30-02AB-4E49-BE91-253BA685701A",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":2,
	"TypeId":"Delete",
	"PositionId":"Toolbar",
	"Text":"Delete",
	"Tooltip":"Delete",
	"IconName":"delete-2",
	"HideText":true,
	"CssClass":"txt-danger",
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"CABCC477-117F-4435-8439-0B2E9071E406",
	"ToolbarName":"tb-cat-producto-view",
	"Order":24,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Archivar",
	"Tooltip":"Archivar",
	"IconName":"archive",
	"HideText":false,
	"ProcessName":"pCAT_ArchivarProducto",
	"TargetId":"slideright",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:35:00",
	"flxUpdatedDate":"2026-09-15T17:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"E465A0CD-6A2B-4A3F-A008-A124AB50139A",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":3,
	"TypeId":"Separator",
	"PositionId":"Toolbar",
	"Text":"Separator",
	"Tooltip":"Separator",
	"HideText":false,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"EA0D15DE-B711-46D0-ACAF-848AB3345D70",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":5,
	"TypeId":"ObjectMenu",
	"PositionId":"Toolbar",
	"Text":"Processes",
	"Tooltip":"Processes",
	"IconName":"bullet-list-3",
	"HideText":true,
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ButtonId":"ECF2207C-DBAB-4452-9C26-16A065DEE3FE",
	"ToolbarName":"tb-vta-pedido-view",
	"Order":6,
	"TypeId":"Process",
	"PositionId":"Toolbar",
	"Text":"Configure",
	"Tooltip":"Configure",
	"IconName":"settings-2",
	"HideText":true,
	"CssClass":"btnConfig",
	"ProcessName":"ConfigureEditView",
	"TargetId":"current",
	"Disabled":false,
	"ExcludeHist":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2024-01-01T00:00:00",
	"flxUpdatedDate":"2024-01-01T00:00:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [ToolBars_Buttons] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ButtonId] nvarchar(100) '$.ButtonId'
,[ToolbarName] nvarchar(50) '$.ToolbarName'
,[ParentButtonId] nvarchar(100) '$.ParentButtonId'
,[Order] int '$.Order'
,[TypeId] nvarchar(50) '$.TypeId'
,[PositionId] nvarchar(50) '$.PositionId'
,[Text] nvarchar(150) '$.Text'
,[Tooltip] nvarchar(150) '$.Tooltip'
,[IconName] nvarchar(100) '$.IconName'
,[HideText] bit '$.HideText'
,[CssClass] nvarchar(255) '$.CssClass'
,[SQlSentence] nvarchar(max) '$.SQlSentence'
,[ProcessName] nvarchar(255) '$.ProcessName'
,[TargetId] varchar(50) '$.TargetId'
,[ReportName] nvarchar(200) '$.ReportName'
,[HelpId] nvarchar(50) '$.HelpId'
,[Disabled] bit '$.Disabled'
,[SQLEnabledDescrip] nvarchar(250) '$.SQLEnabledDescrip'
,[SQLEnabled] nvarchar(max) '$.SQLEnabled'
,[ConnStringId] nvarchar(50) '$.ConnStringId'
,[SettingId] nvarchar(100) '$.SettingId'
,[ExcludeHist] bit '$.ExcludeHist'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ButtonId],[ToolbarName],[ParentButtonId],[Order],[TypeId],[PositionId],[Text],[Tooltip],[IconName],[HideText],[CssClass],[SQlSentence],[ProcessName],[TargetId],[ReportName],[HelpId],[Disabled],[SQLEnabledDescrip],[SQLEnabled],[ConnStringId],[SettingId],[ExcludeHist],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ButtonId] = Source.[ButtonId])
WHEN MATCHED AND (
	NULLIF(Source.[ToolbarName], Target.[ToolbarName]) IS NOT NULL OR NULLIF(Target.[ToolbarName], Source.[ToolbarName]) IS NOT NULL OR 
	NULLIF(Source.[ParentButtonId], Target.[ParentButtonId]) IS NOT NULL OR NULLIF(Target.[ParentButtonId], Source.[ParentButtonId]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[PositionId], Target.[PositionId]) IS NOT NULL OR NULLIF(Target.[PositionId], Source.[PositionId]) IS NOT NULL OR 
	NULLIF(Source.[Text], Target.[Text]) IS NOT NULL OR NULLIF(Target.[Text], Source.[Text]) IS NOT NULL OR 
	NULLIF(Source.[Tooltip], Target.[Tooltip]) IS NOT NULL OR NULLIF(Target.[Tooltip], Source.[Tooltip]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[HideText], Target.[HideText]) IS NOT NULL OR NULLIF(Target.[HideText], Source.[HideText]) IS NOT NULL OR 
	NULLIF(Source.[CssClass], Target.[CssClass]) IS NOT NULL OR NULLIF(Target.[CssClass], Source.[CssClass]) IS NOT NULL OR 
	NULLIF(Source.[SQlSentence], Target.[SQlSentence]) IS NOT NULL OR NULLIF(Target.[SQlSentence], Source.[SQlSentence]) IS NOT NULL OR 
	NULLIF(Source.[ProcessName], Target.[ProcessName]) IS NOT NULL OR NULLIF(Target.[ProcessName], Source.[ProcessName]) IS NOT NULL OR 
	NULLIF(Source.[TargetId], Target.[TargetId]) IS NOT NULL OR NULLIF(Target.[TargetId], Source.[TargetId]) IS NOT NULL OR 
	NULLIF(Source.[ReportName], Target.[ReportName]) IS NOT NULL OR NULLIF(Target.[ReportName], Source.[ReportName]) IS NOT NULL OR 
	NULLIF(Source.[HelpId], Target.[HelpId]) IS NOT NULL OR NULLIF(Target.[HelpId], Source.[HelpId]) IS NOT NULL OR 
	NULLIF(Source.[Disabled], Target.[Disabled]) IS NOT NULL OR NULLIF(Target.[Disabled], Source.[Disabled]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabledDescrip], Target.[SQLEnabledDescrip]) IS NOT NULL OR NULLIF(Target.[SQLEnabledDescrip], Source.[SQLEnabledDescrip]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabled], Target.[SQLEnabled]) IS NOT NULL OR NULLIF(Target.[SQLEnabled], Source.[SQLEnabled]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringId], Target.[ConnStringId]) IS NOT NULL OR NULLIF(Target.[ConnStringId], Source.[ConnStringId]) IS NOT NULL OR 
	NULLIF(Source.[SettingId], Target.[SettingId]) IS NOT NULL OR NULLIF(Target.[SettingId], Source.[SettingId]) IS NOT NULL OR 
	NULLIF(Source.[ExcludeHist], Target.[ExcludeHist]) IS NOT NULL OR NULLIF(Target.[ExcludeHist], Source.[ExcludeHist]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ToolbarName] = Source.[ToolbarName], 
  [ParentButtonId] = Source.[ParentButtonId], 
  [Order] = Source.[Order], 
  [TypeId] = Source.[TypeId], 
  [PositionId] = Source.[PositionId], 
  [Text] = Source.[Text], 
  [Tooltip] = Source.[Tooltip], 
  [IconName] = Source.[IconName], 
  [HideText] = Source.[HideText], 
  [CssClass] = Source.[CssClass], 
  [SQlSentence] = Source.[SQlSentence], 
  [ProcessName] = Source.[ProcessName], 
  [TargetId] = Source.[TargetId], 
  [ReportName] = Source.[ReportName], 
  [HelpId] = Source.[HelpId], 
  [Disabled] = Source.[Disabled], 
  [SQLEnabledDescrip] = Source.[SQLEnabledDescrip], 
  [SQLEnabled] = Source.[SQLEnabled], 
  [ConnStringId] = Source.[ConnStringId], 
  [SettingId] = Source.[SettingId], 
  [ExcludeHist] = Source.[ExcludeHist], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ButtonId],[ToolbarName],[ParentButtonId],[Order],[TypeId],[PositionId],[Text],[Tooltip],[IconName],[HideText],[CssClass],[SQlSentence],[ProcessName],[TargetId],[ReportName],[HelpId],[Disabled],[SQLEnabledDescrip],[SQLEnabled],[ConnStringId],[SettingId],[ExcludeHist],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ButtonId],Source.[ToolbarName],Source.[ParentButtonId],Source.[Order],Source.[TypeId],Source.[PositionId],Source.[Text],Source.[Tooltip],Source.[IconName],Source.[HideText],Source.[CssClass],Source.[SQlSentence],Source.[ProcessName],Source.[TargetId],Source.[ReportName],Source.[HelpId],Source.[Disabled],Source.[SQLEnabledDescrip],Source.[SQLEnabled],Source.[ConnStringId],Source.[SettingId],Source.[ExcludeHist],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





