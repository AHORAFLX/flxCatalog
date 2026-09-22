CREATE TABLE [dbo].[Devoluciones_Estados](
	[IdEstado] [nvarchar](50) NOT NULL CONSTRAINT [DF_Devoluciones_Estados_IdEstado] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
	[Orden] [int] NOT NULL CONSTRAINT [DF_Devoluciones_Estados_Orden] DEFAULT ((0)),
 CONSTRAINT [PK_Devoluciones_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)
)
GO
