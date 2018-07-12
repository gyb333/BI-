IF (OBJECT_ID(N'[Fact_SaleBill_Base]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_SaleBill_Base];
END
GO

CREATE TABLE [Fact_SaleBill_Base]
(
	 [DateKey] INT
	,[NextYearDateKey] INT
	,[GZDateKey] INT
	,[ProdId] INT
	,[CompBranchId] INT
	,[EmpId] INT
	,[SubCustId] INT
	,[SubWHId] INT
	,[SaleTypeBaseId] INT
	,[SaleMethodId] INT
	,[IsGiveId] INT
	,[OrderTypeId] INT
	,[BillStatusKey] INT
	,[BillTypeId] INT
	,[StatusId] INT
	,[MoveSubTypeId] INT
	,[MoveTypeId] INT
	,[BillSrcId] INT
	,[BatchId] NVARCHAR(31)
	,[InvoiceStatusId] INT
	,[IsDisabledId] BIT
	,[SaleBillId] INT
	,[MinUnitSaleQty] NUMERIC(18, 6)
	,[AuxiUnitSaleQty] NUMERIC(18, 6)
	,[BasePackUnitSaleQty] NUMERIC(18, 6)
	,[SaleWeight] NUMERIC(18, 6)
	,[SaleAmt] NUMERIC(18, 6)
	,[CommAmt] NUMERIC(18, 6)
	,[SaleTax] NUMERIC(18, 6)
	,[NonTaxSaleAmt] NUMERIC(18, 6)
	,[SaleCostAmt] NUMERIC(18, 6)
	,[GiveProdCostAmt] NUMERIC(18, 6)
	,[SaleGPAmt] NUMERIC(18, 6)
	,[RegionId] INT
	,[DistributorContractID] INT
	,[ProdLineID] INT
	,[OrgBranchID] INT
	,[CustID] INT
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'NCIX_Fact_SaleBill_Base_01'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill_Base].[NCIX_Fact_SaleBill_Base_01]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_SaleBill_Base_01] ON [dbo].[Fact_SaleBill_Base]
(
	[DistributorContractID] ASC,
	[ProdLineID] ASC,
	[OrgBranchID] ASC,
	[CustID] ASC
)
INCLUDE ( 	[DateKey],
	[NextYearDateKey],
	[GZDateKey],
	[ProdId],
	[CompBranchId],
	[EmpId],
	[SubCustId],
	[SubWHId],
	[SaleTypeBaseId],
	[SaleMethodId],
	[IsGiveId],
	[OrderTypeId],
	[BillStatusKey],
	[BillTypeId],
	[StatusId],
	[MoveSubTypeId],
	[MoveTypeId],
	[BillSrcId],
	[BatchId],
	[InvoiceStatusId],
	[IsDisabledId],
	[SaleBillId],
	[MinUnitSaleQty],
	[AuxiUnitSaleQty],
	[BasePackUnitSaleQty],
	[SaleWeight],
	[SaleAmt],
	[CommAmt],
	[SaleTax],
	[NonTaxSaleAmt],
	[SaleCostAmt],
	[GiveProdCostAmt],
	[SaleGPAmt],
	[RegionId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'NCIX_Fact_SaleBill_Base_02'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill_Base].[NCIX_Fact_SaleBill_Base_02]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SaleBill_Base_02] ON [dbo].[Fact_SaleBill_Base]
(
	[DistributorContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (OBJECT_ID(N'[Fact_SaleBill_Base_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_SaleBill_Base_Error];
END
GO

CREATE TABLE [Fact_SaleBill_Base_Error] 
(
    [DateKey] int,
    [GZDateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [EmpId] int,
    [SubCustId] int,
    [SubWHId] int,
    [SaleMethodId] int,
    [IsGiveId] int,
    [OrderTypeId] int,
    [BillStatusKey] int,
    [BillTypeId] int,
    [StatusId] int,
    [MoveSubTypeId] int,
    [MoveTypeId] int,
    [BillSrcId] int,
    [BatchId] nvarchar(31),
    [InvoiceStatusId] int,
    [IsDisabledId] bit,
    [最小单位销售量] numeric(26,4),
    [辅助单位销售量] numeric(38,6),
    [外包装单位销售量] numeric(38,6),
    [销售重量] numeric(38,6),
    [销售金额] money,
    [提成金额] numeric(38,6),
    [销售税额] money,
    [不含税销售金额] money,
    [销售成本额] numeric(38,6),
    [销售毛利额] numeric(38,6),
    [RegionId] int,
    [CompanyId] int,
    [SaleBillId] int,
    [NextYearDateKey] int,
    [DistributorContractID] int,
    [ProdLineID] int,
    [OrgBranchID] int,
    [CustID] int,
    [SaleTypeBaseId] int,
    [赠品成本额] numeric(38,6),
    [ErrorCode] int,
    [ErrorColumn] int
)

 