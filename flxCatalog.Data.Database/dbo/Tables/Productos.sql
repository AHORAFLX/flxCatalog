CREATE TABLE [dbo].[Productos](
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Referencia] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[DescripcionCorta] [nvarchar](500) NULL,
	[IdFamilia] [uniqueidentifier] NOT NULL,
	[IdMarca] [uniqueidentifier] NOT NULL,
	[PrecioBase] [decimal](18, 2) NOT NULL,
	[IVA] [decimal](5, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Destacado] [bit] NOT NULL,
	[Novedad] [bit] NOT NULL,
	[Oferta] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CreateDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](200) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)
,
 CONSTRAINT [FK_Productos_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familias] ([IdFamilia]),
 CONSTRAINT [FK_Productos_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([IdMarca])
)
GO
