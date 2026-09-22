CREATE TABLE [dbo].[Incidencias_Estados](
	[IdEstado] [nvarchar](50) NOT NULL CONSTRAINT [DF_Incidencias_Estados_IdEstado] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Incidencias_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)
)
GO
