

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ProcessName":"pCAT_ArchivarProducto",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Archivar este producto? Dejará de estar activo.",
	"ProcessDescrip":"Archiva el producto (Activo = No)",
	"StoredName":"pCAT_ArchivarProducto",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:34:00",
	"flxUpdatedDate":"2026-09-15T17:34:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pCAT_DuplicarProducto",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Duplicar este producto? Se creará una copia desactivada.",
	"ProcessDescrip":"Duplica el producto y sus variantes (desactivado, stock a 0)",
	"StoredName":"pCAT_DuplicarProducto",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:34:00",
	"flxUpdatedDate":"2026-09-15T17:34:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pCAT_ToggleFavorito",
	"TypeId":0,
	"ClassId":"product",
	"LoadingMessage":"Actualizando favoritos...",
	"ProcessDescrip":"Añade o quita el producto de tus favoritos",
	"StoredName":"pCAT_ToggleFavorito",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T20:56:00",
	"flxUpdatedDate":"2026-09-17T20:56:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pCLI_AbrirMiFicha",
	"TypeId":0,
	"ClassId":"product",
	"ProcessDescrip":"Abre mi ficha de cliente directamente",
	"StoredName":"pCLI_AbrirMiFicha",
	"ObjectName":"CLI_Cliente",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":false,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-18T08:53:00",
	"flxUpdatedDate":"2026-09-18T08:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pSeed_ResetDemoData",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"Esto borra y vuelve a crear TODOS los datos del catálogo (familias, marcas, tallas, colores, productos, variantes, tarifas, clientes y pedidos). ¿Continuar?",
	"LoadingMessage":"Regenerando datos de demostración...",
	"ProcessDescrip":"Resetear datos demo",
	"StoredName":"pSeed_ResetDemoData",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":true,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonIconName":"fa-database",
	"GipeParams":false,
	"Summary":"Regenera todos los datos de demostración del catálogo desde cero, con volumen realista en cada tabla.",
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T15:41:00",
	"flxUpdatedDate":"2026-09-17T15:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_AbrirMiCarrito",
	"TypeId":0,
	"ClassId":"product",
	"ProcessDescrip":"Abre mi carrito, creándolo vacío si todavía no existe",
	"StoredName":"pVTA_AbrirMiCarrito",
	"ObjectName":"VTA_Pedido",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":false,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T22:31:00",
	"flxUpdatedDate":"2026-09-17T22:31:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_ActualizarCarrito",
	"TypeId":0,
	"ClassId":"product",
	"LoadingMessage":"Actualizando carrito...",
	"ProcessDescrip":"Cambia la cantidad de una línea del carrito, o la quita si la cantidad es 0",
	"StoredName":"pVTA_ActualizarLineaCarrito",
	"ObjectName":"VTA_LineaPedido",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T22:27:00",
	"flxUpdatedDate":"2026-09-17T22:27:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_AnadirConVariante",
	"TypeId":0,
	"ClassId":"product",
	"LoadingMessage":"Añadiendo al carrito...",
	"ProcessDescrip":"Añade el producto al carrito eligiendo variante y cantidad",
	"StoredName":"pVTA_ActualizarLineaCarrito",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"slideright",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonText":"Añadir al carrito",
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T21:27:00",
	"flxUpdatedDate":"2026-09-17T21:27:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_AnadirRapido",
	"TypeId":0,
	"ClassId":"product",
	"LoadingMessage":"Añadiendo al carrito...",
	"ProcessDescrip":"Añade 1 unidad del producto al carrito",
	"StoredName":"pVTA_ActualizarLineaCarrito",
	"ObjectName":"CAT_Producto",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-17T21:27:00",
	"flxUpdatedDate":"2026-09-17T21:27:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_CancelarDevolucion",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Cancelar esta devolución? Esta acción no se puede deshacer.",
	"ProcessDescrip":"Cancela la devolución (rol cliente, solo en estado Solicitada)",
	"StoredName":"pVTA_CancelarDevolucion",
	"ObjectName":"VTA_Devolucion",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonText":"Cancelar",
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-22T21:15:00",
	"flxUpdatedDate":"2026-09-22T21:15:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_CancelarIncidencia",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Cancelar esta incidencia? Esta acción no se puede deshacer.",
	"ProcessDescrip":"Cancela la incidencia (rol cliente, solo en estado Abierta)",
	"StoredName":"pVTA_CancelarIncidencia",
	"ObjectName":"VTA_Incidencia",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonText":"Cancelar",
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-22T21:15:00",
	"flxUpdatedDate":"2026-09-22T21:15:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_CancelarPedido",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Cancelar este pedido? Esta acción no se puede deshacer.",
	"ProcessDescrip":"Cancela el pedido",
	"StoredName":"pVTA_CancelarPedido",
	"ObjectName":"VTA_Pedido",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:52:00",
	"flxUpdatedDate":"2026-09-15T17:52:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_ConfirmarPedido",
	"TypeId":0,
	"ClassId":"product",
	"ConfirmText":"¿Confirmar este pedido?",
	"ProcessDescrip":"Confirma el pedido (Borrador ? Confirmado)",
	"StoredName":"pVTA_ConfirmarPedido",
	"ObjectName":"VTA_Pedido",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:52:00",
	"flxUpdatedDate":"2026-09-15T17:52:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_GenerarPdfPedido",
	"TypeId":1,
	"ClassId":"product",
	"ProcessDescrip":"Genera un PDF básico del pedido y lo descarga",
	"File":"~\/bin\/flxCatalog.Processes.dll",
	"Class":"flxCatalog_processes.VtaPedidos",
	"Method":"GenerarPdfPedido",
	"ObjectName":"VTA_Pedido",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"current",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":false,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T17:54:00",
	"flxUpdatedDate":"2026-09-15T17:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_SolicitarDevolucion",
	"TypeId":1,
	"ClassId":"product",
	"ConfirmText":"¿Confirmas la solicitud de devolución?",
	"LoadingMessage":"Registrando la solicitud...",
	"ProcessDescrip":"Solicita la devolución de una línea de pedido (rol cliente)",
	"File":"~\/bin\/flxCatalog.Processes.dll",
	"Class":"flxCatalog_processes.VtaPostventa",
	"Method":"SolicitarDevolucion",
	"ObjectName":"VTA_Devolucion",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"slideright",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonText":"Solicitar devolución",
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-22T21:56:00",
	"flxUpdatedDate":"2026-09-22T21:56:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ProcessName":"pVTA_SolicitarIncidencia",
	"TypeId":1,
	"ClassId":"product",
	"ConfirmText":"¿Confirmas el registro de la incidencia?",
	"LoadingMessage":"Registrando la incidencia...",
	"ProcessDescrip":"Solicita una incidencia sobre un pedido (rol cliente)",
	"File":"~\/bin\/flxCatalog.Processes.dll",
	"Class":"flxCatalog_processes.VtaPostventa",
	"Method":"SolicitarIncidencia",
	"ObjectName":"VTA_Incidencia",
	"TimeOut":0,
	"ConnStringId":"DataConnectionString",
	"TargetId":"slideright",
	"Auditable":1,
	"AuditableErrors":1,
	"Refresh":true,
	"IsTransacted":false,
	"AdminOnly":false,
	"ConfirmOkText":true,
	"CloseDialogOnOk":true,
	"RunButtonText":"Enviar",
	"GipeParams":false,
	"Reserved":false,
	"Offline":false,
	"LoadFromMemory":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-22T21:56:00",
	"flxUpdatedDate":"2026-09-22T21:56:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Processes] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ProcessName] nvarchar(255) '$.ProcessName'
