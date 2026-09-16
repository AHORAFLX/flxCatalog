CREATE TABLE [dbo].[Productos_Variantes](
	[IdVariante] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[IdTalla] [uniqueidentifier] NOT NULL,
	[IdColor] [uniqueidentifier] NOT NULL,
	[Referencia] [nvarchar](50) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Productos_Variantes] PRIMARY KEY CLUSTERED 
(
	[IdVariante] ASC
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
