CREATE VIEW [dbo].[VTA_DashTopArticulosVendidos]
AS
SELECT TOP (8)
    N'Unidades vendidas' AS serie,
    Productos.Nombre AS label,
    SUM(Pedidos_Lineas.Cantidad) AS value,
    '#6366f1' AS backgroundColor,
    '#6366f1' AS borderColor
FROM Pedidos_Lineas
INNER JOIN Pedidos ON Pedidos.IdPedido = Pedidos_Lineas.IdPedido
INNER JOIN Pedidos_Estados ON Pedidos_Estados.IdEstado = Pedidos.IdEstado
INNER JOIN Productos ON Productos.IdProducto = Pedidos_Lineas.IdProducto
WHERE Pedidos_Estados.Nombre NOT IN (N'Borrador', N'Cancelado')
GROUP BY Productos.Nombre
ORDER BY SUM(Pedidos_Lineas.Cantidad) DESC
GO
