BEGIN TRY

DECLARE @DATA nvarchar(max) = convert(nvarchar(max), '') + N'
[{
    "Id": 1,
    "Name": "Ejemplo estático"
}]'

MERGE INTO [dbo].[SampleTable] AS Target
USING (
    SELECT * FROM OPENJSON(@DATA) WITH (
        [Id] INT '$.Id',
        [Name] NVARCHAR(100) '$.Name'
    )
) AS Source ([Id], [Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
    NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL
) THEN
    UPDATE SET
        [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [Name])
    VALUES (Source.[Id], Source.[Name])
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
