IF ( OBJECT_ID(N'[dbo].[Fact_PromoterPay]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_PromoterPay];
    END
GO

CREATE TABLE [Fact_PromoterPay]
    (
      [DateKey] [INT] NOT NULL ,
      [NextYearDateKey] [INT] NULL ,
      [PromoterID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      AttendedDays NUMERIC(18, 6) NOT NULL ,
      FullAttendedDays NUMERIC(18, 6) NOT NULL ,
      Allowance NUMERIC(18, 6) NOT NULL ,
      BasePay NUMERIC(18, 6) NOT NULL ,
      MeritPay NUMERIC(18, 6) NOT NULL ,
      PromoterCode [NVARCHAR](50) NOT NULL ,
      [PromoterName] [NVARCHAR](20) NOT NULL ,
      [IsProced] BIT
    )
GO

 
          


IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_PromoterPay_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_PromoterPay].[CIX_Fact_PromoterPay_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PromoterPay_01] ON [dbo].[Fact_PromoterPay]
(
[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_PromoterPay_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_PromoterPay].[NCIX_Fact_PromoterPay_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_PromoterPay_02] ON [dbo].[Fact_PromoterPay]
(
[NextYearDateKey] ASC
)
INCLUDE ( 	PromoterID ,
RegionId ,
RegionName ,
OrgID ,
OrgName ,
AttendedDays ,
FullAttendedDays ,
Allowance ,
BasePay ,
MeritPay ,
PromoterCode ,
PromoterName ,
IsProced) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
---------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_CustCreditAmount]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_CustCreditAmount];
    END
GO

CREATE TABLE [Fact_CustCreditAmount]
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
      CreditAmount NUMERIC(18, 6) NOT NULL ,
      TempCreditAmount NUMERIC(18, 6) NOT NULL ,
      [CreditDays] [INT] NOT NULL ,
      [IsProced] BIT
    )
GO

 
 
          


IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_CustCreditAmount_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_CustCreditAmount].[CIX_Fact_CustCreditAmount_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_CustCreditAmount_01] ON [dbo].[Fact_CustCreditAmount]
(
[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_CustCreditAmount_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_CustCreditAmount].[NCIX_Fact_CustCreditAmount_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_CustCreditAmount_02] ON [dbo].[Fact_CustCreditAmount]
(
[CustID],ProdLineID ASC
)
INCLUDE ( 	OrgID ,
OrgName ,
RegionId ,
RegionName ,
CreditType ,
CreditTypeName ,
CompanyID ,
DistributorId ,
CustName ,
CurrID ,
CreditAmount ,
TempCreditAmount ,
CreditDays ,
IsProced) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO



-------------事实表Fact_APMonthInve

IF ( OBJECT_ID(N'[dbo].[Fact_APMonthInve]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_APMonthInve];
    END
GO

CREATE TABLE [Fact_APMonthInve]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [BeginAmount] [NUMERIC](18, 6) NULL ,
      [EndAmount] [NUMERIC](18, 6) NULL ,
      [APAmount] [NUMERIC](18, 6) NULL ,
      [PayAmount] [NUMERIC](18, 6) NULL ,
      [APBeginEstAmt] [NUMERIC](18, 6) NULL ,
      [APEndEstAmt] [NUMERIC](18, 6) NULL ,
      [IsProced] BIT
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_APMonthInve_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_APMonthInve].[CIX_Fact_APMonthInve_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_APMonthInve_01] ON [dbo].[Fact_APMonthInve]
(
[DateKey] ASC 
) 

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_APMonthInve_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_APMonthInve].[NCIX_Fact_APMonthInve_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_APMonthInve_02] ON [dbo].[Fact_APMonthInve]
(
[NextYearDateKey]  ASC
)
INCLUDE([DistributorID],[CompBranchID],SuppID,CurrID,BeginAmount,[EndAmount],ApAmount,PayAmount,[APBeginEstAmt],[APEndEstAmt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


-------------事实表Fact_APVoucher

IF ( OBJECT_ID(N'[dbo].[Fact_APVoucher]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_APVoucher];
    END
GO

CREATE TABLE [Fact_APVoucher]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
	  AcctTypeID INT NOT NULL,
	  AcctStatus INT NOT NULL,
      [Status] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [CheckAmount] [NUMERIC](18, 6) NULL ,
      [APAmount] [NUMERIC](18, 6) NULL ,
      [PayAmount] [NUMERIC](18, 6) NULL ,
      [IsProced] BIT
    )
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_APVoucher_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_APVoucher].[CIX_Fact_APVoucher_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_APVoucher_01] ON [dbo].[Fact_APVoucher]
(
[DateKey] ASC 
) 

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_APVoucher_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_APVoucher].[NCIX_Fact_APVoucher_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_APVoucher_02] ON [dbo].[Fact_APVoucher]
(
[NextYearDateKey]  ASC
)
INCLUDE([DistributorID],[CompBranchID],AcctTypeID,AcctStatus,[Status],SuppID,CurrID,[CheckAmount],ApAmount,PayAmount) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
 

------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_PSInvoice]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_PSInvoice];
    END
