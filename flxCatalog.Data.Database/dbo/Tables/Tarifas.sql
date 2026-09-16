CREATE TABLE [dbo].[Tarifas](
	[IdTarifa] [nvarchar](50) NOT NULL CONSTRAINT [DF_Tarifas_IdTarifa] DEFAULT (NEWID()),
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tarifas] PRIMARY KEY CLUSTERED
(
	[IdTarifa] ASC
)
)
GO
