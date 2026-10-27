/*CONFIG EXAMPLE*/

/*
--Change logo
UPDATE Interfaces SET Logo = '~/custom/logos/flxCatalog.png', SkinId = 'flexy2022' WHERE InterfaceName in( 'webdefault', 'mobiledefault' )

--Change default update url settings
Update Settings set SettingValue='https://nuget.ahorabh.com/v3/index.json' where SettingName='AutoUpdateURL'

--Set user reference
UPDATE Objects_Properties 
		SET TypeId='dbcombo',
		Label='Employee',
		SQLSentence='select Employeeid,Name from Employees order by Name',
		SQLValueField='Employeeid',
		SQLDisplayField='Name',
		IsRequired=1,
		ConnStringId='DataConnectionString',
		LabelStyle='font-weight:bold'
		WHERE ObjectName='sysUser' and PropertyName='Reference'

*/

--Establece espacio de nombres para los paquetes de tu producto
Update Settings set SettingValue='flxCatalog' where SettingName='AutoUpdatePackageNamespace'

--Establece la cadena de conexión de datos para actualizar y el nombre del paquete de base de datos de datos, se concatena 
--con el espacio de nombres del setting anterior
Update DbConnectionStrings set UpdateDataModel = 1, PackageDbName = 'Data' where ConnStringId = 'DataConnectionString'

Update [AspNetUsers] set [ProfileName]='2026' where [Id]=N'1'
Update [AspNetUsers] set [CultureId]='es-es' where [Id]=N'1'
Update [AspNetUsers] set [ConcurrencyStamp]='b5674663-b1eb-45a6-ba35-1841be489a77' where [Id]=N'1'
Update [AspNetUsers] set [Reference]='E391566D-5E36-4C0E-A74D-CF48EDB2C09F' where [Id]=N'1'

Update [Interfaces] set [StartupPageName]='HOME' where [InterfaceName]=N'web2026'
Update [Interfaces] set [StartupPageName]='HOME' where [InterfaceName]=N'webdefault'

Update [Skins_Variables] set [VarValue]='FAFAFA' where [SkinId]=N'flexy2022' AND [VarName]=N'bgColor'
Update [Skins_Variables] set [VarValue]='1c1b1d' where [SkinId]=N'flexy2022' AND [VarName]=N'NavColor'
Update [Skins_Variables] set [VarValue]='333234' where [SkinId]=N'flexy2022' AND [VarName]=N'OutstandingColor'
Update [Skins_Variables] set [VarValue]='000000' where [SkinId]=N'flexy2022' AND [VarName]=N'PrimaryColor'

Update [Navigation_Nodes] set [Order]=4 where [NodeId]=N'3EFA1E96-A067-4C9E-AC1E-1B86ECDFF81B'
Update [Navigation_Nodes] set [Order]=8 where [NodeId]=N'DE243A5F-E146-412A-B369-3C8A8B8B3E0C'

Update [Jobs] set [Enabled]=1 where [JobName]=N'BuildMailsandnotifications'

Update [Objects_Templates] set [IsDefault]=0 where [TemplateId]=N'flx-sysNoticeUsersList'
Update [Objects_Views] set [IsDefault]=0 where [ObjectName]=N'sysNoticeUser' AND [ViewName]=N'sysNoticeUserDefaultList'

--Ajustes de la API y del asistente: no viajan en ningún script de staticdata (decisión D-15 de pendientes-cliente-admin)
Update Settings set SettingValue=N'flxCatalog es una aplicación de demostración de Flexygo: un catálogo B2B/B2C con portal de clientes y backoffice de administración. El catálogo organiza los productos por familia y marca, y cada producto tiene variantes de talla y color. Los clientes hacen pedidos (con sus líneas) a partir de su carrito y luego pueden abrir devoluciones e incidencias, que siguen su propio circuito de estados. El administrador gestiona el catálogo, los pedidos y la postventa desde su mesa de trabajo y su dashboard. Un «pedido» es la venta confirmada de un cliente; una «devolución» es la vuelta de líneas de un pedido; una «incidencia» es una reclamación o consulta sobre un pedido. Los datos son de demo y se reinician periódicamente.' where SettingName='ApplicationDescription'
Update Settings set SettingValue='true' where SettingName='WebAPI_Enabled'
Update Settings set SettingValue='true' where SettingName='MCP_Enabled'
