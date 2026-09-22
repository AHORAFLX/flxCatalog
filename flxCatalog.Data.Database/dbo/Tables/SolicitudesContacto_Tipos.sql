CREATE TABLE [dbo].[SolicitudesContacto_Tipos](
	[IdTipo] [nvarchar](50) NOT NULL CONSTRAINT [DF_SolicitudesContacto_Tipos_IdTipo] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_SolicitudesContacto_Tipos] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)
)
GO
