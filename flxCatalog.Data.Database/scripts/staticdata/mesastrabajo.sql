BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[
    {"IdMesa": "7F3A2B10-5C4D-4E8A-9B61-0D2E4F6A8C01", "Nombre": "Mesa de trabajo"}
]'

MERGE INTO [dbo].[MesasTrabajo] AS Target
USING (
    SELECT * FROM OPENJSON(@DATA) WITH (
        [IdMesa] NVARCHAR(50) '$.IdMesa',
        [Nombre] NVARCHAR(100) '$.Nombre'
    )
) AS Source ([IdMesa], [Nombre])
ON (Target.[IdMesa] = Source.[IdMesa])
WHEN MATCHED AND (
    NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL
) THEN
    UPDATE SET
        [Nombre] = Source.[Nombre]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([IdMesa], [Nombre])
    VALUES (Source.[IdMesa], Source.[Nombre])
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
