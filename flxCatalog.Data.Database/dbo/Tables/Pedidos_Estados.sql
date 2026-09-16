CREATE TABLE [dbo].[Pedidos_Estados](
	[IdEstado] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Pedidos_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)
)
GO
