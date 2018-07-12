 IF ( OBJECT_ID(N'[Fact_PromoterPay_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Fact_PromoterPay_Error];
    END
GO
 CREATE TABLE [dbo].[Fact_PromoterPay_Error]
    (
      [DateKey] [INT] NOT NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [PromoterID] [INT] NOT NULL ,
      [在岗天数] [DECIMAL](18, 1) NOT NULL ,
      [当月天数] [DECIMAL](18, 1) NOT NULL ,
      [津贴] [MONEY] NOT NULL ,
      [基本工资] [MONEY] NOT NULL ,
      [绩效工资] [MONEY] NOT NULL ,
      [促销员代码] [VARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO





 IF ( OBJECT_ID(N'[Fact_CustCreditAmount_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Fact_CustCreditAmount_Error];
    END
GO
 CREATE TABLE [dbo].[Fact_CustCreditAmount_Error]
    (
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [CreditType] [INT] NOT NULL ,
      [CreditTypeName] [NVARCHAR](10) NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorId] [INT] NOT NULL ,
      [CustName] [NVARCHAR](60) NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [固定额度] [MONEY] NOT NULL ,
      [临时额度] [MONEY] NOT NULL ,
      [CreditDays] [INT] NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO


 IF ( OBJECT_ID(N'[Fact_CustCreditAmount_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Fact_CustCreditAmount_Error];
    END
GO
 CREATE TABLE [dbo].[Fact_CustCreditAmount_Error]
    (
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [CreditType] [INT] NOT NULL ,
      [CreditTypeName] [NVARCHAR](10) NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorId] [INT] NOT NULL ,
      [CustName] [NVARCHAR](60) NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [固定额度] [MONEY] NOT NULL ,
      [临时额度] [MONEY] NOT NULL ,
      [CreditDays] [INT] NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO


  IF ( OBJECT_ID(N'[Fact_APMonthInve_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Fact_APMonthInve_Error];
    END
GO
 CREATE TABLE [dbo].[Fact_APMonthInve_Error]
    (
      [DateKey] INT NOT NULL ,
      [NextYearDateKey] INT NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [期初金额] [MONEY] NOT NULL ,
      [应付金额] [MONEY] NOT NULL ,
      [付款金额] [MONEY] NOT NULL ,
      [期初暂估] [MONEY] NOT NULL ,
      [应付暂估金额] [MONEY] NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO

 IF ( OBJECT_ID(N'[Fact_APAmount_Error]', 'U') IS NOT NULL )
    BEGIN
        DROP TABLE [Fact_APAmount_Error];
    END
GO
 CREATE TABLE [dbo].[Fact_APAmount_Error]
    (
      [DateKey] INT NOT NULL ,
      [NextYearDateKey] INT NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [期初金额] [MONEY] NOT NULL ,
      [应付金额] [MONEY] NOT NULL ,
      [付款金额] [MONEY] NOT NULL ,
      [期初暂估] [MONEY] NOT NULL ,
      [应付暂估金额] [MONEY] NOT NULL ,
      [ErrorCode] [INT] NULL ,
      [ErrorColumn] [INT] NULL
    )
 ON [PRIMARY]

GO
 