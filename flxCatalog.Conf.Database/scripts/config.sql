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
Update [Interfaces] set [StartupPageName]='HOME' where [InterfaceName]=N'web2026'
Update [Interfaces] set [flxUpdatedBy]='flexygo-mcp' where [InterfaceName]=N'web2026'
Update [Interfaces] set [StartupPageName]='HOME' where [InterfaceName]=N'webdefault'
Update [Interfaces] set [flxUpdatedBy]='flexygo-mcp' where [InterfaceName]=N'webdefault'
Update [Skins_Variables] set [VarValue]='FAFAFA' where [SkinId]=N'flexy2022' AND [VarName]=N'bgColor'
Update [Skins_Variables] set [VarValue]='1c1b1d' where [SkinId]=N'flexy2022' AND [VarName]=N'NavColor'
Update [Skins_Variables] set [VarValue]='333234' where [SkinId]=N'flexy2022' AND [VarName]=N'OutstandingColor'
Update [Skins_Variables] set [VarValue]='000000' where [SkinId]=N'flexy2022' AND [VarName]=N'PrimaryColor'
