

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"SearchId":"C827A6BD-6ACC-4DF6-8A1C-03A877A35F10",
	"ObjectName":"CAT_Tallas",
	"Name":"Buscar tallas",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"F23FC228-8CC7-411F-8AB6-0C4251557D71",
	"ObjectName":"CAT_Colores",
	"Name":"Buscar colores",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"C2F81E22-DC4A-4D74-B1C4-0CFEC5A8EE4F",
	"ObjectName":"VTA_TiposIncidencia",
	"Name":"Buscar tipos de incidencia",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"BBA3EF7A-D8C8-4E08-B719-12C1C97B8E8D",
	"ObjectName":"VTA_Devoluciones",
	"Name":"Buscar devoluciones",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-21T11:51:00",
	"flxUpdatedDate":"2026-09-21T11:51:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
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
	"SearchId":"033FDF7D-8435-4CB1-99B4-2F5D1B62525D",
	"ObjectName":"VTA_EstadosIncidencia",
	"Name":"Buscar estados de incidencia",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"890F1A10-B298-46B4-891E-5472DE169D92",
	"ObjectName":"VTA_Incidencias",
	"Name":"Buscar incidencias",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-21T12:41:00",
	"flxUpdatedDate":"2026-09-21T12:41:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"DE54D242-89E8-48DF-A576-57519C414E09",
	"ObjectName":"VTA_EstadosDevolucion",
	"Name":"Buscar estados de devolución",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
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
	"SearchId":"830CB6EE-14EA-472F-8DEF-657F69C4E4E6",
	"ObjectName":"VTA_EstadosPedido",
	"Name":"Buscar estados de pedido",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T20:05:00",
	"flxUpdatedDate":"2026-10-02T20:05:00",
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
	"SearchId":"12F3B9F5-F12D-49F4-9D89-793DE50BED55",
	"ObjectName":"CAT_Favoritos",
	"Name":"Buscar favoritos",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T20:55:00",
	"flxUpdatedDate":"2026-09-17T20:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"418C3D33-6D9C-486F-824A-7A56EA30AF23",
	"ObjectName":"VTA_Tarifas",
	"Name":"Buscar tarifas",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:34:00",
	"flxUpdatedDate":"2026-09-17T09:34:00",
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
	"OriginId":1
},{
	"SearchId":"41D8187D-7788-45CF-8EA0-A763391E5021",
	"ObjectName":"VTA_PreciosTarifa",
	"Name":"Buscar precios de tarifa",
	"Generic":false,
	"IsDefault":false,
	"Type":"Properties",
	"Order":1,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:36:00",
	"flxUpdatedDate":"2026-09-17T09:36:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"E1B11BC5-7EAD-48D0-8E64-E6E93B802C1C",
	"ObjectName":"CAT_Producto",
	"Name":"Text",
	"Generic":true,
	"IsDefault":false,
	"Type":"Text",
	"Order":2,
	"SQLSentence":"( EXISTS (\n',
N' SELECT * FROM Productos FlxTblFilter\n',
N' LEFT JOIN Marcas FlxCmb1 ON FlxCmb1.IdMarca = Productos.IdMarca\n',
N' LEFT JOIN Familias FlxCmb2 ON FlxCmb2.IdFamilia = Productos.IdFamilia\n',
N' WHERE ( [Productos].[Referencia] LIKE {~@Param1|16|50|FindString~}\n',
N' or [Productos].[Nombre] LIKE {~@Param2|16|200|FindString~}\n',
N' or [Productos].[DescripcionCorta] LIKE {~@Param3|16|500|FindString~}\n',
N' or [FlxCmb1].[Nombre] LIKE {~@Param4|16|150|FindString~}\n',
N' or [FlxCmb2].[Nombre] LIKE {~@Param5|16|150|FindString~}\n',
N' )\n',
N' AND [Productos].[IdProducto] = [FlxTblFilter].[IdProducto]\n',
N'))",
	"flxInsertedBy":"admin",
	"flxUpdatedBy":"admin",
	"flxInsertedDate":"2026-09-22T18:22:00",
	"flxUpdatedDate":"2026-09-22T18:22:00",
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





