CREATE TABLE [dbo].[Tarifas_Precios](
	[IdPrecio] [nvarchar](50) NOT NULL CONSTRAINT [DF_Tarifas_Precios_IdPrecio] DEFAULT (newid()),
	[IdTarifa] [nvarchar](50) NOT NULL,
	[IdProducto] [nvarchar](50) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tarifas_Precios] PRIMARY KEY CLUSTERED 
(
	[IdPrecio] ASC
),
 CONSTRAINT [UQ_Tarifas_Precios_Tarifa_Producto] UNIQUE NONCLUSTERED 
(
	[IdTarifa] ASC,
	[IdProducto] ASC
)
,
 CONSTRAINT [FK_Precios_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto]),
 CONSTRAINT [FK_Precios_Tarifa] FOREIGN KEY([IdTarifa])
REFERENCES [dbo].[Tarifas] ([IdTarifa])
)
GO
