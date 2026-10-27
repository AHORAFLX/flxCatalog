CREATE   VIEW [dbo].[VTA_DashVentasFamiliaPrincipal]
AS
SELECT COALESCE(Padre.Nombre, Familia.Nombre) AS serie,
       COALESCE(Padre.Nombre, Familia.Nombre) AS label,
       SUM(Linea.Subtotal) AS value,
       CASE COALESCE(Padre.Nombre, Familia.Nombre)
            WHEN N'Ropa' THEN '#6366f1' WHEN N'Calzado' THEN '#16a34a' WHEN N'Moda Infantil' THEN '#d97706'
            WHEN N'Deporte' THEN '#0ea5e9' WHEN N'Accesorios' THEN '#a855f7' WHEN N'Ropa Interior' THEN '#dc2626'
            ELSE '#94a3b8' END AS backgroundColor,
       '#ffffff' AS borderColor
FROM dbo.Pedidos_Lineas AS Linea
INNER JOIN dbo.Productos AS Producto ON Producto.IdProducto = Linea.IdProducto
INNER JOIN dbo.Familias AS Familia ON Familia.IdFamilia = Producto.IdFamilia
LEFT JOIN dbo.Familias AS Padre ON Padre.IdFamilia = Familia.IdFamiliaPadre
GROUP BY COALESCE(Padre.Nombre, Familia.Nombre);
GO
