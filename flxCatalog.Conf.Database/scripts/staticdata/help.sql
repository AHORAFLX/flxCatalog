

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"HelpId":"Help_CAT_Producto_ImagenPrincipal",
	"Title":"Imagen principal",
	"HTMLText":"Foto de portada usada en el catálogo público",
	"TargetId":"current",
	"IconName":"noicon",
	"Order":0,
	"Category":"Tool_Properties",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:39:00",
	"flxUpdatedDate":"2026-09-15T08:39:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"HelpId":"Help_CLI_Cliente_Geolocalizacion",
	"Title":"Geolocalización",
	"HTMLText":"Coordenadas (latitud, longitud) obtenidas de Google Places al buscar el negocio",
	"TargetId":"current",
	"IconName":"noicon",
	"Order":0,
	"Category":"Tool_Properties",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-18T13:11:00",
	"flxUpdatedDate":"2026-09-18T13:11:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"HelpId":"Help_CLI_Cliente_Nombre",
	"Title":"Buscar negocio (Google)",
	"HTMLText":"Busca el negocio en Google y se rellenará automáticamente la ficha",
	"TargetId":"current",
	"IconName":"noicon",
	"Order":0,
	"Category":"Tool_Properties",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-18T10:44:00",
	"flxUpdatedDate":"2026-09-18T10:44:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"HelpId":"Help_COM_Comentario_Puntuacion",
	"Title":"Puntuación",
	"HTMLText":"Puntuación de 1 a 5 (solo reseñas de producto)",
	"TargetId":"current",
	"IconName":"noicon",
	"Order":0,
	"Category":"Tool_Properties",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T19:13:00",
	"flxUpdatedDate":"2026-09-22T19:13:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Help] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[HelpId] nvarchar(50) '$.HelpId'
,[Title] nvarchar(150) '$.Title'
,[HTMLText] nvarchar(max) '$.HTMLText'
,[TargetId] nvarchar(50) '$.TargetId'
,[IconName] nvarchar(100) '$.IconName'
,[ExternalUrl] nvarchar(255) '$.ExternalUrl'
,[Order] int '$.Order'
,[Category] nvarchar(50) '$.Category'
,[Tag] nvarchar(200) '$.Tag'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([HelpId],[Title],[HTMLText],[TargetId],[IconName],[ExternalUrl],[Order],[Category],[Tag],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[HelpId] = Source.[HelpId])
WHEN MATCHED AND (
	NULLIF(Source.[Title], Target.[Title]) IS NOT NULL OR NULLIF(Target.[Title], Source.[Title]) IS NOT NULL OR 
	NULLIF(Source.[HTMLText], Target.[HTMLText]) IS NOT NULL OR NULLIF(Target.[HTMLText], Source.[HTMLText]) IS NOT NULL OR 
	NULLIF(Source.[TargetId], Target.[TargetId]) IS NOT NULL OR NULLIF(Target.[TargetId], Source.[TargetId]) IS NOT NULL OR 
	NULLIF(Source.[IconName], Target.[IconName]) IS NOT NULL OR NULLIF(Target.[IconName], Source.[IconName]) IS NOT NULL OR 
	NULLIF(Source.[ExternalUrl], Target.[ExternalUrl]) IS NOT NULL OR NULLIF(Target.[ExternalUrl], Source.[ExternalUrl]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[Category], Target.[Category]) IS NOT NULL OR NULLIF(Target.[Category], Source.[Category]) IS NOT NULL OR 
	NULLIF(Source.[Tag], Target.[Tag]) IS NOT NULL OR NULLIF(Target.[Tag], Source.[Tag]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Title] = Source.[Title], 
  [HTMLText] = Source.[HTMLText], 
  [TargetId] = Source.[TargetId], 
  [IconName] = Source.[IconName], 
  [ExternalUrl] = Source.[ExternalUrl], 
  [Order] = Source.[Order], 
  [Category] = Source.[Category], 
  [Tag] = Source.[Tag], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([HelpId],[Title],[HTMLText],[TargetId],[IconName],[ExternalUrl],[Order],[Category],[Tag],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[HelpId],Source.[Title],Source.[HTMLText],Source.[TargetId],Source.[IconName],Source.[ExternalUrl],Source.[Order],Source.[Category],Source.[Tag],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





