CREATE   PROCEDURE [dbo].[pCAT_DuplicarProducto] @IdProducto NVARCHAR(36) AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdProducto AS UNIQUEIDENTIFIER);
  DECLARE @NewId UNIQUEIDENTIFIER = NEWID();
  DECLARE @NuevaReferencia NVARCHAR(100);
  DECLARE @NuevoNombre NVARCHAR(200);

  IF NOT EXISTS (SELECT 1 FROM dbo.Productos WHERE IdProducto = @Id)
  BEGIN
    RAISERROR ('El producto no existe.', 16, 1);
    RETURN 0;
  END

  SELECT @NuevaReferencia = Referencia + N'-COPIA', @NuevoNombre = Nombre + N' (copia)'
  FROM dbo.Productos WHERE IdProducto = @Id;

  INSERT INTO dbo.Productos (IdProducto, Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca,
    PrecioBase, IVA, Stock, Destacado, Novedad, Oferta, Activo, ImagenPrincipal,
    CreatedBy, CreateDate, ModifiedBy, ModifiedDate)
  SELECT @NewId, @NuevaReferencia, @NuevoNombre, DescripcionCorta, IdFamilia, IdMarca,
    PrecioBase, IVA, 0, 0, 0, 0, 0, ImagenPrincipal,
    N'admin', SYSDATETIME(), N'admin', SYSDATETIME()
  FROM dbo.Productos WHERE IdProducto = @Id;

  INSERT INTO dbo.Productos_Variantes (IdVariante, IdProducto, IdTalla, IdColor, Referencia, Stock)
  SELECT NEWID(), @NewId, IdTalla, IdColor, Referencia + N'-COPIA', 0
  FROM dbo.Productos_Variantes WHERE IdProducto = @Id;

  SELECT N'Producto duplicado como ' + @NuevaReferencia + N'. Se ha creado desactivado, con stock a 0.' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
