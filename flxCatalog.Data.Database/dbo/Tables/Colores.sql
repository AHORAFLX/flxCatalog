CREATE TABLE [dbo].[Colores](
	[IdColor] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[CodigoHex] [nvarchar](7) NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Colores] PRIMARY KEY CLUSTERED 
(
	[IdColor] ASC
)
)
GO
