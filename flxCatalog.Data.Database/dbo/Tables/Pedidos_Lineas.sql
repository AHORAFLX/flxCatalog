CREATE TABLE [dbo].[Pedidos_Lineas](
	[IdLinea] [nvarchar](50) NOT NULL CONSTRAINT [DF_Pedidos_Lineas_IdLinea] DEFAULT (newid()),
	[IdPedido] [nvarchar](50) NOT NULL,
	[IdProducto] [nvarchar](50) NOT NULL,
	[IdVariante] [nvarchar](50) NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pedidos_Lineas] PRIMARY KEY CLUSTERED 
(
	[IdLinea] ASC CONSTRAINT [DF_Pedidos_Lineas_IdLinea] DEFAULT (newid())
)
,
 CONSTRAINT [FK_Lineas_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido]),
 CONSTRAINT [FK_Lineas_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto]),
 CONSTRAINT [FK_Lineas_Variante] FOREIGN KEY([IdVariante])
REFERENCES [dbo].[Productos_Variantes] ([IdVariante])
)
GO
