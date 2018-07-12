IF ( OBJECT_ID(N'[Dim_Promoter_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Promoter_Error];
    END
GO
CREATE TABLE [dbo].[Dim_Promoter_Error]
    (
      PromoterID INT NOT NULL ,
      CompanyID INT NOT NULL ,
      [账号] NVARCHAR(60) NOT NULL ,
      DistributorID INT NOT NULL ,
	  DistributorName NVARCHAR(60) NOT NULL,
      [促销员代码] VARCHAR(50) NOT NULL ,
      [促销员] NVARCHAR(20) NOT NULL ,
      IsResigned BIT ,
      PromoterType INT NOT NULL ,
      [促销类型] VARCHAR(60) NOT NULL ,
      SupervisorID INT NOT NULL ,
      [促销员主管代码] VARCHAR(50) NOT NULL ,
      SupervisorName NVARCHAR(20) NOT NULL ,
      OrgID INT NOT NULL ,
      OrgName NVARCHAR(20) NOT NULL ,
      RegionID INT NOT NULL ,
      [大区] NVARCHAR(20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_WorkType_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_WorkType_Error];
    END
GO
CREATE TABLE [dbo].[Dim_WorkType_Error]
    (
      WorkTypeID INT NOT NULL ,
      [工作类型名称] NVARCHAR(20) NOT NULL ,
      [工作类型时间/天] NUMERIC(18, 6) ,
      [工作类型代码] VARCHAR(20) ,
      IsIncludePromotion BIT ,
      [是否计入促销费用] VARCHAR(20) ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_ActiveType_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ActiveType_Error];
    END
GO
CREATE TABLE [dbo].[Dim_ActiveType_Error]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      [促销活动类型代码] VARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_ProdRoyalt_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdRoyalt_Error];
    END
GO
CREATE TABLE [dbo].[Dim_ProdRoyalt_Error]
    (
      ProdID INT NOT NULL ,
      [返利] NUMERIC(18, 6) ,
      ProdCode NVARCHAR(20) ,
      ProdName NVARCHAR(60) ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO


IF ( OBJECT_ID(N'[Dim_PromoterCategory_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterCategory_Error];
    END
GO
CREATE TABLE [dbo].[Dim_PromoterCategory_Error]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      [促销员分类代码] VARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_SpecialDisplayType_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_SpecialDisplayType_Error];
    END
GO
CREATE TABLE [dbo].[Dim_SpecialDisplayType_Error]
    (
      CompanyID INT NOT NULL ,
      MSItemTypeID INT NOT NULL ,
      [特陈类型代码] VARCHAR(20) NOT NULL ,
      MSItemTypeName NVARCHAR(20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_PromoterProdLine_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterProdLine_Error];
    END
GO
CREATE TABLE [dbo].[Dim_PromoterProdLine_Error]
    (
      DataKey NVARCHAR(23) NOT NULL ,
      [PromoterID] [INT] NOT NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [促销员代码] [VARCHAR](50) NOT NULL ,
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
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

IF ( OBJECT_ID(N'[Dim_ProdExtension_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_ProdExtension_Error];
    END
GO
CREATE TABLE [dbo].[Dim_ProdExtension_Error]
    (
      DataKey NVARCHAR(22) NOT NULL ,
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
      [销售收入科目代码] [VARCHAR](20) NOT NULL ,
      [SalesRevenueAcctName] [NVARCHAR](40) NOT NULL ,
      [销售成本科目代码] [VARCHAR](20) NOT NULL ,
      [SalesCostAcctName] [NVARCHAR](40) NOT NULL ,
      [库存存货科目代码] [VARCHAR](20) NOT NULL ,
      [ICAcctName] [NVARCHAR](40) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
ON  [PRIMARY]

GO

 IF ( OBJECT_ID(N'[Dim_Expense_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Expense_Error];
    END
GO
 CREATE TABLE [dbo].[Dim_Expense_Error]
    (
      [DataKey] [NVARCHAR](22) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [ExpenseID] [INT] NOT NULL ,
      [费用代码] [VARCHAR](10) NOT NULL ,
      [ExpenseName] [NVARCHAR](20) NOT NULL ,
      [ExpenseCategory] [NVARCHAR](20) NOT NULL ,
      [AcctSubjectID] [INT] NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [科目代码] [VARCHAR](20) NOT NULL ,
      [AcctSubjectName] [NVARCHAR](40) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO


 IF ( OBJECT_ID(N'[Dim_AcctType_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_AcctType_Error];
    END
GO
 CREATE TABLE [dbo].[Dim_AcctType_Error]
    (
      [AcctTypeID] [INT] NOT NULL ,
      [AcctTypeName] [NVARCHAR](20) NOT NULL ,
      [ReverseAcctTypeID] [INT] NOT NULL ,
      [ReverseAcctTypeName] [NVARCHAR](20) NOT NULL ,
      [红蓝字] [VARCHAR](4) NOT NULL ,
      [Remark] [NVARCHAR](250) NOT NULL ,
      [IsDisabled] [BIT] NOT NULL ,
      [ROB] [INT] NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO

 IF ( OBJECT_ID(N'[Dim_PromoterCust_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_PromoterCust_Error];
    END
GO
 CREATE TABLE [dbo].[Dim_PromoterCust_Error]
    (
	 [DataKey] NVARCHAR(21) NOT NULL ,
      [PromoterID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [促销员代码] [VARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [客户代码] [VARCHAR](80) NOT NULL ,
      [CustName] [NVARCHAR](60) NOT NULL ,
      [OrgId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO