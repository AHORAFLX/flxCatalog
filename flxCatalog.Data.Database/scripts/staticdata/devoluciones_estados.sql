BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[
    {"IdEstado": "CB6E0913-0A81-4C7B-BC78-925F53FCF836", "Nombre": "Solicitada", "Orden": 1},
    {"IdEstado": "9D2EF704-F145-4596-9D74-B228D341F07F", "Nombre": "En revisión", "Orden": 2},
    {"IdEstado": "A782EC81-2E3A-4664-82FC-FB0C25332F48", "Nombre": "Aceptada", "Orden": 3},
    {"IdEstado": "E68164DD-1D92-404E-8C17-B86837070EE0", "Nombre": "Rechazada", "Orden": 4},
    {"IdEstado": "6B0AA32C-D983-46EC-892E-C7A835498609", "Nombre": "Abonada", "Orden": 5},
    {"IdEstado": "252D6C82-05A0-4879-953B-856AB5CFBE1C", "Nombre": "Cancelada", "Orden": 6}
]'

MERGE INTO [dbo].[Devoluciones_Estados] AS Target
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
