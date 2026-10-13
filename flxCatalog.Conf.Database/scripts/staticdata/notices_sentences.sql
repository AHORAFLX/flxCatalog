

BEGIN TRY

DECLARE @DATA nvarchar(max)  = convert(nvarchar(max),'')+concat(convert(nvarchar(max),''),N'
[{
	"SentenceId":"1E9B896D-DB90-49CD-AA2C-5C27AE911007",
	"Decrip":"Notify_Incidencia_EstadoCambiado",
	"MailSentence":"SELECT DISTINCT\r\n',
N'  ''demo@flxcatalog.local'' AS FromEmail,\r\n',
N'  C.Email AS [To],\r\n',
N'  ''Incidencia actualizada - Pedido '' + P.Numero AS Subject,\r\n',
N'  ''<p>Hola '' + C.RazonSocial + '',<\/p><p>Tu incidencia sobre el pedido <b>'' + P.Numero + ''<\/b> ('' + T.Nombre + '') ha pasado a estado <b>'' + E.Nombre + ''<\/b>.<\/p>'' AS Body,\r\n',
N'  NULL AS UserId,\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS SendDate,\r\n',
N'  1 AS Status,\r\n',
N'  ''VTA_Incidencia'' AS ObjectName,\r\n',
N'  ''(Incidencias.IdIncidencia='' + CHAR(39) + I.IdIncidencia + CHAR(39) + '')'' AS ObjectWhere\r\n',
N'FROM Incidencias I\r\n',
N'INNER JOIN Incidencias_Estados E ON E.IdEstado = I.IdEstado\r\n',
N'INNER JOIN Incidencias_Tipos T ON T.IdTipo = I.IdTipo\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = I.IdPedido\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE I.IdEstado <> ''571D2BBE-F3C4-48A9-B14D-E7D8D20ECA22''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (I.UltimoEstadoEmailEnviado IS NULL OR I.UltimoEstadoEmailEnviado <> I.IdEstado)",
	"NoticeSentence":"SELECT DISTINCT\r\n',
N'  ''INC-'' + I.IdIncidencia + ''-'' + I.IdEstado AS NoticeId,\r\n',
N'  ''Incidencia actualizada'' AS Title,\r\n',
N'  ''<span>Tu incidencia sobre el pedido <b>'' + P.Numero + ''<\/b> ('' + T.Nombre + '') ha pasado a estado \"'' + E.Nombre + ''\".<\/span>'' AS [Message],\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS ReminderTime,\r\n',
N'  CAST(DATEADD(DAY,90,GETDATE()) AS smalldatetime) AS ExpiryTime,\r\n',
N'  ''app'' AS MethodName,\r\n',
N'  0 AS AllUsers,\r\n',
N'  U.Id AS UserId,\r\n',
N'  ''object'' AS TypeId,\r\n',
N'  ''VTA_Incidencia'' AS ObjectName,\r\n',
N'  ''(Incidencias.IdIncidencia='' + CHAR(39) + I.IdIncidencia + CHAR(39) + '')'' AS ObjectWhere,\r\n',
N'  ''view'' AS PageTypeId,\r\n',
N'  ''VTA_Incidencia_View'' AS PageName\r\n',
N'FROM Incidencias I\r\n',
N'INNER JOIN Incidencias_Estados E ON E.IdEstado = I.IdEstado\r\n',
N'INNER JOIN Incidencias_Tipos T ON T.IdTipo = I.IdTipo\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = I.IdPedido\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE I.IdEstado <> ''571D2BBE-F3C4-48A9-B14D-E7D8D20ECA22''\r\n',
N'  AND (I.UltimoEstadoNotificado IS NULL OR I.UltimoEstadoNotificado <> I.IdEstado)",
	"NoticeAllUsers":false,
	"UpdateNoticeSentence":"UPDATE I SET UltimoEstadoNotificado = I.IdEstado\r\n',
N'FROM Incidencias I\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = I.IdPedido\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE I.IdEstado <> ''571D2BBE-F3C4-48A9-B14D-E7D8D20ECA22''\r\n',
N'  AND (I.UltimoEstadoNotificado IS NULL OR I.UltimoEstadoNotificado <> I.IdEstado)",
	"UpdateMailSentence":"UPDATE I SET UltimoEstadoEmailEnviado = I.IdEstado\r\n',
N'FROM Incidencias I\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = I.IdPedido\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE I.IdEstado <> ''571D2BBE-F3C4-48A9-B14D-E7D8D20ECA22''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (I.UltimoEstadoEmailEnviado IS NULL OR I.UltimoEstadoEmailEnviado <> I.IdEstado)",
	"ConnStringId":"DataConnectionString",
	"JobName":"BuildMailsandnotifications",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T09:44:00",
	"flxUpdatedDate":"2026-09-22T09:44:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SentenceId":"5A2FA4FC-CC43-48E3-9469-08DBBB706FF6",
	"Decrip":"Notify_Devolucion_EstadoCambiado",
	"MailSentence":"SELECT DISTINCT\r\n',
N'  ''demo@flxcatalog.local'' AS FromEmail,\r\n',
N'  C.Email AS [To],\r\n',
N'  ''Devolucion actualizada - Pedido '' + P.Numero AS Subject,\r\n',
N'  ''<p>Hola '' + C.RazonSocial + '',<\/p><p>Tu devolucion de <b>'' + PR.Nombre + ''<\/b> (pedido '' + P.Numero + '') ha pasado a estado <b>'' + E.Nombre + ''<\/b>.<\/p>'' AS Body,\r\n',
N'  NULL AS UserId,\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS SendDate,\r\n',
N'  1 AS Status,\r\n',
N'  ''VTA_Devolucion'' AS ObjectName,\r\n',
N'  ''(Devoluciones.IdDevolucion='' + CHAR(39) + D.IdDevolucion + CHAR(39) + '')'' AS ObjectWhere\r\n',
N'FROM Devoluciones D\r\n',
N'INNER JOIN Devoluciones_Estados E ON E.IdEstado = D.IdEstado\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = D.IdPedido\r\n',
N'INNER JOIN Pedidos_Lineas L ON L.IdLinea = D.IdLinea\r\n',
N'INNER JOIN Productos PR ON PR.IdProducto = L.IdProducto\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE D.IdEstado <> ''CB6E0913-0A81-4C7B-BC78-925F53FCF836''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (D.UltimoEstadoEmailEnviado IS NULL OR D.UltimoEstadoEmailEnviado <> D.IdEstado)",
	"NoticeSentence":"SELECT DISTINCT\r\n',
N'  ''DEV-'' + D.IdDevolucion + ''-'' + D.IdEstado AS NoticeId,\r\n',
N'  ''Devolucion actualizada'' AS Title,\r\n',
N'  ''<span>Tu devolucion de <b>'' + PR.Nombre + ''<\/b> (pedido '' + P.Numero + '') ha pasado a estado \"'' + E.Nombre + ''\".<\/span>'' AS [Message],\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS ReminderTime,\r\n',
N'  CAST(DATEADD(DAY,90,GETDATE()) AS smalldatetime) AS ExpiryTime,\r\n',
N'  ''app'' AS MethodName,\r\n',
N'  0 AS AllUsers,\r\n',
N'  U.Id AS UserId,\r\n',
N'  ''object'' AS TypeId,\r\n',
N'  ''VTA_Devolucion'' AS ObjectName,\r\n',
N'  ''(Devoluciones.IdDevolucion='' + CHAR(39) + D.IdDevolucion + CHAR(39) + '')'' AS ObjectWhere,\r\n',
N'  ''view'' AS PageTypeId,\r\n',
N'  ''VTA_Devolucion_View'' AS PageName\r\n',
N'FROM Devoluciones D\r\n',
N'INNER JOIN Devoluciones_Estados E ON E.IdEstado = D.IdEstado\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = D.IdPedido\r\n',
N'INNER JOIN Pedidos_Lineas L ON L.IdLinea = D.IdLinea\r\n',
N'INNER JOIN Productos PR ON PR.IdProducto = L.IdProducto\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE D.IdEstado <> ''CB6E0913-0A81-4C7B-BC78-925F53FCF836''\r\n',
N'  AND (D.UltimoEstadoNotificado IS NULL OR D.UltimoEstadoNotificado <> D.IdEstado)",
	"NoticeAllUsers":false,
	"UpdateNoticeSentence":"UPDATE D SET UltimoEstadoNotificado = D.IdEstado\r\n',
N'FROM Devoluciones D\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = D.IdPedido\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE D.IdEstado <> ''CB6E0913-0A81-4C7B-BC78-925F53FCF836''\r\n',
N'  AND (D.UltimoEstadoNotificado IS NULL OR D.UltimoEstadoNotificado <> D.IdEstado)",
	"UpdateMailSentence":"UPDATE D SET UltimoEstadoEmailEnviado = D.IdEstado\r\n',
N'FROM Devoluciones D\r\n',
N'INNER JOIN Pedidos P ON P.IdPedido = D.IdPedido\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE D.IdEstado <> ''CB6E0913-0A81-4C7B-BC78-925F53FCF836''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (D.UltimoEstadoEmailEnviado IS NULL OR D.UltimoEstadoEmailEnviado <> D.IdEstado)",
	"ConnStringId":"DataConnectionString",
	"JobName":"BuildMailsandnotifications",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T09:44:00",
	"flxUpdatedDate":"2026-09-22T09:44:00",
	"OriginAddonId":"Main",
	"OriginId":1
},{
	"SentenceId":"E873A5DA-D536-4AFF-9B13-4E68515B8D86",
	"Decrip":"Notify_Pedido_EstadoCambiado",
	"MailSentence":"SELECT DISTINCT\r\n',
N'  ''demo@flxcatalog.local'' AS FromEmail,\r\n',
N'  C.Email AS [To],\r\n',
N'  ''Pedido '' + P.Numero + '' - '' + E.Nombre AS Subject,\r\n',
N'  ''<p>Hola '' + C.RazonSocial + '',<\/p><p>Tu pedido <b>'' + P.Numero + ''<\/b> ha pasado a estado <b>'' + E.Nombre + ''<\/b>.<\/p>'' AS Body,\r\n',
N'  NULL AS UserId,\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS SendDate,\r\n',
N'  1 AS Status,\r\n',
N'  ''VTA_Pedido'' AS ObjectName,\r\n',
N'  ''(Pedidos.IdPedido='' + CHAR(39) + P.IdPedido + CHAR(39) + '')'' AS ObjectWhere\r\n',
N'FROM Pedidos P\r\n',
N'INNER JOIN Pedidos_Estados E ON E.IdEstado = P.IdEstado\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE P.IdEstado <> ''35330DF3-96EA-4A9D-BB75-DF9D6B93DA22''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (P.UltimoEstadoEmailEnviado IS NULL OR P.UltimoEstadoEmailEnviado <> P.IdEstado)",
	"NoticeSentence":"SELECT DISTINCT\r\n',
N'  ''PED-'' + P.IdPedido + ''-'' + P.IdEstado AS NoticeId,\r\n',
N'  ''Pedido '' + P.Numero AS Title,\r\n',
N'  ''<span>Tu pedido <b>'' + P.Numero + ''<\/b> ha pasado a estado \"'' + E.Nombre + ''\".<\/span>'' AS [Message],\r\n',
N'  CAST(GETDATE() AS smalldatetime) AS ReminderTime,\r\n',
N'  CAST(DATEADD(DAY,90,GETDATE()) AS smalldatetime) AS ExpiryTime,\r\n',
N'  ''app'' AS MethodName,\r\n',
N'  0 AS AllUsers,\r\n',
N'  U.Id AS UserId,\r\n',
N'  ''object'' AS TypeId,\r\n',
N'  ''VTA_Pedido'' AS ObjectName,\r\n',
N'  ''(Pedidos.IdPedido='' + CHAR(39) + P.IdPedido + CHAR(39) + '')'' AS ObjectWhere,\r\n',
N'  ''view'' AS PageTypeId,\r\n',
N'  ''VTA_Pedido_Cliente_View'' AS PageName\r\n',
N'FROM Pedidos P\r\n',
N'INNER JOIN Pedidos_Estados E ON E.IdEstado = P.IdEstado\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE P.IdEstado <> ''35330DF3-96EA-4A9D-BB75-DF9D6B93DA22''\r\n',
N'  AND (P.UltimoEstadoNotificado IS NULL OR P.UltimoEstadoNotificado <> P.IdEstado)",
	"NoticeAllUsers":false,
	"UpdateNoticeSentence":"UPDATE P SET UltimoEstadoNotificado = P.IdEstado\r\n',
N'FROM Pedidos P\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE P.IdEstado <> ''35330DF3-96EA-4A9D-BB75-DF9D6B93DA22''\r\n',
N'  AND (P.UltimoEstadoNotificado IS NULL OR P.UltimoEstadoNotificado <> P.IdEstado)",
	"UpdateMailSentence":"UPDATE P SET UltimoEstadoEmailEnviado = P.IdEstado\r\n',
N'FROM Pedidos P\r\n',
N'INNER JOIN Clientes C ON C.IdCliente = P.IdCliente\r\n',
N'INNER JOIN flxCatalog_IC.dbo.AspNetUsers U ON U.Reference = P.IdCliente\r\n',
N'WHERE P.IdEstado <> ''35330DF3-96EA-4A9D-BB75-DF9D6B93DA22''\r\n',
N'  AND C.Email IS NOT NULL AND C.Email <> ''''\r\n',
N'  AND (P.UltimoEstadoEmailEnviado IS NULL OR P.UltimoEstadoEmailEnviado <> P.IdEstado)",
	"ConnStringId":"DataConnectionString",
	"JobName":"BuildMailsandnotifications",
	"flxInsertedBy":"unknown",
	"flxUpdatedBy":"unknown",
	"flxInsertedDate":"2026-09-22T09:44:00",
	"flxUpdatedDate":"2026-09-22T09:44:00",
	"OriginAddonId":"Main",
	"OriginId":1}]')


MERGE INTO [Notices_Sentences] AS Target
USING ( 
SELECT * from OPENJSON(@DATA) WITH (
[SentenceId] nvarchar(100) '$.SentenceId'
,[Decrip] nvarchar(250) '$.Decrip'
,[MailSentence] nvarchar(max) '$.MailSentence'
,[NoticeSentence] nvarchar(max) '$.NoticeSentence'
,[NoticeAllUsers] bit '$.NoticeAllUsers'
,[NoticeUsersSentence] nvarchar(max) '$.NoticeUsersSentence'
,[UpdateNoticeSentence] nvarchar(max) '$.UpdateNoticeSentence'
,[UpdateMailSentence] nvarchar(max) '$.UpdateMailSentence'
,[ConnStringId] nvarchar(50) '$.ConnStringId'
,[JobName] nvarchar(50) '$.JobName'
,[SmsSentence] nvarchar(max) '$.SmsSentence'
,[UpdateSmsSentence] nvarchar(max) '$.UpdateSmsSentence'
,[flxInsertedBy] nvarchar(256) '$.flxInsertedBy'
,[flxUpdatedBy] nvarchar(256) '$.flxUpdatedBy'
,[flxInsertedDate] smalldatetime '$.flxInsertedDate'
,[flxUpdatedDate] smalldatetime '$.flxUpdatedDate'
,[OriginAddonId] nvarchar(256) '$.OriginAddonId'
,[OriginId] int '$.OriginId'
) 
) AS Source ([SentenceId],[Decrip],[MailSentence],[NoticeSentence],[NoticeAllUsers],[NoticeUsersSentence],[UpdateNoticeSentence],[UpdateMailSentence],[ConnStringId],[JobName],[SmsSentence],[UpdateSmsSentence],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
ON (Target.[SentenceId] = Source.[SentenceId])
WHEN MATCHED AND (
	NULLIF(Source.[Decrip], Target.[Decrip]) IS NOT NULL OR NULLIF(Target.[Decrip], Source.[Decrip]) IS NOT NULL OR 
	NULLIF(Source.[MailSentence], Target.[MailSentence]) IS NOT NULL OR NULLIF(Target.[MailSentence], Source.[MailSentence]) IS NOT NULL OR 
	NULLIF(Source.[NoticeSentence], Target.[NoticeSentence]) IS NOT NULL OR NULLIF(Target.[NoticeSentence], Source.[NoticeSentence]) IS NOT NULL OR 
	NULLIF(Source.[NoticeAllUsers], Target.[NoticeAllUsers]) IS NOT NULL OR NULLIF(Target.[NoticeAllUsers], Source.[NoticeAllUsers]) IS NOT NULL OR 
	NULLIF(Source.[NoticeUsersSentence], Target.[NoticeUsersSentence]) IS NOT NULL OR NULLIF(Target.[NoticeUsersSentence], Source.[NoticeUsersSentence]) IS NOT NULL OR 
	NULLIF(Source.[UpdateNoticeSentence], Target.[UpdateNoticeSentence]) IS NOT NULL OR NULLIF(Target.[UpdateNoticeSentence], Source.[UpdateNoticeSentence]) IS NOT NULL OR 
	NULLIF(Source.[UpdateMailSentence], Target.[UpdateMailSentence]) IS NOT NULL OR NULLIF(Target.[UpdateMailSentence], Source.[UpdateMailSentence]) IS NOT NULL OR 
	NULLIF(Source.[ConnStringId], Target.[ConnStringId]) IS NOT NULL OR NULLIF(Target.[ConnStringId], Source.[ConnStringId]) IS NOT NULL OR 
	NULLIF(Source.[JobName], Target.[JobName]) IS NOT NULL OR NULLIF(Target.[JobName], Source.[JobName]) IS NOT NULL OR 
	NULLIF(Source.[SmsSentence], Target.[SmsSentence]) IS NOT NULL OR NULLIF(Target.[SmsSentence], Source.[SmsSentence]) IS NOT NULL OR 
	NULLIF(Source.[UpdateSmsSentence], Target.[UpdateSmsSentence]) IS NOT NULL OR NULLIF(Target.[UpdateSmsSentence], Source.[UpdateSmsSentence]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedBy], Target.[flxInsertedBy]) IS NOT NULL OR NULLIF(Target.[flxInsertedBy], Source.[flxInsertedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedBy], Target.[flxUpdatedBy]) IS NOT NULL OR NULLIF(Target.[flxUpdatedBy], Source.[flxUpdatedBy]) IS NOT NULL OR 
	NULLIF(Source.[flxInsertedDate], Target.[flxInsertedDate]) IS NOT NULL OR NULLIF(Target.[flxInsertedDate], Source.[flxInsertedDate]) IS NOT NULL OR 
	NULLIF(Source.[flxUpdatedDate], Target.[flxUpdatedDate]) IS NOT NULL OR NULLIF(Target.[flxUpdatedDate], Source.[flxUpdatedDate]) IS NOT NULL OR 
	NULLIF(Source.[OriginAddonId], Target.[OriginAddonId]) IS NOT NULL OR NULLIF(Target.[OriginAddonId], Source.[OriginAddonId]) IS NOT NULL OR 
	NULLIF(Source.[OriginId], Target.[OriginId]) IS NOT NULL OR NULLIF(Target.[OriginId], Source.[OriginId]) IS NOT NULL) THEN
 UPDATE SET
  [Decrip] = Source.[Decrip], 
  [MailSentence] = Source.[MailSentence], 
  [NoticeSentence] = Source.[NoticeSentence], 
  [NoticeAllUsers] = Source.[NoticeAllUsers], 
  [NoticeUsersSentence] = Source.[NoticeUsersSentence], 
  [UpdateNoticeSentence] = Source.[UpdateNoticeSentence], 
  [UpdateMailSentence] = Source.[UpdateMailSentence], 
  [ConnStringId] = Source.[ConnStringId], 
  [JobName] = Source.[JobName], 
  [SmsSentence] = Source.[SmsSentence], 
  [UpdateSmsSentence] = Source.[UpdateSmsSentence], 
  [flxInsertedBy] = Source.[flxInsertedBy], 
  [flxUpdatedBy] = Source.[flxUpdatedBy], 
  [flxInsertedDate] = Source.[flxInsertedDate], 
  [flxUpdatedDate] = Source.[flxUpdatedDate], 
  [OriginAddonId] = Source.[OriginAddonId], 
  [OriginId] = Source.[OriginId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([SentenceId],[Decrip],[MailSentence],[NoticeSentence],[NoticeAllUsers],[NoticeUsersSentence],[UpdateNoticeSentence],[UpdateMailSentence],[ConnStringId],[JobName],[SmsSentence],[UpdateSmsSentence],[flxInsertedBy],[flxUpdatedBy],[flxInsertedDate],[flxUpdatedDate],[OriginAddonId],[OriginId])
 VALUES(Source.[SentenceId],Source.[Decrip],Source.[MailSentence],Source.[NoticeSentence],Source.[NoticeAllUsers],Source.[NoticeUsersSentence],Source.[UpdateNoticeSentence],Source.[UpdateMailSentence],Source.[ConnStringId],Source.[JobName],Source.[SmsSentence],Source.[UpdateSmsSentence],Source.[flxInsertedBy],Source.[flxUpdatedBy],Source.[flxInsertedDate],Source.[flxUpdatedDate],Source.[OriginAddonId],Source.[OriginId])
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





