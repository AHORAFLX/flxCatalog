CREATE TABLE [dbo].[SolicitudesContacto](
	[IdSolicitud] [nvarchar](50) NOT NULL CONSTRAINT [DF_SolicitudesContacto_IdSolicitud] DEFAULT (newid()),
	[IdCliente] [nvarchar](50) NOT NULL,
	[IdTipo] [nvarchar](50) NOT NULL,
	[IdEstado] [nvarchar](50) NOT NULL,
	[Motivo] [nvarchar](200) NOT NULL,
	[Mensaje] [nvarchar](max) NOT NULL,
	[FechaAlta] [datetime2](7) NOT NULL CONSTRAINT [DF_SolicitudesContacto_FechaAlta] DEFAULT (sysdatetime()),
	[Activo] [bit] NOT NULL CONSTRAINT [DF_SolicitudesContacto_Activo] DEFAULT ((1)),
	[CreatedBy] [nvarchar](200) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_SolicitudesContacto] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)
,
 CONSTRAINT [FK_SolicitudesContacto_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente]),
 CONSTRAINT [FK_SolicitudesContacto_Estados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[SolicitudesContacto_Estados] ([IdEstado]),
 CONSTRAINT [FK_SolicitudesContacto_Tipos] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[SolicitudesContacto_Tipos] ([IdTipo])
)
GO
