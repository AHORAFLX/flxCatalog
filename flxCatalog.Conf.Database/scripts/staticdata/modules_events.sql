

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ModuleEventId":"cat_producto_gestion_doc_img_event",
	"ModuleName":"cat_producto_gestion_doc_img",
	"EventClass":"dialog",
	"EventType":"closed",
	"EventAction":"refresh",
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ModuleEventId":"vta_devolucion_gestion_doc_img_event",
	"ModuleName":"vta_devolucion_gestion_doc_img",
	"EventClass":"dialog",
	"EventType":"closed",
	"EventAction":"refresh",
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T11:55:00",
	"flxUpdatedDate":"2026-09-21T11:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ModuleEventId":"vta_incidencia_gestion_doc_img_event",
	"ModuleName":"vta_incidencia_gestion_doc_img",
	"EventClass":"dialog",
	"EventType":"closed",
	"EventAction":"refresh",
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T12:42:00",
	"flxUpdatedDate":"2026-09-21T12:42:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ModuleEventId":"vta_pedido_gestion_doc_img_event",
	"ModuleName":"vta_pedido_gestion_doc_img",
	"EventClass":"dialog",
	"EventType":"closed",
	"EventAction":"refresh",
	"Active":true,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Modules_Events] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ModuleEventId] nvarchar(50) '$.ModuleEventId'
,[ModuleName] nvarchar(100) '$.ModuleName'
,[EventClass] nvarchar(50) '$.EventClass'
,[EventType] nvarchar(50) '$.EventType'
,[EventAction] nvarchar(50) '$.EventAction'
,[ProcessName] nvarchar(255) '$.ProcessName'
,[ObjectFilter] nvarchar(50) '$.ObjectFilter'
,[PropertyFilter] nvarchar(50) '$.PropertyFilter'
,[ProcessFilter] nvarchar(255) '$.ProcessFilter'
,[ModuleFilter] nvarchar(100) '$.ModuleFilter'
,[PageFilter] nvarchar(100) '$.PageFilter'
,[MethodFilter] nvarchar(255) '$.MethodFilter'
,[Active] bit '$.Active'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ModuleEventId],[ModuleName],[EventClass],[EventType],[EventAction],[ProcessName],[ObjectFilter],[PropertyFilter],[ProcessFilter],[ModuleFilter],[PageFilter],[MethodFilter],[Active],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ModuleEventId] = Source.[ModuleEventId])
WHEN MATCHED AND (
	NULLIF(Source.[ModuleName], Target.[ModuleName]) IS NOT NULL OR NULLIF(Target.[ModuleName], Source.[ModuleName]) IS NOT NULL OR 
	NULLIF(Source.[EventClass], Target.[EventClass]) IS NOT NULL OR NULLIF(Target.[EventClass], Source.[EventClass]) IS NOT NULL OR 
	NULLIF(Source.[EventType], Target.[EventType]) IS NOT NULL OR NULLIF(Target.[EventType], Source.[EventType]) IS NOT NULL OR 
	NULLIF(Source.[EventAction], Target.[EventAction]) IS NOT NULL OR NULLIF(Target.[EventAction], Source.[EventAction]) IS NOT NULL OR 
	NULLIF(Source.[ProcessName], Target.[ProcessName]) IS NOT NULL OR NULLIF(Target.[ProcessName], Source.[ProcessName]) IS NOT NULL OR 
	NULLIF(Source.[ObjectFilter], Target.[ObjectFilter]) IS NOT NULL OR NULLIF(Target.[ObjectFilter], Source.[ObjectFilter]) IS NOT NULL OR 
	NULLIF(Source.[PropertyFilter], Target.[PropertyFilter]) IS NOT NULL OR NULLIF(Target.[PropertyFilter], Source.[PropertyFilter]) IS NOT NULL OR 
	NULLIF(Source.[ProcessFilter], Target.[ProcessFilter]) IS NOT NULL OR NULLIF(Target.[ProcessFilter], Source.[ProcessFilter]) IS NOT NULL OR 
	NULLIF(Source.[ModuleFilter], Target.[ModuleFilter]) IS NOT NULL OR NULLIF(Target.[ModuleFilter], Source.[ModuleFilter]) IS NOT NULL OR 
	NULLIF(Source.[PageFilter], Target.[PageFilter]) IS NOT NULL OR NULLIF(Target.[PageFilter], Source.[PageFilter]) IS NOT NULL OR 
	NULLIF(Source.[MethodFilter], Target.[MethodFilter]) IS NOT NULL OR NULLIF(Target.[MethodFilter], Source.[MethodFilter]) IS NOT NULL OR 
	NULLIF(Source.[Active], Target.[Active]) IS NOT NULL OR NULLIF(Target.[Active], Source.[Active]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ModuleName] = Source.[ModuleName], 
  [EventClass] = Source.[EventClass], 
  [EventType] = Source.[EventType], 
  [EventAction] = Source.[EventAction], 
  [ProcessName] = Source.[ProcessName], 
  [ObjectFilter] = Source.[ObjectFilter], 
  [PropertyFilter] = Source.[PropertyFilter], 
  [ProcessFilter] = Source.[ProcessFilter], 
  [ModuleFilter] = Source.[ModuleFilter], 
  [PageFilter] = Source.[PageFilter], 
  [MethodFilter] = Source.[MethodFilter], 
  [Active] = Source.[Active], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ModuleEventId],[ModuleName],[EventClass],[EventType],[EventAction],[ProcessName],[ObjectFilter],[PropertyFilter],[ProcessFilter],[ModuleFilter],[PageFilter],[MethodFilter],[Active],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ModuleEventId],Source.[ModuleName],Source.[EventClass],Source.[EventType],Source.[EventAction],Source.[ProcessName],Source.[ObjectFilter],Source.[PropertyFilter],Source.[ProcessFilter],Source.[ModuleFilter],Source.[PageFilter],Source.[MethodFilter],Source.[Active],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





