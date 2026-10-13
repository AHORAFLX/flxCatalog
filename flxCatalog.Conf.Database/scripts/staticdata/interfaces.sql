

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"InterfaceName":"webcliente",
	"TypeId":-3,
	"Descrip":"Interfaz web para el portal de clientes",
	"IsDefault":false,
	"Logo":"~\/img\/logo.png",
	"SkinId":"skin2026",
	"MainNavigateId":"C0167E61-8539-4658-BAEB-7FB023D88F58",
	"NavigateId":"5290BFAF-50CF-4BBA-9194-D42D96229629",
	"DefaultPageSize":50,
	"DefaultDropDownRows":20,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-17T10:08:00",
	"flxUpdatedDate":"2026-09-18T10:16:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Interfaces] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[InterfaceName] nvarchar(100) '$.InterfaceName'
,[TypeId] int '$.TypeId'
,[Descrip] nvarchar(100) '$.Descrip'
,[IsDefault] bit '$.IsDefault'
,[Logo] nvarchar(255) '$.Logo'
,[SkinId] nvarchar(50) '$.SkinId'
,[Script] nvarchar(max) '$.Script'
,[Style] nvarchar(1000) '$.Style'
,[MainNavigateId] uniqueidentifier '$.MainNavigateId'
,[NavigateId] uniqueidentifier '$.NavigateId'
,[StartupPageName] nvarchar(250) '$.StartupPageName'
,[DefaultPageSize] int '$.DefaultPageSize'
,[DefaultDropDownRows] int '$.DefaultDropDownRows'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([InterfaceName],[TypeId],[Descrip],[IsDefault],[Logo],[SkinId],[Script],[Style],[MainNavigateId],[NavigateId],[StartupPageName],[DefaultPageSize],[DefaultDropDownRows],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[InterfaceName] = Source.[InterfaceName])
WHEN MATCHED AND (
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[IsDefault], Target.[IsDefault]) IS NOT NULL OR NULLIF(Target.[IsDefault], Source.[IsDefault]) IS NOT NULL OR 
	NULLIF(Source.[Logo], Target.[Logo]) IS NOT NULL OR NULLIF(Target.[Logo], Source.[Logo]) IS NOT NULL OR 
	NULLIF(Source.[SkinId], Target.[SkinId]) IS NOT NULL OR NULLIF(Target.[SkinId], Source.[SkinId]) IS NOT NULL OR 
	NULLIF(Source.[Script], Target.[Script]) IS NOT NULL OR NULLIF(Target.[Script], Source.[Script]) IS NOT NULL OR 
	NULLIF(Source.[Style], Target.[Style]) IS NOT NULL OR NULLIF(Target.[Style], Source.[Style]) IS NOT NULL OR 
	NULLIF(Source.[MainNavigateId], Target.[MainNavigateId]) IS NOT NULL OR NULLIF(Target.[MainNavigateId], Source.[MainNavigateId]) IS NOT NULL OR 
	NULLIF(Source.[NavigateId], Target.[NavigateId]) IS NOT NULL OR NULLIF(Target.[NavigateId], Source.[NavigateId]) IS NOT NULL OR 
	NULLIF(Source.[StartupPageName], Target.[StartupPageName]) IS NOT NULL OR NULLIF(Target.[StartupPageName], Source.[StartupPageName]) IS NOT NULL OR 
	NULLIF(Source.[DefaultPageSize], Target.[DefaultPageSize]) IS NOT NULL OR NULLIF(Target.[DefaultPageSize], Source.[DefaultPageSize]) IS NOT NULL OR 
	NULLIF(Source.[DefaultDropDownRows], Target.[DefaultDropDownRows]) IS NOT NULL OR NULLIF(Target.[DefaultDropDownRows], Source.[DefaultDropDownRows]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [TypeId] = Source.[TypeId], 
  [Descrip] = Source.[Descrip], 
  [IsDefault] = Source.[IsDefault], 
  [Logo] = Source.[Logo], 
  [SkinId] = Source.[SkinId], 
  [Script] = Source.[Script], 
  [Style] = Source.[Style], 
  [MainNavigateId] = Source.[MainNavigateId], 
  [NavigateId] = Source.[NavigateId], 
  [StartupPageName] = Source.[StartupPageName], 
  [DefaultPageSize] = Source.[DefaultPageSize], 
  [DefaultDropDownRows] = Source.[DefaultDropDownRows], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([InterfaceName],[TypeId],[Descrip],[IsDefault],[Logo],[SkinId],[Script],[Style],[MainNavigateId],[NavigateId],[StartupPageName],[DefaultPageSize],[DefaultDropDownRows],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[InterfaceName],Source.[TypeId],Source.[Descrip],Source.[IsDefault],Source.[Logo],Source.[SkinId],Source.[Script],Source.[Style],Source.[MainNavigateId],Source.[NavigateId],Source.[StartupPageName],Source.[DefaultPageSize],Source.[DefaultDropDownRows],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





