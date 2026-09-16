

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"PluginId":"99D55D21-E0A9-489D-A490-78D45FE88DF9",
	"Path":"~\/flxCatalog\/css\/flx-dashboard.css",
	"Descrip":"Aspecto del panel de control: quita mayúsculas, doble tarjeta en KPIs y hover del skin",
	"Order":206,
	"typeId":1,
	"Bundle":true,
	"Enabled":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:36:00",
	"flxUpdatedDate":"2026-09-15T08:36:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Plugins] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[PluginId] uniqueidentifier '$.PluginId'
,[Path] nvarchar(500) '$.Path'
,[Descrip] nvarchar(100) '$.Descrip'
,[Order] int '$.Order'
,[typeId] int '$.typeId'
,[Bundle] bit '$.Bundle'
,[Enabled] bit '$.Enabled'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([PluginId],[Path],[Descrip],[Order],[typeId],[Bundle],[Enabled],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[PluginId] = Source.[PluginId])
WHEN MATCHED AND (
	NULLIF(Source.[Path], Target.[Path]) IS NOT NULL OR NULLIF(Target.[Path], Source.[Path]) IS NOT NULL OR 
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[typeId], Target.[typeId]) IS NOT NULL OR NULLIF(Target.[typeId], Source.[typeId]) IS NOT NULL OR 
	NULLIF(Source.[Bundle], Target.[Bundle]) IS NOT NULL OR NULLIF(Target.[Bundle], Source.[Bundle]) IS NOT NULL OR 
	NULLIF(Source.[Enabled], Target.[Enabled]) IS NOT NULL OR NULLIF(Target.[Enabled], Source.[Enabled]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Path] = Source.[Path], 
  [Descrip] = Source.[Descrip], 
  [Order] = Source.[Order], 
  [typeId] = Source.[typeId], 
  [Bundle] = Source.[Bundle], 
  [Enabled] = Source.[Enabled], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([PluginId],[Path],[Descrip],[Order],[typeId],[Bundle],[Enabled],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[PluginId],Source.[Path],Source.[Descrip],Source.[Order],Source.[typeId],Source.[Bundle],Source.[Enabled],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





