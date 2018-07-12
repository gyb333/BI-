--����Ĳ�Ʒ
IF(OBJECT_ID(N'[dbo].[Dim_Product]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Product];
END
GO

CREATE TABLE [Dim_Product]
(
	 [ProdId] INT NOT NULL
	,[ProdStatusId] BIT NOT NULL
	,[BrandId] INT NOT NULL
	,[ProdBreedId] INT NOT NULL
	,[ProdCategroyId] INT NOT NULL
	,[ProdLineId] INT NOT NULL
	,[BusLineId] INT NOT NULL
	,[ProdSpecId] INT NOT NULL
	,[ProdBaseSpecId] INT NOT NULL
	,[ProdOtherTypeId] INT NOT NULL
	,[WgtUnitRate] NUMERIC(18, 10)
	,[BasePackRate] NUMERIC(18, 10)
	,[AuxiUnitRate] NUMERIC(18, 10)
	,[MinUnitRate] NUMERIC(18, 10)
	,[CompanyId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[ProdCode] NVARCHAR(40)
	,[ProdName] NVARCHAR(120)
	,[ProdStatusName] NVARCHAR(10)
	,[ProdSAPCode] NVARCHAR(40)
	,[BrandName] NVARCHAR(40)
	,[ProdBreedName] NVARCHAR(400)
	,[ProdCategroyName] NVARCHAR(40)
	,[ProdLineName] NVARCHAR(40)
	,[BusLineName] NVARCHAR(40)
	,[ProdSpecName] NVARCHAR(80)
	,[ProdBaseSpecName] NVARCHAR(60)
	,[ProdOtherTypeName] NVARCHAR(40)
	,[ProdAPICode] NVARCHAR(40)
	,[WeightUnit] NVARCHAR(20)
	,[BasePackUnit] NVARCHAR(20)
	,[AuxiUnit] NVARCHAR(20)
	,[MinUnit] NVARCHAR(20)
	,[BasePackBarCode] NVARCHAR(40)
	,[AuxiUnitBarCode] NVARCHAR(40)
	,[MinUnitBarCode] NVARCHAR(40)
	,[CompanyName] NVARCHAR(60)
	,[RegionName] NVARCHAR(20)
	,[IsGroupProdId] INT NOT NULL
	,[IsGroupProdDesc] NVARCHAR(10) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Product_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Product].[CIX_Dim_Product_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Product_01] ON [dbo].[Dim_Product]
(
	[ProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Product] ADD CONSTRAINT PK_Dim_Product_ProdId PRIMARY KEY([ProdId])
GO

--���в�Ʒ���������������в�Ʒ��
IF(OBJECT_ID(N'[dbo].[Dim_Product_All]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Product_All];
END
GO

CREATE TABLE [Dim_Product_All]
(
	 [ProdId] INT NOT NULL
	,[ProdStatusId] BIT NOT NULL
	,[BrandId] INT NOT NULL
	,[ProdBreedId] INT NOT NULL
	,[ProdCategroyId] INT NOT NULL
	,[ProdLineId] INT NOT NULL
	,[BusLineId] INT NOT NULL
	,[ProdSpecId] INT NOT NULL
	,[ProdBaseSpecId] INT NOT NULL
	,[ProdOtherTypeId] INT NOT NULL
	,[WgtUnitRate] NUMERIC(18, 10)
	,[BasePackRate] NUMERIC(18, 10)
	,[AuxiUnitRate] NUMERIC(18, 10)
	,[MinUnitRate] NUMERIC(18, 10)
	,[CompanyId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[ProdCode] NVARCHAR(40)
	,[ProdName] NVARCHAR(120)
	,[ProdStatusName] NVARCHAR(10)
	,[ProdSAPCode] NVARCHAR(40)
	,[BrandName] NVARCHAR(40)
	,[ProdBreedName] NVARCHAR(40)
	,[ProdCategroyName] NVARCHAR(400)
	,[ProdLineName] NVARCHAR(40)
	,[BusLineName] NVARCHAR(40)
	,[ProdSpecName] NVARCHAR(80)
	,[ProdBaseSpecName] NVARCHAR(60)
	,[ProdOtherTypeName] NVARCHAR(40)
	,[ProdAPICode] NVARCHAR(40)
	,[WeightUnit] NVARCHAR(20)
	,[BasePackUnit] NVARCHAR(20)
	,[AuxiUnit] NVARCHAR(20)
	,[MinUnit] NVARCHAR(20)
	,[BasePackBarCode] NVARCHAR(40)
	,[AuxiUnitBarCode] NVARCHAR(40)
	,[MinUnitBarCode] NVARCHAR(40)
	,[CompanyName] NVARCHAR(60)
	,[RegionName] NVARCHAR(20)
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Product_All_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Product_All].[CIX_Dim_Product_All_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Product_All_01] ON [dbo].[Dim_Product_All]
(
	[ProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Product_All] ADD CONSTRAINT PK_Dim_Product_All_ProdId PRIMARY KEY([ProdId])
GO



IF(OBJECT_ID(N'[dbo].[Dim_Product_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Product_Error];
END
GO
CREATE TABLE [dbo].[Dim_Product_Error](
	[ProdId] [INT] NULL,
	[��Ʒ����] [NVARCHAR](20) NULL,
	[��Ʒ] [NVARCHAR](60) NULL,
	[ProdStatusId] [BIT] NULL,
	[��Ʒ״̬] [VARCHAR](4) NULL,
	[��ƷSAP����] [NVARCHAR](20) NULL,
	[BrandId] [INT] NULL,
	[Ʒ��] [NVARCHAR](20) NULL,
	[ProdBreedId] [INT] NULL,
	[Ʒ��] [NVARCHAR](20) NULL,
	[ProdCategroyId] [INT] NULL,
	[Ʒ��] [VARCHAR](400) NULL,
	[ProdLineId] [INT] NULL,
	[����] [NVARCHAR](20) NULL,
	[BusLineId] [INT] NULL,
	[ҵ����] [NVARCHAR](20) NULL,
	[ProdSpecId] [INT] NULL,
	[��Ʒ���] [NVARCHAR](80) NULL,
	[ProdBaseSpecId] [INT] NULL,
	[��Ʒ�������] [NVARCHAR](50) NULL,
	[ProdOtherTypeId] [INT] NULL,
	[��Ʒ�Զ������] [NVARCHAR](20) NULL,
	[��Ʒ�ӿ���] [NVARCHAR](40) NULL,
	[������λ] [NVARCHAR](10) NULL,
	[WgtUnitRate] [NUMERIC](18, 10) NULL,
	[���װ��λ] [NVARCHAR](10) NULL,
	[������λ] [NVARCHAR](10) NULL,
	[��С��λ] [NVARCHAR](10) NULL,
	[���װ������] [NVARCHAR](40) NULL,
	[BasePackRate] [NUMERIC](18, 10) NULL,
	[������λ������] [NVARCHAR](40) NULL,
	[AuxiUnitRate] [NUMERIC](18, 10) NULL,
	[��С��λ������] [NVARCHAR](40) NULL,
	[MinUnitRate] [NUMERIC](18, 10) NULL,
	[CompanyId] [INT] NULL,
	[�˺�] [NVARCHAR](60) NULL,
	[RegionId] [INT] NULL,
	[����] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO


--DROP TABLE [dbo].[Dim_Product_All];
--DROP TABLE [dbo].[Dim_Product_Error];
