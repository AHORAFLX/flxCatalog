

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"KanbanSettingsName":"kb-vta-mesa-devoluciones",
	"BoardTitleTemplate":"<span>{{Nombre}}<\/span>",
	"BoardObjectName":"VTA_MesaTrabajo",
	"ColumnViewName":"v-vta-mesatrabajo-vta-mesa-devoluciones-kanban-columns",
	"ColumnDescripField":"Nombre",
	"ColumnIdField":"IdEstado",
	"CardObjectName":"VTA_Devolucion",
	"CardViewName":"VTA_DevolucionDefaultList",
	"CardIdField":"IdDevolucion",
	"CardColumnIdField":"IdEstado",
	"CardDescripField":"Producto",
	"CardContentTemplate":"<div>\n',
N'  <flx-navbutton class=\"clickable\" type=\"openpage\" pagetypeid=\"view\" objectname=\"VTA_Devolucion\" objectwhere=\"(Devoluciones.IdDevolucion=''{{IdDevolucion}}'')\" targetid=\"popup\" excludehist=\"false\">\n',
N'    <div title=\"{{Producto}}\"><b>{{Producto}}<\/b><\/div>\n',
N'  <\/flx-navbutton>\n',
N'  <div class=\"ellipsis size-s\">{{Numero}}<\/div>\n',
N'  <div class=\"ellipsis size-s\">{{Motivo}}<\/div>\n',
N'<\/div>",
	"onCardClick":"view",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:46:00",
	"flxUpdatedDate":"2026-10-02T19:46:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-incidencias",
	"BoardTitleTemplate":"<span>{{Nombre}}<\/span>",
	"BoardObjectName":"VTA_MesaTrabajo",
	"ColumnViewName":"v-vta-mesatrabajo-vta-mesa-incidencias-kanban-columns",
	"ColumnDescripField":"Nombre",
	"ColumnIdField":"IdEstado",
	"CardObjectName":"VTA_Incidencia",
	"CardViewName":"VTA_IncidenciaDefaultList",
	"CardIdField":"IdIncidencia",
	"CardColumnIdField":"IdEstado",
	"CardDescripField":"Descripcion",
	"CardContentTemplate":"<div>\n',
N'  <flx-navbutton class=\"clickable\" type=\"openpage\" pagetypeid=\"view\" objectname=\"VTA_Incidencia\" objectwhere=\"(Incidencias.IdIncidencia=''{{IdIncidencia}}'')\" targetid=\"popup\" excludehist=\"false\">\n',
N'    <div title=\"{{Descripcion}}\"><b>{{Descripcion}}<\/b><\/div>\n',
N'  <\/flx-navbutton>\n',
N'  <div class=\"ellipsis size-s\">{{Numero}}<\/div>\n',
N'  <div class=\"ellipsis size-s\">{{Tipo}}<\/div>\n',
N'<\/div>",
	"onCardClick":"view",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:46:00",
	"flxUpdatedDate":"2026-10-02T19:46:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"KanbanSettingsName":"kb-vta-mesa-pedidos",
	"BoardTitleTemplate":"<span>{{Nombre}}<\/span>",
	"BoardObjectName":"VTA_MesaTrabajo",
	"ColumnViewName":"v-vta-mesatrabajo-vta-mesa-pedidos-kanban-columns",
	"ColumnDescripField":"Nombre",
	"ColumnIdField":"IdEstado",
	"CardObjectName":"VTA_Pedido",
	"CardViewName":"VTA_PedidoKanban",
	"CardIdField":"IdPedido",
	"CardColumnIdField":"IdEstado",
	"CardDescripField":"Numero",
	"CardContentTemplate":"<div>\n',
N'  <flx-navbutton class=\"clickable\" type=\"openpage\" pagetypeid=\"view\" objectname=\"VTA_Pedido\" objectwhere=\"(Pedidos.IdPedido=''{{IdPedido}}'')\" targetid=\"popup\" excludehist=\"false\">\n',
N'    <div title=\"{{Numero}}\"><b>{{Numero}}<\/b><\/div>\n',
N'  <\/flx-navbutton>\n',
N'  <div class=\"ellipsis size-s\">{{Cliente}}<\/div>\n',
N'  <div class=\"ellipsis size-s\">{{Total}}<\/div>\n',
N'<\/div>",
	"onCardClick":"view",
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-10-02T19:46:00",
	"flxUpdatedDate":"2026-10-02T19:46:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Kanban_Settings] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[KanbanSettingsName] nvarchar(50) '$.KanbanSettingsName'
