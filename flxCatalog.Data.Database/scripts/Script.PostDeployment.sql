BEGIN TRANSACTION

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

EXEC sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'

PRINT N'sampletable.sql...'
:r .\staticdata\sampletable.sql

PRINT N'pedidos_estados.sql...'
:r .\staticdata\pedidos_estados.sql

PRINT N'devoluciones_estados.sql...'
:r .\staticdata\devoluciones_estados.sql

PRINT N'incidencias_estados.sql...'
:r .\staticdata\incidencias_estados.sql

PRINT N'incidencias_tipos.sql...'
:r .\staticdata\incidencias_tipos.sql

PRINT N'mesastrabajo.sql...'
:r .\staticdata\mesastrabajo.sql

EXEC sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER all'

EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'

COMMIT TRANSACTION

