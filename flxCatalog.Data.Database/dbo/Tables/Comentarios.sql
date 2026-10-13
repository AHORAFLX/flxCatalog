CREATE TABLE [dbo].[Comentarios](
	[IdComentario] [nvarchar](50) NOT NULL,
	[EntidadTipo] [nvarchar](20) NOT NULL,
	[EntidadId] [nvarchar](50) NOT NULL,
	[Texto] [nvarchar](1000) NOT NULL,
	[Autor] [nvarchar](200) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Puntuacion] [int] NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)
)
GO
