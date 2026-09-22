CREATE   PROCEDURE [dbo].[pCAT_ToggleFavorito] @IdProducto NVARCHAR(36), @CurrentReference NVARCHAR(50) = NULL AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdProducto AS UNIQUEIDENTIFIER);

  IF @CurrentReference IS NULL
  BEGIN
    RAISERROR ('No se pudo identificar al cliente actual.', 16, 1);
    RETURN 0;
  END

  IF EXISTS (SELECT 1 FROM dbo.Favoritos WHERE IdCliente = @CurrentReference AND IdProducto = @Id)
  BEGIN
    DELETE FROM dbo.Favoritos WHERE IdCliente = @CurrentReference AND IdProducto = @Id;
    SELECT N'Quitado de favoritos.' AS SuccessMessage, 1 AS Refresh;
  END
  ELSE
  BEGIN
    INSERT INTO dbo.Favoritos (IdCliente, IdProducto) VALUES (@CurrentReference, @Id);
    SELECT N'Añadido a favoritos.' AS SuccessMessage, 1 AS Refresh;
  END

  RETURN 1;
END
GO
