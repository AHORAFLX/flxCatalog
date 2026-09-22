CREATE TABLE [dbo].[Incidencias_Tipos](
	[IdTipo] [nvarchar](50) NOT NULL CONSTRAINT [DF_Incidencias_Tipos_IdTipo] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Incidencias_Tipos] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)
)
GO
