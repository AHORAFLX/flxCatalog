CREATE TABLE [dbo].[Favoritos](
	[IdFavorito] [nvarchar](50) NOT NULL CONSTRAINT [DF_Favoritos_IdFavorito] DEFAULT (newid()),
	[IdCliente] [nvarchar](50) NOT NULL,
	[IdProducto] [nvarchar](50) NOT NULL,
	[FechaAlta] [datetime2](7) NOT NULL CONSTRAINT [DF_Favoritos_FechaAlta] DEFAULT (getdate()),
 CONSTRAINT [PK_Favoritos] PRIMARY KEY CLUSTERED 
(
	[IdFavorito] ASC
),
 CONSTRAINT [UQ_Favoritos_Cliente_Producto] UNIQUE NONCLUSTERED 
(
	[IdCliente] ASC,
	[IdProducto] ASC
)
,
 CONSTRAINT [FK_Favoritos_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente]),
 CONSTRAINT [FK_Favoritos_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
)
GO
