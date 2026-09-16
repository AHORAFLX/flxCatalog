CREATE TABLE [dbo].[Familias](
	[IdFamilia] [nvarchar](50) NOT NULL CONSTRAINT [DF_Familias_IdFamilia] DEFAULT (NEWID()),
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Imagen] [nvarchar](max) NULL,
	[Icono] [nvarchar](100) NULL,
	[IdFamiliaPadre] [nvarchar](50) NULL,
	[Orden] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Destacada] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Familias] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)
,
 CONSTRAINT [FK_Familias_FamiliaPadre] FOREIGN KEY([IdFamiliaPadre])
REFERENCES [dbo].[Familias] ([IdFamilia])
)
GO
