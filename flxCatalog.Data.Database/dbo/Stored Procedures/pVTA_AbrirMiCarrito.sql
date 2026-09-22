CREATE   PROCEDURE [dbo].[pVTA_AbrirMiCarrito] @CurrentReference NVARCHAR(50) = NULL AS
BEGIN
  SET NOCOUNT ON;

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
    SET @IdPedido = CAST(NEWID() AS NVARCHAR(50));
    INSERT INTO dbo.Pedidos (IdPedido, Numero, IdCliente, IdEstado, Fecha, Total)
    VALUES (@IdPedido, CONCAT(N'CARR-', FORMAT(GETDATE(), N'yyyyMMddHHmmss')), @CurrentReference, @IdEstadoBorrador, GETDATE(), 0);
  END

  DECLARE @Q CHAR(1) = CHAR(39);
  DECLARE @JS NVARCHAR(MAX) = N'flexygo.nav.openPageName(' + @Q + N'VTA_Pedido_MiCarrito_View' + @Q + N',' + @Q + N'VTA_Pedido' + @Q + N',"(Pedidos.IdPedido=' + @Q + @IdPedido + @Q + N')",null,' + @Q + N'current' + @Q + N');';

  SELECT @JS AS JSCode;
  RETURN 1;
END
GO
