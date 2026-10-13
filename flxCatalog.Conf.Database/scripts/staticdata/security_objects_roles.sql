

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Color",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:48:00",
	"flxUpdatedDate":"2026-09-17T09:48:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"RoleId":"cliente",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:48:00",
	"flxUpdatedDate":"2026-09-17T09:48:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"RoleId":"notRegistered",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T23:05:00",
	"flxUpdatedDate":"2026-09-15T23:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Favorito",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Favoritos.IdCliente = ''{{currentReference}}''",
	"CanViewCollection":true,
	"ViewFilterCollection":"Favoritos.IdCliente = ''{{currentReference}}''",
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T20:58:00",
	"flxUpdatedDate":"2026-09-17T20:58:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"RoleId":"cliente",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:48:00",
	"flxUpdatedDate":"2026-09-17T09:48:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"RoleId":"cliente",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:48:00",
	"flxUpdatedDate":"2026-09-17T09:48:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"RoleId":"notRegistered",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T23:04:00",
	"flxUpdatedDate":"2026-09-15T23:04:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Talla",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Variante",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"IdCliente = ''{{currentReference}}''",
	"CanViewCollection":true,
	"ViewFilterCollection":"IdCliente = ''{{currentReference}}''",
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:47:00",
	"flxUpdatedDate":"2026-09-17T09:47:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"COM_Comentario",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"EntidadTipo=''Producto''",
	"CanViewCollection":true,
	"ViewFilterCollection":"EntidadTipo=''Producto''",
	"CanInsert":true,
	"InsertFilter":"EntidadTipo=''Producto'' AND EXISTS (SELECT 1 FROM Pedidos_Lineas INNER JOIN Pedidos ON Pedidos.IdPedido = Pedidos_Lineas.IdPedido WHERE Pedidos_Lineas.IdProducto = Comentarios.EntidadId AND Pedidos.IdCliente=''{{currentReference}}'')",
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T10:27:00",
	"flxUpdatedDate":"2026-09-22T10:27:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"COM_Comentarios",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T10:27:00",
	"flxUpdatedDate":"2026-09-22T10:27:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"sysNoticeUser",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Notices_Users.UserId=''{{currentUserId}}''",
	"CanViewCollection":true,
	"ViewFilterCollection":"Notices_Users.UserId=''{{currentUserId}}''",
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T09:56:00",
	"flxUpdatedDate":"2026-09-22T09:56:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Devolucion",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Devoluciones.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanViewCollection":true,
	"ViewFilterCollection":"Devoluciones.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanInsert":false,
	"InsertFilter":"1=1",
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-21T11:54:00",
	"flxUpdatedDate":"2026-09-21T11:54:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoPedido",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Incidencia",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Incidencias.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanViewCollection":true,
	"ViewFilterCollection":"Incidencias.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanInsert":false,
	"InsertFilter":"1=1",
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-21T12:42:00",
	"flxUpdatedDate":"2026-09-21T12:42:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_LineaPedido",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Pedidos_Lineas.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanViewCollection":true,
	"ViewFilterCollection":"Pedidos_Lineas.IdPedido IN (SELECT IdPedido FROM Pedidos WHERE IdCliente = ''{{currentReference}}'')",
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_MesaTrabajo",
	"RoleId":"admins",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:46:00",
	"flxUpdatedDate":"2026-10-02T19:46:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_MesaTrabajo",
	"RoleId":"allUsers",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-10-02T19:46:00",
	"flxUpdatedDate":"2026-10-02T19:46:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"RoleId":"cliente",
	"CanView":true,
	"ViewFilter":"Pedidos.IdCliente = ''{{currentReference}}''",
	"CanViewCollection":true,
	"ViewFilterCollection":"Pedidos.IdCliente = ''{{currentReference}}''",
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":true,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:48:00",
	"flxUpdatedDate":"2026-09-17T09:48:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_PrecioTarifa",
	"RoleId":"cliente",
	"CanView":false,
	"CanViewCollection":false,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Tarifa",
	"RoleId":"cliente",
	"CanView":true,
	"CanViewCollection":true,
	"CanInsert":false,
	"CanEdit":false,
	"CanDelete":false,
	"CanPrint":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-17T09:49:00",
	"flxUpdatedDate":"2026-09-17T09:49:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Security_Objects_Roles] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[RoleId] nvarchar(128) '$.RoleId'
