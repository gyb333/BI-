--501-维度_促销员
IF ( OBJECT_ID(N'[Dim_Promoter]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Promoter];
    END
GO

CREATE TABLE [Dim_Promoter]
    (
      PromoterID INT NOT NULL ,
      CompanyID INT NOT NULL ,
      CompanyName NVARCHAR(60) NOT NULL ,
      DistributorID INT NOT NULL ,
	  DistributorName NVARCHAR(60) NOT NULL,
      PromoterCode NVARCHAR(50) NOT NULL ,
      PromoterName NVARCHAR(20) NOT NULL ,
      IsResigned BIT ,
      PromoterType INT NOT NULL ,
      PromoterTypeName NVARCHAR(60) NOT NULL ,
      SupervisorID INT NOT NULL ,
      SupervisorCode NVARCHAR(50) NOT NULL ,
      SupervisorName NVARCHAR(20) NOT NULL ,
      OrgID INT NOT NULL ,
      OrgName NVARCHAR(20) NOT NULL ,
      RegionID INT NOT NULL ,
      RegionName NVARCHAR(20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_Promoter_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_Promoter].[CIX_Dim_Promoter_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Promoter_01] ON [dbo].[Dim_Promoter]
(
PromoterID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Promoter] ADD CONSTRAINT PK_Dim_Promoter_PromoterID PRIMARY KEY(PromoterID)
GO




--502-维度_考勤类型
IF ( OBJECT_ID(N'[Dim_WorkType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_WorkType];
    END
GO

CREATE TABLE [Dim_WorkType]
    (
      WorkTypeID INT NOT NULL ,
      WorkTypeName NVARCHAR(20) NOT NULL ,
      WorkTypeValue NUMERIC(18, 6) ,
      WorkTypeCode NVARCHAR(20) ,
      IsIncludePromotion BIT ,
      IsInCludePromotionName NVARCHAR(20)
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_WorkType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_WorkType].[CIX_Dim_WorkType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_WorkType_01] ON [dbo].[Dim_WorkType]
(
WorkTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_WorkType] ADD CONSTRAINT PK_Dim_WorkType_WorkTypeID PRIMARY KEY(WorkTypeID)
GO


--503-维度_促销活动类型
IF ( OBJECT_ID(N'[Dim_ActiveType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ActiveType];
    END
GO

CREATE TABLE [Dim_ActiveType]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      MSItemTypeCode NVARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ActiveType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ActiveType].[CIX_Dim_ActiveType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ActiveType_01] ON [dbo].[Dim_ActiveType]
(
MSItemTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ActiveType] ADD CONSTRAINT PK_Dim_ActiveType_MSItemTypeID PRIMARY KEY(MSItemTypeID)
GO



--504-维度_产品返利
IF ( OBJECT_ID(N'[Dim_ProdRoyalt]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdRoyalt];
    END
GO

CREATE TABLE [Dim_ProdRoyalt]
    (
      ProdID INT NOT NULL ,
      RoyaltyMoney NUMERIC(18, 6) ,
      ProdCode NVARCHAR(20) NOT NULL ,
      ProdName NVARCHAR(60) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProdRoyalt_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdRoyalt].[CIX_Dim_ProdRoyalt_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdRoyalt_01] ON [dbo].[Dim_ProdRoyalt]
(
ProdID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProdRoyalt] ADD CONSTRAINT PK_Dim_ProdRoyalt_ProdID PRIMARY KEY(ProdID)
GO

--505-维度_促销分类
IF ( OBJECT_ID(N'[Dim_PromoterCategory]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterCategory];
    END
GO

CREATE TABLE [Dim_PromoterCategory]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      MSItemTypeCode NVARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_PromoterCategory_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_PromoterCategory].[CIX_Dim_PromoterCategory_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_PromoterCategory_01] ON [dbo].[Dim_PromoterCategory]
(
MSItemTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_PromoterCategory] ADD CONSTRAINT PK_Dim_PromoterCategory_MSItemTypeID PRIMARY KEY(MSItemTypeID)
GO

--506-维度_特陈类型
IF ( OBJECT_ID(N'[Dim_SpecialDisplayType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_SpecialDisplayType];
    END
GO

CREATE TABLE [Dim_SpecialDisplayType]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      MSItemTypeCode NVARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_SpecialDisplayType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_SpecialDisplayType].[CIX_Dim_SpecialDisplayType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_SpecialDisplayType_01] ON [dbo].[Dim_SpecialDisplayType]
(
MSItemTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_SpecialDisplayType] ADD CONSTRAINT PK_Dim_SpecialDisplayType_MSItemTypeID PRIMARY KEY(MSItemTypeID)
GO

--500-维度_发票类型
IF ( OBJECT_ID(N'[Dim_InvoiceType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_InvoiceType];
    END
GO

CREATE TABLE [Dim_InvoiceType]
    (
      InvType INT NOT NULL ,
      InvTypeName NVARCHAR(20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_InvoiceType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_InvoiceType].[CIX_Dim_InvoiceType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_InvoiceType_01] ON [dbo].[Dim_InvoiceType]
(
InvType ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_InvoiceType] ADD CONSTRAINT PK_Dim_InvoiceType_InvType PRIMARY KEY(InvType)
GO

--507-维度_促销员产线
IF ( OBJECT_ID(N'[Dim_PromoterProdLine]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterProdLine];
    END
GO

CREATE TABLE [Dim_PromoterProdLine]
    (
      DataKey NVARCHAR(23) NOT NULL ,
      [PromoterID] [INT] NOT NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [PromoterCode] [NVARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [ProdLineCode] [NVARCHAR](10) NOT NULL ,
      [ProdLineName] [NVARCHAR](20) NOT NULL ,
      [IsPrimary] [BIT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [DistributorContractName] [NVARCHAR](60) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_PromoterProdLine_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_PromoterProdLine].[CIX_Dim_PromoterProdLine_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_PromoterProdLine_01] ON [dbo].[Dim_PromoterProdLine]
(
DataKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_PromoterProdLine] ADD CONSTRAINT PK_Dim_PromoterProdLine_DataKey PRIMARY KEY(DataKey)
GO


--508-维度_产品扩展属性
IF ( OBJECT_ID(N'[Dim_ProdExtension]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdExtension];
    END
GO

CREATE TABLE [Dim_ProdExtension]
    (
      DataKey NVARCHAR(21) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
	  DistributorContractID INT NOT NULL,
      [ProdID] [INT] NOT NULL ,
      [SalesRevenueAcctID] [INT] NOT NULL ,
      [SalesCostAcctID] [INT] NOT NULL ,
      [ICAcctID] [INT] NOT NULL ,
      [ProdCode_IF] [NVARCHAR](40) NOT NULL ,
      [ProdAcctOtherTypeID] [INT] NOT NULL ,
      [ProdAcctOtherTypeCode] [NVARCHAR](10) NOT NULL ,
      [ProdAcctOtherTypeName] [NVARCHAR](20) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      SalesRevenueAcctCode [NVARCHAR](20) NOT NULL ,
      [SalesRevenueAcctName] [NVARCHAR](40) NOT NULL ,
      SalesCostAcctCode [NVARCHAR](20) NOT NULL ,
      [SalesCostAcctName] [NVARCHAR](40) NOT NULL ,
      ICAcctCode [NVARCHAR](20) NOT NULL ,
      [ICAcctName] [NVARCHAR](40) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProdExtension_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdExtension].[CIX_Dim_ProdExtension_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdExtension_01] ON [dbo].[Dim_ProdExtension]
(
DataKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProdExtension] ADD CONSTRAINT PK_Dim_ProdExtension_DataKey PRIMARY KEY(DataKey)
GO


--509-维度_客户价格租
IF ( OBJECT_ID(N'[Dim_CustPriceType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_CustPriceType];
    END
GO

CREATE TABLE [Dim_CustPriceType]
    (
      [DataKey] [NVARCHAR](21) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CustPriceTypeID] [INT] NOT NULL ,
      [CustPriceTypeCode] [NVARCHAR](10) NOT NULL ,
      [CustPriceTypeName] [NVARCHAR](20) NOT NULL ,
      [IsDisabled] [BIT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_CustPriceType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_CustPriceType].[CIX_Dim_CustPriceType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_CustPriceType_01] ON [dbo].[Dim_CustPriceType]
(
DataKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_CustPriceType] ADD CONSTRAINT PK_Dim_CustPriceType_DataKey PRIMARY KEY(DataKey)
GO

--510-维度_销售费用
IF ( OBJECT_ID(N'[Dim_Expense]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Expense];
    END
GO

CREATE TABLE [Dim_Expense]
    (
      [ExpenseID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      ExpenseCode [NVARCHAR](10) NOT NULL ,
      [ExpenseName] [NVARCHAR](20) NOT NULL ,
      [ExpenseCategory] [NVARCHAR](20) NOT NULL ,
      [AcctSubjectID] [INT] NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      AcctSubjectCode [NVARCHAR](20) NOT NULL ,
      [AcctSubjectName] [NVARCHAR](40) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_Expense_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_Expense].[CIX_Dim_Expense_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Expense_01] ON [dbo].[Dim_Expense]
(
[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Expense] ADD CONSTRAINT PK_Dim_Expense PRIMARY KEY([ExpenseID])
GO

--511-维度_财务类型
IF ( OBJECT_ID(N'[Dim_AcctType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_AcctType];
    END
GO

CREATE TABLE [Dim_AcctType]
    (
      [AcctTypeID] [INT] NOT NULL,
	[AcctTypeName] [NVARCHAR](20) NOT NULL,
	[ReverseAcctTypeID] [INT] NOT NULL,
	[ReverseAcctTypeName] [NVARCHAR](20) NOT NULL,
	[ROBName] [NVARCHAR](4) NOT NULL,
	[Remark] [NVARCHAR](250) NOT NULL,
	[IsDisabled] [BIT] NOT NULL,
	[ROB] [INT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_AcctType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_AcctType].[CIX_Dim_AcctType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_AcctType_01] ON [dbo].[Dim_AcctType]
(
AcctTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_AcctType] ADD CONSTRAINT PK_Dim_AcctType_AcctTypeID PRIMARY KEY(AcctTypeID)
GO

--512-维度_支付类型
IF ( OBJECT_ID(N'[Dim_PaymentType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PaymentType];
    END
GO

CREATE TABLE [Dim_PaymentType]
    (
      [PaymentTypeID] [INT] NOT NULL ,
      [PaymentTypeCode] [NVARCHAR](20) NOT NULL ,
      [PaymentTypeName] [NVARCHAR](20) NOT NULL ,
      [Disabled] [BIT] NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_PaymentType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_PaymentType].[CIX_Dim_PaymentType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_PaymentType_01] ON [dbo].[Dim_PaymentType]
(
PaymentTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_PaymentType] ADD CONSTRAINT PK_Dim_PaymentType_PaymentTypeID PRIMARY KEY(PaymentTypeID)
GO

--513-维度_币种
IF ( OBJECT_ID(N'[Dim_Currency]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Currency];
    END
GO

CREATE TABLE [Dim_Currency]
    (
      [CurrID] [INT] NOT NULL ,
      [CurrCode] [NVARCHAR](10) NOT NULL ,
      [CurrName] [NVARCHAR](20) NOT NULL ,
      [ExchangeRate] [DECIMAL](18, 6) NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_Currency_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_Currency].[CIX_Dim_Currency_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Currency_01] ON [dbo].[Dim_Currency]
(
CurrID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Currency] ADD CONSTRAINT PK_Dim_Currency_CurrID PRIMARY KEY(CurrID)
GO


--514-维度_产品核算类别
IF ( OBJECT_ID(N'[Dim_ProdAcctOtherType]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdAcctOtherType];
    END
GO

CREATE TABLE [Dim_ProdAcctOtherType]
    (
      [DataKey] NVARCHAR(21) NOT NULL ,
      [ProdAcctOtherTypeID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [ProdAcctOtherTypeCode] [NVARCHAR](10) NOT NULL ,
      [ProdAcctOtherTypeName] [NVARCHAR](20) NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [DistributorContractName] [NVARCHAR](60) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProdAcctOtherType_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdAcctOtherType].[CIX_Dim_ProdAcctOtherType_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdAcctOtherType_01] ON [dbo].[Dim_ProdAcctOtherType]
(
DataKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProdAcctOtherType] ADD CONSTRAINT PK_Dim_ProdAcctOtherType_DataKey PRIMARY KEY(DataKey)
GO

--515-维度_产品级别
IF ( OBJECT_ID(N'[Dim_ProdLevel]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdLevel];
    END
GO

CREATE TABLE [Dim_ProdLevel]
    (
      ProdLevelKey [NVARCHAR](20) NOT NULL ,
      ProdLevelName [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_ProdLevel_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_ProdLevel].[CIX_Dim_ProdLevel_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_ProdLevel_01] ON [dbo].[Dim_ProdLevel]
(
ProdLevelKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_ProdLevel] ADD CONSTRAINT PK_Dim_ProdLevel_ProdLevelKey PRIMARY KEY(ProdLevelKey)
GO

--516-维度_是否含税
IF ( OBJECT_ID(N'[Dim_IsIncludeTax]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_IsIncludeTax];
    END
GO

CREATE TABLE [Dim_IsIncludeTax]
    (
      [DataKey] NVARCHAR(12) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [KeyName] [NVARCHAR](40) NOT NULL ,
      [KeyValue] [NVARCHAR](200) NOT NULL ,
      [CompanyCode] [NVARCHAR](10) NOT NULL ,
      [CompanyName] [NVARCHAR](60) NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_IsIncludeTax_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_IsIncludeTax].[CIX_Dim_IsIncludeTax_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_IsIncludeTax_01] ON [dbo].[Dim_IsIncludeTax]
(
DataKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_IsIncludeTax] ADD CONSTRAINT PK_Dim_IsIncludeTax_DataKey PRIMARY KEY(DataKey)
GO

--517-维度_促销员客户
IF ( OBJECT_ID(N'[Dim_PromoterCust]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterCust];
    END
GO

CREATE TABLE [Dim_PromoterCust]
    (
	  [DataKey] NVARCHAR(21) NOT NULL ,
      [PromoterID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [PromoterCode] [NVARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [CustCode] [NVARCHAR](80) NOT NULL ,
      [CustName] [NVARCHAR](60) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Dim_PromoterCust_01' ) )
    BEGIN
        DROP INDEX [dbo].[Dim_PromoterCust].[CIX_Dim_PromoterCust_01]
    END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_PromoterCust_01] ON [dbo].[Dim_PromoterCust]
(
[DataKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_PromoterCust] ADD CONSTRAINT PK_Dim_PromoterCust_DataKey PRIMARY KEY([DataKey])
GO