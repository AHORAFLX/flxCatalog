CREATE TABLE [dbo].[Tallas](
	[IdTalla] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Tallas] PRIMARY KEY CLUSTERED 
(
	[IdTalla] ASC
)
)
GO