,[TypeId] int '$.TypeId'
,[ClassId] nvarchar(50) '$.ClassId'
,[ConfirmText] varchar(200) '$.ConfirmText'
,[LoadingMessage] nvarchar(500) '$.LoadingMessage'
,[ProcessDescrip] nvarchar(500) '$.ProcessDescrip'
,[ParamsDescrip] nvarchar(500) '$.ParamsDescrip'
,[ReturnDescrip] nvarchar(500) '$.ReturnDescrip'
,[JSforParams] varchar(2000) '$.JSforParams'
,[File] varchar(255) '$.File'
,[Class] varchar(255) '$.Class'
,[Method] varchar(50) '$.Method'
,[StoredName] varchar(255) '$.StoredName'
,[Code] varchar(max) '$.Code'
,[ExternalUrl] varchar(255) '$.ExternalUrl'
,[PageTypeId] nvarchar(50) '$.PageTypeId'
,[PageName] nvarchar(100) '$.PageName'
,[ReportName] nvarchar(200) '$.ReportName'
,[HelpId] uniqueidentifier '$.HelpId'
,[ReportWhere] nvarchar(1000) '$.ReportWhere'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[ObjectWhere] nvarchar(1000) '$.ObjectWhere'
,[Defaults] varchar(2000) '$.Defaults'
,[TimeOut] int '$.TimeOut'
,[ConnStringId] nvarchar(255) '$.ConnStringId'
,[TargetId] nvarchar(50) '$.TargetId'
,[ProcessFlowText] nvarchar(500) '$.ProcessFlowText'
,[Auditable] int '$.Auditable'
,[AuditableErrors] int '$.AuditableErrors'
,[Refresh] bit '$.Refresh'
,[IsTransacted] bit '$.IsTransacted'
,[AdminOnly] bit '$.AdminOnly'
,[ConfirmOkText] bit '$.ConfirmOkText'
,[CloseDialogOnOk] bit '$.CloseDialogOnOk'
,[RunButtonText] nvarchar(100) '$.RunButtonText'
,[RunButtonIconName] nvarchar(100) '$.RunButtonIconName'
,[LoadProcessName] nvarchar(255) '$.LoadProcessName'
,[GipeParams] bit '$.GipeParams'
,[Summary] nvarchar(max) '$.Summary'
,[ReturnTableNames] nvarchar(max) '$.ReturnTableNames'
,[Reserved] bit '$.Reserved'
,[Offline] bit '$.Offline'
,[BeforeExec] nvarchar(255) '$.BeforeExec'
,[AfterExec] nvarchar(255) '$.AfterExec'
,[LoadFromMemory] bit '$.LoadFromMemory'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ProcessName],[TypeId],[ClassId],[ConfirmText],[LoadingMessage],[ProcessDescrip],[ParamsDescrip],[ReturnDescrip],[JSforParams],[File],[Class],[Method],[StoredName],[Code],[ExternalUrl],[PageTypeId],[PageName],[ReportName],[HelpId],[ReportWhere],[ObjectName],[ObjectWhere],[Defaults],[TimeOut],[ConnStringId],[TargetId],[ProcessFlowText],[Auditable],[AuditableErrors],[Refresh],[IsTransacted],[AdminOnly],[ConfirmOkText],[CloseDialogOnOk],[RunButtonText],[RunButtonIconName],[LoadProcessName],[GipeParams],[Summary],[ReturnTableNames],[Reserved],[Offline],[BeforeExec],[AfterExec],[LoadFromMemory],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ProcessName] = Source.[ProcessName])
WHEN MATCHED AND (
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[ClassId], Target.[ClassId]) IS NOT NULL OR NULLIF(Target.[ClassId], Source.[ClassId]) IS NOT NULL OR 
	NULLIF(Source.[ConfirmText], Target.[ConfirmText]) IS NOT NULL OR NULLIF(Target.[ConfirmText], Source.[ConfirmText]) IS NOT NULL OR 
	NULLIF(Source.[LoadingMessage], Target.[LoadingMessage]) IS NOT NULL OR NULLIF(Target.[LoadingMessage], Source.[LoadingMessage]) IS NOT NULL OR 
	NULLIF(Source.[ProcessDescrip], Target.[ProcessDescrip]) IS NOT NULL OR NULLIF(Target.[ProcessDescrip], Source.[ProcessDescrip]) IS NOT NULL OR 
	NULLIF(Source.[ParamsDescrip], Target.[ParamsDescrip]) IS NOT NULL OR NULLIF(Target.[ParamsDescrip], Source.[ParamsDescrip]) IS NOT NULL OR 
	NULLIF(Source.[ReturnDescrip], Target.[ReturnDescrip]) IS NOT NULL OR NULLIF(Target.[ReturnDescrip], Source.[ReturnDescrip]) IS NOT NULL OR 
	NULLIF(Source.[JSforParams], Target.[JSforParams]) IS NOT NULL OR NULLIF(Target.[JSforParams], Source.[JSforParams]) IS NOT NULL OR 
	NULLIF(Source.[File], Target.[File]) IS NOT NULL OR NULLIF(Target.[File], Source.[File]) IS NOT NULL OR 
	NULLIF(Source.[Class], Target.[Class]) IS NOT NULL OR NULLIF(Target.[Class], Source.[Class]) IS NOT NULL OR 
	NULLIF(Source.[Method], Target.[Method]) IS NOT NULL OR NULLIF(Target.[Method], Source.[Method]) IS NOT NULL OR 
	NULLIF(Source.[StoredName], Target.[StoredName]) IS NOT NULL OR NULLIF(Target.[StoredName], Source.[StoredName]) IS NOT NULL OR 
	NULLIF(Source.[Code], Target.[Code]) IS NOT NULL OR NULLIF(Target.[Code], Source.[Code]) IS NOT NULL OR 
	NULLIF(Source.[ExternalUrl], Target.[ExternalUrl]) IS NOT NULL OR NULLIF(Target.[ExternalUrl], Source.[ExternalUrl]) IS NOT NULL OR 
	NULLIF(Source.[PageTypeId], Target.[PageTypeId]) IS NOT NULL OR NULLIF(Target.[PageTypeId], Source.[PageTypeId]) IS NOT NULL OR 
	NULLIF(Source.[PageName], Target.[PageName]) IS NOT NULL OR NULLIF(Target.[PageName], Source.[PageName]) IS NOT NULL OR 
	NULLIF(Source.[ReportName], Target.[ReportName]) IS NOT NULL OR NULLIF(Target.[ReportName], Source.[ReportName]) IS NOT NULL OR 
	NULLIF(Source.[HelpId], Target.[HelpId]) IS NOT NULL OR NULLIF(Target.[HelpId], Source.[HelpId]) IS NOT NULL OR 
	NULLIF(Source.[ReportWhere], Target.[ReportWhere]) IS NOT NULL OR NULLIF(Target.[ReportWhere], Source.[ReportWhere]) IS NOT NULL OR 
	NULLIF(Source.[ObjectName], Target.[ObjectName]) IS NOT NULL OR NULLIF(Target.[ObjectName], Source.[ObjectName]) IS NOT NULL OR 
	NULLIF(Source.[ObjectWhere], Target.[ObjectWhere]) IS NOT NULL OR NULLIF(Target.[ObjectWhere], Source.[ObjectWhere]) IS NOT NULL OR 
	NULLIF(Source.[Defaults], Target.[Defaults]) IS NOT NULL OR NULLIF(Target.[Defaults], Source.[Defaults]) IS NOT NULL OR 
	NULLIF(Source.[TimeOut], Target.[TimeOut]) IS NOT NULL OR NULLIF(Target.[TimeOut], Source.[TimeOut]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringId], Target.[ConnStringId]) IS NOT NULL OR NULLIF(Target.[ConnStringId], Source.[ConnStringId]) IS NOT NULL OR 
	NULLIF(Source.[TargetId], Target.[TargetId]) IS NOT NULL OR NULLIF(Target.[TargetId], Source.[TargetId]) IS NOT NULL OR 
	NULLIF(Source.[ProcessFlowText], Target.[ProcessFlowText]) IS NOT NULL OR NULLIF(Target.[ProcessFlowText], Source.[ProcessFlowText]) IS NOT NULL OR 
	NULLIF(Source.[Auditable], Target.[Auditable]) IS NOT NULL OR NULLIF(Target.[Auditable], Source.[Auditable]) IS NOT NULL OR 
	NULLIF(Source.[AuditableErrors], Target.[AuditableErrors]) IS NOT NULL OR NULLIF(Target.[AuditableErrors], Source.[AuditableErrors]) IS NOT NULL OR 
	NULLIF(Source.[Refresh], Target.[Refresh]) IS NOT NULL OR NULLIF(Target.[Refresh], Source.[Refresh]) IS NOT NULL OR 
	NULLIF(Source.[IsTransacted], Target.[IsTransacted]) IS NOT NULL OR NULLIF(Target.[IsTransacted], Source.[IsTransacted]) IS NOT NULL OR 
	NULLIF(Source.[AdminOnly], Target.[AdminOnly]) IS NOT NULL OR NULLIF(Target.[AdminOnly], Source.[AdminOnly]) IS NOT NULL OR 
	NULLIF(Source.[ConfirmOkText], Target.[ConfirmOkText]) IS NOT NULL OR NULLIF(Target.[ConfirmOkText], Source.[ConfirmOkText]) IS NOT NULL OR 
	NULLIF(Source.[CloseDialogOnOk], Target.[CloseDialogOnOk]) IS NOT NULL OR NULLIF(Target.[CloseDialogOnOk], Source.[CloseDialogOnOk]) IS NOT NULL OR 
	NULLIF(Source.[RunButtonText], Target.[RunButtonText]) IS NOT NULL OR NULLIF(Target.[RunButtonText], Source.[RunButtonText]) IS NOT NULL OR 
	NULLIF(Source.[RunButtonIconName], Target.[RunButtonIconName]) IS NOT NULL OR NULLIF(Target.[RunButtonIconName], Source.[RunButtonIconName]) IS NOT NULL OR 
	NULLIF(Source.[LoadProcessName], Target.[LoadProcessName]) IS NOT NULL OR NULLIF(Target.[LoadProcessName], Source.[LoadProcessName]) IS NOT NULL OR 
	NULLIF(Source.[GipeParams], Target.[GipeParams]) IS NOT NULL OR NULLIF(Target.[GipeParams], Source.[GipeParams]) IS NOT NULL OR 
	NULLIF(Source.[Summary], Target.[Summary]) IS NOT NULL OR NULLIF(Target.[Summary], Source.[Summary]) IS NOT NULL OR 
	NULLIF(Source.[ReturnTableNames], Target.[ReturnTableNames]) IS NOT NULL OR NULLIF(Target.[ReturnTableNames], Source.[ReturnTableNames]) IS NOT NULL OR 
	NULLIF(Source.[Reserved], Target.[Reserved]) IS NOT NULL OR NULLIF(Target.[Reserved], Source.[Reserved]) IS NOT NULL OR 
	NULLIF(Source.[Offline], Target.[Offline]) IS NOT NULL OR NULLIF(Target.[Offline], Source.[Offline]) IS NOT NULL OR 
	NULLIF(Source.[BeforeExec], Target.[BeforeExec]) IS NOT NULL OR NULLIF(Target.[BeforeExec], Source.[BeforeExec]) IS NOT NULL OR 
	NULLIF(Source.[AfterExec], Target.[AfterExec]) IS NOT NULL OR NULLIF(Target.[AfterExec], Source.[AfterExec]) IS NOT NULL OR 
	NULLIF(Source.[LoadFromMemory], Target.[LoadFromMemory]) IS NOT NULL OR NULLIF(Target.[LoadFromMemory], Source.[LoadFromMemory]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [TypeId] = Source.[TypeId], 
  [ClassId] = Source.[ClassId], 
  [ConfirmText] = Source.[ConfirmText], 
  [LoadingMessage] = Source.[LoadingMessage], 
  [ProcessDescrip] = Source.[ProcessDescrip], 
  [ParamsDescrip] = Source.[ParamsDescrip], 
  [ReturnDescrip] = Source.[ReturnDescrip], 
  [JSforParams] = Source.[JSforParams], 
  [File] = Source.[File], 
  [Class] = Source.[Class], 
  [Method] = Source.[Method], 
  [StoredName] = Source.[StoredName], 
  [Code] = Source.[Code], 
  [ExternalUrl] = Source.[ExternalUrl], 
  [PageTypeId] = Source.[PageTypeId], 
  [PageName] = Source.[PageName], 
  [ReportName] = Source.[ReportName], 
  [HelpId] = Source.[HelpId], 
  [ReportWhere] = Source.[ReportWhere], 
  [ObjectName] = Source.[ObjectName], 
  [ObjectWhere] = Source.[ObjectWhere], 
  [Defaults] = Source.[Defaults], 
  [TimeOut] = Source.[TimeOut], 
  [ConnStringId] = Source.[ConnStringId], 
  [TargetId] = Source.[TargetId], 
  [ProcessFlowText] = Source.[ProcessFlowText], 
  [Auditable] = Source.[Auditable], 
  [AuditableErrors] = Source.[AuditableErrors], 
  [Refresh] = Source.[Refresh], 
  [IsTransacted] = Source.[IsTransacted], 
  [AdminOnly] = Source.[AdminOnly], 
  [ConfirmOkText] = Source.[ConfirmOkText], 
  [CloseDialogOnOk] = Source.[CloseDialogOnOk], 
  [RunButtonText] = Source.[RunButtonText], 
  [RunButtonIconName] = Source.[RunButtonIconName], 
  [LoadProcessName] = Source.[LoadProcessName], 
  [GipeParams] = Source.[GipeParams], 
  [Summary] = Source.[Summary], 
  [ReturnTableNames] = Source.[ReturnTableNames], 
  [Reserved] = Source.[Reserved], 
  [Offline] = Source.[Offline], 
  [BeforeExec] = Source.[BeforeExec], 
  [AfterExec] = Source.[AfterExec], 
  [LoadFromMemory] = Source.[LoadFromMemory], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ProcessName],[TypeId],[ClassId],[ConfirmText],[LoadingMessage],[ProcessDescrip],[ParamsDescrip],[ReturnDescrip],[JSforParams],[File],[Class],[Method],[StoredName],[Code],[ExternalUrl],[PageTypeId],[PageName],[ReportName],[HelpId],[ReportWhere],[ObjectName],[ObjectWhere],[Defaults],[TimeOut],[ConnStringId],[TargetId],[ProcessFlowText],[Auditable],[AuditableErrors],[Refresh],[IsTransacted],[AdminOnly],[ConfirmOkText],[CloseDialogOnOk],[RunButtonText],[RunButtonIconName],[LoadProcessName],[GipeParams],[Summary],[ReturnTableNames],[Reserved],[Offline],[BeforeExec],[AfterExec],[LoadFromMemory],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ProcessName],Source.[TypeId],Source.[ClassId],Source.[ConfirmText],Source.[LoadingMessage],Source.[ProcessDescrip],Source.[ParamsDescrip],Source.[ReturnDescrip],Source.[JSforParams],Source.[File],Source.[Class],Source.[Method],Source.[StoredName],Source.[Code],Source.[ExternalUrl],Source.[PageTypeId],Source.[PageName],Source.[ReportName],Source.[HelpId],Source.[ReportWhere],Source.[ObjectName],Source.[ObjectWhere],Source.[Defaults],Source.[TimeOut],Source.[ConnStringId],Source.[TargetId],Source.[ProcessFlowText],Source.[Auditable],Source.[AuditableErrors],Source.[Refresh],Source.[IsTransacted],Source.[AdminOnly],Source.[ConfirmOkText],Source.[CloseDialogOnOk],Source.[RunButtonText],Source.[RunButtonIconName],Source.[LoadProcessName],Source.[GipeParams],Source.[Summary],Source.[ReturnTableNames],Source.[Reserved],Source.[Offline],Source.[BeforeExec],Source.[AfterExec],Source.[LoadFromMemory],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





