PRINT N'Inserting data'

BEGIN TRAN

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

EXEC sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'

PRINT N'config.sql...'
:r .\config.sql

-- El orden tiene que ser  primero habilitar triggers y constraint, luego lanzar el proceso de actualizacion 
EXEC sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER all'

EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'

IF (N'$(IsProduct)' = '1') BEGIN
	EXEC pNet_CreateOrUpdateDatabase $(OriginDatabaseName), N'$(CurrentDacVersion)', N'$(ProjectName)'
END

UPDATE Origins SET Active=CASE OriginId WHEN 2 THEN 1 ELSE 0 END

COMMIT TRANSACTION
