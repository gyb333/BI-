IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'CIX_Fact_SaleBill_01'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill].[CIX_Fact_SaleBill_01];
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SaleBill_01] ON [dbo].[Fact_SaleBill]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Sch_Fact_SaleBill_DateKey]([DateKey])
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'NCIX_Fact_SaleBill_02'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill].[NCIX_Fact_SaleBill_02];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_SaleBill_02] ON [dbo].[Fact_SaleBill]
(
	[NextYearDateKey] ASC
)
INCLUDE ( 	[GZDateKey],
	[ProdId],
	[OrgId],
	[BusOfficeId],
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
	[SaleTax],
	[NonTaxSaleAmt],
	[CommAmt],
	[SaleCostAmt],
	[GiveProdCostAmt],
	[SaleGPAmt],
	[IsProced],
	[RegionId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_Fact_SaleBill_Index]

GO