CREATE   PROCEDURE [dbo].[pVTA_CancelarDevolucion] @IdDevolucion NVARCHAR(36), @CurrentRole NVARCHAR(50) = NULL, @CurrentReference NVARCHAR(50) = NULL AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdDevolucion AS UNIQUEIDENTIFIER);
  DECLARE @EstadoActual NVARCHAR(50);
  DECLARE @IdClientePedido NVARCHAR(50);

  SELECT @EstadoActual = e.Nombre, @IdClientePedido = p.IdCliente
  FROM dbo.Devoluciones d
  JOIN dbo.Devoluciones_Estados e ON e.IdEstado = d.IdEstado
  JOIN dbo.Pedidos p ON p.IdPedido = d.IdPedido
  WHERE d.IdDevolucion = @Id;

  IF @EstadoActual IS NULL
  BEGIN
    RAISERROR ('La devolución no existe.', 16, 1);
    RETURN 0;
  END
  IF @CurrentRole = N'cliente' AND @IdClientePedido <> @CurrentReference
  BEGIN
    RAISERROR ('No tienes permiso sobre esta devolución.', 16, 1);
    RETURN 0;
  END
  IF @EstadoActual <> N'Solicitada'
  BEGIN
    RAISERROR ('Solo se puede cancelar una devolución en estado Solicitada (estado actual: %s).', 16, 1, @EstadoActual);
    RETURN 0;
  END

  UPDATE dbo.Devoluciones SET IdEstado = (SELECT IdEstado FROM dbo.Devoluciones_Estados WHERE Nombre = N'Cancelada')
  WHERE IdDevolucion = @Id;

  SELECT N'Devolución cancelada.' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
