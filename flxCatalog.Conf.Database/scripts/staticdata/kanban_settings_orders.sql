

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"KanbanSettingsName":"kb-vta-mesa-devoluciones",
	"OrderField":"FechaSolicitud",
	"Order":0,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-devoluciones",
	"OrderField":"IdDevolucion",
	"Order":1,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-incidencias",
	"OrderField":"FechaAlta",
	"Order":0,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-incidencias",
	"OrderField":"IdIncidencia",
	"Order":1,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-pedidos",
	"OrderField":"Fecha",
	"Order":0,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-pedidos",
	"OrderField":"Numero",
	"Order":1,
	"OrderType":"DESC",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-27T08:07:00",
	"flxUpdatedDate":"2026-10-27T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Kanban_Settings_Orders] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[KanbanSettingsName] nvarchar(50) '$.KanbanSettingsName'
,[OrderField] nvarchar(100) '$.OrderField'
,[Order] int '$.Order'
,[OrderType] nvarchar(4) '$.OrderType'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([KanbanSettingsName],[OrderField],[Order],[OrderType],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[KanbanSettingsName] = Source.[KanbanSettingsName] AND Target.[OrderField] = Source.[OrderField])
WHEN MATCHED AND (
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[OrderType], Target.[OrderType]) IS NOT NULL OR NULLIF(Target.[OrderType], Source.[OrderType]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Order] = Source.[Order], 
  [OrderType] = Source.[OrderType], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([KanbanSettingsName],[OrderField],[Order],[OrderType],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[KanbanSettingsName],Source.[OrderField],Source.[Order],Source.[OrderType],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





