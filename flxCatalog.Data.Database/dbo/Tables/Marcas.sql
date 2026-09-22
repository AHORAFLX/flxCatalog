CREATE TABLE [dbo].[Marcas](
	[IdMarca] [nvarchar](50) NOT NULL CONSTRAINT [DF_Marcas_IdMarca] DEFAULT (newid()),
	[Nombre] [nvarchar](150) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)
)
GO
