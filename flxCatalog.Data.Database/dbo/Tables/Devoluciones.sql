CREATE TABLE [dbo].[Devoluciones](
	[IdDevolucion] [nvarchar](50) NOT NULL CONSTRAINT [DF_Devoluciones_IdDevolucion] DEFAULT (newid()),
	[IdPedido] [nvarchar](50) NOT NULL,
	[IdLinea] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL CONSTRAINT [DF_Devoluciones_Cantidad] DEFAULT ((1)),
	[Motivo] [nvarchar](200) NOT NULL,
	[Comentario] [nvarchar](500) NULL,
	[IdEstado] [nvarchar](50) NOT NULL,
	[FechaSolicitud] [datetime2](7) NOT NULL CONSTRAINT [DF_Devoluciones_FechaSolicitud] DEFAULT (sysdatetime()),
	[Activo] [bit] NOT NULL CONSTRAINT [DF_Devoluciones_Activo] DEFAULT ((1)),
	[CreatedBy] [nvarchar](200) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[UltimoEstadoNotificado] [nvarchar](50) NULL,
	[UltimoEstadoEmailEnviado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Devoluciones] PRIMARY KEY CLUSTERED 
(
	[IdDevolucion] ASC
)
,
 CONSTRAINT [FK_Devoluciones_Devoluciones_Estados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Devoluciones_Estados] ([IdEstado]),
 CONSTRAINT [FK_Devoluciones_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido]),
 CONSTRAINT [FK_Devoluciones_Pedidos_Lineas] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Pedidos_Lineas] ([IdLinea])
)
GO
