IF (OBJECT_ID(N'[dbo].[Fact_PurcStock]', N'U') IS NOT NULL)
   BEGIN
         DROP TABLE [dbo].[Fact_PurcStock];
   END
GO

CREATE TABLE [Fact_PurcStock]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[ProdId] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[OrderTypeId] INT NOT NULL
	,[SuppId] INT NOT NULL
	,[IsCreditSaleId] BIT
	,[IsElecOrderId] BIT
	,[SubWHId] INT NOT NULL
	,[MoveSubTypeId] INT
	,[InvoiceStatusId] INT
	,[PurcOrderId] INT
	,[PurcStockId] INT
	,[PurcStockQty] NUMERIC(18, 6)
	,[AuxiUnitPurcStockQty] NUMERIC(18, 6)
	,[BasePackUnitPurcStockQty] NUMERIC(18, 6)
	,[PurcStockWeight] NUMERIC(18, 6)
	,[PurcStockAmt] NUMERIC(18, 6)
	,[PurcStockTax] NUMERIC(18, 6)
	,[PurcStockNonTaxAmt] NUMERIC(18, 6)
	,[RegionId] INT NOT NULL
	,[IsProced] BIT
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Fact_PurcStock_01'))
BEGIN
 DROP INDEX [dbo].[Fact_PurcStock].[CIX_Fact_PurcStock_01]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PurcStock_01] ON [dbo].[Fact_PurcStock]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_Fact_PurcStock_02'))
BEGIN
 DROP INDEX [dbo].[Fact_PurcStock].[NCIX_Fact_PurcStock_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_PurcStock_02] ON [dbo].[Fact_PurcStock]
(
	[NextYearDateKey] ASC
)
INCLUDE ( 	[ProdId],
	[OrgId],
	[CompBranchId],
	[OrderTypeId],
	[SuppId],
	[IsCreditSaleId],
	[IsElecOrderId],
	[SubWHId],
	[MoveSubTypeId],
	[InvoiceStatusId],
	[PurcOrderId],
	[PurcStockId],
	[PurcStockQty],
	[AuxiUnitPurcStockQty],
	[BasePackUnitPurcStockQty],
	[PurcStockWeight],
	[PurcStockAmt],
	[PurcStockTax],
	[PurcStockNonTaxAmt],
	[IsProced]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcStock_ZL]', N'U') IS NOT NULL)
   BEGIN
         DROP TABLE [dbo].[Fact_PurcStock_ZL];
   END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_PurcStock_ZL]
FROM [dbo].[Fact_PurcStock]