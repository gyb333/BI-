IF ( OBJECT_ID(N'[Dim_Promoter_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Dim_Promoter_Error];
    END
GO
CREATE TABLE [dbo].[Dim_Promoter_Error]
    (
      PromoterID INT NOT NULL ,
      CompanyID INT NOT NULL ,
      [�˺�] NVARCHAR(60) NOT NULL ,
      DistributorID INT NOT NULL ,
	  DistributorName NVARCHAR(60) NOT NULL,
      [����Ա����] VARCHAR(50) NOT NULL ,
      [����Ա] NVARCHAR(20) NOT NULL ,
      IsResigned BIT ,
      PromoterType INT NOT NULL ,
      [��������] VARCHAR(60) NOT NULL ,
      SupervisorID INT NOT NULL ,
      [����Ա���ܴ���] VARCHAR(50) NOT NULL ,
      SupervisorName NVARCHAR(20) NOT NULL ,
      OrgID INT NOT NULL ,
      OrgName NVARCHAR(20) NOT NULL ,
      RegionID INT NOT NULL ,
      [����] NVARCHAR(20) NOT NULL ,
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
      [������������] NVARCHAR(20) NOT NULL ,
      [��������ʱ��/��] NUMERIC(18, 6) ,
      [�������ʹ���] VARCHAR(20) ,
      IsIncludePromotion BIT ,
      [�Ƿ�����������] VARCHAR(20) ,
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
      [��������ʹ���] VARCHAR(20) NOT NULL ,
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
      [����] NUMERIC(18, 6) ,
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
      [����Ա�������] VARCHAR(20) NOT NULL ,
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
      [�س����ʹ���] VARCHAR(20) NOT NULL ,
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
      [����Ա����] [VARCHAR](50) NOT NULL ,
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
      [���������Ŀ����] [VARCHAR](20) NOT NULL ,
      [SalesRevenueAcctName] [NVARCHAR](40) NOT NULL ,
      [���۳ɱ���Ŀ����] [VARCHAR](20) NOT NULL ,
      [SalesCostAcctName] [NVARCHAR](40) NOT NULL ,
      [�������Ŀ����] [VARCHAR](20) NOT NULL ,
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
      [���ô���] [VARCHAR](10) NOT NULL ,
      [ExpenseName] [NVARCHAR](20) NOT NULL ,
      [ExpenseCategory] [NVARCHAR](20) NOT NULL ,
      [AcctSubjectID] [INT] NOT NULL ,
      [DistributorCode] [NVARCHAR](10) NOT NULL ,
      [DistributorName] [NVARCHAR](60) NOT NULL ,
      [��Ŀ����] [VARCHAR](20) NOT NULL ,
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
      [������] [VARCHAR](4) NOT NULL ,
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
      [����Ա����] [VARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [�ͻ�����] [VARCHAR](80) NOT NULL ,
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