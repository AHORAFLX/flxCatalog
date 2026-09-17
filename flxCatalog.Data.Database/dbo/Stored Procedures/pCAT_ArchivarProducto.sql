CREATE   PROCEDURE [dbo].[pCAT_ArchivarProducto] @IdProducto NVARCHAR(36) AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdProducto AS UNIQUEIDENTIFIER);

  IF NOT EXISTS (SELECT 1 FROM dbo.Productos WHERE IdProducto = @Id)
  BEGIN
    RAISERROR ('El producto no existe.', 16, 1);
    RETURN 0;
  END

  UPDATE dbo.Productos SET Activo = 0, ModifiedBy = N'admin', ModifiedDate = SYSDATETIME()
  WHERE IdProducto = @Id;

  SELECT N'Producto archivado (Activo = No).' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
