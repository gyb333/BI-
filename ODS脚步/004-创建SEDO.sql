IF (OBJECT_ID(N'[dbo].[SEDo]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[SEDo];
END
GO

CREATE TABLE [dbo].[SEDo] 
(
    [DateKey] int,
    [BillDate] datetime,
    [DistributorID] int,
    [BillID] int,
    [ROB] int,
    [DoBillDate] datetime,
    [GZDateKey] int,
    [OrderTypeID] int,
    [CompanyID] int,
    [CustID] int,
    [EmpID] int,
    [CompBranchID] int,
    [ShipToCustID] int,
    [SaleType] int,
    [SalesModeID] int,
    [Status] int,
    [MoveTypeSubID] int,
    [SubSysType] int,
    [InvoiceStatus] int
)
GO



IF (EXISTS(SELECT 1 FROM sys.indexes AS ix WHERE ix.name = 'NCIX_SEDo_01'))
BEGIN
	DROP INDEX [dbo].[SEDo].[NCIX_SEDo_01];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_SEDo_01] ON [dbo].[SEDo]
(
	[OrderTypeID] ASC,
	[CompanyID] ASC,
	[DistributorID] ASC,
	[BillID] ASC,
	[CustID] ASC,
	[EmpID] ASC
)
INCLUDE ( 	[DoBillDate],
	[DateKey],
	[BillDate],
	[GZDateKey],
	[CompBranchID],
	[ShipToCustID],
	[SaleType],
	[SalesModeID],
	[Status],
	[MoveTypeSubID],
	[SubSysType],
	[InvoiceStatus],
	[ROB]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM sys.indexes AS ix WHERE ix.name = 'NCIX_SEDo_02'))
BEGIN
	DROP INDEX [dbo].[SEDo].[NCIX_SEDo_02];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_SEDo_02]
ON [dbo].[SEDo] ([CustID])
INCLUDE ([DateKey],[DistributorID],[BillID],[ROB],[DoBillDate],[GZDateKey],[OrderTypeID],[CompanyID],[EmpID],[CompBranchID],[ShipToCustID],[SaleType],[SalesModeID],[Status],[MoveTypeSubID],[SubSysType],[InvoiceStatus]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO