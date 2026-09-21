CREATE TABLE [dbo].[Tallas](
	[IdTalla] [nvarchar](50) NOT NULL CONSTRAINT [DF_Tallas_IdTalla] DEFAULT (newid()),
	[Nombre] [nvarchar](20) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Tallas] PRIMARY KEY CLUSTERED 
(
	[IdTalla] ASC 
)
)
GO
