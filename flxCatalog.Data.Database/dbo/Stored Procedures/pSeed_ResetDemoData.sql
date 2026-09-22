CREATE         PROCEDURE [dbo].[pSeed_ResetDemoData]
AS
BEGIN
  SET NOCOUNT ON;

  -- Orden de borrado: hijos antes que padres. Tarifas_Precios depende de Tarifas y Productos,
  -- así que se borra ANTES de ambas (si no, ALTER/DELETE falla por violación de FK).
  -- Comentarios/Devoluciones/Incidencias/Favoritos dependen de Pedidos/Pedidos_Lineas/Clientes/
  -- Productos: se borran antes que todos ellos.
  DELETE FROM dbo.Comentarios;
  DELETE FROM dbo.Devoluciones;
  DELETE FROM dbo.Incidencias;
  DELETE FROM dbo.Favoritos;
  DELETE FROM dbo.Pedidos_Lineas;
  DELETE FROM dbo.Pedidos;
  DELETE FROM dbo.Tarifas_Precios;
  -- SolicitudesContacto depende de Clientes: se borra antes que Clientes.
  DELETE FROM dbo.SolicitudesContacto;
  DELETE FROM dbo.Clientes;
  -- Los maestros de SolicitudesContacto usan GUIDs fijos (no NEWID()), porque las
  -- propiedades IdTipo/IdEstado de COM_SolicitudContacto los llevan grabados como
  -- DefaultValue (el formulario de alta del cliente los rellena en oculto). Si se
  -- regeneraran con NEWID() en cada reset, esos defaults apuntarían a filas que ya
  -- no existen. Mismo motivo que el IdCliente fijo del cliente de demo, más abajo.
  DELETE FROM dbo.SolicitudesContacto_Tipos;
  DELETE FROM dbo.SolicitudesContacto_Estados;
  -- El estado 'Solicitada' de Devoluciones también usa un GUID fijo (VTA_Devolucion.IdEstado
  -- lo lleva grabado como DefaultValue oculto); los demás maestros de aquí abajo no tienen
  -- ningún default hardcodeado y pueden regenerarse con NEWID() sin problema.
  DELETE FROM dbo.Devoluciones_Estados;
  DELETE FROM dbo.Incidencias_Estados;
  DELETE FROM dbo.Incidencias_Tipos;
  DELETE FROM dbo.Productos_Variantes;
  DELETE FROM dbo.Productos;
  DELETE FROM dbo.Familias;
  DELETE FROM dbo.Marcas;
  DELETE FROM dbo.Tallas;
  DELETE FROM dbo.Colores;
  DELETE FROM dbo.Pedidos_Estados;
  DELETE FROM dbo.Tarifas;

  ---------------------------------------------------------------------------
  -- MAESTROS: cardinalidad real de negocio, no forzada a 100
  ---------------------------------------------------------------------------

  INSERT INTO dbo.Familias (IdFamilia, Nombre, Descripcion, IdFamiliaPadre, Orden, Visible, Destacada, Activo, OrdenJerarquico)
  VALUES
    (NEWID(), N'Ropa', N'Prendas de vestir', NULL, 1, 1, 1, 1, 100),
    (NEWID(), N'Calzado', N'Zapatillas, botas y sandalias', NULL, 2, 1, 1, 1, 200),
    (NEWID(), N'Accesorios', N'Complementos de moda', NULL, 3, 1, 0, 1, 300),
    (NEWID(), N'Ropa Interior', N'Ropa interior y calcetería', NULL, 4, 1, 0, 1, 400),
    (NEWID(), N'Deporte', N'Ropa y equipación deportiva', NULL, 5, 1, 1, 1, 500),
    (NEWID(), N'Moda Infantil', N'Ropa y calzado para niños', NULL, 6, 1, 0, 1, 600);

  INSERT INTO dbo.Familias (IdFamilia, Nombre, Descripcion, IdFamiliaPadre, Orden, Visible, Destacada, Activo, OrdenJerarquico)
  SELECT NEWID(), v.Nombre, v.Descripcion, p.IdFamilia, v.Orden, 1, v.Destacada, 1, v.OrdenJerarquico
  FROM (VALUES
    (N'Camisetas', NULL, N'Ropa', 1, 0, 101),
    (N'Sudaderas', NULL, N'Ropa', 2, 0, 102),
    (N'Pantalones', NULL, N'Ropa', 3, 0, 103),
    (N'Chaquetas', NULL, N'Ropa', 4, 0, 104),
    (N'Vestidos', NULL, N'Ropa', 5, 0, 105),
    (N'Faldas', NULL, N'Ropa', 6, 0, 106),
    (N'Camisas', NULL, N'Ropa', 7, 0, 107),
    (N'Deportivo', NULL, N'Calzado', 1, 1, 201),
    (N'Casual', NULL, N'Calzado', 2, 0, 202),
    (N'Botas', NULL, N'Calzado', 3, 0, 203),
    (N'Sandalias', NULL, N'Calzado', 4, 0, 204),
    (N'Mochilas', NULL, N'Accesorios', 1, 0, 301),
    (N'Gorras', NULL, N'Accesorios', 2, 0, 302),
    (N'Bolsos', NULL, N'Accesorios', 3, 0, 303),
    (N'Cinturones', NULL, N'Accesorios', 4, 0, 304),
    (N'Bufandas', NULL, N'Accesorios', 5, 0, 305),
    (N'Guantes', NULL, N'Accesorios', 6, 0, 306),
    (N'Calcetines', NULL, N'Ropa Interior', 1, 0, 401),
    (N'Ropa Interior Femenina', NULL, N'Ropa Interior', 2, 0, 402),
    (N'Ropa Interior Masculina', NULL, N'Ropa Interior', 3, 0, 403),
    (N'Camisetas Técnicas', NULL, N'Deporte', 1, 0, 501),
    (N'Mallas Deportivas', NULL, N'Deporte', 2, 0, 502),
    (N'Chalecos Deportivos', NULL, N'Deporte', 3, 0, 503),
    (N'Pantalones Deportivos', NULL, N'Deporte', 4, 0, 504),
    (N'Camisetas Niño', NULL, N'Moda Infantil', 1, 0, 601),
    (N'Pantalones Niño', NULL, N'Moda Infantil', 2, 0, 602),
    (N'Calzado Niño', NULL, N'Moda Infantil', 3, 0, 603),
    (N'Abrigos Niño', NULL, N'Moda Infantil', 4, 0, 604)
  ) AS v(Nombre, Descripcion, PadreNombre, Orden, Destacada, OrdenJerarquico)
  JOIN dbo.Familias p ON p.Nombre = v.PadreNombre;

  INSERT INTO dbo.Marcas (IdMarca, Nombre, Activo)
  SELECT NEWID(), v.Nombre, 1
  FROM (VALUES
    (N'Norden'), (N'Trailmark'), (N'Vestiga'), (N'Urbana Co.'), (N'Nortex'), (N'Solvane'),
    (N'Kalma'), (N'Bruma'), (N'Ferric'), (N'Alara'), (N'Montis'), (N'Duna Sport'),
    (N'Rivera'), (N'Talvera'), (N'Nómada'), (N'Cursa'), (N'Ébano'), (N'Lienzo')
  ) AS v(Nombre);

  INSERT INTO dbo.Tallas (IdTalla, Nombre, Orden)
  SELECT NEWID(), v.Nombre, v.Orden
  FROM (VALUES
    (N'XS',1),(N'S',2),(N'M',3),(N'L',4),(N'XL',5),(N'XXL',6),
    (N'38',7),(N'39',8),(N'40',9),(N'41',10),(N'42',11),(N'43',12),(N'44',13),(N'45',14)
  ) AS v(Nombre, Orden);

  INSERT INTO dbo.Colores (IdColor, Nombre, CodigoHex, Orden)
  SELECT NEWID(), v.Nombre, v.Hex, v.Orden
  FROM (VALUES
    (N'Negro',N'#000000',1),(N'Blanco',N'#FFFFFF',2),(N'Gris',N'#9CA3AF',3),(N'Azul Marino',N'#1E3A5F',4),
    (N'Azul Cielo',N'#87CEEB',5),(N'Rojo',N'#C0392B',6),(N'Verde Oliva',N'#708238',7),(N'Verde Botella',N'#123524',8),
    (N'Beige',N'#E8DCC8',9),(N'Camel',N'#C19A6B',10),(N'Rosa',N'#E8A0BF',11),(N'Burdeos',N'#7B2D3E',12),
    (N'Amarillo Mostaza',N'#D4AC0D',13),(N'Marrón',N'#6F4E37',14)
  ) AS v(Nombre, Hex, Orden);

  INSERT INTO dbo.Tarifas (IdTarifa, Nombre)
  SELECT NEWID(), v.Nombre
  FROM (VALUES (N'Público'), (N'Distribuidor'), (N'Profesional'), (N'Mayorista'), (N'VIP')) AS v(Nombre);

  INSERT INTO dbo.Pedidos_Estados (IdEstado, Nombre, Orden)
  SELECT NEWID(), v.Nombre, v.Orden
  FROM (VALUES
    (N'Borrador',1), (N'Confirmado',2), (N'En proceso',3),
    (N'Enviado',4), (N'Entregado',5), (N'Cancelado',6)
  ) AS v(Nombre, Orden);

  -- GUIDs fijos: ver el comentario junto al DELETE de estas dos tablas, más arriba.
  INSERT INTO dbo.SolicitudesContacto_Tipos (IdTipo, Nombre, Orden)
  VALUES
    (N'11111111-1111-1111-1111-111111111101', N'Contacto', 1),
    (N'11111111-1111-1111-1111-111111111102', N'Demostración', 2);

  INSERT INTO dbo.SolicitudesContacto_Estados (IdEstado, Nombre, Orden)
  VALUES
    (N'22222222-2222-2222-2222-222222222201', N'Nueva', 1),
    (N'22222222-2222-2222-2222-222222222202', N'En proceso', 2),
    (N'22222222-2222-2222-2222-222222222203', N'Resuelta', 3);

  INSERT INTO dbo.Devoluciones_Estados (IdEstado, Nombre, Orden)
  VALUES
    (N'CB6E0913-0A81-4C7B-BC78-925F53FCF836', N'Solicitada', 1),
    (CAST(NEWID() AS NVARCHAR(50)), N'En revisión', 2),
    (CAST(NEWID() AS NVARCHAR(50)), N'Aceptada', 3),
    (CAST(NEWID() AS NVARCHAR(50)), N'Rechazada', 4),
    (CAST(NEWID() AS NVARCHAR(50)), N'Abonada', 5);

  INSERT INTO dbo.Incidencias_Estados (IdEstado, Nombre, Orden)
  VALUES
    (CAST(NEWID() AS NVARCHAR(50)), N'Abierta', 1),
    (CAST(NEWID() AS NVARCHAR(50)), N'Cerrada', 2);

  INSERT INTO dbo.Incidencias_Tipos (IdTipo, Nombre, Orden)
  VALUES
    (CAST(NEWID() AS NVARCHAR(50)), N'Producto incorrecto', 1),
    (CAST(NEWID() AS NVARCHAR(50)), N'Producto defectuoso', 2),
    (CAST(NEWID() AS NVARCHAR(50)), N'Falta material', 3),
    (CAST(NEWID() AS NVARCHAR(50)), N'Problema de entrega', 4),
    (CAST(NEWID() AS NVARCHAR(50)), N'Facturación', 5),
    (CAST(NEWID() AS NVARCHAR(50)), N'Consulta general', 6);

  ---------------------------------------------------------------------------
  -- PRODUCTOS: generación por combinación de sustantivo x adjetivo (>=130)
  ---------------------------------------------------------------------------

  DECLARE @Adjetivos TABLE (Adjetivo NVARCHAR(30));
  INSERT INTO @Adjetivos VALUES
    (N'Urban'),(N'Classic'),(N'Basic'),(N'Sport'),(N'Premium'),(N'Elite'),(N'Trail'),(N'Casual'),
    (N'Comfort'),(N'Style'),(N'Active'),(N'Essential'),(N'Flex'),(N'Move'),(N'Line'),(N'Free'),
    (N'Wild'),(N'Pro'),(N'Light'),(N'Deluxe'),(N'Nova'),(N'Prime'),(N'Vintage'),(N'Ultra');

  DECLARE @Nouns TABLE (Id INT IDENTITY(1,1), Nombre NVARCHAR(60), FamiliaNombre NVARCHAR(150), TipoVariante NVARCHAR(10));
  INSERT INTO @Nouns (Nombre, FamiliaNombre, TipoVariante) VALUES
    (N'Camiseta', N'Camisetas', N'ROPA'),
    (N'Camiseta Manga Larga', N'Camisetas', N'ROPA'),
    (N'Sudadera', N'Sudaderas', N'ROPA'),
    (N'Sudadera con Capucha', N'Sudaderas', N'ROPA'),
    (N'Pantalón', N'Pantalones', N'ROPA'),
    (N'Pantalón Cargo', N'Pantalones', N'ROPA'),
    (N'Chaqueta', N'Chaquetas', N'ROPA'),
    (N'Chaqueta Cortavientos', N'Chaquetas', N'ROPA'),
    (N'Vestido', N'Vestidos', N'ROPA'),
    (N'Falda', N'Faldas', N'ROPA'),
    (N'Camisa', N'Camisas', N'ROPA'),
    (N'Zapatilla Running', N'Deportivo', N'CALZADO'),
    (N'Zapatilla Trail', N'Deportivo', N'CALZADO'),
    (N'Zapatilla Casual', N'Casual', N'CALZADO'),
    (N'Mocasín', N'Casual', N'CALZADO'),
    (N'Bota', N'Botas', N'CALZADO'),
    (N'Botín', N'Botas', N'CALZADO'),
    (N'Sandalia', N'Sandalias', N'CALZADO'),
    (N'Mochila', N'Mochilas', N'NINGUNA'),
    (N'Gorra', N'Gorras', N'NINGUNA'),
    (N'Bolso', N'Bolsos', N'NINGUNA'),
    (N'Cinturón', N'Cinturones', N'NINGUNA'),
    (N'Bufanda', N'Bufandas', N'NINGUNA'),
    (N'Guante', N'Guantes', N'NINGUNA'),
    (N'Pack de Calcetines', N'Calcetines', N'NINGUNA'),
    (N'Pack Ropa Interior', N'Ropa Interior Femenina', N'NINGUNA'),
    (N'Pack Ropa Interior', N'Ropa Interior Masculina', N'NINGUNA'),
    (N'Camiseta Técnica', N'Camisetas Técnicas', N'ROPA'),
    (N'Malla Deportiva', N'Mallas Deportivas', N'ROPA'),
    (N'Chaleco Deportivo', N'Chalecos Deportivos', N'ROPA'),
    (N'Pantalón Deportivo', N'Pantalones Deportivos', N'ROPA'),
    (N'Camiseta Niño', N'Camisetas Niño', N'ROPA'),
    (N'Pantalón Niño', N'Pantalones Niño', N'ROPA'),
    (N'Zapatilla Niño', N'Calzado Niño', N'CALZADO'),
    (N'Abrigo Niño', N'Abrigos Niño', N'ROPA');

  DECLARE @ProductosGenerados TABLE (
    IdProducto NVARCHAR(50), Referencia NVARCHAR(50), Nombre NVARCHAR(200), DescripcionCorta NVARCHAR(500),
    IdFamilia NVARCHAR(50), IdMarca NVARCHAR(50), PrecioBase DECIMAL(18,2), Stock INT,
    Destacado BIT, Novedad BIT, Oferta BIT, Activo BIT, TipoVariante NVARCHAR(10)
  );

  ;WITH CombosBase AS (
    SELECT n.Id, n.Nombre AS NounNombre, n.FamiliaNombre, n.TipoVariante, a.Adjetivo,
           ROW_NUMBER() OVER (PARTITION BY n.Id ORDER BY NEWID()) AS rn
    FROM @Nouns n CROSS JOIN @Adjetivos a
  ),
  Combos AS (
    SELECT NounNombre, FamiliaNombre, TipoVariante, Adjetivo,
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS seq
    FROM CombosBase WHERE rn <= 4
  )
  INSERT INTO @ProductosGenerados (IdProducto, Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca, PrecioBase, Stock, Destacado, Novedad, Oferta, Activo, TipoVariante)
  SELECT
    NEWID(),
    N'REF-' + CAST(2000 + c.seq AS NVARCHAR(10)),
    c.NounNombre + N' ' + c.Adjetivo,
    N'Diseño ' + c.Adjetivo + N', línea ' + f.Nombre + N'.',
    f.IdFamilia,
    m.IdMarca,
    CAST(
      (CASE c.TipoVariante WHEN N'CALZADO' THEN 40 WHEN N'ROPA' THEN 15 ELSE 8 END)
      + (ABS(CHECKSUM(NEWID())) % (CASE c.TipoVariante WHEN N'CALZADO' THEN 80 WHEN N'ROPA' THEN 75 ELSE 55 END))
      AS DECIMAL(18,2)
    ) + 0.90,
    ABS(CHECKSUM(NEWID())) % 200,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 9 = 0 THEN 1 ELSE 0 END,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 11 = 0 THEN 1 ELSE 0 END,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 13 = 0 THEN 1 ELSE 0 END,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 29 = 0 THEN 0 ELSE 1 END,
    c.TipoVariante
  FROM Combos c
  JOIN dbo.Familias f ON f.Nombre = c.FamiliaNombre
  CROSS APPLY (SELECT TOP 1 IdMarca FROM dbo.Marcas ORDER BY NEWID()) m;

  INSERT INTO dbo.Productos (IdProducto, Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca, PrecioBase, IVA, Stock, Destacado, Novedad, Oferta, Activo, CreatedBy, CreateDate, ModifiedBy, ModifiedDate, ImagenPrincipal)
  SELECT IdProducto, Referencia, Nombre, DescripcionCorta, IdFamilia, IdMarca, PrecioBase, 21, Stock, Destacado, Novedad, Oferta, Activo,
         N'admin', SYSDATETIME(), N'admin', SYSDATETIME(), NULL
  FROM @ProductosGenerados;

  ---------------------------------------------------------------------------
  -- FOTOS: una imagen de Pexels por producto, agrupadas por familia (hasta 6
  -- fotos distintas por familia, cicladas entre los productos de esa familia).
  ---------------------------------------------------------------------------

  DECLARE @FamiliaImagenes TABLE (FamiliaNombre NVARCHAR(150), Slug NVARCHAR(50), MaxImg INT);
  INSERT INTO @FamiliaImagenes (FamiliaNombre, Slug, MaxImg) VALUES
    (N'Abrigos Niño', N'abrigos-nino', 6),
    (N'Bolsos', N'bolsos', 6),
    (N'Botas', N'botas', 6),
    (N'Bufandas', N'bufandas', 6),
    (N'Calcetines', N'calcetines', 6),
    (N'Calzado Niño', N'calzado-nino', 6),
    (N'Camisas', N'camisas', 6),
    (N'Camisetas', N'camisetas', 6),
    (N'Camisetas Niño', N'camisetas-nino', 6),
    (N'Camisetas Técnicas', N'camisetas-tecnicas', 5),
    (N'Casual', N'casual', 6),
    (N'Chalecos Deportivos', N'chalecos-deportivos', 6),
    (N'Chaquetas', N'chaquetas', 6),
    (N'Cinturones', N'cinturones', 6),
    (N'Deportivo', N'deportivo', 6),
    (N'Faldas', N'faldas', 6),
    (N'Gorras', N'gorras', 6),
    (N'Guantes', N'guantes', 6),
    (N'Mallas Deportivas', N'mallas-deportivas', 5),
    (N'Mochilas', N'mochilas', 6),
    (N'Pantalones', N'pantalones', 6),
    (N'Pantalones Deportivos', N'pantalones-deportivos', 6),
    (N'Pantalones Niño', N'pantalones-nino', 6),
    (N'Ropa Interior Femenina', N'ropa-interior-femenina', 6),
    (N'Ropa Interior Masculina', N'ropa-interior-masculina', 6),
    (N'Sandalias', N'sandalias', 6),
    (N'Sudaderas', N'sudaderas', 6),
    (N'Vestidos', N'vestidos', 6);

  ;WITH Ranked AS (
    SELECT pg.IdProducto, fi.Slug, fi.MaxImg,
           ROW_NUMBER() OVER (PARTITION BY pg.IdFamilia ORDER BY pg.IdProducto) AS rn
    FROM @ProductosGenerados pg
    JOIN dbo.Familias f ON f.IdFamilia = pg.IdFamilia
    JOIN @FamiliaImagenes fi ON fi.FamiliaNombre = f.Nombre
  )
  UPDATE p
  SET p.ImagenPrincipal = N'/flxCatalog/images/productos/' + r.Slug + N'-' + CAST(((r.rn - 1) % r.MaxImg) + 1 AS NVARCHAR(2)) + N'.jpg'
  FROM dbo.Productos p
  JOIN Ranked r ON r.IdProducto = p.IdProducto;

  ---------------------------------------------------------------------------
  -- VARIANTES: solo familias de tipo ROPA o CALZADO (>=150)
  ---------------------------------------------------------------------------

  INSERT INTO dbo.Productos_Variantes (IdVariante, IdProducto, IdTalla, IdColor, Referencia, Stock)
  SELECT
    NEWID(), p.IdProducto, t.IdTalla, c.IdColor,
    p.Referencia + N'-' + tn.Nombre + N'-' + UPPER(LEFT(cn.Nombre, 3)),
    ABS(CHECKSUM(NEWID())) % 40
  FROM @ProductosGenerados p
  CROSS APPLY (
    SELECT TOP 3 IdTalla
    FROM dbo.Tallas
    WHERE (p.TipoVariante = N'ROPA' AND ISNUMERIC(Nombre) = 0)
       OR (p.TipoVariante = N'CALZADO' AND ISNUMERIC(Nombre) = 1)
    ORDER BY NEWID()
  ) t
  CROSS APPLY (SELECT TOP 2 IdColor FROM dbo.Colores ORDER BY NEWID()) c
  JOIN dbo.Tallas tn ON tn.IdTalla = t.IdTalla
  JOIN dbo.Colores cn ON cn.IdColor = c.IdColor
  WHERE p.TipoVariante IN (N'ROPA', N'CALZADO');

  ---------------------------------------------------------------------------
  -- TARIFAS_PRECIOS: Mayorista/Distribuidor/Profesional sobre TODOS los productos;
  -- Público y VIP se quedan sin fila (fallback a PrecioBase).
  ---------------------------------------------------------------------------

  DECLARE @TarifasDescuento TABLE (IdTarifa NVARCHAR(50), Factor DECIMAL(4,2));
  INSERT INTO @TarifasDescuento (IdTarifa, Factor)
  SELECT IdTarifa,
         CASE Nombre WHEN N'Mayorista' THEN 0.85 WHEN N'Distribuidor' THEN 0.90 WHEN N'Profesional' THEN 0.95 END
  FROM dbo.Tarifas
  WHERE Nombre IN (N'Mayorista', N'Distribuidor', N'Profesional');

  INSERT INTO dbo.Tarifas_Precios (IdPrecio, IdTarifa, IdProducto, Precio)
  SELECT NEWID(), td.IdTarifa, p.IdProducto, CAST(ROUND(p.PrecioBase * td.Factor, 2) AS DECIMAL(18,2))
  FROM dbo.Productos p
  CROSS JOIN @TarifasDescuento td;

  ---------------------------------------------------------------------------
  -- CLIENTES: empresas + particulares (>=100), repartidos entre las 5 tarifas
  ---------------------------------------------------------------------------

  DECLARE @PalabrasEmpresa TABLE (Palabra NVARCHAR(50));
  INSERT INTO @PalabrasEmpresa VALUES
    (N'Ibérica'),(N'Atlántica'),(N'Mediterránea'),(N'Central'),(N'Norte'),(N'Sur'),
    (N'Levante'),(N'Cantábrica'),(N'Peninsular'),(N'Global'),(N'Nacional'),(N'Hispana'),
    (N'Meridional'),(N'Litoral'),(N'Urbana');

  DECLARE @SectorEmpresa TABLE (Sector NVARCHAR(50));
  INSERT INTO @SectorEmpresa VALUES
    (N'Distribución'),(N'Moda'),(N'Textil'),(N'Comercial'),(N'Retail'),
    (N'Confección'),(N'Importación'),(N'Boutique'),(N'Almacenes'),(N'Comercio');

  DECLARE @Sufijos TABLE (Sufijo NVARCHAR(10));
  INSERT INTO @Sufijos VALUES (N'S.L.'), (N'S.A.'), (N'S.L.U.');

  DECLARE @Nombres TABLE (Nombre NVARCHAR(50));
  INSERT INTO @Nombres VALUES
    (N'Ana'),(N'María'),(N'Carmen'),(N'Laura'),(N'Elena'),(N'Sara'),(N'Lucía'),(N'Marta'),
    (N'Cristina'),(N'Isabel'),(N'Antonio'),(N'José'),(N'Manuel'),(N'Francisco'),(N'Javier'),
    (N'Carlos'),(N'Miguel'),(N'Pedro'),(N'Alejandro'),(N'David');

  DECLARE @Apellidos TABLE (Apellido NVARCHAR(50));
  INSERT INTO @Apellidos VALUES
    (N'García'),(N'Martínez'),(N'López'),(N'Sánchez'),(N'Pérez'),(N'González'),(N'Rodríguez'),
    (N'Fernández'),(N'Ruiz'),(N'Díaz'),(N'Moreno'),(N'Muñoz'),(N'Álvarez'),(N'Romero'),
    (N'Alonso'),(N'Gutiérrez'),(N'Navarro'),(N'Torres'),(N'Domínguez'),(N'Vázquez');

  DECLARE @Ciudades TABLE (Ciudad NVARCHAR(50));
  INSERT INTO @Ciudades VALUES
    (N'Madrid'),(N'Barcelona'),(N'Valencia'),(N'Sevilla'),(N'Zaragoza'),(N'Málaga'),
    (N'Bilbao'),(N'Alicante'),(N'Córdoba'),(N'Valladolid'),(N'Vigo'),(N'Gijón'),
    (N'Granada'),(N'Murcia'),(N'Palma'),(N'Las Palmas'),(N'San Sebastián'),(N'Santander'),
    (N'Pamplona'),(N'Toledo');

  DECLARE @Calles TABLE (Calle NVARCHAR(80));
  INSERT INTO @Calles VALUES
    (N'Calle Mayor'),(N'Avenida de la Constitución'),(N'Calle Gran Vía'),(N'Paseo de la Castellana'),
    (N'Calle Alcalá'),(N'Avenida Diagonal'),(N'Calle Sierpes'),(N'Calle Preciados'),
    (N'Avenida de América'),(N'Calle Serrano'),(N'Paseo del Prado'),(N'Calle Colón'),
    (N'Avenida del Puerto'),(N'Calle San Fernando'),(N'Ronda de Toledo');

  DECLARE @Comerciales TABLE (Nombre NVARCHAR(80));
  INSERT INTO @Comerciales VALUES
    (N'Ana Martín'),(N'Pedro Ruiz'),(N'Laura Gómez'),(N'Carlos Sánchez'),(N'Elena Torres'),(N'Javier López');

  DECLARE @Dominios TABLE (Dominio NVARCHAR(50));
  INSERT INTO @Dominios VALUES (N'gmail.com'),(N'hotmail.com'),(N'outlook.es'),(N'yahoo.es');

  DECLARE @TarifasNum TABLE (IdTarifa NVARCHAR(50), rn INT);
  INSERT INTO @TarifasNum (IdTarifa, rn)
  SELECT IdTarifa, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM dbo.Tarifas;

  DECLARE @ClientesGenerados TABLE (
    IdCliente NVARCHAR(50), CodigoCliente NVARCHAR(20), RazonSocial NVARCHAR(200), NombreComercial NVARCHAR(200),
    CifNif NVARCHAR(20), DireccionFiscal NVARCHAR(300), Email NVARCHAR(200), Telefono NVARCHAR(30),
    IdTarifa NVARCHAR(50), Comercial NVARCHAR(150), Activo BIT
  );

  -- Empresas (~75)
  ;WITH EmpresasBase AS (
    SELECT TOP (75) pe.Palabra, se.Sector, su.Sufijo
    FROM @PalabrasEmpresa pe CROSS JOIN @SectorEmpresa se CROSS JOIN @Sufijos su
    ORDER BY NEWID()
  ),
  Empresas AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS seq FROM EmpresasBase
  )
  INSERT INTO @ClientesGenerados (IdCliente, CodigoCliente, RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono, IdTarifa, Comercial, Activo)
  SELECT
    NEWID(),
    N'CLI-' + RIGHT(N'0000' + CAST(2000 + e.seq AS NVARCHAR(10)), 4),
    e.Palabra + N' ' + e.Sector + N' ' + e.Sufijo,
    e.Palabra + N' ' + e.Sector,
    N'B' + RIGHT(N'00000000' + CAST(10000000 + e.seq AS NVARCHAR(10)), 8),
    ca.Calle + N' ' + CAST((ABS(CHECKSUM(NEWID())) % 150) + 1 AS NVARCHAR(10)) + N', ' +
      RIGHT(N'00000' + CAST((ABS(CHECKSUM(NEWID())) % 50000) + 1000 AS NVARCHAR(10)), 5) + N' ' + ci.Ciudad + N', España',
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(e.Palabra), N'á',N'a'),N'é',N'e'),N'í',N'i'),N'ó',N'o'),N'ú',N'u'),N'ñ',N'n')
      + N'@' +
      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(e.Sector), N'á',N'a'),N'é',N'e'),N'í',N'i'),N'ó',N'o'),N'ú',N'u'),N'ñ',N'n')
      + N'.es',
    N'9' + RIGHT(N'00000000' + CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS NVARCHAR(10)), 8),
    tn.IdTarifa,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 9 = 0 THEN NULL ELSE co.Nombre END,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 23 = 0 THEN 0 ELSE 1 END
  FROM Empresas e
  CROSS APPLY (SELECT TOP 1 Ciudad FROM @Ciudades ORDER BY NEWID()) ci
  CROSS APPLY (SELECT TOP 1 Calle FROM @Calles ORDER BY NEWID()) ca
  CROSS APPLY (SELECT TOP 1 Nombre FROM @Comerciales ORDER BY NEWID()) co
  JOIN @TarifasNum tn ON tn.rn = ((e.seq - 1) % 5) + 1;

  -- Particulares (~35)
  ;WITH PersonasBase AS (
    SELECT TOP (35) n.Nombre, a.Apellido AS Apellido1
    FROM @Nombres n CROSS JOIN @Apellidos a
    ORDER BY NEWID()
  ),
  Personas AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS seq FROM PersonasBase
  )
  INSERT INTO @ClientesGenerados (IdCliente, CodigoCliente, RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono, IdTarifa, Comercial, Activo)
  SELECT
    -- El cliente #1 conserva siempre el mismo IdCliente: es el que enlaza el login de
    -- demo 'cliente' (AspNetUsers.Reference), y un reset que le diera un GUID nuevo cada
    -- vez rompería ese enlace (ya pasó una vez: FK_Favoritos_Cliente contra un IdCliente
    -- que el reset anterior había borrado).
    CASE WHEN p.seq = 1 THEN N'E391566D-5E36-4C0E-A74D-CF48EDB2C09F' ELSE CAST(NEWID() AS NVARCHAR(50)) END,
    N'CLI-' + RIGHT(N'0000' + CAST(2100 + p.seq AS NVARCHAR(10)), 4),
    p.Nombre + N' ' + p.Apellido1 + N' ' + ap2.Apellido,
    NULL,
    RIGHT(N'00000000' + CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS NVARCHAR(10)), 8) + N'Z',
    ca.Calle + N' ' + CAST((ABS(CHECKSUM(NEWID())) % 150) + 1 AS NVARCHAR(10)) + N', ' +
      RIGHT(N'00000' + CAST((ABS(CHECKSUM(NEWID())) % 50000) + 1000 AS NVARCHAR(10)), 5) + N' ' + ci.Ciudad + N', España',
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(p.Nombre), N'á',N'a'),N'é',N'e'),N'í',N'i'),N'ó',N'o'),N'ú',N'u'),N'ñ',N'n')
      + N'.' +
      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(p.Apellido1), N'á',N'a'),N'é',N'e'),N'í',N'i'),N'ó',N'o'),N'ú',N'u'),N'ñ',N'n')
      + N'@' + dom.Dominio,
    (CASE WHEN p.seq % 2 = 0 THEN N'6' ELSE N'7' END) + RIGHT(N'00000000' + CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS NVARCHAR(10)), 8),
    tn.IdTarifa,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 9 = 0 THEN NULL ELSE co.Nombre END,
    CASE WHEN ABS(CHECKSUM(NEWID())) % 23 = 0 THEN 0 ELSE 1 END
  FROM Personas p
  CROSS APPLY (SELECT TOP 1 Apellido FROM @Apellidos ORDER BY NEWID()) ap2
  CROSS APPLY (SELECT TOP 1 Ciudad FROM @Ciudades ORDER BY NEWID()) ci
  CROSS APPLY (SELECT TOP 1 Calle FROM @Calles ORDER BY NEWID()) ca
  CROSS APPLY (SELECT TOP 1 Nombre FROM @Comerciales ORDER BY NEWID()) co
  CROSS APPLY (SELECT TOP 1 Dominio FROM @Dominios ORDER BY NEWID()) dom
  JOIN @TarifasNum tn ON tn.rn = ((p.seq - 1) % 5) + 1;

  INSERT INTO dbo.Clientes (IdCliente, CodigoCliente, RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono, IdTarifa, Comercial, Activo, CreatedBy, CreateDate, ModifiedBy, ModifiedDate)
  SELECT IdCliente, CodigoCliente, RazonSocial, NombreComercial, CifNif, DireccionFiscal, Email, Telefono, IdTarifa, Comercial, Activo,
         N'admin', SYSDATETIME(), N'admin', SYSDATETIME()
  FROM @ClientesGenerados;

  ---------------------------------------------------------------------------
  -- PEDIDOS: todo cliente con al menos 1 pedido (>=120 en total)
  ---------------------------------------------------------------------------

  DECLARE @PedidoSeed TABLE (IdCliente NVARCHAR(50), DireccionFiscal NVARCHAR(300));

  INSERT INTO @PedidoSeed (IdCliente, DireccionFiscal)
  SELECT IdCliente, DireccionFiscal FROM dbo.Clientes;

  INSERT INTO @PedidoSeed (IdCliente, DireccionFiscal)
  SELECT TOP (25) IdCliente, DireccionFiscal FROM dbo.Clientes ORDER BY NEWID();

  INSERT INTO @PedidoSeed (IdCliente, DireccionFiscal)
  SELECT TOP (10) IdCliente, DireccionFiscal FROM dbo.Clientes ORDER BY NEWID();

  DECLARE @FormasPago TABLE (Forma NVARCHAR(50));
  INSERT INTO @FormasPago VALUES (N'Transferencia'), (N'Tarjeta'), (N'Contrareembolso'), (N'Domiciliación bancaria');

  DECLARE @EstadosNum TABLE (IdEstado NVARCHAR(50), Nombre NVARCHAR(50), rn INT);
  INSERT INTO @EstadosNum (IdEstado, Nombre, rn)
  SELECT IdEstado, Nombre, ROW_NUMBER() OVER (ORDER BY Orden) FROM dbo.Pedidos_Estados;

  DECLARE @PedidosGenerados TABLE (IdPedido NVARCHAR(50), Numero NVARCHAR(20), IdCliente NVARCHAR(50), IdEstado NVARCHAR(50), Fecha DATETIME2, DireccionEntrega NVARCHAR(300), FormaPago NVARCHAR(100));

  ;WITH Seed AS (
    SELECT IdCliente, DireccionFiscal, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS seq FROM @PedidoSeed
  )
  INSERT INTO @PedidosGenerados (IdPedido, Numero, IdCliente, IdEstado, Fecha, DireccionEntrega, FormaPago)
  SELECT
    NEWID(),
    N'PED-' + CAST(1000 + s.seq AS NVARCHAR(10)),
    s.IdCliente,
    est.IdEstado,
    DATEADD(DAY, -1 * (ABS(CHECKSUM(NEWID())) % 120), SYSDATETIME()),
    s.DireccionFiscal,
    CASE WHEN est.Nombre = N'Borrador' THEN NULL ELSE fp.Forma END
  FROM Seed s
  CROSS APPLY (SELECT TOP 1 Forma FROM @FormasPago ORDER BY NEWID()) fp
  JOIN @EstadosNum est ON est.rn =
    CASE (s.seq % 10)
      WHEN 0 THEN 2 WHEN 1 THEN 2
      WHEN 2 THEN 3 WHEN 3 THEN 3
      WHEN 4 THEN 4 WHEN 5 THEN 4
      WHEN 6 THEN 5 WHEN 7 THEN 5
      WHEN 8 THEN 6
      ELSE 1
    END;

  INSERT INTO dbo.Pedidos (IdPedido, Numero, IdCliente, IdEstado, Fecha, DireccionEntrega, FormaPago, Total)
  SELECT IdPedido, Numero, IdCliente, IdEstado, Fecha, DireccionEntrega, FormaPago, 0
  FROM @PedidosGenerados;

  ---------------------------------------------------------------------------
  -- PEDIDOS_LINEAS: 3 a 6 líneas por pedido (>=300 en total, con margen),
  -- precio tomado de la tarifa del cliente cuando existe, si no PrecioBase.
  ---------------------------------------------------------------------------

  DECLARE @LineasSeed TABLE (IdPedido NVARCHAR(50), IdCliente NVARCHAR(50), LineNum INT);

  ;WITH PedidoConNumLineas AS (
    SELECT IdPedido, IdCliente, 3 + ABS(CHECKSUM(NEWID())) % 4 AS NumLineas -- 3..6
    FROM @PedidosGenerados
  ),
  Tally AS (
    SELECT n FROM (VALUES (1),(2),(3),(4),(5),(6)) AS v(n)
  )
  INSERT INTO @LineasSeed (IdPedido, IdCliente, LineNum)
  SELECT p.IdPedido, p.IdCliente, t.n
  FROM PedidoConNumLineas p JOIN Tally t ON t.n <= p.NumLineas;

  INSERT INTO dbo.Pedidos_Lineas (IdLinea, IdPedido, IdProducto, IdVariante, Cantidad, Precio, Subtotal)
  SELECT
    NEWID(),
    ls.IdPedido,
    prod.IdProducto,
    var.IdVariante,
    cant.Cantidad,
    ISNULL(tp.Precio, prod.PrecioBase),
    cant.Cantidad * ISNULL(tp.Precio, prod.PrecioBase)
  FROM @LineasSeed ls
  CROSS APPLY (SELECT TOP 1 IdProducto, PrecioBase FROM dbo.Productos WHERE Activo = 1 ORDER BY NEWID()) prod
  CROSS APPLY (SELECT 1 + ABS(CHECKSUM(NEWID())) % 10 AS Cantidad) cant
  OUTER APPLY (SELECT TOP 1 IdVariante FROM dbo.Productos_Variantes WHERE IdProducto = prod.IdProducto ORDER BY NEWID()) var
  LEFT JOIN dbo.Clientes cli ON cli.IdCliente = ls.IdCliente
  LEFT JOIN dbo.Tarifas_Precios tp ON tp.IdProducto = prod.IdProducto AND tp.IdTarifa = cli.IdTarifa;

  UPDATE p SET p.Total = t.Base
  FROM dbo.Pedidos p
  INNER JOIN (
    SELECT IdPedido, SUM(Subtotal) AS Base FROM dbo.Pedidos_Lineas GROUP BY IdPedido
  ) t ON t.IdPedido = p.IdPedido;

  ---------------------------------------------------------------------------
  -- DEVOLUCIONES: sobre líneas de pedido reales, motivo y estado variados.
  ---------------------------------------------------------------------------

  DECLARE @Motivos TABLE (Motivo NVARCHAR(200), seq INT IDENTITY(1,1));
  INSERT INTO @Motivos (Motivo) VALUES
    (N'Talla incorrecta'), (N'Color distinto al pedido'), (N'Llegó dañado'),
    (N'Producto defectuoso'), (N'No corresponde con la descripción'),
    (N'Talla incorrecta, necesito una talla más grande');

  DECLARE @DevEstados TABLE (Nombre NVARCHAR(50), IdEstado NVARCHAR(50), seq INT IDENTITY(1,1));
  INSERT INTO @DevEstados (Nombre, IdEstado)
  SELECT Nombre, IdEstado FROM dbo.Devoluciones_Estados ORDER BY Orden;

  ;WITH LineasNum AS (
    SELECT IdLinea, IdPedido, Cantidad,
           ROW_NUMBER() OVER (ORDER BY CHECKSUM(NEWID(), IdLinea)) AS rn
    FROM dbo.Pedidos_Lineas
  )
  INSERT INTO dbo.Devoluciones (IdDevolucion, IdPedido, IdLinea, Cantidad, Motivo, Comentario, IdEstado, FechaSolicitud, Activo)
  SELECT
    NEWID(),
    l.IdPedido,
    l.IdLinea,
    1 + ABS(CHECKSUM(NEWID(), l.IdLinea)) % l.Cantidad,
    m.Motivo,
    NULL,
    -- distribución realista: Solicitada/En revisión más frecuentes que Rechazada/Abonada
    de.IdEstado,
    DATEADD(DAY, -(ABS(CHECKSUM(NEWID(), l.IdLinea, N'fecha')) % 60), SYSDATETIME()),
    1
  FROM LineasNum l
  JOIN @Motivos m ON m.seq = ((l.rn - 1) % (SELECT COUNT(*) FROM @Motivos)) + 1
  JOIN @DevEstados de ON de.seq = (CASE (l.rn - 1) % 8
      WHEN 0 THEN 1 WHEN 1 THEN 1 WHEN 2 THEN 1  -- Solicitada
      WHEN 3 THEN 2 WHEN 4 THEN 2 WHEN 5 THEN 2  -- En revisión
      WHEN 6 THEN 3                              -- Aceptada
      ELSE 5                                     -- Abonada
    END)
  WHERE l.rn <= 13;

  ---------------------------------------------------------------------------
  -- INCIDENCIAS: sobre pedidos reales, tipo/estado/descripción variados.
  ---------------------------------------------------------------------------

  DECLARE @Descripciones TABLE (Descripcion NVARCHAR(500), seq INT IDENTITY(1,1));
  INSERT INTO @Descripciones (Descripcion) VALUES
    (N'Consulta general sobre el estado del pedido.'),
    (N'Falta uno de los artículos del pedido en el envío recibido.'),
    (N'Retraso en la entrega respecto a la fecha estimada.'),
    (N'El cliente reporta un desperfecto en el artículo recibido.'),
    (N'El paquete llegó con la caja abierta y falta uno de los artículos.'),
    (N'El cliente solicita revisión de la factura emitida.');

  DECLARE @IncTipos TABLE (IdTipo NVARCHAR(50), seq INT IDENTITY(1,1));
  INSERT INTO @IncTipos (IdTipo) SELECT IdTipo FROM dbo.Incidencias_Tipos ORDER BY Orden;

  DECLARE @IncEstados TABLE (Nombre NVARCHAR(50), IdEstado NVARCHAR(50), seq INT IDENTITY(1,1));
  INSERT INTO @IncEstados (Nombre, IdEstado)
  SELECT Nombre, IdEstado FROM dbo.Incidencias_Estados ORDER BY Orden;

  ;WITH PedidosNum AS (
    SELECT IdPedido,
           ROW_NUMBER() OVER (ORDER BY CHECKSUM(NEWID(), IdPedido)) AS rn
    FROM dbo.Pedidos
  )
  INSERT INTO dbo.Incidencias (IdIncidencia, IdPedido, IdTipo, IdEstado, Descripcion, FechaAlta, Activo)
  SELECT
    NEWID(),
    p.IdPedido,
    it.IdTipo,
    -- ~60% Abierta, ~40% Cerrada
    ie.IdEstado,
    d.Descripcion,
    DATEADD(DAY, -(ABS(CHECKSUM(NEWID(), p.IdPedido, N'fecha')) % 60), SYSDATETIME()),
    1
  FROM PedidosNum p
  JOIN @Descripciones d ON d.seq = ((p.rn - 1) % (SELECT COUNT(*) FROM @Descripciones)) + 1
  JOIN @IncTipos it ON it.seq = ((p.rn - 1) % (SELECT COUNT(*) FROM @IncTipos)) + 1
  JOIN @IncEstados ie ON ie.seq = (CASE (p.rn - 1) % 5 WHEN 0 THEN 1 WHEN 1 THEN 1 WHEN 2 THEN 1 ELSE 2 END)
  WHERE p.rn <= 12;

  ---------------------------------------------------------------------------
  -- FAVORITOS: unos pocos productos marcados como favoritos por clientes reales.
  ---------------------------------------------------------------------------

  ;WITH ClientesNum AS (
    SELECT IdCliente, ROW_NUMBER() OVER (ORDER BY CHECKSUM(NEWID(), IdCliente)) AS rn
    FROM dbo.Clientes
  ),
  ProductosNum AS (
    SELECT IdProducto, ROW_NUMBER() OVER (ORDER BY CHECKSUM(NEWID(), IdProducto)) AS rn
    FROM dbo.Productos WHERE Activo = 1
  )
  INSERT INTO dbo.Favoritos (IdFavorito, IdCliente, IdProducto, FechaAlta)
  SELECT NEWID(), c.IdCliente, p.IdProducto,
         DATEADD(DAY, -(ABS(CHECKSUM(NEWID(), c.IdCliente, N'fecha')) % 90), SYSDATETIME())
  FROM ClientesNum c
  JOIN ProductosNum p ON p.rn = ((c.rn - 1) % 20) + 1
  WHERE c.rn <= 15;

  -- Comentarios: sin seed de datos (se crean a mano desde la aplicación).

  SELECT N'Datos de demostración regenerados correctamente.' AS SuccessMessage, 1 AS Refresh;

  RETURN 1;
END
GO
