

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder];
END
GO

CREATE TABLE [dbo].[Fact_PurcOrder]
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
	,[PurcOrderId] INT NOT NULL
	,[PurcOrderQty] NUMERIC(18, 6)
	,[AuxiUnitPurcOrderQty] NUMERIC(18, 6)
	,[BasePackUnitPurcOrderQty] NUMERIC(18, 6)
	,[PurcOrderWeight] NUMERIC(18, 6)
	,[PurcOrderAmt] NUMERIC(18, 6)
	,[PurcOrderTax] NUMERIC(18, 6)
	,[PurcOrderNonTaxAmt] NUMERIC(18, 6)
	,[RegionId] INT NOT NULL
	,[IsProced] BIT
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Fact_PurcOrder_01'))
BEGIN
	DROP INDEX [dbo].[Fact_PurcOrder].[CIX_Fact_PurcOrder_01]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PurcOrder_01] ON [dbo].[Fact_PurcOrder]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_Fact_PurcOrder_02'))
BEGIN
	DROP INDEX [dbo].[Fact_PurcOrder].[NCIX_Fact_PurcOrder_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_PurcOrder_02] ON [dbo].[Fact_PurcOrder]
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
	[PurcOrderId],
	[PurcOrderQty],
	[AuxiUnitPurcOrderQty],
	[BasePackUnitPurcOrderQty],
	[PurcOrderWeight],
	[PurcOrderAmt],
	[PurcOrderTax],
	[PurcOrderNonTaxAmt],
	[RegionId],
	[IsProced]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_ZL]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_ZL];
END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_PurcOrder_ZL]
FROM [dbo].[Fact_PurcOrder]


IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_DER_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_DER_Error];
END
GO
CREATE TABLE [dbo].[Fact_PurcOrder_DER_Error](
	[DateKey] [INT] NULL,
	[ProdId] [INT] NULL,
	[CompBranchId] [INT] NULL,
	[SuppId] [INT] NULL,
	[IsCreditSaleId] [BIT] NULL,
	[IsElecOrderId] [BIT] NULL,
	[采购订单量] [NUMERIC](38, 7) NULL,
	[采购订单金额] [NUMERIC](38, 6) NULL,
	[采购订单税额] [NUMERIC](38, 6) NULL,
	[采购订单不含税金额] [NUMERIC](38, 6) NULL,
	[RegionId] [INT] NULL,
	[OrderTypeId] [INT] NULL,
	[OrgId] [INT] NULL,
	[PurcOrderId] [INT] NULL,
	[CompanyId] [INT] NULL,
	[NextYearDateKey] [INT] NULL,
	[PurcOrderQty] [NUMERIC](18, 4) NULL,
	[PurcOrderAmt] [NUMERIC](18, 4) NULL,
	[PurcOrderTax] [NUMERIC](18, 4) NULL,
	[PurcOrderNonTaxAmt] [NUMERIC](18, 4) NULL,
	[WgtUnitRate] [NUMERIC](18, 10) NULL,
	[AuxiUnitRate] [NUMERIC](18, 10) NULL,
	[MinUnitRate] [NUMERIC](18, 10) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO
IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_Error];
END
GO

CREATE TABLE [dbo].[Fact_PurcOrder_Error](
	[DateKey] [INT] NULL,
	[ProdId] [INT] NULL,
	[CompBranchId] [INT] NULL,
	[SuppId] [INT] NULL,
	[IsCreditSaleId] [BIT] NULL,
	[IsElecOrderId] [BIT] NULL,
	[采购订单量] [NUMERIC](38, 7) NULL,
	[采购订单金额] [NUMERIC](38, 6) NULL,
	[采购订单税额] [NUMERIC](38, 6) NULL,
	[采购订单不含税金额] [NUMERIC](38, 6) NULL,
	[RegionId] [INT] NULL,
	[OrderTypeId] [INT] NULL,
	[OrgId] [INT] NULL,
	[PurcOrderId] [INT] NULL,
	[CompanyId] [INT] NULL,
	[NextYearDateKey] [INT] NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_LKP_ProdRate_Error];
END
GO
CREATE TABLE [dbo].[Fact_PurcOrder_LKP_ProdRate_Error](
	[DateKey] [INT] NULL,
	[ProdId] [INT] NULL,
	[CompBranchId] [INT] NULL,
	[SuppId] [INT] NULL,
	[IsCreditSaleId] [BIT] NULL,
	[IsElecOrderId] [BIT] NULL,
	[采购订单量] [NUMERIC](38, 7) NULL,
	[采购订单金额] [NUMERIC](38, 6) NULL,
	[采购订单税额] [NUMERIC](38, 6) NULL,
	[采购订单不含税金额] [NUMERIC](38, 6) NULL,
	[RegionId] [INT] NULL,
	[OrderTypeId] [INT] NULL,
	[OrgId] [INT] NULL,
	[PurcOrderId] [INT] NULL,
	[CompanyId] [INT] NULL,
	[NextYearDateKey] [INT] NULL,
	[PurcOrderQty] [NUMERIC](18, 4) NULL,
	[PurcOrderAmt] [NUMERIC](18, 4) NULL,
	[PurcOrderTax] [NUMERIC](18, 4) NULL,
	[PurcOrderNonTaxAmt] [NUMERIC](18, 4) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO


--采购返单
IF(OBJECT_ID(N'[dbo].[Fact_PurcReorder]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcReorder]
END
GO


CREATE TABLE [Fact_PurcReorder]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[BillStatusKey] INT NOT NULL
	,[BillTypeId] INT
	,[StatusId] INT
	,[SuppDealStatusId] INT NOT NULL
	,[IsElecOrderId] BIT
	,[PurcOrderId] INT NOT NULL
	,[SysId] BIGINT NOT NULL
	,[RegionId] INT NOT NULL
	,[IsProced] BIT
)
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Fact_PurcReorder_01'))
BEGIN
 DROP INDEX [dbo].[Fact_PurcReorder].[CIX_Fact_PurcReorder_01]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PurcReorder_01] ON [dbo].[Fact_PurcReorder]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_Fact_PurcReorder_02'))
BEGIN
 DROP INDEX [dbo].[Fact_PurcReorder].[NCIX_Fact_PurcReorder_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_PurcReorder_02] ON [dbo].[Fact_PurcReorder]
(
	[NextYearDateKey] ASC
)
INCLUDE ( 	[OrgId]
	,[CompBranchId]
	,[BillStatusKey]
	,[BillTypeId]
	,[StatusId]
	,[SuppDealStatusId] 
	,[IsElecOrderId]
	,[PurcOrderId]
	,[SysId]
	,[RegionId]
	,[IsProced]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcReorder_ZL]', N'U') IS NOT NULL)
   BEGIN
         DROP TABLE [dbo].[Fact_PurcReorder_ZL];
   END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_PurcReorder_ZL]
FROM [dbo].[Fact_PurcReorder]


IF(OBJECT_ID(N'[dbo].[Fact_PurcReorder_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcReorder_Error]
END
GO

CREATE TABLE [dbo].[Fact_PurcReorder_Error](
	[DateKey] [INT] NULL,
	[CompBranchId] [INT] NULL,
	[BillStatusKey] [INT] NULL,
	[BillTypeId] [INT] NULL,
	[StatusId] [INT] NULL,
	[SuppDealStatusId] [INT] NULL,
	[IsElecOrderId] [BIT] NULL,
	[PurcOrderId] [INT] NULL,
	[采购订单Id] [INT] NULL,
	[OrgId] [INT] NULL,
	[RegionId] [INT] NULL,
	[NextYearDateKey] [INT] NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO


--采购订单执行
IF (OBJECT_ID(N'[dbo].[Fact_PurcOrderExec]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrderExec];
END
GO

CREATE TABLE [Fact_PurcOrderExec]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[ProdId] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[SuppId] INT NOT NULL
	,[PurcOrderId] INT NOT NULL
	,[IsCreditSaleId] BIT NOT NULL
	,[IsElecOrderId] BIT NOT NULL
	,[PurcOrderQty] NUMERIC(18, 6)
	,[PurcOrderAmt] NUMERIC(18, 6)
	,[PurcStockQty] NUMERIC(18, 6)
	,[PurcStockAmt] NUMERIC(18, 6)
	,[PurcExecResQty] NUMERIC(18, 6)
	,[PurcExecResAmt] NUMERIC(18, 6)
	,[PurcOnWayQty] NUMERIC(18, 6)
	,[PurcOnWayAmt] NUMERIC(18, 6)
	,[AuxiUnitPurcOrderQty] NUMERIC(18, 6)
	,[BasePackUnitPurcOrderQty] NUMERIC(18, 6)
	,[PurcOrderWeight] NUMERIC(18, 6)
	,[AuxiUnitPurcStockQty] NUMERIC(18, 6)
	,[BasePackUnitPurcStockQty] NUMERIC(18, 6)
	,[PurcStockWeight] NUMERIC(18, 6)
	,[AuxiUnitPurcExecResQty] NUMERIC(18, 6)
	,[BasePackUnitPurcExecResQty] NUMERIC(18, 6)
	,[PurcExecResWeight] NUMERIC(18, 6)
	,[AuxiUnitPurcOnWayQty] NUMERIC(18, 6)
	,[BasePackUnitPurcOnWayQty] NUMERIC(18, 6)
	,[PurcOnWayWeight] NUMERIC(18, 6)
	,[RegionId] INT NOT NULL
	,[CompanyId] INT NOT NULL
	,[IsProced] BIT
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Fact_PurcOrderExec_01'))
BEGIN
	DROP INDEX [dbo].[Fact_PurcOrderExec].[CIX_Fact_PurcOrderExec_01]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_PurcOrderExec_01] ON [dbo].[Fact_PurcOrderExec]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_Fact_PurcOrderExec_02'))
BEGIN
	DROP INDEX [dbo].[Fact_PurcOrderExec].[NCIX_Fact_PurcOrderExec_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_PurcOrderExec_02] ON [dbo].[Fact_PurcOrderExec]
(
	[NextYearDateKey] ASC
)
INCLUDE ( 	[DateKey],
	[ProdId],
	[OrgId],
	[CompBranchId],
	[SuppId],
	[PurcOrderId],
	[IsCreditSaleId],
	[IsElecOrderId],
	[PurcOrderQty],
	[PurcOrderAmt],
	[PurcStockQty],
	[PurcStockAmt],
	[PurcExecResQty],
	[PurcExecResAmt],
	[PurcOnWayQty],
	[PurcOnWayAmt],
	[AuxiUnitPurcOrderQty],
	[BasePackUnitPurcOrderQty],
	[PurcOrderWeight],
	[AuxiUnitPurcStockQty],
	[BasePackUnitPurcStockQty],
	[PurcStockWeight],
	[AuxiUnitPurcExecResQty],
	[BasePackUnitPurcExecResQty],
	[PurcExecResWeight],
	[AuxiUnitPurcOnWayQty],
	[BasePackUnitPurcOnWayQty],
	[PurcOnWayWeight],
	[RegionId],
	[CompanyId],
	[IsProced]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF(OBJECT_ID(N'[Fact_PurcOrderExec_ZL]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [Fact_PurcOrderExec_ZL];
END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_PurcOrderExec_ZL]
FROM [dbo].[Fact_PurcOrderExec]