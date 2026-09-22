CREATE TABLE [dbo].[Incidencias](
	[IdIncidencia] [nvarchar](50) NOT NULL CONSTRAINT [DF_Incidencias_IdIncidencia] DEFAULT (newid()),
	[IdPedido] [nvarchar](50) NOT NULL,
	[IdTipo] [nvarchar](50) NOT NULL,
	[IdEstado] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[FechaAlta] [datetime2](7) NOT NULL,
	[Activo] [bit] NOT NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[UltimoEstadoNotificado] [nvarchar](50) NULL,
	[UltimoEstadoEmailEnviado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Incidencias] PRIMARY KEY CLUSTERED 
(
	[IdIncidencia] ASC
)
,
 CONSTRAINT [FK_Incidencias_Estados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Incidencias_Estados] ([IdEstado]),
 CONSTRAINT [FK_Incidencias_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido]),
 CONSTRAINT [FK_Incidencias_Tipos] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Incidencias_Tipos] ([IdTipo])
)
GO
