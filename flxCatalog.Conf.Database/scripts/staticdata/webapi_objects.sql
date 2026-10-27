

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Color",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-10-06T15:56:00",
	"flxUpdatedDate":"2026-10-06T15:56:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Talla",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Variante",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Devolucion",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoDevolucion",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoIncidencia",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoPedido",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Incidencia",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_LineaPedido",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_TipoIncidencia",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-26T17:19:00",
	"flxUpdatedDate":"2026-10-26T17:19:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [WebAPI_Objects] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[CanView] bit '$.CanView'
,[CanViewCollection] bit '$.CanViewCollection'
,[CanInsert] bit '$.CanInsert'
,[CanEdit] bit '$.CanEdit'
,[CanDelete] bit '$.CanDelete'
,[CanPrint] bit '$.CanPrint'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[CanView],[CanViewCollection],[CanInsert],[CanEdit],[CanDelete],[CanPrint],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName])
WHEN MATCHED AND (
	NULLIF(Source.[CanView], Target.[CanView]) IS NOT NULL OR NULLIF(Target.[CanView], Source.[CanView]) IS NOT NULL OR 
	NULLIF(Source.[CanViewCollection], Target.[CanViewCollection]) IS NOT NULL OR NULLIF(Target.[CanViewCollection], Source.[CanViewCollection]) IS NOT NULL OR 
	NULLIF(Source.[CanInsert], Target.[CanInsert]) IS NOT NULL OR NULLIF(Target.[CanInsert], Source.[CanInsert]) IS NOT NULL OR 
	NULLIF(Source.[CanEdit], Target.[CanEdit]) IS NOT NULL OR NULLIF(Target.[CanEdit], Source.[CanEdit]) IS NOT NULL OR 
	NULLIF(Source.[CanDelete], Target.[CanDelete]) IS NOT NULL OR NULLIF(Target.[CanDelete], Source.[CanDelete]) IS NOT NULL OR 
	NULLIF(Source.[CanPrint], Target.[CanPrint]) IS NOT NULL OR NULLIF(Target.[CanPrint], Source.[CanPrint]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [CanView] = Source.[CanView], 
  [CanViewCollection] = Source.[CanViewCollection], 
  [CanInsert] = Source.[CanInsert], 
  [CanEdit] = Source.[CanEdit], 
  [CanDelete] = Source.[CanDelete], 
  [CanPrint] = Source.[CanPrint], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[CanView],[CanViewCollection],[CanInsert],[CanEdit],[CanDelete],[CanPrint],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[CanView],Source.[CanViewCollection],Source.[CanInsert],Source.[CanEdit],Source.[CanDelete],Source.[CanPrint],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