,[BoardTitleTemplate] nvarchar(max) '$.BoardTitleTemplate'
,[BoardDescripTemplate] nvarchar(max) '$.BoardDescripTemplate'
,[BoardObjectName] nvarchar(50) '$.BoardObjectName'
,[ColumnViewName] nvarchar(255) '$.ColumnViewName'
,[ColumnDescripField] nvarchar(100) '$.ColumnDescripField'
,[ColumnIdField] nvarchar(100) '$.ColumnIdField'
,[ColumnCssClassField] nvarchar(100) '$.ColumnCssClassField'
,[ColumnIconIdField] nvarchar(100) '$.ColumnIconIdField'
,[CardObjectName] nvarchar(50) '$.CardObjectName'
,[CardViewName] nvarchar(255) '$.CardViewName'
,[CardIdField] nvarchar(100) '$.CardIdField'
,[CardColumnIdField] nvarchar(100) '$.CardColumnIdField'
,[CardDescripField] nvarchar(100) '$.CardDescripField'
,[CardContentTemplate] nvarchar(max) '$.CardContentTemplate'
,[onChangeColumnProcess] nvarchar(255) '$.onChangeColumnProcess'
,[onCardClick] nvarchar(50) '$.onCardClick'
,[EndBoxLastState] nvarchar(100) '$.EndBoxLastState'
,[EndBoxProcess] nvarchar(255) '$.EndBoxProcess'
,[EndBoxText] nvarchar(255) '$.EndBoxText'
,[EndBoxIconName] nvarchar(100) '$.EndBoxIconName'
,[EndBoxCssClass] nvarchar(100) '$.EndBoxCssClass'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([KanbanSettingsName],[BoardTitleTemplate],[BoardDescripTemplate],[BoardObjectName],[ColumnViewName],[ColumnDescripField],[ColumnIdField],[ColumnCssClassField],[ColumnIconIdField],[CardObjectName],[CardViewName],[CardIdField],[CardColumnIdField],[CardDescripField],[CardContentTemplate],[onChangeColumnProcess],[onCardClick],[EndBoxLastState],[EndBoxProcess],[EndBoxText],[EndBoxIconName],[EndBoxCssClass],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[KanbanSettingsName] = Source.[KanbanSettingsName])
WHEN MATCHED AND (
	NULLIF(Source.[BoardTitleTemplate], Target.[BoardTitleTemplate]) IS NOT NULL OR NULLIF(Target.[BoardTitleTemplate], Source.[BoardTitleTemplate]) IS NOT NULL OR 
	NULLIF(Source.[BoardDescripTemplate], Target.[BoardDescripTemplate]) IS NOT NULL OR NULLIF(Target.[BoardDescripTemplate], Source.[BoardDescripTemplate]) IS NOT NULL OR 
	NULLIF(Source.[BoardObjectName], Target.[BoardObjectName]) IS NOT NULL OR NULLIF(Target.[BoardObjectName], Source.[BoardObjectName]) IS NOT NULL OR 
	NULLIF(Source.[ColumnViewName], Target.[ColumnViewName]) IS NOT NULL OR NULLIF(Target.[ColumnViewName], Source.[ColumnViewName]) IS NOT NULL OR 
	NULLIF(Source.[ColumnDescripField], Target.[ColumnDescripField]) IS NOT NULL OR NULLIF(Target.[ColumnDescripField], Source.[ColumnDescripField]) IS NOT NULL OR 
	NULLIF(Source.[ColumnIdField], Target.[ColumnIdField]) IS NOT NULL OR NULLIF(Target.[ColumnIdField], Source.[ColumnIdField]) IS NOT NULL OR 
	NULLIF(Source.[ColumnCssClassField], Target.[ColumnCssClassField]) IS NOT NULL OR NULLIF(Target.[ColumnCssClassField], Source.[ColumnCssClassField]) IS NOT NULL OR 
	NULLIF(Source.[ColumnIconIdField], Target.[ColumnIconIdField]) IS NOT NULL OR NULLIF(Target.[ColumnIconIdField], Source.[ColumnIconIdField]) IS NOT NULL OR 
	NULLIF(Source.[CardObjectName], Target.[CardObjectName]) IS NOT NULL OR NULLIF(Target.[CardObjectName], Source.[CardObjectName]) IS NOT NULL OR 
	NULLIF(Source.[CardViewName], Target.[CardViewName]) IS NOT NULL OR NULLIF(Target.[CardViewName], Source.[CardViewName]) IS NOT NULL OR 
	NULLIF(Source.[CardIdField], Target.[CardIdField]) IS NOT NULL OR NULLIF(Target.[CardIdField], Source.[CardIdField]) IS NOT NULL OR 
	NULLIF(Source.[CardColumnIdField], Target.[CardColumnIdField]) IS NOT NULL OR NULLIF(Target.[CardColumnIdField], Source.[CardColumnIdField]) IS NOT NULL OR 
	NULLIF(Source.[CardDescripField], Target.[CardDescripField]) IS NOT NULL OR NULLIF(Target.[CardDescripField], Source.[CardDescripField]) IS NOT NULL OR 
	NULLIF(Source.[CardContentTemplate], Target.[CardContentTemplate]) IS NOT NULL OR NULLIF(Target.[CardContentTemplate], Source.[CardContentTemplate]) IS NOT NULL OR 
	NULLIF(Source.[onChangeColumnProcess], Target.[onChangeColumnProcess]) IS NOT NULL OR NULLIF(Target.[onChangeColumnProcess], Source.[onChangeColumnProcess]) IS NOT NULL OR 
	NULLIF(Source.[onCardClick], Target.[onCardClick]) IS NOT NULL OR NULLIF(Target.[onCardClick], Source.[onCardClick]) IS NOT NULL OR 
	NULLIF(Source.[EndBoxLastState], Target.[EndBoxLastState]) IS NOT NULL OR NULLIF(Target.[EndBoxLastState], Source.[EndBoxLastState]) IS NOT NULL OR 
	NULLIF(Source.[EndBoxProcess], Target.[EndBoxProcess]) IS NOT NULL OR NULLIF(Target.[EndBoxProcess], Source.[EndBoxProcess]) IS NOT NULL OR 
	NULLIF(Source.[EndBoxText], Target.[EndBoxText]) IS NOT NULL OR NULLIF(Target.[EndBoxText], Source.[EndBoxText]) IS NOT NULL OR 
	NULLIF(Source.[EndBoxIconName], Target.[EndBoxIconName]) IS NOT NULL OR NULLIF(Target.[EndBoxIconName], Source.[EndBoxIconName]) IS NOT NULL OR 
	NULLIF(Source.[EndBoxCssClass], Target.[EndBoxCssClass]) IS NOT NULL OR NULLIF(Target.[EndBoxCssClass], Source.[EndBoxCssClass]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [BoardTitleTemplate] = Source.[BoardTitleTemplate], 
  [BoardDescripTemplate] = Source.[BoardDescripTemplate], 
  [BoardObjectName] = Source.[BoardObjectName], 
  [ColumnViewName] = Source.[ColumnViewName], 
  [ColumnDescripField] = Source.[ColumnDescripField], 
  [ColumnIdField] = Source.[ColumnIdField], 
  [ColumnCssClassField] = Source.[ColumnCssClassField], 
  [ColumnIconIdField] = Source.[ColumnIconIdField], 
  [CardObjectName] = Source.[CardObjectName], 
  [CardViewName] = Source.[CardViewName], 
  [CardIdField] = Source.[CardIdField], 
  [CardColumnIdField] = Source.[CardColumnIdField], 
  [CardDescripField] = Source.[CardDescripField], 
  [CardContentTemplate] = Source.[CardContentTemplate], 
  [onChangeColumnProcess] = Source.[onChangeColumnProcess], 
  [onCardClick] = Source.[onCardClick], 
  [EndBoxLastState] = Source.[EndBoxLastState], 
  [EndBoxProcess] = Source.[EndBoxProcess], 
  [EndBoxText] = Source.[EndBoxText], 
  [EndBoxIconName] = Source.[EndBoxIconName], 
  [EndBoxCssClass] = Source.[EndBoxCssClass], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([KanbanSettingsName],[BoardTitleTemplate],[BoardDescripTemplate],[BoardObjectName],[ColumnViewName],[ColumnDescripField],[ColumnIdField],[ColumnCssClassField],[ColumnIconIdField],[CardObjectName],[CardViewName],[CardIdField],[CardColumnIdField],[CardDescripField],[CardContentTemplate],[onChangeColumnProcess],[onCardClick],[EndBoxLastState],[EndBoxProcess],[EndBoxText],[EndBoxIconName],[EndBoxCssClass],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[KanbanSettingsName],Source.[BoardTitleTemplate],Source.[BoardDescripTemplate],Source.[BoardObjectName],Source.[ColumnViewName],Source.[ColumnDescripField],Source.[ColumnIdField],Source.[ColumnCssClassField],Source.[ColumnIconIdField],Source.[CardObjectName],Source.[CardViewName],Source.[CardIdField],Source.[CardColumnIdField],Source.[CardDescripField],Source.[CardContentTemplate],Source.[onChangeColumnProcess],Source.[onCardClick],Source.[EndBoxLastState],Source.[EndBoxProcess],Source.[EndBoxText],Source.[EndBoxIconName],Source.[EndBoxCssClass],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





