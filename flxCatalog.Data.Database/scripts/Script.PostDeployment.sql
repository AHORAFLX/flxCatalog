BEGIN TRANSACTION

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

EXEC sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'

PRINT N'sampletable.sql...'
:r .\staticdata\sampletable.sql

EXEC sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER all'

EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'

COMMIT TRANSACTION

