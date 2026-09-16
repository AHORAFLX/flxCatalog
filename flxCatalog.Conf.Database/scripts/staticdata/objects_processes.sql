

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Producto",
	"ProcessName":"pCAT_ArchivarProducto",
	"MenuId":"8E45BCFC-3C45-47B6-AB0E-4F0418A2E5CC",
	"Order":1,
	"Active":true,
	"BagOnly":false,
	"ClearSelectionBag":true,
	"Offline":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:35:00",
	"flxUpdatedDate":"2026-09-15T17:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"CAT_Producto",
	"ProcessName":"pCAT_DuplicarProducto",
	"MenuId":"036C0D31-2393-4E8A-9129-A44830FB7B60",
	"Order":2,
	"Active":true,
	"BagOnly":false,
	"ClearSelectionBag":true,
	"Offline":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:35:00",
	"flxUpdatedDate":"2026-09-15T17:35:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ProcessName":"pVTA_CancelarPedido",
	"MenuId":"61210B41-C30C-4AA0-82D6-F11378DAEB4A",
	"Order":2,
	"Active":true,
	"BagOnly":false,
	"ClearSelectionBag":true,
	"Offline":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:53:00",
	"flxUpdatedDate":"2026-09-15T17:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ProcessName":"pVTA_ConfirmarPedido",
	"MenuId":"B18CAE04-517C-4A76-8B7C-1C80CD592236",
	"Order":1,
	"Active":true,
	"BagOnly":false,
	"ClearSelectionBag":true,
	"Offline":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:53:00",
	"flxUpdatedDate":"2026-09-15T17:53:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ProcessName":"pVTA_GenerarPdfPedido",
	"MenuId":"AC3A8E90-4108-4DF6-A936-8833C57FCD3E",
	"Order":3,
	"Active":true,
	"BagOnly":false,
	"ClearSelectionBag":true,
	"Offline":false,
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-15T17:54:00",
	"flxUpdatedDate":"2026-09-15T17:54:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Objects_Processes] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[ProcessName] nvarchar(255) '$.ProcessName'
,[MenuId] nvarchar(50) '$.MenuId'
,[Order] int '$.Order'
,[Active] bit '$.Active'
,[SQLEnabled] nvarchar(max) '$.SQLEnabled'
,[SQLEnabledDescrip] nvarchar(255) '$.SQLEnabledDescrip'
,[EnabledProperty] nvarchar(50) '$.EnabledProperty'
,[EnabledValues] nvarchar(max) '$.EnabledValues'
,[DisabledValues] nvarchar(max) '$.DisabledValues'
,[BagOnly] bit '$.BagOnly'
,[ClearSelectionBag] bit '$.ClearSelectionBag'
,[Offline] bit '$.Offline'
,[IconMenuClass] nvarchar(100) '$.IconMenuClass'
,[TextMenuClass] nvarchar(100) '$.TextMenuClass'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[ProcessName],[MenuId],[Order],[Active],[SQLEnabled],[SQLEnabledDescrip],[EnabledProperty],[EnabledValues],[DisabledValues],[BagOnly],[ClearSelectionBag],[Offline],[IconMenuClass],[TextMenuClass],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName] AND Target.[ProcessName] = Source.[ProcessName])
WHEN MATCHED AND (
	NULLIF(Source.[MenuId], Target.[MenuId]) IS NOT NULL OR NULLIF(Target.[MenuId], Source.[MenuId]) IS NOT NULL OR 
	NULLIF(Source.[Order], Target.[Order]) IS NOT NULL OR NULLIF(Target.[Order], Source.[Order]) IS NOT NULL OR 
	NULLIF(Source.[Active], Target.[Active]) IS NOT NULL OR NULLIF(Target.[Active], Source.[Active]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabled], Target.[SQLEnabled]) IS NOT NULL OR NULLIF(Target.[SQLEnabled], Source.[SQLEnabled]) IS NOT NULL OR 
	NULLIF(Source.[SQLEnabledDescrip], Target.[SQLEnabledDescrip]) IS NOT NULL OR NULLIF(Target.[SQLEnabledDescrip], Source.[SQLEnabledDescrip]) IS NOT NULL OR 
	NULLIF(Source.[EnabledProperty], Target.[EnabledProperty]) IS NOT NULL OR NULLIF(Target.[EnabledProperty], Source.[EnabledProperty]) IS NOT NULL OR 
	NULLIF(Source.[EnabledValues], Target.[EnabledValues]) IS NOT NULL OR NULLIF(Target.[EnabledValues], Source.[EnabledValues]) IS NOT NULL OR 
	NULLIF(Source.[DisabledValues], Target.[DisabledValues]) IS NOT NULL OR NULLIF(Target.[DisabledValues], Source.[DisabledValues]) IS NOT NULL OR 
	NULLIF(Source.[BagOnly], Target.[BagOnly]) IS NOT NULL OR NULLIF(Target.[BagOnly], Source.[BagOnly]) IS NOT NULL OR 
	NULLIF(Source.[ClearSelectionBag], Target.[ClearSelectionBag]) IS NOT NULL OR NULLIF(Target.[ClearSelectionBag], Source.[ClearSelectionBag]) IS NOT NULL OR 
	NULLIF(Source.[Offline], Target.[Offline]) IS NOT NULL OR NULLIF(Target.[Offline], Source.[Offline]) IS NOT NULL OR 
	NULLIF(Source.[IconMenuClass], Target.[IconMenuClass]) IS NOT NULL OR NULLIF(Target.[IconMenuClass], Source.[IconMenuClass]) IS NOT NULL OR 
	NULLIF(Source.[TextMenuClass], Target.[TextMenuClass]) IS NOT NULL OR NULLIF(Target.[TextMenuClass], Source.[TextMenuClass]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [MenuId] = Source.[MenuId], 
  [Order] = Source.[Order], 
  [Active] = Source.[Active], 
  [SQLEnabled] = Source.[SQLEnabled], 
  [SQLEnabledDescrip] = Source.[SQLEnabledDescrip], 
  [EnabledProperty] = Source.[EnabledProperty], 
  [EnabledValues] = Source.[EnabledValues], 
  [DisabledValues] = Source.[DisabledValues], 
  [BagOnly] = Source.[BagOnly], 
  [ClearSelectionBag] = Source.[ClearSelectionBag], 
  [Offline] = Source.[Offline], 
  [IconMenuClass] = Source.[IconMenuClass], 
  [TextMenuClass] = Source.[TextMenuClass], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[ProcessName],[MenuId],[Order],[Active],[SQLEnabled],[SQLEnabledDescrip],[EnabledProperty],[EnabledValues],[DisabledValues],[BagOnly],[ClearSelectionBag],[Offline],[IconMenuClass],[TextMenuClass],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[ProcessName],Source.[MenuId],Source.[Order],Source.[Active],Source.[SQLEnabled],Source.[SQLEnabledDescrip],Source.[EnabledProperty],Source.[EnabledValues],Source.[DisabledValues],Source.[BagOnly],Source.[ClearSelectionBag],Source.[Offline],Source.[IconMenuClass],Source.[TextMenuClass],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





