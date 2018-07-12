---------------------------------------------------------

IF ( OBJECT_ID(N'[dbo].[ODS_SDInvoice]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_SDInvoice];
    END
GO

CREATE TABLE [ODS_SDInvoice]
    (
      [BillID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [DistributorID] [INT] NOT NULL ,
      [BillDate] [DATETIME] NOT NULL ,
      [InvType] [INT] NOT NULL ,
      [BillNo] [NVARCHAR](20) NOT NULL ,
      [RefBillNo] [NVARCHAR](40) NULL ,
      [CustID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [Status] [INT] NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SDInvoice_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SDInvoice].[CIX_ODS_SDInvoice_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_SDInvoice_01] ON [dbo].[ODS_SDInvoice]
(
Status,[BillDate],[BillID] ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SDInvoice_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SDInvoice].[CIX_ODS_SDInvoice_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_SDInvoice_02] ON [dbo].[ODS_SDInvoice]
(
Status,[BillDate],[BillID] ASC 
) INCLUDE(
CompanyID ,
CompBranchID ,
DistributorID ,
InvType ,
BillNo ,
RefBillNo ,
CustID ,
EmpID )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


-----------------------------
IF ( OBJECT_ID(N'[dbo].[ODS_SDInvoiceDetl]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_SDInvoiceDetl];
    END
GO

CREATE TABLE [ODS_SDInvoiceDetl]
    (
      [BillID] [INT] NOT NULL ,
      [SDBillID] [INT] NOT NULL ,
      [SDSNO] [INT] NOT NULL ,
      [SDBillNo] [NVARCHAR](20) NOT NULL ,
      [ProdID] [INT] NOT NULL ,
      [OrderTypeID] [INT] NOT NULL ,
      [MinUnitQty] [DECIMAL](15, 4) NOT NULL ,
      [ROB] [INT] NOT NULL ,
      [Amount] [MONEY] NOT NULL ,
      [TaxAmount] [MONEY] NOT NULL ,
      [NotIncTaxAmount] [MONEY] NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SDInvoiceDetl_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SDInvoiceDetl].[CIX_ODS_SDInvoiceDetl_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_SDInvoiceDetl_01] ON [dbo].[ODS_SDInvoiceDetl]
(
[BillID],OrderTypeID ,SDBillID,SDSNO ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SDInvoiceDetl_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SDInvoiceDetl].[CIX_ODS_SDInvoiceDetl_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_SDInvoiceDetl_02] ON [dbo].[ODS_SDInvoiceDetl]
(
[BillID],OrderTypeID ,SDBillID,SDSNO ASC 
) INCLUDE(
          SDBillNo ,
          ProdID ,          
          MinUnitQty ,
          ROB ,
          Amount ,
          TaxAmount ,
          NotIncTaxAmount )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO



------------------------------
IF ( OBJECT_ID(N'[dbo].[ODS_SEDo]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_SEDo];
    END
GO

CREATE TABLE [ODS_SEDo]
    (
      [BillID] [INT] NOT NULL ,
      [BillDate] [DATETIME] NULL ,
	  DoBillDate DATETIME NOT NULL,
      [OrderTypeID] [INT] NOT NULL ,
      [Status] [INT] NOT NULL ,
	  InvoiceStatus INT NOT NULL,
      [DistributorID] [INT] NOT NULL ,
      [CompBranchID] [INT] NOT NULL ,
      [CustID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [CurrID] [INT] NOT NULL ,
      [EmpID] [INT] NOT NULL ,
      [ROB] [INT] NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SEDo_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SEDo].[CIX_ODS_SEDo_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_SEDo_01] ON [dbo].[ODS_SEDo]
(
BillDate,DoBillDate , Status ,[BillID],OrderTypeID,InvoiceStatus ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SEDo_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SEDo].[CIX_ODS_SEDo_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_SEDo_02] ON [dbo].[ODS_SEDo]
(
BillDate ,DoBillDate ,  Status ,[BillID],OrderTypeID,InvoiceStatus ASC 
) INCLUDE(
DistributorID ,
CompBranchID ,
CustID ,
CompanyID ,
CurrID ,
EmpID ,
ROB )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO



---------------------------
IF ( OBJECT_ID(N'[dbo].[ODS_SEDoDetl]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_SEDoDetl];
    END
GO

CREATE TABLE [ODS_SEDoDetl]
    (
      [BillID] [INT] NOT NULL ,
	   [WareHouseID] [INT] NOT NULL ,
      [ProdID] [INT] NOT NULL ,
      [ProdCost] [MONEY] NOT NULL ,
      [SNO] [INT] NOT NULL ,
      [Quantity] [DECIMAL](15, 4) NOT NULL ,
      [InvQty] [DECIMAL](15, 4) NOT NULL ,
      [Price] [DECIMAL](18, 10) NOT NULL,
      --[MinUnitQty] [DECIMAL](15, 4) NOT NULL ,
      --[MinUnitPrice] [DECIMAL](18, 10) NOT NULL,
      [DiscountRate] [DECIMAL](15, 10) NOT NULL 
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SEDoDetl_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SEDoDetl].[CIX_ODS_SEDoDetl_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_SEDoDetl_01] ON [dbo].[ODS_SEDoDetl]
(
[BillID],SNO, ProdID  ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_SEDoDetl_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_SEDoDetl].[CIX_ODS_SEDoDetl_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_SEDoDetl_02] ON [dbo].[ODS_SEDoDetl]
(
[BillID],SNO, ProdID           ASC 
) INCLUDE(WareHouseID,
ProdCost ,
Quantity ,
InvQty ,
Price  ,
--MinUnitQty ,
--MinUnitPrice,
DiscountRate )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


SELECT * FROM dbo.ODS_SEDoDetl