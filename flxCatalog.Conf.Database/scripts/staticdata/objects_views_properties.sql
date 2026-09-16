

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Familia",
	"Order":9,
	"Label":"Activo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Descripcion",
	"ObjectPath":"CAT_Familia",
	"Order":3,
	"Label":"Descripción",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Destacada",
	"ObjectPath":"CAT_Familia",
	"Order":8,
	"Label":"Destacada",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Icono",
	"ObjectPath":"CAT_Familia",
	"Order":2,
	"Label":"Icono",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"IdFamiliaPadre",
	"ObjectPath":"CAT_Familia",
	"Order":5,
	"Label":"Familia padre",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Imagen",
	"ObjectPath":"CAT_Familia",
	"Order":4,
	"Label":"Imagen",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Familia",
	"Order":1,
	"Label":"Nombre",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Orden",
	"ObjectPath":"CAT_Familia",
	"Order":6,
	"Label":"Orden",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"ObjectPropertyName":"CAT_Familia",
	"PropertyName":"Visible",
	"ObjectPath":"CAT_Familia",
	"Order":7,
	"Label":"Visible",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"ViewName":"CAT_MarcaDefaultView",
	"ObjectPropertyName":"CAT_Marca",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Marca",
	"Order":2,
	"Label":"Activo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"ViewName":"CAT_MarcaDefaultView",
	"ObjectPropertyName":"CAT_Marca",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Marca",
	"Order":1,
	"Label":"Nombre",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Activo",
	"ObjectPath":"CAT_Producto",
	"Order":9,
	"Label":"Activo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"DescripcionCorta",
	"ObjectPath":"CAT_Producto",
	"Order":3,
	"Label":"Descripción corta",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Destacado",
	"ObjectPath":"CAT_Producto",
	"Order":10,
	"Label":"Destacado",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"IdFamilia",
	"ObjectPath":"CAT_Producto",
	"Order":4,
	"Label":"Familia",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"IdMarca",
	"ObjectPath":"CAT_Producto",
	"Order":5,
	"Label":"Marca",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"IVA",
	"ObjectPath":"CAT_Producto",
	"Order":7,
	"Label":"IVA",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Nombre",
	"ObjectPath":"CAT_Producto",
	"Order":2,
	"Label":"Nombre",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Novedad",
	"ObjectPath":"CAT_Producto",
	"Order":11,
	"Label":"Novedad",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Oferta",
	"ObjectPath":"CAT_Producto",
	"Order":12,
	"Label":"Oferta",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"PrecioBase",
	"ObjectPath":"CAT_Producto",
	"Order":6,
	"Label":"Precio base",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Referencia",
	"ObjectPath":"CAT_Producto",
	"Order":1,
	"Label":"Referencia",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"ObjectPropertyName":"CAT_Producto",
	"PropertyName":"Stock",
	"ObjectPath":"CAT_Producto",
	"Order":8,
	"Label":"Stock",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"Activo",
	"ObjectPath":"CLI_Cliente",
	"Order":10,
	"Label":"Activo",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"CifNif",
	"ObjectPath":"CLI_Cliente",
	"Order":4,
	"Label":"CIF\/NIF",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"CodigoCliente",
	"ObjectPath":"CLI_Cliente",
	"Order":1,
	"Label":"Código",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"Comercial",
	"ObjectPath":"CLI_Cliente",
	"Order":9,
	"Label":"Comercial",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"DireccionFiscal",
	"ObjectPath":"CLI_Cliente",
	"Order":5,
	"Label":"Dirección fiscal",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"Email",
	"ObjectPath":"CLI_Cliente",
	"Order":6,
	"Label":"Email",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"IdTarifa",
	"ObjectPath":"CLI_Cliente",
	"Order":8,
	"Label":"Tarifa",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"NombreComercial",
	"ObjectPath":"CLI_Cliente",
	"Order":3,
	"Label":"Nombre comercial",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"RazonSocial",
	"ObjectPath":"CLI_Cliente",
	"Order":2,
	"Label":"Razón social",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"ObjectPropertyName":"CLI_Cliente",
	"PropertyName":"Telefono",
	"ObjectPath":"CLI_Cliente",
	"Order":7,
	"Label":"Teléfono",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"DireccionEntrega",
	"ObjectPath":"VTA_Pedido",
	"Order":5,
	"Label":"Dirección de entrega",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"Fecha",
	"ObjectPath":"VTA_Pedido",
	"Order":4,
	"Label":"Fecha",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"FormaPago",
	"ObjectPath":"VTA_Pedido",
	"Order":6,
	"Label":"Forma de pago",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"IdCliente",
	"ObjectPath":"VTA_Pedido",
	"Order":2,
	"Label":"Cliente",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"IdEstado",
	"ObjectPath":"VTA_Pedido",
	"Order":3,
	"Label":"Estado",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"Numero",
	"ObjectPath":"VTA_Pedido",
	"Order":1,
	"Label":"Número",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"ObjectPropertyName":"VTA_Pedido",
	"PropertyName":"Total",
	"ObjectPath":"VTA_Pedido",
	"Order":7,
	"Label":"Total",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Views_Properties] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[ViewName] nvarchar(255) '$.ViewName'
,[ObjectPropertyName] nvarchar(50) '$.ObjectPropertyName'
,[PropertyName] nvarchar(50) '$.PropertyName'
,[ObjectPath] nvarchar(500) '$.ObjectPath'
,[Order] int '$.Order'
,[Label] nvarchar(250) '$.Label'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[ViewName],[ObjectPropertyName],[PropertyName],[ObjectPath],[Order],[Label],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName] AND Target.[ViewName] = Source.[ViewName] AND Target.[ObjectPropertyName] = Source.[ObjectPropertyName] AND Target.[PropertyName] = Source.[PropertyName])
WHEN MATCHED AND (
	NULLIF(Source.[ObjectPath], Target.[ObjectPath]) IS NOT NULL OR NULLIF(Target.[ObjectPath], Source.[ObjectPath]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[Label], Target.[Label]) IS NOT NULL OR NULLIF(Target.[Label], Source.[Label]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ObjectPath] = Source.[ObjectPath], 
  [Order] = Source.[Order], 
  [Label] = Source.[Label], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[ViewName],[ObjectPropertyName],[PropertyName],[ObjectPath],[Order],[Label],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[ViewName],Source.[ObjectPropertyName],Source.[PropertyName],Source.[ObjectPath],Source.[Order],Source.[Label],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





