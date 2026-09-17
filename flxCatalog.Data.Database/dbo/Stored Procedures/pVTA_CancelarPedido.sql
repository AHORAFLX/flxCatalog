CREATE   PROCEDURE [dbo].[pVTA_CancelarPedido] @IdPedido NVARCHAR(36) AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdPedido AS UNIQUEIDENTIFIER);
  DECLARE @EstadoActual NVARCHAR(50);

  SELECT @EstadoActual = e.Nombre FROM dbo.Pedidos p JOIN dbo.Pedidos_Estados e ON e.IdEstado = p.IdEstado WHERE p.IdPedido = @Id;

  IF @EstadoActual IS NULL
  BEGIN
    RAISERROR ('El pedido no existe.', 16, 1);
    RETURN 0;
  END
  IF @EstadoActual IN (N'Entregado', N'Cancelado')
  BEGIN
    RAISERROR ('No se puede cancelar un pedido en estado %s.', 16, 1, @EstadoActual);
    RETURN 0;
  END

  UPDATE dbo.Pedidos SET IdEstado = (SELECT IdEstado FROM dbo.Pedidos_Estados WHERE Nombre = N'Cancelado')
  WHERE IdPedido = @Id;

  SELECT N'Pedido cancelado.' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
