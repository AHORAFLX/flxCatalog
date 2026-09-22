CREATE TABLE [dbo].[Colores](
	[IdColor] [nvarchar](50) NOT NULL CONSTRAINT [DF_Colores_IdColor] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[CodigoHex] [nvarchar](7) NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Colores] PRIMARY KEY CLUSTERED 
(
	[IdColor] ASC
)
)
GO