,[CanView] bit '$.CanView'
,[ViewFilter] nvarchar(2048) '$.ViewFilter'
,[CanViewCollection] bit '$.CanViewCollection'
,[ViewFilterCollection] nvarchar(2048) '$.ViewFilterCollection'
,[CanInsert] bit '$.CanInsert'
,[InsertFilter] nvarchar(2048) '$.InsertFilter'
,[CanEdit] bit '$.CanEdit'
,[EditFilter] nvarchar(2048) '$.EditFilter'
,[CanDelete] bit '$.CanDelete'
,[DeleteFilter] nvarchar(2048) '$.DeleteFilter'
,[CanPrint] bit '$.CanPrint'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[RoleId],[CanView],[ViewFilter],[CanViewCollection],[ViewFilterCollection],[CanInsert],[InsertFilter],[CanEdit],[EditFilter],[CanDelete],[DeleteFilter],[CanPrint],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName] AND Target.[RoleId] = Source.[RoleId])
WHEN MATCHED AND (
	NULLIF(Source.[CanView], Target.[CanView]) IS NOT NULL OR NULLIF(Target.[CanView], Source.[CanView]) IS NOT NULL OR 
	NULLIF(Source.[ViewFilter], Target.[ViewFilter]) IS NOT NULL OR NULLIF(Target.[ViewFilter], Source.[ViewFilter]) IS NOT NULL OR 
	NULLIF(Source.[CanViewCollection], Target.[CanViewCollection]) IS NOT NULL OR NULLIF(Target.[CanViewCollection], Source.[CanViewCollection]) IS NOT NULL OR 
	NULLIF(Source.[ViewFilterCollection], Target.[ViewFilterCollection]) IS NOT NULL OR NULLIF(Target.[ViewFilterCollection], Source.[ViewFilterCollection]) IS NOT NULL OR 
	NULLIF(Source.[CanInsert], Target.[CanInsert]) IS NOT NULL OR NULLIF(Target.[CanInsert], Source.[CanInsert]) IS NOT NULL OR 
	NULLIF(Source.[InsertFilter], Target.[InsertFilter]) IS NOT NULL OR NULLIF(Target.[InsertFilter], Source.[InsertFilter]) IS NOT NULL OR 
	NULLIF(Source.[CanEdit], Target.[CanEdit]) IS NOT NULL OR NULLIF(Target.[CanEdit], Source.[CanEdit]) IS NOT NULL OR 
	NULLIF(Source.[EditFilter], Target.[EditFilter]) IS NOT NULL OR NULLIF(Target.[EditFilter], Source.[EditFilter]) IS NOT NULL OR 
	NULLIF(Source.[CanDelete], Target.[CanDelete]) IS NOT NULL OR NULLIF(Target.[CanDelete], Source.[CanDelete]) IS NOT NULL OR 
	NULLIF(Source.[DeleteFilter], Target.[DeleteFilter]) IS NOT NULL OR NULLIF(Target.[DeleteFilter], Source.[DeleteFilter]) IS NOT NULL OR 
	NULLIF(Source.[CanPrint], Target.[CanPrint]) IS NOT NULL OR NULLIF(Target.[CanPrint], Source.[CanPrint]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [CanView] = Source.[CanView], 
  [ViewFilter] = Source.[ViewFilter], 
  [CanViewCollection] = Source.[CanViewCollection], 
  [ViewFilterCollection] = Source.[ViewFilterCollection], 
  [CanInsert] = Source.[CanInsert], 
  [InsertFilter] = Source.[InsertFilter], 
  [CanEdit] = Source.[CanEdit], 
  [EditFilter] = Source.[EditFilter], 
  [CanDelete] = Source.[CanDelete], 
  [DeleteFilter] = Source.[DeleteFilter], 
  [CanPrint] = Source.[CanPrint], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[RoleId],[CanView],[ViewFilter],[CanViewCollection],[ViewFilterCollection],[CanInsert],[InsertFilter],[CanEdit],[EditFilter],[CanDelete],[DeleteFilter],[CanPrint],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[RoleId],Source.[CanView],Source.[ViewFilter],Source.[CanViewCollection],Source.[ViewFilterCollection],Source.[CanInsert],Source.[InsertFilter],Source.[CanEdit],Source.[EditFilter],Source.[CanDelete],Source.[DeleteFilter],Source.[CanPrint],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





