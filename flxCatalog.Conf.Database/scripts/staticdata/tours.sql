

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"TourId":"tour-catalogo-cliente",
	"Descrip":"El catálogo del cliente: precios de su tarifa, carrito, favoritos y comparador.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tu catálogo, en un minuto",
	"InviteText":"Cómo añadir al carrito, guardar favoritos y comparar productos.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:30:00",
	"flxUpdatedDate":"2026-10-26T19:30:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-clientes",
	"Descrip":"El listado de clientes: buscar, abrir la ficha y dar de alta.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus clientes, en un minuto",
	"InviteText":"Cómo encontrar un cliente, ver su ficha y dar de alta uno nuevo.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:29:00",
	"flxUpdatedDate":"2026-10-26T19:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-dashboard",
	"Descrip":"El Dashboard del administrador: indicadores y gráficos para saber qué está pendiente.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"¿Te enseño el Dashboard?",
	"InviteText":"Un minuto para saber qué dice cada cifra y cada gráfico.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T17:05:00",
	"flxUpdatedDate":"2026-10-26T17:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-devoluciones",
	"Descrip":"Las devoluciones de todos los clientes, para el administrador.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Las devoluciones, en un minuto",
	"InviteText":"Dónde ver las devoluciones y dónde tramitarlas.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-incidencias",
	"Descrip":"Las incidencias de todos los clientes, para el administrador.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Las incidencias, en un minuto",
	"InviteText":"Dónde ver las incidencias y dónde resolverlas.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mesa-trabajo",
	"Descrip":"La Mesa de trabajo: incidencias, pedidos y devoluciones en tableros por estado.",
	"TourVersion":3,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"¿Te enseño la Mesa de trabajo?",
	"InviteText":"Cómo leer los tableros y cambiar el estado de una tarjeta.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T17:05:00",
	"flxUpdatedDate":"2026-10-26T17:13:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mi-carrito",
	"Descrip":"El carrito del cliente: cambiar cantidades, quitar productos y confirmar el pedido.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tu carrito, en un minuto",
	"InviteText":"Cómo ajustar lo que llevas y confirmar el pedido.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mi-ficha",
	"Descrip":"Los datos del cliente y su tarifa.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tu ficha, en un minuto",
	"InviteText":"Tus datos de facturación y tu tarifa.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mis-devoluciones",
	"Descrip":"Las devoluciones del cliente y su estado.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus devoluciones, en un minuto",
	"InviteText":"Cómo seguir una devolución y cómo pedir otra.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mis-documentos",
	"Descrip":"Los documentos del cliente y su tarifa.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus documentos, en un minuto",
	"InviteText":"Dónde están tus facturas y albaranes.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mis-incidencias",
	"Descrip":"Las incidencias del cliente y su estado.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus incidencias, en un minuto",
	"InviteText":"Cómo seguir una incidencia y cómo abrir otra.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mis-notificaciones",
	"Descrip":"Los avisos del cliente: cambios de estado de sus pedidos, devoluciones e incidencias.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus avisos, en un minuto",
	"InviteText":"Qué te avisamos y cómo llegar desde un aviso a su pedido.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:32:00",
	"flxUpdatedDate":"2026-10-26T19:32:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-mis-pedidos",
	"Descrip":"Los pedidos del cliente: estado, total y cómo abrir uno.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tus pedidos, en un minuto",
	"InviteText":"Cómo seguir un pedido y qué puedes hacer desde su ficha.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-pedido-cliente",
	"Descrip":"La ficha de un pedido del cliente: seguimiento, líneas, recibo y postventa.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Tu pedido, en un minuto",
	"InviteText":"Dónde está tu pedido y qué hacer si algo llega mal.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:33:00",
	"flxUpdatedDate":"2026-10-26T19:33:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-pedidos",
	"Descrip":"El listado de pedidos del administrador: todos los pedidos de todos los clientes.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Los pedidos, en un minuto",
	"InviteText":"Cómo leer el listado de pedidos y abrir uno para hacerlo avanzar.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:29:00",
	"flxUpdatedDate":"2026-10-26T19:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-productos",
	"Descrip":"El listado de productos del administrador: buscar, abrir la ficha y dar de alta.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"El catálogo, en un minuto",
	"InviteText":"Cómo buscar un producto, abrir su ficha y dar de alta uno nuevo.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:29:00",
	"flxUpdatedDate":"2026-10-26T19:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-tarifas",
	"Descrip":"Las tarifas de precios y sus precios por producto.",
	"TourVersion":1,
	"AutoStart":false,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Las tarifas, en un minuto",
	"InviteText":"Qué es cada tarifa y dónde están sus precios.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T19:29:00",
	"flxUpdatedDate":"2026-10-26T19:29:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-welcome-admin",
	"Descrip":"Bienvenida del administrador a flxCatalog: el menú, el buscador, los avisos y la ayuda.",
	"TourVersion":1,
	"AutoStart":true,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Bienvenido a flxCatalog",
	"InviteText":"Un recorrido rápido por lo que vas a usar cada día.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T17:05:00",
	"flxUpdatedDate":"2026-10-26T17:05:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"TourId":"tour-welcome-cliente",
	"Descrip":"Bienvenida del cliente al portal: el catálogo, el carrito, los pedidos, los avisos y la ayuda.",
	"TourVersion":1,
	"AutoStart":true,
	"Enabled":true,
	"ShowProgress":true,
	"InviteTitle":"Bienvenido a tu portal",
	"InviteText":"Te enseñamos en un minuto dónde está cada cosa.",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-26T17:05:00",
	"flxUpdatedDate":"2026-10-26T17:05:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Tours] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[TourId] nvarchar(100) '$.TourId'
