CREATE TABLE [dbo].[Tarifas](
	[IdTarifa] [nvarchar](50) NOT NULL CONSTRAINT [DF_Tarifas_IdTarifa] DEFAULT (newid()),
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tarifas] PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC CONSTRAINT [DF_Tarifas_IdTarifa] DEFAULT (newid())
)
)
GO
