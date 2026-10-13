

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"ObjectName":"CAT_Producto",
	"ObjectPK":"IdProducto",
	"TypeId":"flexygo",
	"Path":"~\/custom\/documents\/CAT_Producto",
	"DefaultCategoryId":"sysdoc-generic",
	"DropboxFolderCreate":false,
	"DropboxFolderLink":false,
	"DropboxFileCreate":false,
	"DropboxFileLink":false,
	"DriveFolderCreate":false,
	"DriveFolderLink":false,
	"DriveFileCreate":false,
	"DriveFileLink":false,
	"DiskFolderCreate":true,
	"DiskFolderLink":true,
	"DiskFileCreate":true,
	"DiskFileLink":true,
	"ExtensionId":"sysDocuments",
	"CreateObjectIDFolder":true,
	"DownloadBDName":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:09:00",
	"flxUpdatedDate":"2026-09-15T08:09:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Devolucion",
	"ObjectPK":"IdDevolucion",
	"TypeId":"flexygo",
	"Path":"~\/custom\/documents\/VTA_Devolucion",
	"DefaultCategoryId":"sysdoc-generic",
	"DropboxFolderCreate":false,
	"DropboxFolderLink":false,
	"DropboxFileCreate":false,
	"DropboxFileLink":false,
	"DriveFolderCreate":false,
	"DriveFolderLink":false,
	"DriveFileCreate":false,
	"DriveFileLink":false,
	"DiskFolderCreate":true,
	"DiskFolderLink":true,
	"DiskFileCreate":true,
	"DiskFileLink":true,
	"ExtensionId":"sysDocuments",
	"CreateObjectIDFolder":true,
	"DownloadBDName":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T11:55:00",
	"flxUpdatedDate":"2026-09-21T11:55:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Incidencia",
	"ObjectPK":"IdIncidencia",
	"TypeId":"flexygo",
	"Path":"~\/custom\/documents\/VTA_Incidencia",
	"DefaultCategoryId":"sysdoc-generic",
	"DropboxFolderCreate":false,
	"DropboxFolderLink":false,
	"DropboxFileCreate":false,
	"DropboxFileLink":false,
	"DriveFolderCreate":false,
	"DriveFolderLink":false,
	"DriveFileCreate":false,
	"DriveFileLink":false,
	"DiskFolderCreate":true,
	"DiskFolderLink":true,
	"DiskFileCreate":true,
	"DiskFileLink":true,
	"ExtensionId":"sysDocuments",
	"CreateObjectIDFolder":true,
	"DownloadBDName":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-21T12:42:00",
	"flxUpdatedDate":"2026-09-21T12:42:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"ObjectName":"VTA_Pedido",
	"ObjectPK":"IdPedido",
	"TypeId":"flexygo",
	"Path":"~\/custom\/documents\/VTA_Pedido",
	"DefaultCategoryId":"sysdoc-generic",
	"DropboxFolderCreate":false,
	"DropboxFolderLink":false,
	"DropboxFileCreate":false,
	"DropboxFileLink":false,
	"DriveFolderCreate":false,
	"DriveFolderLink":false,
	"DriveFileCreate":false,
	"DriveFileLink":false,
	"DiskFolderCreate":true,
	"DiskFolderLink":true,
	"DiskFileCreate":true,
	"DiskFileLink":true,
	"ExtensionId":"sysDocuments",
	"CreateObjectIDFolder":true,
	"DownloadBDName":false,
	"flxInsertedBy":"flexygo-mcp",
	"flxUpdatedBy":"flexygo-mcp",
	"flxInsertedDate":"2026-09-15T08:31:00",
	"flxUpdatedDate":"2026-09-15T08:31:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Documents_Objects_Config] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[ObjectName] nvarchar(50) '$.ObjectName'
