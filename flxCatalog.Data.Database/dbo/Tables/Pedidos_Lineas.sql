CREATE TABLE [dbo].[Pedidos_Lineas](
	[IdLinea] [uniqueidentifier] NOT NULL,
	[IdPedido] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[IdVariante] [uniqueidentifier] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pedidos_Lineas] PRIMARY KEY CLUSTERED 
(
	[IdLinea] ASC
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
