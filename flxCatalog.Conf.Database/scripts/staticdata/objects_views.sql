

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Color",
	"ViewName":"CAT_ColorDefaultList",
	"Descrip":"Listado de colores",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Colores.IdColor, Colores.Nombre, Colores.CodigoHex, Colores.Orden FROM Colores",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:04:00",
	"flxUpdatedDate":"2026-09-15T08:04:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultList",
	"Descrip":"Listado de familias",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Familias.IdFamilia, Familias.Nombre, Familias.Orden, Familias.Visible, Familias.Destacada, Familias.Activo, (SELECT p.Nombre FROM Familias p WHERE p.IdFamilia = Familias.IdFamiliaPadre) AS FamiliaPadre FROM Familias",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Familia",
	"ViewName":"CAT_FamiliaDefaultView",
	"Descrip":"Ficha de familia",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Familias.IdFamilia, Familias.Nombre, Familias.Descripcion, Familias.Imagen, Familias.Icono, Familias.IdFamiliaPadre, (SELECT p.Nombre FROM Familias p WHERE p.IdFamilia = Familias.IdFamiliaPadre) AS FamiliaPadreNombre, Familias.Orden, Familias.Visible, Familias.Destacada, Familias.Activo FROM Familias",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:01:00",
	"flxUpdatedDate":"2026-09-15T08:01:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"ViewName":"CAT_MarcaDefaultList",
	"Descrip":"Listado de marcas",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Marcas.IdMarca, Marcas.Nombre, Marcas.Activo FROM Marcas",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Marca",
	"ViewName":"CAT_MarcaDefaultView",
	"Descrip":"Ficha de marca",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Marcas.IdMarca, Marcas.Nombre, Marcas.Activo FROM Marcas",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultList",
	"Descrip":"Listado de productos",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos.IdProducto, Productos.Referencia, Productos.Nombre, Familias.Nombre AS Familia, Marcas.Nombre AS Marca, Productos.PrecioBase, Productos.Stock, Productos.Activo, Productos.Novedad, Productos.Oferta, Productos.CreateDate, CASE WHEN Productos.Stock = 0 THEN ''sinstock'' WHEN Productos.Novedad = 1 THEN ''novedad'' WHEN Productos.Oferta = 1 THEN ''oferta'' WHEN Productos.Activo = 1 THEN ''activo'' ELSE ''inactivo'' END AS EstadoCodigo FROM Productos LEFT JOIN Familias ON Familias.IdFamilia = Productos.IdFamilia LEFT JOIN Marcas ON Marcas.IdMarca = Productos.IdMarca",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoDefaultView",
	"Descrip":"Ficha de producto",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos.IdProducto, Productos.Referencia, Productos.Nombre, Productos.DescripcionCorta, Productos.IdFamilia, Productos.IdMarca, Productos.PrecioBase, Productos.IVA, Productos.Stock, Productos.Activo, Productos.Destacado, Productos.Novedad, Productos.Oferta, Productos.CreatedBy, Productos.CreateDate, Productos.ModifiedBy, Productos.ModifiedDate FROM Productos LEFT JOIN Familias ON Familias.IdFamilia = Productos.IdFamilia LEFT JOIN Marcas ON Marcas.IdMarca = Productos.IdMarca",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:07:00",
	"flxUpdatedDate":"2026-09-15T08:07:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoPublicoList",
	"Descrip":"CAT_ProductoPublicoList",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos.IdProducto, Productos.Nombre, Familias.Nombre AS Familia, Marcas.Nombre AS Marca, Productos.PrecioBase, Productos.ImagenPrincipal, Productos.Stock, Productos.Novedad, Productos.Oferta, Productos.Activo, CASE WHEN Productos.Stock = 0 THEN ''sinstock'' WHEN Productos.Novedad = 1 THEN ''novedad'' WHEN Productos.Oferta = 1 THEN ''oferta'' ELSE ''ninguno'' END AS EstadoCodigo FROM Productos LEFT JOIN Familias ON Familias.IdFamilia = Productos.IdFamilia LEFT JOIN Marcas ON Marcas.IdMarca = Productos.IdMarca",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:39:00",
	"flxUpdatedDate":"2026-09-15T08:39:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ViewName":"CAT_ProductoView",
	"Descrip":"CAT_ProductoView",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos.IdProducto, Productos.Referencia, Productos.Nombre, Productos.DescripcionCorta, Familias.Nombre AS Familia, Marcas.Nombre AS Marca, Productos.PrecioBase, Productos.IVA, Productos.Stock, Productos.Activo, Productos.Destacado, Productos.Novedad, Productos.Oferta FROM Productos LEFT JOIN Familias ON Familias.IdFamilia = Productos.IdFamilia LEFT JOIN Marcas ON Marcas.IdMarca = Productos.IdMarca",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Talla",
	"ViewName":"CAT_TallaDefaultList",
	"Descrip":"Listado de tallas",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Tallas.IdTalla, Tallas.Nombre, Tallas.Orden FROM Tallas",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:03:00",
	"flxUpdatedDate":"2026-09-15T08:03:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Variante",
	"ViewName":"CAT_VarianteDefaultList",
	"Descrip":"Listado de variantes",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos_Variantes.IdVariante, Productos.Nombre AS Producto, Tallas.Nombre AS Talla, Colores.Nombre AS Color, Productos_Variantes.Referencia, Productos_Variantes.Stock FROM Productos_Variantes LEFT JOIN Productos ON Productos.IdProducto = Productos_Variantes.IdProducto LEFT JOIN Tallas ON Tallas.IdTalla = Productos_Variantes.IdTalla LEFT JOIN Colores ON Colores.IdColor = Productos_Variantes.IdColor",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:08:00",
	"flxUpdatedDate":"2026-09-15T08:08:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Variante",
	"ViewName":"CAT_VarianteList",
	"Descrip":"CAT_VarianteList",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Productos_Variantes.IdVariante, Productos.Nombre AS Producto, Tallas.Nombre AS Talla, Colores.Nombre AS Color, Productos_Variantes.Referencia, Productos_Variantes.Stock, Productos_Variantes.IdProducto FROM Productos_Variantes LEFT JOIN Productos ON Productos.IdProducto = Productos_Variantes.IdProducto LEFT JOIN Tallas ON Tallas.IdTalla = Productos_Variantes.IdTalla LEFT JOIN Colores ON Colores.IdColor = Productos_Variantes.IdColor",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultList",
	"Descrip":"Listado de clientes",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Clientes.IdCliente, Clientes.CodigoCliente, Clientes.RazonSocial, Clientes.CifNif, Tarifas.Nombre AS Tarifa, Clientes.Comercial, Clientes.Activo, Clientes.CreateDate FROM Clientes LEFT JOIN Tarifas ON Tarifas.IdTarifa = Clientes.IdTarifa",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CLI_Cliente",
	"ViewName":"CLI_ClienteDefaultView",
	"Descrip":"Ficha de cliente",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Clientes.IdCliente, Clientes.CodigoCliente, Clientes.RazonSocial, Clientes.NombreComercial, Clientes.CifNif, Clientes.DireccionFiscal, Clientes.Email, Clientes.Telefono, Clientes.IdTarifa, Tarifas.Nombre AS Tarifa, Clientes.Comercial, Clientes.Activo FROM Clientes LEFT JOIN Tarifas ON Tarifas.IdTarifa = Clientes.IdTarifa",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:28:00",
	"flxUpdatedDate":"2026-09-15T08:28:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_EstadoPedido",
	"ViewName":"VTA_EstadoPedidoDefaultList",
	"Descrip":"Listado de estados de pedido",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Pedidos_Estados.IdEstado, Pedidos_Estados.Nombre, Pedidos_Estados.Orden FROM Pedidos_Estados",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:04:00",
	"flxUpdatedDate":"2026-09-15T08:04:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_LineaPedido",
	"ViewName":"VTA_LineaPedidoDefaultList",
	"Descrip":"Listado de líneas de pedido",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Pedidos_Lineas.IdLinea, Pedidos_Lineas.IdPedido, Productos.Nombre AS Producto, Productos_Variantes.Referencia AS Variante, Pedidos_Lineas.Cantidad, Pedidos_Lineas.Precio, Pedidos_Lineas.Subtotal FROM Pedidos_Lineas LEFT JOIN Productos ON Productos.IdProducto = Pedidos_Lineas.IdProducto LEFT JOIN Productos_Variantes ON Productos_Variantes.IdVariante = Pedidos_Lineas.IdVariante",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultList",
	"Descrip":"Listado de pedidos",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Pedidos.IdPedido, Pedidos.Numero, Clientes.RazonSocial AS Cliente, Pedidos.Fecha, Pedidos_Estados.Nombre AS Estado, Pedidos.Total FROM Pedidos LEFT JOIN Clientes ON Clientes.IdCliente = Pedidos.IdCliente LEFT JOIN Pedidos_Estados ON Pedidos_Estados.IdEstado = Pedidos.IdEstado",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoDefaultView",
	"Descrip":"Ficha de pedido",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Pedidos.IdPedido, Pedidos.Numero, Pedidos.IdCliente, Pedidos.IdEstado, Pedidos.Fecha, Pedidos.DireccionEntrega, Pedidos.FormaPago, Pedidos.Total FROM Pedidos LEFT JOIN Clientes ON Clientes.IdCliente = Pedidos.IdCliente LEFT JOIN Pedidos_Estados ON Pedidos_Estados.IdEstado = Pedidos.IdEstado",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":false,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:29:00",
	"flxUpdatedDate":"2026-09-15T08:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ViewName":"VTA_PedidoView",
	"Descrip":"VTA_PedidoView",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Pedidos.IdPedido, Pedidos.Numero, Clientes.RazonSocial AS Cliente, Pedidos_Estados.Nombre AS Estado, Pedidos.Fecha, Pedidos.DireccionEntrega, Pedidos.FormaPago, Pedidos.Total, (SELECT ISNULL(SUM(Subtotal),0) FROM Pedidos_Lineas WHERE Pedidos_Lineas.IdPedido = Pedidos.IdPedido) AS BaseImponible FROM Pedidos LEFT JOIN Clientes ON Clientes.IdCliente = Pedidos.IdCliente LEFT JOIN Pedidos_Estados ON Pedidos_Estados.IdEstado = Pedidos.IdEstado",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:32:00",
	"flxUpdatedDate":"2026-09-15T08:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Tarifa",
	"ViewName":"VTA_TarifaDefaultList",
	"Descrip":"Listado de tarifas",
	"ConnStringId":"DataConnectionString",
	"SQLSentence":"SELECT Tarifas.IdTarifa, Tarifas.Nombre FROM Tarifas",
	"NoFilter":false,
	"ShowAsGrid":true,
	"Active":true,
	"System":false,
	"IsDefault":true,
	"Offline":false,
	"BufferSize":500,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T08:04:00",
	"flxUpdatedDate":"2026-09-15T08:04:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Views] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[ViewName] nvarchar(255) '$.ViewName'
