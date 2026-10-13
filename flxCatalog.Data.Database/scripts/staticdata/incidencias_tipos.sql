BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[
    {"IdTipo": "8454CDE7-9C36-4506-AAC7-8012B5BC8E8A", "Nombre": "Producto incorrecto", "Orden": 1},
    {"IdTipo": "179C4490-C84C-40C7-B5D9-8591E0864F20", "Nombre": "Producto defectuoso", "Orden": 2},
    {"IdTipo": "07A89CA9-F547-4784-96B4-4A338BDC3E3C", "Nombre": "Falta material", "Orden": 3},
    {"IdTipo": "51983699-D378-443E-8F73-9A07ED39DB2B", "Nombre": "Problema de entrega", "Orden": 4},
    {"IdTipo": "649C0045-C0A1-4870-B379-6301C34C2E54", "Nombre": "Facturación", "Orden": 5},
    {"IdTipo": "14CAE997-2D68-4353-8779-F2D793403C91", "Nombre": "Consulta general", "Orden": 6}
]'

MERGE INTO [dbo].[Incidencias_Tipos] AS Target
USING (
    SELECT * FROM OPENJSON(@DATA) WITH (
        [IdTipo] NVARCHAR(50) '$.IdTipo',
        [Nombre] NVARCHAR(50) '$.Nombre',
        [Orden] INT '$.Orden'
    )
) AS Source ([IdTipo], [Nombre], [Orden])
ON (Target.[IdTipo] = Source.[IdTipo])
WHEN MATCHED AND (
    NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL
    OR NULLIF(Source.[Orden], Target.[Orden]) IS NOT NULL OR NULLIF(Target.[Orden], Source.[Orden]) IS NOT NULL
) THEN
    UPDATE SET
        [Nombre] = Source.[Nombre],
        [Orden] = Source.[Orden]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([IdTipo], [Nombre], [Orden])
    VALUES (Source.[IdTipo], Source.[Nombre], Source.[Orden])
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
