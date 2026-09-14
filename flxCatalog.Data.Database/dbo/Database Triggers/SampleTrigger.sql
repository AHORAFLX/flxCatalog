CREATE TRIGGER [dbo].[SampleTrigger]
ON [dbo].[SampleTable]
AFTER INSERT
AS
BEGIN
    PRINT 'Registro insertado en SampleTable';
END;
