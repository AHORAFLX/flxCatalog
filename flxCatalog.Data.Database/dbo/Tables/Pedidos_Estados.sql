CREATE TABLE [dbo].[Pedidos_Estados](
	[IdEstado] [nvarchar](50) NOT NULL CONSTRAINT [DF_Pedidos_Estados_IdEstado] DEFAULT (NEWID()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_Pedidos_Estados] PRIMARY KEY CLUSTERED
(
	[IdEstado] ASC
)
)
GO
