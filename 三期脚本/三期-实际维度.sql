IF ( OBJECT_ID(N'[Dim_ProdLine]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdLine];
    END
GO

CREATE TABLE [Dim_ProdLine]
    (
      [RegionId] [INT] NOT NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [ProdLineCode] [NVARCHAR](10) NOT NULL ,
      [ProdLineCode2] [NVARCHAR](20) NULL ,
      [ProdLineName] [NVARCHAR](20) NOT NULL ,
      [BussLineID] [INT] NOT NULL ,
      [KMISID] [INT] NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProdLine_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdLine].[CIX_Dim_ProdLine_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdLine_01] ON [dbo].[Dim_ProdLine]
(
ProdLineID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProdLine] ADD CONSTRAINT PK_Dim_ProdLine_ProdLineID PRIMARY KEY(ProdLineID)
GO


------------
IF ( OBJECT_ID(N'[Dim_CreditType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CreditType];
    END
GO

CREATE TABLE [Dim_CreditType]
    (
      [CreditType] [INT] NOT NULL,
	[CreditTypeName] [NVARCHAR](8) NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CreditType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CreditType].[CIX_Dim_CreditType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CreditType_01] ON [dbo].[Dim_CreditType]
(
[CreditType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CreditType] ADD CONSTRAINT PK_Dim_CreditType PRIMARY KEY([CreditType])
GO

-------------------------------
IF ( OBJECT_ID(N'[Dim_Customer_Cut]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Customer_Cut];
    END
GO

CREATE TABLE [Dim_Customer_Cut]
    (
    [CustID] [INT] NOT NULL,
	[SubCustName] [NVARCHAR](60) NOT NULL,
	[ParentCustID] [INT] NULL,
	[ParentCustName] [NVARCHAR](60) NULL,
	[StatusId] [SMALLINT] NULL,
	[StatusName] [NVARCHAR](4) NULL,
	[IsKerryCust] [BIT] NOT NULL,
	[IsKerryCustName] [NVARCHAR](2) NULL,
	[CustCategoryId] [INT] NOT NULL,
	[CustCategoryName] [NVARCHAR](20) NOT NULL,
	[CustChannelID] [INT] NOT NULL,
	[CustChannelName] [NVARCHAR](20) NOT NULL,
	[CustChannelTypeID] [INT] NOT NULL,
	[CustChannelTypeName] [NVARCHAR](60) NOT NULL,
	[SecondCustId] [INT] NOT NULL,
	[SecondCustName] [NVARCHAR](60) NULL,
	[IsSecondCustId] [INT] NOT NULL,
	[IsSecondCustName] [NVARCHAR](2) NULL,
	[Contacts] [NVARCHAR](60) NOT NULL,
	[ContTel] [NVARCHAR](60) NOT NULL,
	[ContAddr] [NVARCHAR](200) NOT NULL,
	[KASys] [INT] NOT NULL,
	[KASysName] [NVARCHAR](40) NOT NULL,
	[CompBranchId] [INT] NOT NULL,
	[CompBranchName] [NVARCHAR](60) NOT NULL,
	[DistributorId] [INT] NOT NULL,
	[DistributorName] [NVARCHAR](60) NOT NULL,
	[DistributorContractId] [INT] NOT NULL,
	[DistributorContractName] [NVARCHAR](60) NOT NULL,
	[CompanyId] [INT] NOT NULL,
	[CompanyName] [NVARCHAR](60) NOT NULL,
	[OrgId] [INT] NOT NULL,
	[OrgName] [NVARCHAR](20) NOT NULL,
	[RegionId] [INT] NOT NULL,
	[RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_Customer_Cut_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_Customer_Cut].[CIX_Dim_Customer_Cut_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Customer_Cut_01] ON [dbo].[Dim_Customer_Cut]
(
[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Customer_Cut] ADD CONSTRAINT PK_Dim_Customer_Cut PRIMARY KEY([CustID])
GO
 
 --------------------------


 IF ( OBJECT_ID(N'[Dim_CustOtherType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CustOtherType];
    END
GO

CREATE TABLE [Dim_CustOtherType]
    (
      [CustOtherTypeID] [INT] NOT NULL ,
      [CustOtherTypeCode] [NVARCHAR](10) NOT NULL ,
      [CustOtherTypeName] [NVARCHAR](20) NOT NULL ,
      [Disabled] [BIT] NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [DistributorID] [INT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CustOtherType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CustOtherType].[CIX_Dim_CustOtherType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CustOtherType_01] ON [dbo].[Dim_CustOtherType]
(
[CustOtherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CustOtherType] ADD CONSTRAINT PK_Dim_CustOtherType PRIMARY KEY([CustOtherTypeID])
GO
 



 ------------------
 IF ( OBJECT_ID(N'[Dim_CheckStatus]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CheckStatus];
    END
GO

CREATE TABLE [Dim_CheckStatus]
    (
      [CheckStatusID] [INT] NOT NULL ,
      [CheckStatusName] [NVARCHAR](6) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CheckStatus_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CheckStatus].[CIX_Dim_CheckStatus_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CheckStatus_01] ON [dbo].[Dim_CheckStatus]
(
[CheckStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CheckStatus] ADD CONSTRAINT PK_Dim_CheckStatus PRIMARY KEY([CheckStatusID])
GO
 

 ------------------------
 IF ( OBJECT_ID(N'[Dim_CompanyBase]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CompanyBase];
    END
GO

CREATE TABLE [Dim_CompanyBase]
    (
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
	  [DataKey] [NVARCHAR](19) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CompanyBase_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CompanyBase].[CIX_Dim_CompanyBase_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CompanyBase_01] ON [dbo].[Dim_CompanyBase]
(
[DataKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CompanyBase] ADD CONSTRAINT PK_Dim_CompanyBase PRIMARY KEY([DataKey])
GO
 
IF ( OBJECT_ID(N'[Dim_DistributorContract]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_DistributorContract];
    END
GO

CREATE TABLE [Dim_DistributorContract]
    (
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [DistributorContractName] [NVARCHAR](60) NOT NULL ,
      [DistributorContractCode] [NVARCHAR](10) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_DistributorContract_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_DistributorContract].[CIX_Dim_DistributorContract_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_DistributorContract_01] ON [dbo].[Dim_DistributorContract]
(
[DistributorContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_DistributorContract] ADD CONSTRAINT PK_Dim_DistributorContract PRIMARY KEY([DistributorContractID])
GO
 

 IF ( OBJECT_ID(N'[Dim_Distributor]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Distributor];
    END
GO

CREATE TABLE [Dim_Distributor]
    (
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [DistributorContractName] [NVARCHAR](60) NOT NULL ,
      [DistributorContractCode] [NVARCHAR](10) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [Disabled] [BIT] NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_Distributor_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_Distributor].[CIX_Dim_Distributor_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Distributor_01] ON [dbo].[Dim_Distributor]
(
[DistributorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Distributor] ADD CONSTRAINT PK_Dim_Distributor PRIMARY KEY([DistributorID])
GO
 


 IF ( OBJECT_ID(N'[Dim_CompanyBranch]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CompanyBranch];
    END
GO

CREATE TABLE [Dim_CompanyBranch]
    (
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [DistributorContractName] [NVARCHAR](60) NOT NULL ,
      [DistributorContractCode] [NVARCHAR](10) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CompBranchCode] [NVARCHAR](12) NOT NULL ,
      [CompBranchName] [NVARCHAR](60) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CompanyBranch_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CompanyBranch].[CIX_Dim_CompanyBranch_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CompanyBranch_01] ON [dbo].[Dim_CompanyBranch]
(
[CompBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CompanyBranch] ADD CONSTRAINT PK_Dim_CompanyBranch PRIMARY KEY([CompBranchID])
GO
 

 --------------
 IF ( OBJECT_ID(N'[Dim_ProductBrand]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProductBrand];
    END
GO

CREATE TABLE [Dim_ProductBrand]
    (
      [RegionId] [INT] NOT NULL ,
      [ProdBrandID] [INT] NOT NULL ,
      [ProdBrandCode] [NVARCHAR](40) NOT NULL ,
      [ProdBrandCode2] [NVARCHAR](40) NULL ,
      [ProdBrandName] [NVARCHAR](20) NOT NULL ,
      [BussLineID] [INT] NOT NULL ,
      [IsCompetition] [BIT] NOT NULL ,
      [MDPID] [INT] NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProductBrand_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProductBrand].[CIX_Dim_ProductBrand_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProductBrand_01] ON [dbo].[Dim_ProductBrand]
(
[ProdBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProductBrand] ADD CONSTRAINT PK_Dim_ProductBrand PRIMARY KEY([ProdBrandID])
GO
 
 ------------------------------

 IF ( OBJECT_ID(N'[Dim_ProductBreed]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProductBreed];
    END
GO

CREATE TABLE [Dim_ProductBreed]
    (
      [RegionId] [INT] NOT NULL ,
      [ProdBreedID] [INT] NOT NULL ,
      [ProdBreedCode] [NVARCHAR](200) NULL ,
      [ProdBreedCode2] [NVARCHAR](10) NULL ,
      [ProdBreedName] [NVARCHAR](200) NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [IsCompetition] [BIT] NOT NULL ,
      [MDPID] [INT] NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProductBreed_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProductBreed].[CIX_Dim_ProductBreed_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProductBreed_01] ON [dbo].[Dim_ProductBreed]
(
[ProdBreedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProductBreed] ADD CONSTRAINT PK_Dim_ProductBreed PRIMARY KEY([ProdBreedID])
GO
 
 ---------------------------------------------

IF ( OBJECT_ID(N'[Dim_CustomerSys]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CustomerSys];
    END
GO

CREATE TABLE [Dim_CustomerSys]
    (
      [CustSysID] [INT] NOT NULL ,
      [CustSysCode] [NVARCHAR](20) NOT NULL ,
      [CustSysCode2] [NVARCHAR](20) NOT NULL ,
      [CustSysName] [NVARCHAR](40) NOT NULL ,
      [Disabled] [BIT] NOT NULL ,
      [CustCate] [INT] NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CustomerSys_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CustomerSys].[CIX_Dim_CustomerSys_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CustomerSys_01] ON [dbo].[Dim_CustomerSys]
(
[CustSysID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CustomerSys] ADD CONSTRAINT PK_Dim_CustomerSys PRIMARY KEY([CustSysID])
GO
 
 -------------------------------------
IF ( OBJECT_ID(N'[Dim_City]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_City];
    END
GO

CREATE TABLE [Dim_City]
    (
      [CityID] [INT] NOT NULL ,
      [CityCode] [NVARCHAR](20) NOT NULL ,
      [CityName] [NVARCHAR](40) NOT NULL ,
      [SelfCode] [CHAR](10) NOT NULL ,
      [ParentID] [INT] NOT NULL ,
      [Acreage] [DECIMAL](9, 2) NOT NULL ,
      [Population] [INT] NOT NULL ,
      [GovementPlace] [NVARCHAR](20) NULL ,
      [StatisticsDate] [NVARCHAR](20) NULL ,
      [AreaCode2] [NVARCHAR](20) NOT NULL ,
      [AreaType] [VARCHAR](40) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_City_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_City].[CIX_Dim_City_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_City_01] ON [dbo].[Dim_City]
(
[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_City] ADD CONSTRAINT PK_Dim_City PRIMARY KEY([CityID])
GO
 

 ---------------------------------------
 IF ( OBJECT_ID(N'[Dim_County]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_County];
    END
GO

CREATE TABLE [Dim_County]
    (
      [CountyID] [INT] NOT NULL ,
      [CountyCode] [NVARCHAR](20) NOT NULL ,
      [CountyName] [NVARCHAR](40) NOT NULL ,
      [SelfCode] [CHAR](10) NOT NULL ,
      [ParentID] [INT] NOT NULL ,
      [Acreage] [DECIMAL](9, 2) NOT NULL ,
      [Population] [INT] NOT NULL ,
      [GovementPlace] [NVARCHAR](20) NULL ,
      [StatisticsDate] [NVARCHAR](20) NULL ,
      [AreaCode2] [NVARCHAR](20) NOT NULL ,
      [AreaType] [VARCHAR](40) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_County_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_County].[CIX_Dim_County_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_County_01] ON [dbo].[Dim_County]
(
[CountyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_County] ADD CONSTRAINT PK_Dim_County PRIMARY KEY([CountyID])
GO

-------------------------
 IF ( OBJECT_ID(N'[Dim_CustChannelType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CustChannelType];
    END
GO

 CREATE TABLE [Dim_CustChannelType]
    (
      [CustChannelTypeID] [INT] NOT NULL ,
      [CustChannelTypeCode] [NVARCHAR](20) NOT NULL ,
      [CustChannelTypeCode2] [NVARCHAR](20) NOT NULL ,
      [CustChannelTypeName] [NVARCHAR](60) NOT NULL ,
      [Remark] [NVARCHAR](200) NOT NULL
    )
GO

 IF ( EXISTS ( SELECT   1
               FROM     [sys].[indexes] AS ix
               WHERE    [ix].[name] = 'CIX_Dim_CustChannelType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CustChannelType].[CIX_Dim_CustChannelType_01]
    END
GO

 CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CustChannelType_01] ON [dbo].[Dim_CustChannelType]
 (
 [CustChannelTypeID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

 ALTER TABLE [dbo].[Dim_CustChannelType] ADD CONSTRAINT PK_Dim_CustChannelType PRIMARY KEY([CustChannelTypeID])
GO

--------------------------------
 IF ( OBJECT_ID(N'[Dim_ProdOtherType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdOtherType];
    END
GO

 CREATE TABLE [Dim_ProdOtherType]
    (
      [RegionId] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [ProdOtherTypeID] [INT] NOT NULL ,
      [ProdOtherTypeCode] [NVARCHAR](10) NOT NULL ,
      [ProdOtherTypeName] [NVARCHAR](20) NOT NULL ,
      [Remark] [NVARCHAR](250) NOT NULL
    )
GO

 IF ( EXISTS ( SELECT   1
               FROM     [sys].[indexes] AS ix
               WHERE    [ix].[name] = 'CIX_Dim_ProdOtherType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdOtherType].[CIX_Dim_ProdOtherType_01]
    END
GO

 CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdOtherType_01] ON [dbo].[Dim_ProdOtherType]
 (
 [ProdOtherTypeID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

 ALTER TABLE [dbo].[Dim_ProdOtherType] ADD CONSTRAINT PK_Dim_ProdOtherType PRIMARY KEY([ProdOtherTypeID])
GO

 



--TRUNCATE TABLE dbo.Dim_CreditType



 