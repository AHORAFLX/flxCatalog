CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [uniqueidentifier] NOT NULL,
	[Numero] [nvarchar](20) NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[IdEstado] [uniqueidentifier] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[DireccionEntrega] [nvarchar](300) NULL,
	[FormaPago] [nvarchar](100) NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)
,
 CONSTRAINT [FK_Pedidos_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente]),
 CONSTRAINT [FK_Pedidos_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Pedidos_Estados] ([IdEstado])
)
GO
