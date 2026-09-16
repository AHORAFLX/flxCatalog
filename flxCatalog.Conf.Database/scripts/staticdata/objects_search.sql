

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"SearchId":"BCA52B1D-48E8-40E7-BAD4-1BE7F97F6B59",
	"ObjectName":"CAT_Variantes",
	"Name":"Buscar variantes",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"78BB9E76-9794-4E99-8604-22CB0CAC7BA8",
	"ObjectName":"CAT_Marcas",
	"Name":"Buscar marcas",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Clientes",
	"Name":"Buscar clientes",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"3167C66B-2DF6-448F-8C14-6C648101A1CC",
	"ObjectName":"CAT_Familias",
	"Name":"Buscar familias",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"19D85F68-99A0-445D-AEB1-90BFFD24F219",
	"ObjectName":"VTA_Pedidos",
	"Name":"Buscar pedidos",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Productos",
	"Name":"Buscar productos",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Search] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[SearchId] uniqueidentifier '$.SearchId'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[Name] nvarchar(100) '$.Name'
,[Generic] bit '$.Generic'
,[IsDefault] bit '$.IsDefault'
,[Type] nvarchar(20) '$.Type'
,[Order] int '$.Order'
,[UserId] nvarchar(128) '$.UserId'
,[SQLSentence] nvarchar(max) '$.SQLSentence'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([SearchId],[ObjectName],[Name],[Generic],[IsDefault],[Type],[Order],[UserId],[SQLSentence],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[SearchId] = Source.[SearchId])
WHEN MATCHED AND (
	NULLIF(Source.[ObjectName], Target.[ObjectName]) IS NOT NULL OR NULLIF(Target.[ObjectName], Source.[ObjectName]) IS NOT NULL OR 
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[Generic], Target.[Generic]) IS NOT NULL OR NULLIF(Target.[Generic], Source.[Generic]) IS NOT NULL OR 
	NULLIF(Source.[IsDefault], Target.[IsDefault]) IS NOT NULL OR NULLIF(Target.[IsDefault], Source.[IsDefault]) IS NOT NULL OR 
	NULLIF(Source.[Type], Target.[Type]) IS NOT NULL OR NULLIF(Target.[Type], Source.[Type]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[UserId], Target.[UserId]) IS NOT NULL OR NULLIF(Target.[UserId], Source.[UserId]) IS NOT NULL OR 
	NULLIF(Source.[SQLSentence], Target.[SQLSentence]) IS NOT NULL OR NULLIF(Target.[SQLSentence], Source.[SQLSentence]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ObjectName] = Source.[ObjectName], 
  [Name] = Source.[Name], 
  [Generic] = Source.[Generic], 
  [IsDefault] = Source.[IsDefault], 
  [Type] = Source.[Type], 
  [Order] = Source.[Order], 
  [UserId] = Source.[UserId], 
  [SQLSentence] = Source.[SQLSentence], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([SearchId],[ObjectName],[Name],[Generic],[IsDefault],[Type],[Order],[UserId],[SQLSentence],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[SearchId],Source.[ObjectName],Source.[Name],Source.[Generic],Source.[IsDefault],Source.[Type],Source.[Order],Source.[UserId],Source.[SQLSentence],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





