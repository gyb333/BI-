IF (OBJECT_ID(N'[ICVoucher]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [ICVoucher]
END
GO


CREATE TABLE [ICVoucher]
(
	 [DateKey] INT NOT NULL
	,[BillDate] DATETIME
	,[BillID] INT NOT NULL
	,[MoveTypeID] INT NOT NULL
	,[DistributorID] INT NOT NULL
	,[SrcWarehouseID] INT NOT NULL
	,[ROB] INT
	,[RefBillType] INT
	,CompanyID INT 
)

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_ICVoucher_01'))
BEGIN
    DROP INDEX [dbo].[ICVoucher].[NCIX_ICVoucher_01];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_ICVoucher_01] ON [dbo].[ICVoucher]
([DistributorID],[CompanyID])
INCLUDE ([DateKey],[BillDate],[BillID],[MoveTypeID],[ROB]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_ICVoucher_02'))
BEGIN
    DROP INDEX [dbo].[ICVoucher].[NCIX_ICVoucher_02];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_ICVoucher_02]
ON [dbo].[ICVoucher] ([MoveTypeID])
INCLUDE ([DateKey],[BillDate],[BillID],[DistributorID],[SrcWarehouseID],[ROB],[CompanyID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_ICVoucher_03'))
BEGIN
    DROP INDEX [dbo].[ICVoucher].[NCIX_ICVoucher_03];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_ICVoucher_03]
ON [dbo].[ICVoucher] ([SrcWarehouseID],[CompanyID],[MoveTypeID])
INCLUDE ([DateKey],[BillDate],[BillID],[DistributorID],[ROB]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO