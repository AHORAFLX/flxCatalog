CREATE TABLE [dbo].[Marcas](
	[IdMarca] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)
)
GO
