CREATE TABLE [dbo].[MesasTrabajo](
	[IdMesa] [nvarchar](50) NOT NULL CONSTRAINT [DF_MesasTrabajo_IdMesa] DEFAULT (newid()),
	[Nombre] [nvarchar](100) NOT NULL,
	[Activo] [bit] NOT NULL CONSTRAINT [DF_MesasTrabajo_Activo] DEFAULT ((1)),
 CONSTRAINT [PK_MesasTrabajo] PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)
)
GO