,[Descrip] nvarchar(255) '$.Descrip'
,[ConnStringId] nvarchar(50) '$.ConnStringId'
,[SQLSentence] nvarchar(max) '$.SQLSentence'
,[NoFilter] bit '$.NoFilter'
,[ShowAsGrid] bit '$.ShowAsGrid'
,[Active] bit '$.Active'
,[System] bit '$.System'
,[IsDefault] bit '$.IsDefault'
,[OrderBy] nvarchar(max) '$.OrderBy'
,[Offline] bit '$.Offline'
,[PrimaryKeys] nvarchar(max) '$.PrimaryKeys'
,[IndexFields] nvarchar(max) '$.IndexFields'
,[BufferSize] int '$.BufferSize'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[ViewName],[Descrip],[ConnStringId],[SQLSentence],[NoFilter],[ShowAsGrid],[Active],[System],[IsDefault],[OrderBy],[Offline],[PrimaryKeys],[IndexFields],[BufferSize],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName] AND Target.[ViewName] = Source.[ViewName])
WHEN MATCHED AND (
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringId], Target.[ConnStringId]) IS NOT NULL OR NULLIF(Target.[ConnStringId], Source.[ConnStringId]) IS NOT NULL OR 
	NULLIF(Source.[SQLSentence], Target.[SQLSentence]) IS NOT NULL OR NULLIF(Target.[SQLSentence], Source.[SQLSentence]) IS NOT NULL OR 
	NULLIF(Source.[NoFilter], Target.[NoFilter]) IS NOT NULL OR NULLIF(Target.[NoFilter], Source.[NoFilter]) IS NOT NULL OR 
	NULLIF(Source.[ShowAsGrid], Target.[ShowAsGrid]) IS NOT NULL OR NULLIF(Target.[ShowAsGrid], Source.[ShowAsGrid]) IS NOT NULL OR 
	NULLIF(Source.[Active], Target.[Active]) IS NOT NULL OR NULLIF(Target.[Active], Source.[Active]) IS NOT NULL OR 
	NULLIF(Source.[System], Target.[System]) IS NOT NULL OR NULLIF(Target.[System], Source.[System]) IS NOT NULL OR 
	NULLIF(Source.[IsDefault], Target.[IsDefault]) IS NOT NULL OR NULLIF(Target.[IsDefault], Source.[IsDefault]) IS NOT NULL OR 
	NULLIF(Source.[OrderBy], Target.[OrderBy]) IS NOT NULL OR NULLIF(Target.[OrderBy], Source.[OrderBy]) IS NOT NULL OR 
	NULLIF(Source.[Offline], Target.[Offline]) IS NOT NULL OR NULLIF(Target.[Offline], Source.[Offline]) IS NOT NULL OR 
	NULLIF(Source.[PrimaryKeys], Target.[PrimaryKeys]) IS NOT NULL OR NULLIF(Target.[PrimaryKeys], Source.[PrimaryKeys]) IS NOT NULL OR 
	NULLIF(Source.[IndexFields], Target.[IndexFields]) IS NOT NULL OR NULLIF(Target.[IndexFields], Source.[IndexFields]) IS NOT NULL OR 
	NULLIF(Source.[BufferSize], Target.[BufferSize]) IS NOT NULL OR NULLIF(Target.[BufferSize], Source.[BufferSize]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Descrip] = Source.[Descrip], 
  [ConnStringId] = Source.[ConnStringId], 
  [SQLSentence] = Source.[SQLSentence], 
  [NoFilter] = Source.[NoFilter], 
  [ShowAsGrid] = Source.[ShowAsGrid], 
  [Active] = Source.[Active], 
  [System] = Source.[System], 
  [IsDefault] = Source.[IsDefault], 
  [OrderBy] = Source.[OrderBy], 
  [Offline] = Source.[Offline], 
  [PrimaryKeys] = Source.[PrimaryKeys], 
  [IndexFields] = Source.[IndexFields], 
  [BufferSize] = Source.[BufferSize], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[ViewName],[Descrip],[ConnStringId],[SQLSentence],[NoFilter],[ShowAsGrid],[Active],[System],[IsDefault],[OrderBy],[Offline],[PrimaryKeys],[IndexFields],[BufferSize],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[ViewName],Source.[Descrip],Source.[ConnStringId],Source.[SQLSentence],Source.[NoFilter],Source.[ShowAsGrid],Source.[Active],Source.[System],Source.[IsDefault],Source.[OrderBy],Source.[Offline],Source.[PrimaryKeys],Source.[IndexFields],Source.[BufferSize],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





