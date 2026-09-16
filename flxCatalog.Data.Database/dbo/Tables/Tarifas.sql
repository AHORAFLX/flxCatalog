CREATE TABLE [dbo].[Tarifas](
	[IdTarifa] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tarifas] PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC
)
)
GO