GO

CREATE TABLE [Fact_PSInvoice]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [Status] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [APAmount] [NUMERIC](18, 6) NULL ,
      [PayAmount] [NUMERIC](18, 6) NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_PSInvoice_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_PSInvoice].[CIX_Fact_PSInvoice_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PSInvoice_01] ON [dbo].[Fact_PSInvoice]
(
[DateKey] ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_PSInvoice_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_PSInvoice].[CIX_Fact_PSInvoice_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_PSInvoice_02] ON [dbo].[Fact_PSInvoice]
(
[NextYearDateKey] ASC 
) INCLUDE(
OrgID,
RegionId,
OrgName,
RegionName,
Status,
DistributorID,
CompBranchID,
SuppID,
CurrID,
[ApAmount] ,[PayAmount])

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 

 
 
 


---------------------------------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_CustARAmount]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_CustARAmount];
    END
GO

CREATE TABLE [Fact_CustARAmount]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [DistributorID] INT NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [BillID] INT NOT NULL ,
      [BillNo] [NVARCHAR](20) NOT NULL ,
      [AcctTypeID] [INT] NOT NULL ,
      [PaymentTypeID] [INT] NOT NULL ,
      [StatusId] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [empID] [INT] NOT NULL ,
      [ARAmount] [NUMERIC](18, 6) NULL ,
      --[OrgName] [NVARCHAR](20) NOT NULL ,
      --[RegionName] [NVARCHAR](20) NOT NULL ,
      --[CompBranchName] [NVARCHAR](60) NOT NULL ,
      --[CompanyName] [NVARCHAR](60) NOT NULL ,
      --[CustName] [NVARCHAR](60) NOT NULL ,
      --[CustCode] [NVARCHAR](60) NULL ,
      --[AcctTypeName] [NVARCHAR](20) NOT NULL ,
      --[PaymentTypeName] [NVARCHAR](20) NOT NULL ,
      --[StatusDesc] [NVARCHAR](40) NOT NULL ,
      --[EmpName] [NVARCHAR](20) NULL ,
      --[CurrCode] [NVARCHAR](10) NOT NULL ,
      [IsProced] BIT
    )
GO




IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_CustARAmount_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_CustARAmount].[CIX_Fact_CustARAmount_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_CustARAmount_01] ON [dbo].[Fact_CustARAmount]
(
[DateKey],[BillID] ASC 
) 

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_CustARAmount_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_CustARAmount].[NCIX_Fact_CustARAmount_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_CustARAmount_02] ON [dbo].[Fact_CustARAmount]
(
[NextYearDateKey],[BillID]  ASC
)
INCLUDE(OrgID ,
RegionId ,
CompBranchID ,
[DistributorID],
CompanyID ,
CustID ,
BillNo ,
AcctTypeID ,
PaymentTypeID ,
StatusId ,
CurrID ,
empID ,
ARAmount ,
IsProced) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( OBJECT_ID(N'[dbo].[Fact_CustARAmount_ZL]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_CustARAmount_ZL];
    END
GO

SELECT TOP 0
        *
INTO    [dbo].[Fact_CustARAmount_ZL]
FROM    [dbo].[Fact_CustARAmount]



IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_CustARAmount_ZL_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_CustARAmount_ZL].[CIX_Fact_CustARAmount_ZL_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_CustARAmount_ZL_01] ON [dbo].[Fact_CustARAmount_ZL]
(
[DateKey],[BillID],[IsProced] ASC 
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF ( OBJECT_ID(N'[dbo].[view_Fact_CustARAmount]', N'V') IS NOT NULL )
    BEGIN
        DROP VIEW [dbo].[view_Fact_CustARAmount];
    END
GO

CREATE VIEW [dbo].[view_Fact_CustARAmount]
AS
    SELECT  *
    FROM    Fact_CustARAmount
    UNION ALL
    SELECT  *
    FROM    Fact_CustARAmount_ZL
    WHERE   IsProced IS NULL
GO


------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_SDInvoice]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SDInvoice];
    END
GO

CREATE TABLE [Fact_SDInvoice]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      BillID INT NOT NULL ,
      [BillNo] [NVARCHAR](20) NOT NULL ,
      [RefBillNo] [NVARCHAR](40) NOT NULL ,
	  SDBillID INT,
      [SDBillNo] [NVARCHAR](20) NOT NULL ,
      [InvType] INT NULL ,
      [CustID] [INT] NOT NULL ,
      [CustTypeID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [DeptID] [INT] NULL ,
      [ProdID] [INT] NOT NULL ,
      [ProdOtherTypeID] [INT] NULL ,
      [MinUnitQty] [NUMERIC](32, 6) NULL ,
	  [AuxiUnitQty] [NUMERIC](32, 6) NULL ,
	  [BasePackUnitQty] [NUMERIC](32, 6) NULL ,
      [Amount] [NUMERIC](32, 6) NULL ,
      [TaxAmount] [NUMERIC](32, 6) NULL ,
      [NoTaxAmount] [NUMERIC](32, 6) NULL ,
      [WareHouseID] [INT] NULL ,
      [ProdQty] [NUMERIC](32, 6) NULL ,
      [SdQty] [NUMERIC](32, 6) NULL ,
      [MAmount] [NUMERIC](32, 6) NULL ,
	  [TotalAmount] [NUMERIC](32, 6) NULL ,
	  [DataKey] NVARCHAR(28) NOT NULL,
	  SDSNO INT NOT NULL,
      [IsProced] BIT
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SDInvoice_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SDInvoice].[CIX_Fact_SDInvoice_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SDInvoice_01] ON [dbo].[Fact_SDInvoice]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SDInvoice_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SDInvoice].[CIX_Fact_SDInvoice_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_SDInvoice_02] ON [dbo].[Fact_SDInvoice]
(
[NextYearDateKey] ASC 
) INCLUDE(
OrgID ,
OrgName ,
RegionId ,
RegionName ,
CompanyID ,
DistributorID ,
CompBranchID ,
BillID,
BillNo ,
RefBillNo ,
SDBillID,
SDBillNo ,
InvType ,
CustID ,
EmpID ,
ProdID ,
[MinUnitQty] ,
[AuxiUnitQty],
[BasePackUnitQty],
Amount ,
TaxAmount ,
NoTaxAmount ,
WareHouseID ,
ProdQty ,
SdQty ,
[MAmount],
[TotalAmount],
[DataKey],SDSNO )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
 

IF ( OBJECT_ID(N'[dbo].[Fact_SDInvoice_ZL]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SDInvoice_ZL];
    END
GO

SELECT TOP 0
        *
INTO    [dbo].[Fact_SDInvoice_ZL]
FROM    [dbo].[Fact_SDInvoice]

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SDInvoice_ZL_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SDInvoice_ZL].[CIX_Fact_SDInvoice_ZL_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SDInvoice_ZL_01] ON [dbo].[Fact_SDInvoice_ZL]
(
[DateKey],[DataKey],[IsProced] ASC 
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF ( OBJECT_ID(N'[dbo].[view_Fact_SDInvoice]', N'V') IS NOT NULL )
    BEGIN
        DROP VIEW [dbo].[view_Fact_SDInvoice];
    END
GO

CREATE VIEW [dbo].[view_Fact_SDInvoice]
AS
    SELECT  *
    FROM    Fact_SDInvoice
    UNION ALL
    SELECT  *
    FROM    Fact_SDInvoice_ZL
    WHERE   IsProced IS NULL

GO


 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_ARCost]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_ARCost];
    END
GO

CREATE TABLE [Fact_ARCost]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [BillDate] [NVARCHAR](10) NOT NULL ,
      BillID INT NOT NULL ,
      [BillNo] [NVARCHAR](20) NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [ExpenseID] [INT] NOT NULL ,
      [AcctTypeID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
	  StatusId INT NOT NULL,
      [StatusDesc] [NVARCHAR](40) NOT NULL ,
      [CheckStatusID] [INT] NOT NULL ,
      [CheckStatus] [NVARCHAR](10) NULL ,
      [ARAmount] [NUMERIC](18, 6) NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARCost_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARCost].[CIX_Fact_ARCost_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_ARCost_01] ON [dbo].[Fact_ARCost]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARCost_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARCost].[CIX_Fact_ARCost_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_ARCost_02] ON [dbo].[Fact_ARCost]
(
[NextYearDateKey] ASC 
) INCLUDE(
RegionId ,
RegionName ,
OrgID ,
OrgName ,
CompBranchID ,
CompanyID ,
BillDate ,
BillID,
BillNo ,
CustID ,
ExpenseID ,
AcctTypeID ,
EmpID ,
StatusId,
StatusDesc ,
CheckStatusID ,
CheckStatus ,
ARAmount )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 
 --------------------------------

IF ( OBJECT_ID(N'[dbo].[Fact_MCSaleVoucher]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_MCSaleVoucher];
    END
GO

CREATE TABLE [Fact_MCSaleVoucher]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [SuppID] [INT] NOT NULL ,
      [BillID] [INT] NOT NULL ,
      [Introducer] [NVARCHAR](20) NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [DeptID] [INT] NOT NULL ,
      [EmpID] [INT] NULL ,
      [Amount] [NUMERIC](18, 6) NULL ,
      [Qty] [NUMERIC](18, 6) NULL ,
      [Wgt] [NUMERIC](18, 6) NULL ,
      [Profit] [NUMERIC](18, 6) NULL ,
      [Status] [INT] NOT NULL
    )
GO         


IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_MCSaleVoucher_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_MCSaleVoucher].[CIX_Fact_MCSaleVoucher_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_MCSaleVoucher_01] ON [dbo].[Fact_MCSaleVoucher]
(
[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'NCIX_Fact_MCSaleVoucher_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_MCSaleVoucher].[NCIX_Fact_MCSaleVoucher_02]
    END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_MCSaleVoucher_02] ON [dbo].[Fact_MCSaleVoucher]
(
[NextYearDateKey] ASC
)
INCLUDE ( 	
RegionId ,
RegionName ,
OrgID ,
OrgName ,
CompanyID ,
DistributorID ,
SuppID ,
BillID ,
Introducer ,
CustID ,
DeptID ,
EmpID ,
Amount ,
Qty ,
Wgt ,
Profit ,
Status) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_NewTQCust]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_NewTQCust];
    END
GO

CREATE TABLE [Fact_NewTQCust]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [AreaID] [INT] NOT NULL ,
      [BillID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [Introducer] [NVARCHAR](20) NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_NewTQCust_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_NewTQCust].[CIX_Fact_NewTQCust_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_NewTQCust_01] ON [dbo].[Fact_NewTQCust]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_NewTQCust_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_NewTQCust].[CIX_Fact_NewTQCust_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_NewTQCust_02] ON [dbo].[Fact_NewTQCust]
(
[NextYearDateKey] ASC 
) INCLUDE(
RegionId ,
RegionName ,
OrgID ,
OrgName ,
CompBranchID ,
CompanyID ,
DistributorID ,
AreaID ,
BillID ,
CustID ,
Introducer )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 


 ------------------------------
 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_ARMonthInve]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_ARMonthInve];
    END
GO

CREATE TABLE [Fact_ARMonthInve]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [BeginAmount] [NUMERIC](32, 6) NULL ,
      [RecAmount] [NUMERIC](32, 6) NULL ,
      [ARAmount] [NUMERIC](32, 6) NULL ,
      [EndAmount] [NUMERIC](32, 6) NULL ,
      [IsProced] BIT
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARMonthInve_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARMonthInve].[CIX_Fact_ARMonthInve_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_ARMonthInve_01] ON [dbo].[Fact_ARMonthInve]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARMonthInve_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARMonthInve].[CIX_Fact_ARMonthInve_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_ARMonthInve_02] ON [dbo].[Fact_ARMonthInve]
(
[NextYearDateKey] ASC 
) INCLUDE(
OrgID ,
RegionId ,
DistributorID ,
CompBranchID ,
CustID ,
CurrID ,
EmpID ,
CompanyID ,
BeginAmount,[RecAmount],[ARAmount],[EndAmount] )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 
IF ( OBJECT_ID(N'[dbo].[Fact_ARMonthInve_ZL]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_ARMonthInve_ZL];
    END
GO

SELECT TOP 0
        *
INTO    [dbo].[Fact_ARMonthInve_ZL]
FROM    [dbo].[Fact_ARMonthInve]

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARMonthInve_ZL_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARMonthInve_ZL].[CIX_Fact_ARMonthInve_ZL_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_ARMonthInve_ZL_01] ON [dbo].[Fact_ARMonthInve_ZL]
(
[DateKey],[IsProced] ASC 
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( OBJECT_ID(N'[dbo].[view_Fact_ARMonthInve]', N'V') IS NOT NULL )
    BEGIN
        DROP VIEW [dbo].[view_Fact_ARMonthInve];
    END
GO

CREATE VIEW [dbo].[view_Fact_ARMonthInve]
AS
    SELECT  *
    FROM    Fact_ARMonthInve
    UNION ALL
    SELECT  *
    FROM    Fact_ARMonthInve_ZL
    WHERE   IsProced IS NULL

GO

 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_ARVoucher]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_ARVoucher];
    END
GO

CREATE TABLE [Fact_ARVoucher]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
	  AcctTypeID INT NOT NULL,
	  AcctStatus INT NOT NULL,
      [CustID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [BeginAmount] [NUMERIC](32, 6) NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [ARAmount] [NUMERIC](32, 6) NULL ,
      [RVAmount] [NUMERIC](32, 6) NULL ,
      [CheckAmount] [NUMERIC](32, 6) NULL ,
	  CheckAmountROB [NUMERIC](32, 6) NOT NULL,
      [IsProced] BIT
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARVoucher_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARVoucher].[CIX_Fact_ARVoucher_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_ARVoucher_01] ON [dbo].[Fact_ARVoucher]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARVoucher_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARVoucher].[CIX_Fact_ARVoucher_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_ARVoucher_02] ON [dbo].[Fact_ARVoucher]
(
[NextYearDateKey] ASC 
) INCLUDE(
OrgID ,
RegionId ,
DistributorID ,
CompBranchID ,
AcctTypeID,
AcctStatus,
CustID ,
CurrID ,
EmpID ,
CompanyID ,
BeginAmount,[ARAmount],RVAmount,CheckAmount,CheckAmountROB )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 
IF ( OBJECT_ID(N'[dbo].[Fact_ARVoucher_ZL]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_ARVoucher_ZL];
    END
GO

SELECT TOP 0
        *
INTO    [dbo].[Fact_ARVoucher_ZL]
FROM    [dbo].[Fact_ARVoucher]

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_ARVoucher_ZL_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_ARVoucher_ZL].[CIX_Fact_ARVoucher_ZL_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_ARVoucher_ZL_01] ON [dbo].[Fact_ARVoucher_ZL]
(
[DateKey],[IsProced] ASC 
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( OBJECT_ID(N'[dbo].[view_Fact_ARVoucher]', N'V') IS NOT NULL )
    BEGIN
        DROP VIEW [dbo].[view_Fact_ARVoucher];
    END
GO

CREATE VIEW [dbo].[view_Fact_ARVoucher]
AS
    SELECT  *
    FROM    Fact_ARVoucher
    UNION ALL
    SELECT  *
    FROM    Fact_ARVoucher_ZL
    WHERE   IsProced IS NULL

GO


 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_SEDO]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SEDO];
    END
GO

