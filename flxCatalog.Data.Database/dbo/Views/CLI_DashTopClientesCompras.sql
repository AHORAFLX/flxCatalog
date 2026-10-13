CREATE VIEW [dbo].[CLI_DashTopClientesCompras]
AS
SELECT TOP (8)
    N'Importe comprado' AS serie,
    ISNULL(Clientes.NombreComercial, Clientes.RazonSocial) AS label,
    SUM(Pedidos.Total) AS value,
    '#16a34a' AS backgroundColor,
    '#16a34a' AS borderColor
FROM Pedidos
INNER JOIN Pedidos_Estados ON Pedidos_Estados.IdEstado = Pedidos.IdEstado
INNER JOIN Clientes ON Clientes.IdCliente = Pedidos.IdCliente
WHERE Pedidos_Estados.Nombre NOT IN (N'Borrador', N'Cancelado')
GROUP BY ISNULL(Clientes.NombreComercial, Clientes.RazonSocial)
ORDER BY SUM(Pedidos.Total) DESC
GO
