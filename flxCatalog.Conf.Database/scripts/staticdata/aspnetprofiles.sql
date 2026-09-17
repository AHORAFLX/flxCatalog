

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ProfileName":"Cliente",
	"Descrip":"Perfil Cliente",
	"CultureId":"es-es",
	"WebInterfaceName":"webcliente",
	"MobileInterfaceName":"webcliente",
	"StartupPageName":"d2e00246-cc6a-4cdb-993d-6ec7bd7c8d86",
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-17T10:18:00",
	"flxUpdatedDate":"2026-09-17T10:20:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [AspNetProfiles] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ProfileName] nvarchar(100) '$.ProfileName'
,[Descrip] nvarchar(100) '$.Descrip'
,[CultureId] nvarchar(8) '$.CultureId'
,[WebInterfaceName] nvarchar(100) '$.WebInterfaceName'
,[MobileInterfaceName] nvarchar(100) '$.MobileInterfaceName'
,[StartupPageName] nvarchar(100) '$.StartupPageName'
,[MailAccountId] nvarchar(100) '$.MailAccountId'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ProfileName],[Descrip],[CultureId],[WebInterfaceName],[MobileInterfaceName],[StartupPageName],[MailAccountId],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ProfileName] = Source.[ProfileName])
WHEN MATCHED AND (
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[CultureId], Target.[CultureId]) IS NOT NULL OR NULLIF(Target.[CultureId], Source.[CultureId]) IS NOT NULL OR 
	NULLIF(Source.[WebInterfaceName], Target.[WebInterfaceName]) IS NOT NULL OR NULLIF(Target.[WebInterfaceName], Source.[WebInterfaceName]) IS NOT NULL OR 
	NULLIF(Source.[MobileInterfaceName], Target.[MobileInterfaceName]) IS NOT NULL OR NULLIF(Target.[MobileInterfaceName], Source.[MobileInterfaceName]) IS NOT NULL OR 
	NULLIF(Source.[StartupPageName], Target.[StartupPageName]) IS NOT NULL OR NULLIF(Target.[StartupPageName], Source.[StartupPageName]) IS NOT NULL OR 
	NULLIF(Source.[MailAccountId], Target.[MailAccountId]) IS NOT NULL OR NULLIF(Target.[MailAccountId], Source.[MailAccountId]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Descrip] = Source.[Descrip], 
  [CultureId] = Source.[CultureId], 
  [WebInterfaceName] = Source.[WebInterfaceName], 
  [MobileInterfaceName] = Source.[MobileInterfaceName], 
  [StartupPageName] = Source.[StartupPageName], 
  [MailAccountId] = Source.[MailAccountId], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ProfileName],[Descrip],[CultureId],[WebInterfaceName],[MobileInterfaceName],[StartupPageName],[MailAccountId],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ProfileName],Source.[Descrip],Source.[CultureId],Source.[WebInterfaceName],Source.[MobileInterfaceName],Source.[StartupPageName],Source.[MailAccountId],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





