CREATE   PROCEDURE [dbo].[pVTA_CancelarIncidencia] @IdIncidencia NVARCHAR(36), @CurrentRole NVARCHAR(50) = NULL, @CurrentReference NVARCHAR(50) = NULL AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id UNIQUEIDENTIFIER = CAST(@IdIncidencia AS UNIQUEIDENTIFIER);
  DECLARE @EstadoActual NVARCHAR(50);
  DECLARE @IdClientePedido NVARCHAR(50);

  SELECT @EstadoActual = e.Nombre, @IdClientePedido = p.IdCliente
  FROM dbo.Incidencias i
  JOIN dbo.Incidencias_Estados e ON e.IdEstado = i.IdEstado
  JOIN dbo.Pedidos p ON p.IdPedido = i.IdPedido
  WHERE i.IdIncidencia = @Id;

  IF @EstadoActual IS NULL
  BEGIN
    RAISERROR ('La incidencia no existe.', 16, 1);
    RETURN 0;
  END
  IF @CurrentRole = N'cliente' AND @IdClientePedido <> @CurrentReference
  BEGIN
    RAISERROR ('No tienes permiso sobre esta incidencia.', 16, 1);
    RETURN 0;
  END
  IF @EstadoActual <> N'Abierta'
  BEGIN
    RAISERROR ('Solo se puede cancelar una incidencia en estado Abierta (estado actual: %s).', 16, 1, @EstadoActual);
    RETURN 0;
  END

  UPDATE dbo.Incidencias SET IdEstado = (SELECT IdEstado FROM dbo.Incidencias_Estados WHERE Nombre = N'Cancelada')
  WHERE IdIncidencia = @Id;

  SELECT N'Incidencia cancelada.' AS SuccessMessage, 1 AS Refresh;
  RETURN 1;
END
GO
