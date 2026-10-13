CREATE VIEW [dbo].[CLI_DashTopClientesCasos]
AS
SELECT TOP (8)
    N'Incidencias y devoluciones' AS serie,
    ISNULL(Clientes.NombreComercial, Clientes.RazonSocial) AS label,
    COUNT(Casos.Id) AS value,
    '#d97706' AS backgroundColor,
    '#d97706' AS borderColor
FROM (
    SELECT Incidencias.IdIncidencia AS Id, Incidencias.IdPedido FROM Incidencias WHERE Incidencias.Activo = 1
    UNION ALL
    SELECT Devoluciones.IdDevolucion AS Id, Devoluciones.IdPedido FROM Devoluciones WHERE Devoluciones.Activo = 1
) AS Casos
INNER JOIN Pedidos ON Pedidos.IdPedido = Casos.IdPedido
INNER JOIN Clientes ON Clientes.IdCliente = Pedidos.IdCliente
GROUP BY ISNULL(Clientes.NombreComercial, Clientes.RazonSocial)
ORDER BY COUNT(Casos.Id) DESC
GO
