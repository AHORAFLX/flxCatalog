BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[
    {"IdEstado": "25B5DB82-DB5D-483F-86DC-C6BA418C4FE2", "Nombre": "Abierta", "Orden": 1},
    {"IdEstado": "1C218D64-1ADF-48D1-8DF6-4A1A37D9C62A", "Nombre": "Cerrada", "Orden": 2},
    {"IdEstado": "11EEC4CC-FD6C-43B9-A640-FBE3C542C5B4", "Nombre": "Cancelada", "Orden": 3}
]'

MERGE INTO [dbo].[Incidencias_Estados] AS Target
USING (
    SELECT * FROM OPENJSON(@DATA) WITH (
        [IdEstado] NVARCHAR(50) '$.IdEstado',
        [Nombre] NVARCHAR(50) '$.Nombre',
        [Orden] INT '$.Orden'
    )
) AS Source ([IdEstado], [Nombre], [Orden])
ON (Target.[IdEstado] = Source.[IdEstado])
WHEN MATCHED AND (
    NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL
    OR NULLIF(Source.[Orden], Target.[Orden]) IS NOT NULL OR NULLIF(Target.[Orden], Source.[Orden]) IS NOT NULL
) THEN
    UPDATE SET
        [Nombre] = Source.[Nombre],
        [Orden] = Source.[Orden]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([IdEstado], [Nombre], [Orden])
    VALUES (Source.[IdEstado], Source.[Nombre], Source.[Orden])
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

END TRY
BEGIN CATCH
    DECLARE @ERRORNUMBER INT, @ERRORMSG VARCHAR(MAX), @ERRORSTATE INT;
    SELECT
        @ERRORNUMBER = 50000 + ERROR_NUMBER(),
        @ERRORMSG = ERROR_MESSAGE(),
        @ERRORSTATE = ERROR_STATE();
    THROW @ERRORNUMBER, @ERRORMSG, @ERRORSTATE;
END CATCH
GO
