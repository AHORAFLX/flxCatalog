

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"SearchId":"BCA52B1D-48E8-40E7-BAD4-1BE7F97F6B59",
	"ObjectName":"CAT_Variante",
	"PropertyName":"IdColor",
	"ObjectPath":"CAT_Variantes",
	"Size":3,
	"Order":2,
	"Label":"Color",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"BCA52B1D-48E8-40E7-BAD4-1BE7F97F6B59",
	"ObjectName":"CAT_Variante",
	"PropertyName":"IdProducto",
	"ObjectPath":"CAT_Variantes",
	"Size":6,
	"Order":0,
	"Label":"Producto",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"BCA52B1D-48E8-40E7-BAD4-1BE7F97F6B59",
	"ObjectName":"CAT_Variante",
	"PropertyName":"IdTalla",
	"ObjectPath":"CAT_Variantes",
	"Size":3,
	"Order":1,
	"Label":"Talla",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"78BB9E76-9794-4E99-8604-22CB0CAC7BA8",
	"ObjectName":"CAT_Marca",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Marcas",
	"Size":3,
	"Order":1,
	"Label":"Activo",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"78BB9E76-9794-4E99-8604-22CB0CAC7BA8",
	"ObjectName":"CAT_Marca",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Marcas",
	"Size":6,
	"Order":0,
	"Label":"Nombre",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Cliente",
	"PropertyName":"Activo",
	"ObjectPath":"CLI_Clientes",
	"Size":3,
	"Order":2,
	"Label":"Activo",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Cliente",
	"PropertyName":"Comercial",
	"ObjectPath":"CLI_Clientes",
	"Size":6,
	"Order":3,
	"Label":"Comercial",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Cliente",
	"PropertyName":"CreateDate",
	"ObjectPath":"CLI_Clientes",
	"Size":6,
	"Order":4,
	"Label":"Fecha de creación",
	"PropertySearchType":"datetime-range",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Cliente",
	"PropertyName":"IdTarifa",
	"ObjectPath":"CLI_Clientes",
	"Size":6,
	"Order":1,
	"Label":"Tarifa",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"5B79AEA7-C4D9-4991-AA3F-62458313A35C",
	"ObjectName":"CLI_Cliente",
	"PropertyName":"RazonSocial",
	"ObjectPath":"CLI_Clientes",
	"Size":6,
	"Order":0,
	"Label":"Razón social",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"3167C66B-2DF6-448F-8C14-6C648101A1CC",
	"ObjectName":"CAT_Familia",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Familias",
	"Size":3,
	"Order":1,
	"Label":"Activo",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"3167C66B-2DF6-448F-8C14-6C648101A1CC",
	"ObjectName":"CAT_Familia",
	"PropertyName":"Destacada",
	"ObjectPath":"CAT_Familias",
	"Size":3,
	"Order":3,
	"Label":"Destacada",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"3167C66B-2DF6-448F-8C14-6C648101A1CC",
	"ObjectName":"CAT_Familia",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Familias",
	"Size":6,
	"Order":0,
	"Label":"Nombre",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"3167C66B-2DF6-448F-8C14-6C648101A1CC",
	"ObjectName":"CAT_Familia",
	"PropertyName":"Visible",
	"ObjectPath":"CAT_Familias",
	"Size":3,
	"Order":2,
	"Label":"Visible",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"418C3D33-6D9C-486F-824A-7A56EA30AF23",
	"ObjectName":"VTA_Tarifa",
	"PropertyName":"Nombre",
	"ObjectPath":"VTA_Tarifas",
	"Size":6,
	"Order":0,
	"Label":"Nombre",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:34:00",
	"flxUpdatedDate":"2026-09-17T09:34:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"19D85F68-99A0-445D-AEB1-90BFFD24F219",
	"ObjectName":"VTA_Pedido",
	"PropertyName":"Fecha",
	"ObjectPath":"VTA_Pedidos",
	"Size":6,
	"Order":3,
	"Label":"Fecha",
	"PropertySearchType":"datetime-range",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"19D85F68-99A0-445D-AEB1-90BFFD24F219",
	"ObjectName":"VTA_Pedido",
	"PropertyName":"IdCliente",
	"ObjectPath":"VTA_Pedidos",
	"Size":4,
	"Order":1,
	"Label":"Cliente",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"19D85F68-99A0-445D-AEB1-90BFFD24F219",
	"ObjectName":"VTA_Pedido",
	"PropertyName":"IdEstado",
	"ObjectPath":"VTA_Pedidos",
	"Size":4,
	"Order":2,
	"Label":"Estado",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"19D85F68-99A0-445D-AEB1-90BFFD24F219",
	"ObjectName":"VTA_Pedido",
	"PropertyName":"Numero",
	"ObjectPath":"VTA_Pedidos",
	"Size":4,
	"Order":0,
	"Label":"Número",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Producto",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Productos",
	"Size":3,
	"Order":3,
	"Label":"Activo",
	"PropertySearchType":"check",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Producto",
	"PropertyName":"CreateDate",
	"ObjectPath":"CAT_Productos",
	"Size":6,
	"Order":4,
	"Label":"Fecha de creación",
	"PropertySearchType":"datetime-range",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Producto",
	"PropertyName":"IdFamilia",
	"ObjectPath":"CAT_Productos",
	"Size":6,
	"Order":1,
	"Label":"Familia",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Producto",
	"PropertyName":"IdMarca",
	"ObjectPath":"CAT_Productos",
	"Size":6,
	"Order":2,
	"Label":"Marca",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"2A385CCF-617B-4EF5-A627-9911FF0469D2",
	"ObjectName":"CAT_Producto",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Productos",
	"Size":6,
	"Order":0,
	"Label":"Nombre",
	"PropertySearchType":"text",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"41D8187D-7788-45CF-8EA0-A763391E5021",
	"ObjectName":"VTA_PrecioTarifa",
	"PropertyName":"IdProducto",
	"ObjectPath":"VTA_PreciosTarifa",
	"Size":6,
	"Order":1,
	"Label":"Producto",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:36:00",
	"flxUpdatedDate":"2026-09-17T09:36:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"41D8187D-7788-45CF-8EA0-A763391E5021",
	"ObjectName":"VTA_PrecioTarifa",
	"PropertyName":"IdTarifa",
	"ObjectPath":"VTA_PreciosTarifa",
	"Size":6,
	"Order":0,
	"Label":"Tarifa",
	"PropertySearchType":"dbcombo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:36:00",
	"flxUpdatedDate":"2026-09-17T09:36:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SearchId":"41D8187D-7788-45CF-8EA0-A763391E5021",
	"ObjectName":"VTA_PrecioTarifa",
	"PropertyName":"Precio",
	"ObjectPath":"VTA_PreciosTarifa",
	"Size":3,
	"Order":2,
	"Label":"Precio",
	"PropertySearchType":"number",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:36:00",
	"flxUpdatedDate":"2026-09-17T09:36:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Search_Properties] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[SearchId] uniqueidentifier '$.SearchId'