CREATE TABLE [Fact_SEDO]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionId] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [LockAmount] [NUMERIC](18, 6) NULL ,
      [IsProced] BIT
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SEDO_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SEDO].[CIX_Fact_SEDO_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SEDO_01] ON [dbo].[Fact_SEDO]
(
[DateKey]ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SEDO_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SEDO].[CIX_Fact_SEDO_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_SEDO_02] ON [dbo].[Fact_SEDO]
(
[NextYearDateKey] ASC 
) INCLUDE(
OrgID ,
RegionId ,
DistributorID ,
CompBranchID ,
CustID ,
CompanyID ,
CurrID ,
EmpID ,
LockAmount )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 
IF ( OBJECT_ID(N'[dbo].[Fact_SEDO_ZL]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SEDO_ZL];
    END
GO

SELECT TOP 0
        *
INTO    [dbo].[Fact_SEDO_ZL]
FROM    [dbo].[Fact_SEDO]

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SEDO_ZL_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SEDO_ZL].[CIX_Fact_SEDO_ZL_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SEDO_ZL_01] ON [dbo].[Fact_SEDO_ZL]
(
[DateKey],[IsProced] ASC 
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
 
IF ( OBJECT_ID(N'[dbo].[view_Fact_SEDO]', N'V') IS NOT NULL )
    BEGIN
        DROP VIEW [dbo].[view_Fact_SEDO];
    END
GO

CREATE VIEW [dbo].[view_Fact_SEDO]
AS
    SELECT  *
    FROM    Fact_SEDO
    UNION ALL
    SELECT  *
    FROM    Fact_SEDO_ZL
    WHERE   IsProced IS NULL

GO


 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_SalesPlan]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SalesPlan];
    END
GO