,[ObjectPK] nvarchar(50) '$.ObjectPK'
,[ERPObjectName] nvarchar(250) '$.ERPObjectName'
,[TypeId] nvarchar(50) '$.TypeId'
,[Path] nvarchar(500) '$.Path'
,[DefaultCategoryId] nvarchar(50) '$.DefaultCategoryId'
,[CategoryFilter] nvarchar(max) '$.CategoryFilter'
,[DropboxFolderCreate] bit '$.DropboxFolderCreate'
,[DropboxFolderLink] bit '$.DropboxFolderLink'
,[DropboxFileCreate] bit '$.DropboxFileCreate'
,[DropboxFileLink] bit '$.DropboxFileLink'
,[DriveFolderCreate] bit '$.DriveFolderCreate'
,[DriveFolderLink] bit '$.DriveFolderLink'
,[DriveFileCreate] bit '$.DriveFileCreate'
,[DriveFileLink] bit '$.DriveFileLink'
,[DiskFolderCreate] bit '$.DiskFolderCreate'
,[DiskFolderLink] bit '$.DiskFolderLink'
,[DiskFileCreate] bit '$.DiskFileCreate'
,[DiskFileLink] bit '$.DiskFileLink'
,[ExtensionId] nvarchar(100) '$.ExtensionId'
,[OfflineFilter] nvarchar(max) '$.OfflineFilter'
,[CreateObjectIDFolder] bit '$.CreateObjectIDFolder'
,[MaximumSize] int '$.MaximumSize'
,[DownloadBDName] bit '$.DownloadBDName'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([ObjectName],[ObjectPK],[ERPObjectName],[TypeId],[Path],[DefaultCategoryId],[CategoryFilter],[DropboxFolderCreate],[DropboxFolderLink],[DropboxFileCreate],[DropboxFileLink],[DriveFolderCreate],[DriveFolderLink],[DriveFileCreate],[DriveFileLink],[DiskFolderCreate],[DiskFolderLink],[DiskFileCreate],[DiskFileLink],[ExtensionId],[OfflineFilter],[CreateObjectIDFolder],[MaximumSize],[DownloadBDName],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[ObjectName] = Source.[ObjectName] AND Target.[ObjectPK] = Source.[ObjectPK])
WHEN MATCHED AND (
	NULLIF(Source.[ERPObjectName], Target.[ERPObjectName]) IS NOT NULL OR NULLIF(Target.[ERPObjectName], Source.[ERPObjectName]) IS NOT NULL OR 
	NULLIF(Source.[TypeId], Target.[TypeId]) IS NOT NULL OR NULLIF(Target.[TypeId], Source.[TypeId]) IS NOT NULL OR 
	NULLIF(Source.[Path], Target.[Path]) IS NOT NULL OR NULLIF(Target.[Path], Source.[Path]) IS NOT NULL OR 
	NULLIF(Source.[DefaultCategoryId], Target.[DefaultCategoryId]) IS NOT NULL OR NULLIF(Target.[DefaultCategoryId], Source.[DefaultCategoryId]) IS NOT NULL OR 
	NULLIF(Source.[CategoryFilter], Target.[CategoryFilter]) IS NOT NULL OR NULLIF(Target.[CategoryFilter], Source.[CategoryFilter]) IS NOT NULL OR 
	NULLIF(Source.[DropboxFolderCreate], Target.[DropboxFolderCreate]) IS NOT NULL OR NULLIF(Target.[DropboxFolderCreate], Source.[DropboxFolderCreate]) IS NOT NULL OR 
	NULLIF(Source.[DropboxFolderLink], Target.[DropboxFolderLink]) IS NOT NULL OR NULLIF(Target.[DropboxFolderLink], Source.[DropboxFolderLink]) IS NOT NULL OR 
	NULLIF(Source.[DropboxFileCreate], Target.[DropboxFileCreate]) IS NOT NULL OR NULLIF(Target.[DropboxFileCreate], Source.[DropboxFileCreate]) IS NOT NULL OR 
	NULLIF(Source.[DropboxFileLink], Target.[DropboxFileLink]) IS NOT NULL OR NULLIF(Target.[DropboxFileLink], Source.[DropboxFileLink]) IS NOT NULL OR 
	NULLIF(Source.[DriveFolderCreate], Target.[DriveFolderCreate]) IS NOT NULL OR NULLIF(Target.[DriveFolderCreate], Source.[DriveFolderCreate]) IS NOT NULL OR 
	NULLIF(Source.[DriveFolderLink], Target.[DriveFolderLink]) IS NOT NULL OR NULLIF(Target.[DriveFolderLink], Source.[DriveFolderLink]) IS NOT NULL OR 
	NULLIF(Source.[DriveFileCreate], Target.[DriveFileCreate]) IS NOT NULL OR NULLIF(Target.[DriveFileCreate], Source.[DriveFileCreate]) IS NOT NULL OR 
	NULLIF(Source.[DriveFileLink], Target.[DriveFileLink]) IS NOT NULL OR NULLIF(Target.[DriveFileLink], Source.[DriveFileLink]) IS NOT NULL OR 
	NULLIF(Source.[DiskFolderCreate], Target.[DiskFolderCreate]) IS NOT NULL OR NULLIF(Target.[DiskFolderCreate], Source.[DiskFolderCreate]) IS NOT NULL OR 
	NULLIF(Source.[DiskFolderLink], Target.[DiskFolderLink]) IS NOT NULL OR NULLIF(Target.[DiskFolderLink], Source.[DiskFolderLink]) IS NOT NULL OR 
	NULLIF(Source.[DiskFileCreate], Target.[DiskFileCreate]) IS NOT NULL OR NULLIF(Target.[DiskFileCreate], Source.[DiskFileCreate]) IS NOT NULL OR 
	NULLIF(Source.[DiskFileLink], Target.[DiskFileLink]) IS NOT NULL OR NULLIF(Target.[DiskFileLink], Source.[DiskFileLink]) IS NOT NULL OR 
	NULLIF(Source.[ExtensionId], Target.[ExtensionId]) IS NOT NULL OR NULLIF(Target.[ExtensionId], Source.[ExtensionId]) IS NOT NULL OR 
	NULLIF(Source.[OfflineFilter], Target.[OfflineFilter]) IS NOT NULL OR NULLIF(Target.[OfflineFilter], Source.[OfflineFilter]) IS NOT NULL OR 
	NULLIF(Source.[CreateObjectIDFolder], Target.[CreateObjectIDFolder]) IS NOT NULL OR NULLIF(Target.[CreateObjectIDFolder], Source.[CreateObjectIDFolder]) IS NOT NULL OR 
	NULLIF(Source.[MaximumSize], Target.[MaximumSize]) IS NOT NULL OR NULLIF(Target.[MaximumSize], Source.[MaximumSize]) IS NOT NULL OR 
	NULLIF(Source.[DownloadBDName], Target.[DownloadBDName]) IS NOT NULL OR NULLIF(Target.[DownloadBDName], Source.[DownloadBDName]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [ERPObjectName] = Source.[ERPObjectName], 
  [TypeId] = Source.[TypeId], 
  [Path] = Source.[Path], 
  [DefaultCategoryId] = Source.[DefaultCategoryId], 
  [CategoryFilter] = Source.[CategoryFilter], 
  [DropboxFolderCreate] = Source.[DropboxFolderCreate], 
  [DropboxFolderLink] = Source.[DropboxFolderLink], 
  [DropboxFileCreate] = Source.[DropboxFileCreate], 
  [DropboxFileLink] = Source.[DropboxFileLink], 
  [DriveFolderCreate] = Source.[DriveFolderCreate], 
  [DriveFolderLink] = Source.[DriveFolderLink], 
  [DriveFileCreate] = Source.[DriveFileCreate], 
  [DriveFileLink] = Source.[DriveFileLink], 
  [DiskFolderCreate] = Source.[DiskFolderCreate], 
  [DiskFolderLink] = Source.[DiskFolderLink], 
  [DiskFileCreate] = Source.[DiskFileCreate], 
  [DiskFileLink] = Source.[DiskFileLink], 
  [ExtensionId] = Source.[ExtensionId], 
  [OfflineFilter] = Source.[OfflineFilter], 
  [CreateObjectIDFolder] = Source.[CreateObjectIDFolder], 
  [MaximumSize] = Source.[MaximumSize], 
  [DownloadBDName] = Source.[DownloadBDName], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ObjectName],[ObjectPK],[ERPObjectName],[TypeId],[Path],[DefaultCategoryId],[CategoryFilter],[DropboxFolderCreate],[DropboxFolderLink],[DropboxFileCreate],[DropboxFileLink],[DriveFolderCreate],[DriveFolderLink],[DriveFileCreate],[DriveFileLink],[DiskFolderCreate],[DiskFolderLink],[DiskFileCreate],[DiskFileLink],[ExtensionId],[OfflineFilter],[CreateObjectIDFolder],[MaximumSize],[DownloadBDName],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[ObjectName],Source.[ObjectPK],Source.[ERPObjectName],Source.[TypeId],Source.[Path],Source.[DefaultCategoryId],Source.[CategoryFilter],Source.[DropboxFolderCreate],Source.[DropboxFolderLink],Source.[DropboxFileCreate],Source.[DropboxFileLink],Source.[DriveFolderCreate],Source.[DriveFolderLink],Source.[DriveFileCreate],Source.[DriveFileLink],Source.[DiskFolderCreate],Source.[DiskFolderLink],Source.[DiskFileCreate],Source.[DiskFileLink],Source.[ExtensionId],Source.[OfflineFilter],Source.[CreateObjectIDFolder],Source.[MaximumSize],Source.[DownloadBDName],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





