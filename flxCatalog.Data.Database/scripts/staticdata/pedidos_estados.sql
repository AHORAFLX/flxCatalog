BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[
    {"IdEstado": "094D3515-5EC4-4651-B829-A42DEE93CD8F", "Nombre": "Borrador", "Orden": 1},
    {"IdEstado": "EB7AEA4C-FEC6-473D-9C64-08BDDDAF75B4", "Nombre": "Confirmado", "Orden": 2},
    {"IdEstado": "458BAE9E-BBE2-463A-A59F-FA7AFF1D9A64", "Nombre": "En proceso", "Orden": 3},
    {"IdEstado": "E61C3BF6-86CC-46EE-959D-E3B438F88FF8", "Nombre": "Enviado", "Orden": 4},
    {"IdEstado": "B6B9E119-3BA2-4EB4-B06E-C1B7C401DA02", "Nombre": "Entregado", "Orden": 5},
    {"IdEstado": "736D5D6A-072B-46E6-8B1A-0689C0C485D6", "Nombre": "Cancelado", "Orden": 6}
]'

MERGE INTO [dbo].[Pedidos_Estados] AS Target
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
