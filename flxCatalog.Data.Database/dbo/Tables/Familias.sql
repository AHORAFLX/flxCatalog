CREATE TABLE [dbo].[Familias](
	[IdFamilia] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Imagen] [nvarchar](max) NULL,
	[Icono] [nvarchar](100) NULL,
	[IdFamiliaPadre] [uniqueidentifier] NULL,
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
