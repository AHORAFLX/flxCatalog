

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"MenuId":"036C0D31-2393-4E8A-9129-A44830FB7B60",
	"Descrip":"Duplicar producto",
	"IconName":"copy-1",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:34:00",
	"flxUpdatedDate":"2026-09-15T17:34:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"MenuId":"61210B41-C30C-4AA0-82D6-F11378DAEB4A",
	"Descrip":"Cancelar pedido",
	"IconName":"close-1",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:52:00",
	"flxUpdatedDate":"2026-09-15T17:52:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"MenuId":"67AE80E8-4003-43A5-88D2-787CFBCC1918",
	"Descrip":"Resetear datos demo",
	"IconName":"fa-database",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T15:41:00",
	"flxUpdatedDate":"2026-09-17T15:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"MenuId":"8E45BCFC-3C45-47B6-AB0E-4F0418A2E5CC",
	"Descrip":"Archivar producto",
	"IconName":"archive",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:34:00",
	"flxUpdatedDate":"2026-09-15T17:34:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"MenuId":"AC3A8E90-4108-4DF6-A936-8833C57FCD3E",
	"Descrip":"Generar PDF",
	"IconName":"pdf",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:54:00",
	"flxUpdatedDate":"2026-09-15T17:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"MenuId":"B18CAE04-517C-4A76-8B7C-1C80CD592236",
	"Descrip":"Confirmar pedido",
	"IconName":"check",
	"Disabled":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:52:00",
	"flxUpdatedDate":"2026-09-15T17:52:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Menus] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[MenuId] nvarchar(50) '$.MenuId'
,[Descrip] nvarchar(50) '$.Descrip'
,[ParentId] nvarchar(50) '$.ParentId'
,[IconName] nvarchar(100) '$.IconName'
,[Disabled] bit '$.Disabled'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([MenuId],[Descrip],[ParentId],[IconName],[Disabled],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[MenuId] = Source.[MenuId])
WHEN MATCHED AND (
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[ParentId], Target.[ParentId]) IS NOT NULL OR NULLIF(Target.[ParentId], Source.[ParentId]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[Disabled], Target.[Disabled]) IS NOT NULL OR NULLIF(Target.[Disabled], Source.[Disabled]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Descrip] = Source.[Descrip], 
  [ParentId] = Source.[ParentId], 
  [IconName] = Source.[IconName], 
  [Disabled] = Source.[Disabled], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([MenuId],[Descrip],[ParentId],[IconName],[Disabled],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[MenuId],Source.[Descrip],Source.[ParentId],Source.[IconName],Source.[Disabled],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





