CREATE TABLE [dbo].[Productos_Variantes](
	[IdVariante] [nvarchar](50) NOT NULL CONSTRAINT [DF_Productos_Variantes_IdVariante] DEFAULT (newid()),
	[IdProducto] [nvarchar](50) NOT NULL,
	[IdTalla] [nvarchar](50) NOT NULL,
	[IdColor] [nvarchar](50) NOT NULL,
	[Referencia] [nvarchar](50) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Productos_Variantes] PRIMARY KEY CLUSTERED 
(
	[IdVariante] ASC CONSTRAINT [DF_Productos_Variantes_IdVariante] DEFAULT (newid())
)
,
 CONSTRAINT [FK_Variantes_Color] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Colores] ([IdColor]),
 CONSTRAINT [FK_Variantes_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto]),
 CONSTRAINT [FK_Variantes_Talla] FOREIGN KEY([IdTalla])
REFERENCES [dbo].[Tallas] ([IdTalla])
)
GO
