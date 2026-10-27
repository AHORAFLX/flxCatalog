PRINT N'Inserting data'

BEGIN TRAN

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

EXEC sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'

PRINT N'config.sql...'
:r .\config.sql
:r .\staticdata\aspnetprofiles.sql
:r .\staticdata\aspnetroles.sql
:r .\staticdata\contextvars.sql
:r .\staticdata\documents_objects_config.sql
:r .\staticdata\help.sql
:r .\staticdata\interfaces.sql
:r .\staticdata\kanban_settings.sql
:r .\staticdata\menus.sql
:r .\staticdata\modules_events.sql
:r .\staticdata\modules.sql
:r .\staticdata\navigation_nodes.sql
:r .\staticdata\notices_sentences.sql
:r .\staticdata\notices.sql
:r .\staticdata\objects_images_settings.sql
:r .\staticdata\objects_objects.sql
:r .\staticdata\objects_processes.sql
:r .\staticdata\objects_properties.sql
:r .\staticdata\objects_search_properties.sql
:r .\staticdata\objects_search.sql
:r .\staticdata\objects_templates.sql
:r .\staticdata\objects_views_properties.sql
:r .\staticdata\objects_views.sql
:r .\staticdata\objects.sql
:r .\staticdata\pages_modules_tabs.sql
:r .\staticdata\pages_modules.sql
:r .\staticdata\pages.sql
:r .\staticdata\plugins.sql
:r .\staticdata\processes_params_dependencies.sql
:r .\staticdata\processes_params.sql
:r .\staticdata\processes.sql
:r .\staticdata\security_modules_roles.sql
:r .\staticdata\security_navigation_nodes_roles.sql
:r .\staticdata\security_objects_processes_roles.sql
:r .\staticdata\security_objects_roles.sql
:r .\staticdata\security_pages_roles.sql
:r .\staticdata\toolbars_buttons.sql
:r .\staticdata\toolbars.sql
:r .\staticdata\webapi_objects.sql
:r .\staticdata\2026-10-26_201805_origin_0_system_customizations.sql
:r .\staticdata\kanban_settings_orders.sql
:r .\staticdata\tours.sql
:r .\staticdata\tours_steps.sql
:r .\staticdata\webapi_roles.sql



-- El orden tiene que ser  primero habilitar triggers y constraint, luego lanzar el proceso de actualizacion 
EXEC sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER all'

EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'

IF (N'$(IsProduct)' = '1') BEGIN
	EXEC pNet_CreateOrUpdateDatabase $(OriginDatabaseName), N'$(CurrentDacVersion)', N'$(ProjectName)'
END

UPDATE Origins SET Active=CASE OriginId WHEN 2 THEN 1 ELSE 0 END

COMMIT TRANSACTION