,[ObjectName] nvarchar(50) '$.ObjectName'
,[PropertyName] nvarchar(50) '$.PropertyName'
,[ObjectPath] nvarchar(500) '$.ObjectPath'
,[Size] int '$.Size'
,[Order] int '$.Order'
,[Label] nvarchar(250) '$.Label'
,[PropertySearchType] nvarchar(20) '$.PropertySearchType'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([SearchId],[ObjectName],[PropertyName],[ObjectPath],[Size],[Order],[Label],[PropertySearchType],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[SearchId] = Source.[SearchId] AND Target.[ObjectName] = Source.[ObjectName] AND Target.[PropertyName] = Source.[PropertyName])
WHEN MATCHED AND (
	NULLIF(Source.[ObjectPath], Target.[ObjectPath]) IS NOT NULL OR NULLIF(Target.[ObjectPath], Source.[ObjectPath]) IS NOT NULL OR 
	NULLIF(Source.[Size], Target.[Size]) IS NOT NULL OR NULLIF(Target.[Size], Source.[Size]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[Label], Target.[Label]) IS NOT NULL OR NULLIF(Target.[Label], Source.[Label]) IS NOT NULL OR 
	NULLIF(Source.[PropertySearchType], Target.[PropertySearchType]) IS NOT NULL OR NULLIF(Target.[PropertySearchType], Source.[PropertySearchType]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ObjectPath] = Source.[ObjectPath], 
  [Size] = Source.[Size], 
  [Order] = Source.[Order], 
  [Label] = Source.[Label], 
  [PropertySearchType] = Source.[PropertySearchType], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([SearchId],[ObjectName],[PropertyName],[ObjectPath],[Size],[Order],[Label],[PropertySearchType],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[SearchId],Source.[ObjectName],Source.[PropertyName],Source.[ObjectPath],Source.[Size],Source.[Order],Source.[Label],Source.[PropertySearchType],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