,[Descrip] nvarchar(255) '$.Descrip'
,[TourVersion] int '$.TourVersion'
,[AutoStart] bit '$.AutoStart'
,[Enabled] bit '$.Enabled'
,[ShowProgress] bit '$.ShowProgress'
,[InviteTitle] nvarchar(255) '$.InviteTitle'
,[InviteText] nvarchar(500) '$.InviteText'
,[InviteArt] nvarchar(250) '$.InviteArt'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([TourId],[Descrip],[TourVersion],[AutoStart],[Enabled],[ShowProgress],[InviteTitle],[InviteText],[InviteArt],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[TourId] = Source.[TourId])
WHEN MATCHED AND (
	NULLIF(Source.[Descrip], Target.[Descrip]) IS NOT NULL OR NULLIF(Target.[Descrip], Source.[Descrip]) IS NOT NULL OR 
	NULLIF(Source.[TourVersion], Target.[TourVersion]) IS NOT NULL OR NULLIF(Target.[TourVersion], Source.[TourVersion]) IS NOT NULL OR 
	NULLIF(Source.[AutoStart], Target.[AutoStart]) IS NOT NULL OR NULLIF(Target.[AutoStart], Source.[AutoStart]) IS NOT NULL OR 
	NULLIF(Source.[Enabled], Target.[Enabled]) IS NOT NULL OR NULLIF(Target.[Enabled], Source.[Enabled]) IS NOT NULL OR 
	NULLIF(Source.[ShowProgress], Target.[ShowProgress]) IS NOT NULL OR NULLIF(Target.[ShowProgress], Source.[ShowProgress]) IS NOT NULL OR 
	NULLIF(Source.[InviteTitle], Target.[InviteTitle]) IS NOT NULL OR NULLIF(Target.[InviteTitle], Source.[InviteTitle]) IS NOT NULL OR 
	NULLIF(Source.[InviteText], Target.[InviteText]) IS NOT NULL OR NULLIF(Target.[InviteText], Source.[InviteText]) IS NOT NULL OR 
	NULLIF(Source.[InviteArt], Target.[InviteArt]) IS NOT NULL OR NULLIF(Target.[InviteArt], Source.[InviteArt]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Descrip] = Source.[Descrip], 
  [TourVersion] = Source.[TourVersion], 
  [AutoStart] = Source.[AutoStart], 
  [Enabled] = Source.[Enabled], 
  [ShowProgress] = Source.[ShowProgress], 
  [InviteTitle] = Source.[InviteTitle], 
  [InviteText] = Source.[InviteText], 
  [InviteArt] = Source.[InviteArt], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([TourId],[Descrip],[TourVersion],[AutoStart],[Enabled],[ShowProgress],[InviteTitle],[InviteText],[InviteArt],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[TourId],Source.[Descrip],Source.[TourVersion],Source.[AutoStart],Source.[Enabled],Source.[ShowProgress],Source.[InviteTitle],Source.[InviteText],Source.[InviteArt],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





