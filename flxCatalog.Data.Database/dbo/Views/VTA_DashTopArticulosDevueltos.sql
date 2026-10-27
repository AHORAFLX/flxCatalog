CREATE   VIEW [dbo].[VTA_DashTopArticulosDevueltos]
AS
SELECT TOP (8)
    N'Unidades devueltas' AS serie,
    Productos.Nombre AS label,
    SUM(Devoluciones.Cantidad) AS value,
    '#dc2626' AS backgroundColor,
    '#dc2626' AS borderColor
FROM Devoluciones
INNER JOIN Pedidos_Lineas ON Pedidos_Lineas.IdLinea = Devoluciones.IdLinea
INNER JOIN Productos ON Productos.IdProducto = Pedidos_Lineas.IdProducto
WHERE Devoluciones.Activo = 1
GROUP BY Productos.Nombre
ORDER BY SUM(Devoluciones.Cantidad) DESC
GO
