

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"NodeId":"CBB70670-77B9-4A65-B499-01930A455ACA",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"C96488D9-3CFC-46E1-9C6F-0EC8A60B0561",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"6F38509E-D939-45C2-8C4C-3B5E0B37CE85",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"4B9E7144-2FAB-4E5A-ADF8-3C1DFF8CD997",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"663876E7-0914-4A7B-8CE6-480E73B34217",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"EAF2C216-983C-457A-9D34-53E6ADC21437",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"6DACE786-2B4C-4392-8A1A-5D9CA40FD62B",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"26295D67-1F80-4DA5-8AA1-696127447C91",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"86F4A4FC-C6AC-4539-8DE0-7E0B344049E2",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"BB497776-43BB-4BA1-8098-FAA001627D83",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:58:00",
	"flxUpdatedDate":"2026-10-02T19:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"NodeId":"D57B094F-499A-462A-907B-FE66E22F4B59",
	"RoleId":"allUsers",
	"CanView":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:55:00",
	"flxUpdatedDate":"2026-10-02T19:55:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Security_Navigation_Nodes_Roles] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[NodeId] uniqueidentifier '$.NodeId'
,[RoleId] nvarchar(128) '$.RoleId'
,[CanView] bit '$.CanView'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([NodeId],[RoleId],[CanView],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[NodeId] = Source.[NodeId] AND Target.[RoleId] = Source.[RoleId])
WHEN MATCHED AND (
	NULLIF(Source.[CanView], Target.[CanView]) IS NOT NULL OR NULLIF(Target.[CanView], Source.[CanView]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [CanView] = Source.[CanView], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([NodeId],[RoleId],[CanView],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[NodeId],Source.[RoleId],Source.[CanView],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





