CREATE TABLE [dbo].[MesasTrabajo](
	[IdMesa] [nvarchar](50) NOT NULL CONSTRAINT [DF_MesasTrabajo_IdMesa] DEFAULT (newid()),
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MesasTrabajo] PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)
)
GO
