CREATE TABLE [dbo].[Clientes](
	[IdCliente] [nvarchar](50) NOT NULL CONSTRAINT [DF_Clientes_IdCliente] DEFAULT (newid()),
	[CodigoCliente] [nvarchar](20) NOT NULL,
	[RazonSocial] [nvarchar](200) NOT NULL,
	[NombreComercial] [nvarchar](200) NULL,
	[CifNif] [nvarchar](20) NOT NULL,
	[DireccionFiscal] [nvarchar](300) NULL,
	[Email] [nvarchar](200) NULL,
	[Telefono] [nvarchar](30) NULL,
	[IdTarifa] [nvarchar](50) NOT NULL,
	[Comercial] [nvarchar](150) NULL,
	[Activo] [bit] NOT NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC CONSTRAINT [DF_Clientes_IdCliente] DEFAULT (newid())
)
,
 CONSTRAINT [FK_Clientes_Tarifa] FOREIGN KEY([IdTarifa])
REFERENCES [dbo].[Tarifas] ([IdTarifa])
)
GO
