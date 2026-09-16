CREATE FUNCTION [dbo].[SampleFunction]
(
    @Id INT
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Name NVARCHAR(100);
    SELECT @Name = [Name] FROM [dbo].[SampleTable] WHERE [Id] = @Id;
    RETURN @Name;
END;
GO
