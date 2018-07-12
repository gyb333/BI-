IF (OBJECT_ID(N'[Dim_Customer]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Customer];
END
GO

CREATE TABLE [Dim_Customer]
(
	 [SubCustId] INT NOT NULL
	,[ParCustId] INT NOT NULL
	,[StatusId] SMALLINT
	,[IsGroupCustId] BIT
	,[CustCategoryId] INT
	,[ChanTypeId] INT NOT NULL
	,[CustTypeId] INT NOT NULL
	,[CustIndustryId] INT NOT NULL
	,[SaleLineId] INT NOT NULL
	,[SaleAreaID] INT NOT NULL
	,[CustOtherTypeId] INT NOT NULL
	,[SecondCustId] INT NOT NULL
	,[IsSecondCustId] INT NOT NULL
	,[IsSecondCustName] NVARCHAR(1)
	,[Contacts] NVARCHAR(60)
	,[ContTel] NVARCHAR(60)
	,[ContAddr] NVARCHAR(200)
	,[CreatedDate] CHAR(10) NOT NULL
	,[CreatedDateKey] INT NOT NULL
	,[CreatedYear] INT NOT NULL
	,[CreatedMonth] INT NOT NULL
	,[CreatedDay] INT NOT NULL
	,[DisableDate] CHAR(10) NOT NULL
	,[DisableDateKey] INT NOT NULL
	,[DisableYear] INT NOT NULL
	,[DisableMonth] INT NOT NULL
	,[DisableDay] INT NOT NULL
	,[KASys] INT
	,[KASysName] NVARCHAR(40)
	,[StdSys] INT
	,[StdSysName] NVARCHAR(60)
	,[CustPriceTypeID] INT NOT NULL
	,[CustPriceTypeCode] NVARCHAR(10)
	,[CustPriceTypeName] NVARCHAR(20)
	,[CreditAmount] MONEY
	,[CompBranchId] INT NOT NULL
	,[DistributorId] INT NOT NULL
	,[DistributorContractId] INT NOT NULL
	,[CompanyId] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[OrgName] NVARCHAR(20)
	,[RegionId] INT NOT NULL
	,[ProvinceId] INT NOT NULL
	,[CityId] INT NOT NULL
	,[CountyId] INT NOT NULL
	,[TownId] INT NOT NULL
	,[VillageId] INT NOT NULL
	,[CompanyName] NVARCHAR(60) NOT NULL
	,[RegionName] NVARCHAR(20) NOT NULL
	,[SubCustName] NVARCHAR(60) NOT NULL
	,[ParCustName] NVARCHAR(60) NOT NULL
	,[StatusName] NVARCHAR(10)
	,[IsGroupCustName] NVARCHAR(10)
	,[CustCategoryName] NVARCHAR(20) NOT NULL
	,[ChanTypeName] NVARCHAR(60) NOT NULL
	,[CustTypeName] NVARCHAR(20) NOT NULL
	,[CustIndustryName] NVARCHAR(20) NOT NULL
	,[SaleLineName] NVARCHAR(20) NOT NULL
	,[SaelAreaName] NVARCHAR(20) NOT NULL
	,[CustOtherTypeName] NVARCHAR(40) NOT NULL
	,[SecondCustName] NVARCHAR(60) NOT NULL
	,[CompBranchName] NVARCHAR(60) NOT NULL
	,[DistributorName] NVARCHAR(60) NOT NULL
	,[DistributorContractName] NVARCHAR(60) NOT NULL
	,[ProvinceName] NVARCHAR(40) NOT NULL
	,[CityName] NVARCHAR(40) NOT NULL
	,[CountyName] NVARCHAR(40) NOT NULL
	,[TownName] NVARCHAR(40) NOT NULL
	,[VillageName] NVARCHAR(40) NOT NULL
)
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Customer_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Customer].[CIX_Dim_Customer_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Customer_01] ON [dbo].[Dim_Customer]
(
	[SubCustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Customer] ADD CONSTRAINT PK_Dim_Customer_SubCustId PRIMARY KEY([SubCustId])
GO

IF (OBJECT_ID(N'[Dim_Customer_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Customer_Error];
END
GO

CREATE TABLE [dbo].[Dim_Customer_Error](
	[SubCustId] [INT] NULL,
	[子客户] [NVARCHAR](60) NULL,
	[ParCustId] [INT] NULL,
	[父客户] [NVARCHAR](60) NULL,
	[StatusId] [SMALLINT] NULL,
	[是否有效] [VARCHAR](4) NULL,
	[IsGroupCustId] [BIT] NULL,
	[是否集团客户] [VARCHAR](2) NULL,
	[CustCategoryId] [INT] NULL,
	[客户分类] [NVARCHAR](20) NULL,
	[CustTypeId] [INT] NULL,
	[客户类型] [NVARCHAR](20) NULL,
	[ChanTypeId] [INT] NULL,
	[渠道类型] [NVARCHAR](60) NULL,
	[CustIndustryId] [INT] NULL,
	[客户行业] [NVARCHAR](20) NULL,
	[SaleLineId] [INT] NULL,
	[销售线路] [NVARCHAR](20) NULL,
	[SaleAreaID] [INT] NULL,
	[销售区域] [NVARCHAR](20) NULL,
	[CustOtherTypeId] [INT] NULL,
	[客户自定义分类] [NVARCHAR](20) NULL,
	[SecondCustId] [INT] NULL,
	[分销商] [NVARCHAR](60) NULL,
	[IsSecondCustId] [INT] NULL,
	[IsSecondCustName] [NVARCHAR](1) NULL,
	[Contacts] [NVARCHAR](60) NULL,
	[ContTel] [NVARCHAR](60) NULL,
	[ContAddr] [NVARCHAR](200) NULL,
	[CreatedDate] [VARCHAR](10) NULL,
	[CreatedDateKey] [INT] NULL,
	[CreatedYear] [INT] NULL,
	[CreatedMonth] [INT] NULL,
	[CreatedDay] [INT] NULL,
	[KASys] [INT] NULL,
	[KASysName] [NVARCHAR](40) NULL,
	[StdSys] [INT] NULL,
	[StdSysName] [NVARCHAR](60) NULL,
	[CustPriceTypeID] [INT] NULL,
	[CustPriceTypeCode] [NVARCHAR](10) NULL,
	[CustPriceTypeName] [NVARCHAR](20) NULL,
	[CompBranchId] [INT] NULL,
	[户头] [NVARCHAR](60) NULL,
	[DistributorId] [INT] NULL,
	[经销商公司] [NVARCHAR](60) NULL,
	[DistributorContractId] [INT] NULL,
	[签约经销商] [NVARCHAR](60) NULL,
	[CompanyId] [INT] NULL,
	[账号] [NVARCHAR](60) NULL,
	[OrgId] [INT] NULL,
	[营销分公司] [NVARCHAR](20) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[ProvinceId] [INT] NULL,
	[省] [NVARCHAR](40) NULL,
	[CityId] [INT] NULL,
	[市] [NVARCHAR](40) NULL,
	[CountyId] [INT] NULL,
	[县] [NVARCHAR](40) NULL,
	[TownId] [INT] NULL,
	[乡镇] [NVARCHAR](40) NULL,
	[VillageId] [INT] NULL,
	[村] [NVARCHAR](40) NULL,
	[DisableDate] [VARCHAR](10) NULL,
	[DisableDateKey] [INT] NULL,
	[DisableYear] [INT] NULL,
	[DisableMonth] [INT] NULL,
	[DisableDay] [INT] NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO


--调拨客户
IF(OBJECT_ID(N'[dbo].[Dim_Customer_DB]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Customer_DB];
END
GO

CREATE TABLE [dbo].[Dim_Customer_DB]
(
	 [SubCustId] INT NOT NULL
	,[SubCustName] NVARCHAR(60) NOT NULL
	,[StatusId] SMALLINT
	,[StatusDesc] VARCHAR(4)
	,[OrgId] INT
	,[OrgName] NVARCHAR(20)
	,[RegionId] INT
	,[CompanyId] INT
	,[DistributorId] INT
)
GO

ALTER TABLE [dbo].[Dim_Customer_DB] ADD CONSTRAINT PK_Dim_Customer_Id_DB PRIMARY KEY([SubCustId])
GO


--DROP TABLE [Dim_Customer_Error];