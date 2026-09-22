CREATE   PROCEDURE [dbo].[pVTA_ActualizarLineaCarrito]
  @IdProducto NVARCHAR(36),
  @IdVariante NVARCHAR(36) = NULL,
  @Cantidad INT,
  @CurrentReference NVARCHAR(50) = NULL
AS
BEGIN
  SET NOCOUNT ON;
  SET @IdVariante = NULLIF(@IdVariante, N'');

  IF @CurrentReference IS NULL
  BEGIN
    RAISERROR (N'No se pudo identificar al cliente actual.', 16, 1);
    RETURN 0;
  END

  DECLARE @IdEstadoBorrador NVARCHAR(50);
  SELECT @IdEstadoBorrador = IdEstado FROM dbo.Pedidos_Estados WHERE Nombre = N'Borrador';

  DECLARE @IdPedido NVARCHAR(50);
  SELECT @IdPedido = IdPedido FROM dbo.Pedidos WHERE IdCliente = @CurrentReference AND IdEstado = @IdEstadoBorrador;

  IF @IdPedido IS NULL
  BEGIN
    IF @Cantidad <= 0
    BEGIN
      SELECT N'No hay nada que quitar del carrito.' AS SuccessMessage, 0 AS Refresh;
      RETURN 1;
    END
    SET @IdPedido = CAST(NEWID() AS NVARCHAR(50));
    INSERT INTO dbo.Pedidos (IdPedido, Numero, IdCliente, IdEstado, Fecha, Total)
    VALUES (@IdPedido, CONCAT(N'CARR-', FORMAT(GETDATE(), N'yyyyMMddHHmmss')), @CurrentReference, @IdEstadoBorrador, GETDATE(), 0);
  END

  DECLARE @IdTarifa NVARCHAR(50);
  SELECT @IdTarifa = IdTarifa FROM dbo.Clientes WHERE IdCliente = @CurrentReference;

  DECLARE @Precio DECIMAL(18,2);
  SELECT @Precio = ISNULL(
    (SELECT Precio FROM dbo.Tarifas_Precios WHERE IdProducto = @IdProducto AND IdTarifa = @IdTarifa),
    (SELECT PrecioBase FROM dbo.Productos WHERE IdProducto = @IdProducto));

  IF @Cantidad <= 0
  BEGIN
    DELETE FROM dbo.Pedidos_Lineas
    WHERE IdPedido = @IdPedido AND IdProducto = @IdProducto
      AND ISNULL(IdVariante, N'') = ISNULL(@IdVariante, N'');
  END
  ELSE IF EXISTS (
    SELECT 1 FROM dbo.Pedidos_Lineas
    WHERE IdPedido = @IdPedido AND IdProducto = @IdProducto
      AND ISNULL(IdVariante, N'') = ISNULL(@IdVariante, N''))
  BEGIN
    UPDATE dbo.Pedidos_Lineas
    SET Cantidad = @Cantidad, Precio = @Precio, Subtotal = @Cantidad * @Precio
    WHERE IdPedido = @IdPedido AND IdProducto = @IdProducto
      AND ISNULL(IdVariante, N'') = ISNULL(@IdVariante, N'');
  END
  ELSE
  BEGIN
    INSERT INTO dbo.Pedidos_Lineas (IdLinea, IdPedido, IdProducto, IdVariante, Cantidad, Precio, Subtotal)
    VALUES (CAST(NEWID() AS NVARCHAR(50)), @IdPedido, @IdProducto, @IdVariante, @Cantidad, @Precio, @Cantidad * @Precio);
  END

  UPDATE dbo.Pedidos
  SET Total = ISNULL((SELECT SUM(Subtotal) FROM dbo.Pedidos_Lineas WHERE IdPedido = @IdPedido), 0)
  WHERE IdPedido = @IdPedido;

  SELECT N'Carrito actualizado.' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
