

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Familia",
	"ChildCollection":"CAT_Productos",
	"ObjectRelation":"IdFamilia=IdFamilia",
	"ObjectDefaults":"IdFamilia=IdFamilia",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:10:00",
	"flxUpdatedDate":"2026-09-15T08:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"ChildCollection":"CAT_Productos",
	"ObjectRelation":"IdMarca=IdMarca",
	"ObjectDefaults":"IdMarca=IdMarca",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:10:00",
	"flxUpdatedDate":"2026-09-15T08:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Color",
	"ChildCollection":"CAT_Variantes",
	"ObjectRelation":"IdColor=IdColor",
	"ObjectDefaults":"IdColor=IdColor",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:10:00",
	"flxUpdatedDate":"2026-09-15T08:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ChildCollection":"CAT_Variantes",
	"ObjectRelation":"IdProducto=IdProducto",
	"ObjectDefaults":"IdProducto=IdProducto",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":1,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:10:00",
	"flxUpdatedDate":"2026-09-15T08:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Talla",
	"ChildCollection":"CAT_Variantes",
	"ObjectRelation":"IdTalla=IdTalla",
	"ObjectDefaults":"IdTalla=IdTalla",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:10:00",
	"flxUpdatedDate":"2026-09-15T08:10:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Tarifa",
	"ChildCollection":"CLI_Clientes",
	"ObjectRelation":"IdTarifa=IdTarifa",
	"ObjectDefaults":"IdTarifa=IdTarifa",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ChildCollection":"Documents_Object",
	"ObjectRelation":"IdProducto=ObjectId|''CAT_Producto''=ObjectName",
	"ObjectDefaults":"IdProducto=ObjectId|''CAT_Producto''=ObjectName",
	"ShowInMenu":true,
	"ShowInAnalysis":false,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ChildCollection":"Documents_Object",
	"ObjectRelation":"IdPedido=ObjectId|''VTA_Pedido''=ObjectName",
	"ObjectDefaults":"IdPedido=ObjectId|''VTA_Pedido''=ObjectName",
	"ShowInMenu":true,
	"ShowInAnalysis":false,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ChildCollection":"sysObjectImages",
	"ObjectRelation":"IdProducto=ObjectId|''CAT_Producto''=ObjectName",
	"ObjectDefaults":"IdProducto=ObjectId|''CAT_Producto''=ObjectName",
	"ShowInMenu":true,
	"ShowInAnalysis":false,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ChildCollection":"sysObjectImages",
	"ObjectRelation":"IdPedido=ObjectId|''VTA_Pedido''=ObjectName",
	"ObjectDefaults":"IdPedido=ObjectId|''VTA_Pedido''=ObjectName",
	"ShowInMenu":true,
	"ShowInAnalysis":false,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ChildCollection":"VTA_LineasPedido",
	"ObjectRelation":"IdProducto=IdProducto",
	"ObjectDefaults":"IdProducto=IdProducto",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":2,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ChildCollection":"VTA_LineasPedido",
	"ObjectRelation":"IdPedido=IdPedido",
	"ObjectDefaults":"IdPedido=IdPedido",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":1,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ChildCollection":"VTA_Pedidos",
	"ObjectRelation":"IdCliente=IdCliente",
	"ObjectDefaults":"IdCliente=IdCliente",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoPedido",
	"ChildCollection":"VTA_Pedidos",
	"ObjectRelation":"IdEstado=IdEstado",
	"ObjectDefaults":"IdEstado=IdEstado",
	"ShowInMenu":true,
	"ShowInAnalysis":true,
	"OneToOneRelation":false,
	"Order":0,
	"RemoveOnDelete":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Objects] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[ChildCollection] nvarchar(50) '$.ChildCollection'
,[ObjectRelation] nvarchar(255) '$.ObjectRelation'
,[ObjectDefaults] nvarchar(255) '$.ObjectDefaults'
,[ShowInMenu] bit '$.ShowInMenu'
,[ShowInAnalysis] bit '$.ShowInAnalysis'
,[OneToOneRelation] bit '$.OneToOneRelation'
,[Order] int '$.Order'
,[RemoveOnDelete] bit '$.RemoveOnDelete'
,[SQLEnabled] nvarchar(max) '$.SQLEnabled'
,[SQLEnabledDescrip] nvarchar(255) '$.SQLEnabledDescrip'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[ChildCollection],[ObjectRelation],[ObjectDefaults],[ShowInMenu],[ShowInAnalysis],[OneToOneRelation],[Order],[RemoveOnDelete],[SQLEnabled],[SQLEnabledDescrip],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ChildCollection] = Source.[ChildCollection] AND Target.[ObjectName] = Source.[ObjectName])
WHEN MATCHED AND (
	NULLIF(Source.[ObjectRelation], Target.[ObjectRelation]) IS NOT NULL OR NULLIF(Target.[ObjectRelation], Source.[ObjectRelation]) IS NOT NULL OR 
	NULLIF(Source.[ObjectDefaults], Target.[ObjectDefaults]) IS NOT NULL OR NULLIF(Target.[ObjectDefaults], Source.[ObjectDefaults]) IS NOT NULL OR 
	NULLIF(Source.[ShowInMenu], Target.[ShowInMenu]) IS NOT NULL OR NULLIF(Target.[ShowInMenu], Source.[ShowInMenu]) IS NOT NULL OR 
	NULLIF(Source.[ShowInAnalysis], Target.[ShowInAnalysis]) IS NOT NULL OR NULLIF(Target.[ShowInAnalysis], Source.[ShowInAnalysis]) IS NOT NULL OR 
	NULLIF(Source.[OneToOneRelation], Target.[OneToOneRelation]) IS NOT NULL OR NULLIF(Target.[OneToOneRelation], Source.[OneToOneRelation]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[RemoveOnDelete], Target.[RemoveOnDelete]) IS NOT NULL OR NULLIF(Target.[RemoveOnDelete], Source.[RemoveOnDelete]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabled], Target.[SQLEnabled]) IS NOT NULL OR NULLIF(Target.[SQLEnabled], Source.[SQLEnabled]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabledDescrip], Target.[SQLEnabledDescrip]) IS NOT NULL OR NULLIF(Target.[SQLEnabledDescrip], Source.[SQLEnabledDescrip]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ObjectRelation] = Source.[ObjectRelation], 
  [ObjectDefaults] = Source.[ObjectDefaults], 
  [ShowInMenu] = Source.[ShowInMenu], 
  [ShowInAnalysis] = Source.[ShowInAnalysis], 
  [OneToOneRelation] = Source.[OneToOneRelation], 
  [Order] = Source.[Order], 
  [RemoveOnDelete] = Source.[RemoveOnDelete], 
  [SQLEnabled] = Source.[SQLEnabled], 
  [SQLEnabledDescrip] = Source.[SQLEnabledDescrip], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[ChildCollection],[ObjectRelation],[ObjectDefaults],[ShowInMenu],[ShowInAnalysis],[OneToOneRelation],[Order],[RemoveOnDelete],[SQLEnabled],[SQLEnabledDescrip],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[ChildCollection],Source.[ObjectRelation],Source.[ObjectDefaults],Source.[ShowInMenu],Source.[ShowInAnalysis],Source.[OneToOneRelation],Source.[Order],Source.[RemoveOnDelete],Source.[SQLEnabled],Source.[SQLEnabledDescrip],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