CREATE TABLE [Fact_SalesPlan]
    (
	  [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [CompanySalesPlanID] [INT] NOT NULL ,
      [DistributorContractID] [INT] NOT NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [ProdBrandID] [INT] NOT NULL ,
      [ProdBreedID] [INT] NOT NULL ,
      [ProductLevel] [INT] NOT NULL ,
      [CustSysID] [INT]  ,
      [CityID] [INT] NOT NULL ,
      [CountyID] [INT] NOT NULL ,
      [JanAmount_Plan] [NUMERIC](18, 6) NULL ,
      [JanAmount_Actual] [NUMERIC](18, 6) NULL ,
      [FebAmount_Plan] [NUMERIC](18, 6) NULL ,
      [FebAmount_Actual] [NUMERIC](18, 6) NULL ,
      [MarAmount_Plan] [NUMERIC](18, 6) NULL ,
      [MarAmount_Actual] [NUMERIC](18, 6) NULL ,
      [AprAmount_Plan] [NUMERIC](18, 6) NULL ,
      [AprAmount_Actual] [NUMERIC](18, 6) NULL ,
      [MayAmount_Plan] [NUMERIC](18, 6) NULL ,
      [MayAmount_Actual] [NUMERIC](18, 6) NULL ,
      [JunAmount_Plan] [NUMERIC](18, 6) NULL ,
      [JunAmount_Actual] [NUMERIC](18, 6) NULL ,
      [JulAmount_Plan] [NUMERIC](18, 6) NULL ,
      [JulAmount_Actual] [NUMERIC](18, 6) NULL ,
      [AugAmount_Plan] [NUMERIC](18, 6) NULL ,
      [AugAmount_Actual] [NUMERIC](18, 6) NULL ,
      [SepAmount_Plan] [NUMERIC](18, 6) NULL ,
      [SepAmount_Actual] [NUMERIC](18, 6) NULL ,
      [OctAmount_Plan] [NUMERIC](18, 6) NULL ,
      [OctAmount_Actual] [NUMERIC](18, 6) NULL ,
      [NovAmount_Plan] [NUMERIC](18, 6) NULL ,
      [NovAmount_Actual] [NUMERIC](18, 6) NULL ,
      [DecAmount_Plan] [NUMERIC](18, 6) NULL ,
      [DecAmount_Actual] [NUMERIC](18, 6) NULL ,
      [TotalAmount_Plan] [NUMERIC](18, 6) NULL ,
      [TotalAmount_Actual] [NUMERIC](18, 6) NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SalesPlan_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SalesPlan].[CIX_Fact_SalesPlan_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SalesPlan_01] ON [dbo].[Fact_SalesPlan]
(
DateKey,NextYearDateKey,RegionId ,OrgID ,CompanySalesPlanID ,DistributorContractID ,
ProdLineID ,ProdBrandID ,ProdBreedID ,ProductLevel ,CustSysID ,
CityID ,CountyID ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SalesPlan_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SalesPlan].[CIX_Fact_SalesPlan_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_SalesPlan_02] ON [dbo].[Fact_SalesPlan]
(
DateKey,NextYearDateKey,RegionId ,OrgID ,CompanySalesPlanID ,DistributorContractID ,
ProdLineID ,ProdBrandID ,ProdBreedID ,ProductLevel ,CustSysID ,
CityID ,CountyID ASC 
) INCLUDE(
JanAmount_Plan ,
JanAmount_Actual ,
FebAmount_Plan ,
FebAmount_Actual ,
MarAmount_Plan ,
MarAmount_Actual ,
AprAmount_Plan ,
AprAmount_Actual ,
MayAmount_Plan ,
MayAmount_Actual ,
JunAmount_Plan ,
JunAmount_Actual ,
JulAmount_Plan ,
JulAmount_Actual ,
AugAmount_Plan ,
AugAmount_Actual ,
SepAmount_Plan ,
SepAmount_Actual ,
OctAmount_Plan ,
OctAmount_Actual ,
NovAmount_Plan ,
NovAmount_Actual ,
DecAmount_Plan ,
DecAmount_Actual ,
TotalAmount_Plan ,
TotalAmount_Actual )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 

 
 ------------------------------
IF ( OBJECT_ID(N'[dbo].[Fact_SEPlan]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[Fact_SEPlan];
    END
GO

CREATE TABLE [Fact_SEPlan]
    (
      [DateKey] [INT] NULL ,
      [NextYearDateKey] [INT] NULL ,
      [RegionId] [INT] NOT NULL ,
      [OrgID] [INT] NOT NULL ,
      [RegionName] [NVARCHAR](20) NOT NULL ,
      [OrgName] [NVARCHAR](20) NOT NULL ,
      [BillID] [INT] NOT NULL ,
      [SNo] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [PlanType] [INT] NOT NULL ,
      [Status] [INT] NOT NULL ,
      [PlanYear] [INT] NOT NULL ,
      [PlanMonth] [INT] NOT NULL ,
      [DeptID] [INT] NOT NULL ,
      [SalesAreaID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [ProdLineID] [INT] NOT NULL ,
      [ProdBrandID] [INT] NOT NULL ,
      [ProdBreedID] [INT] NOT NULL ,
      [TaskQuatity] [NUMERIC](18, 6) NULL ,
      [UnitType] [INT] NOT NULL ,
      [ProdOtherTypeID] [INT] NOT NULL ,
      [SalesAreaExID] [INT] NOT NULL ,
      [CustChannelTypeID] [INT] NOT NULL ,
      [CustSysID] [INT] NOT NULL ,
      [SAreaID] [INT] NOT NULL ,
      [QAreaID] [INT] NOT NULL ,
      [ProductID] [INT] NOT NULL ,
      [CustomerOtherTypeID] [INT] NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SEPlan_01' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SEPlan].[CIX_Fact_SEPlan_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SEPlan_01] ON [dbo].[Fact_SEPlan]
(
[DateKey] ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_Fact_SEPlan_02' ) )
    BEGIN
        DROP INDEX [dbo].[Fact_SEPlan].[CIX_Fact_SEPlan_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_Fact_SEPlan_02] ON [dbo].[Fact_SEPlan]
(
[NextYearDateKey] ASC 
) INCLUDE(
RegionId ,
OrgID ,
RegionName ,
OrgName ,
BillID ,
SNo ,
CompanyID ,
DistributorID ,
PlanType ,
Status ,
PlanYear ,
PlanMonth ,
DeptID ,
SalesAreaID ,
EmpID ,
CustID ,
ProdLineID ,
ProdBrandID ,
ProdBreedID ,
TaskQuatity ,
UnitType ,
ProdOtherTypeID ,
SalesAreaExID ,
CustChannelTypeID ,
CustSysID ,
SAreaID ,
QAreaID ,
ProductID ,
CustomerOtherTypeID )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO
 

 
 
 
 

 


