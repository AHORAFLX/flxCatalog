CREATE TABLE [dbo].[SolicitudesContacto_Estados](
	[IdEstado] [nvarchar](50) NOT NULL CONSTRAINT [DF_SolicitudesContacto_Estados_IdEstado] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_SolicitudesContacto_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)
)
GO
