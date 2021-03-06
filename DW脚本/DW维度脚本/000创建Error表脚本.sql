 
IF (OBJECT_ID(N'[dbo].[Dim_BusOffice_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_BusOffice_Error];
END
GO

CREATE TABLE [dbo].[Dim_BusOffice_Error]
(
	 [BusOfficeId] [INT] NULL
	,[营业所代码] [NVARCHAR](40) NULL
	,[营业所] [NVARCHAR](40) NULL
	,[StatusId] [SMALLINT] NULL
	,[是否有效] [NVARCHAR](10) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[OrgId] INT
	,[OrgName] NVARCHAR(20)
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Company_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Company_Error];
END
GO

CREATE TABLE [dbo].[Dim_Company_Error]
(
	 [CompBranchId] [INT] NULL
	,[户头] [NVARCHAR](60) NULL
	,[户头SAP代码] [NVARCHAR](20) NULL
	,[DistributorId] [INT] NULL
	,[经销商公司] [NVARCHAR](60) NULL
	,[DistributorContractID] [INT] NULL
	,[签约经销商] [NVARCHAR](60) NULL
	,[签约经销商SAP代码] [NVARCHAR](20) NULL
	,[CompanyId] [INT] NULL
	,[账号] [NVARCHAR](60) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Customer_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Customer_Error];
END
GO

CREATE TABLE [Dim_Customer_Error] 
(
    [SubCustId] int,
    [子客户] nvarchar(60),
    [ParCustId] int,
    [父客户] nvarchar(60),
    [StatusId] smallint,
    [是否有效] varchar(4),
    [IsGroupCustId] bit,
    [是否集团客户] varchar(2),
    [CustCategoryId] int,
    [客户分类] nvarchar(20),
    [CustTypeId] int,
    [客户类型] nvarchar(20),
    [ChanTypeId] int,
    [渠道类型] nvarchar(60),
    [CustIndustryId] int,
    [客户行业] nvarchar(20),
    [SaleLineId] int,
    [销售线路] nvarchar(20),
    [SaleAreaID] int,
    [销售区域] nvarchar(20),
    [CustOtherTypeId] int,
    [客户自定义分类] nvarchar(20),
    [SecondCustId] int,
    [分销商] nvarchar(60),
    [IsSecondCustId] int,
    [IsSecondCustName] nvarchar(1),
    [Contacts] nvarchar(60),
    [ContTel] nvarchar(60),
    [ContAddr] nvarchar(200),
    [CreatedDate] varchar(10),
    [CreatedDateKey] int,
    [CreatedYear] int,
    [CreatedMonth] int,
    [CreatedDay] int,
    [KASys] int,
    [KASysName] nvarchar(40),
    [StdSys] int,
    [StdSysName] nvarchar(60),
    [CustPriceTypeID] int,
    [CustPriceTypeCode] nvarchar(10),
    [CustPriceTypeName] nvarchar(20),
    [CompBranchId] int,
    [户头] nvarchar(60),
    [DistributorId] int,
    [经销商公司] nvarchar(60),
    [DistributorContractId] int,
    [签约经销商] nvarchar(60),
    [CompanyId] int,
    [账号] nvarchar(60),
    [OrgId] int,
    [营销分公司] nvarchar(20),
    [RegionId] int,
    [大区] nvarchar(20),
    [ProvinceId] int,
    [省] nvarchar(40),
    [CityId] int,
    [市] nvarchar(40),
    [CountyId] int,
    [县] nvarchar(40),
    [TownId] int,
    [乡镇] nvarchar(40),
    [VillageId] int,
    [村] nvarchar(40),
    [DisableDate] varchar(10),
    [DisableDateKey] int,
    [DisableYear] int,
    [DisableMonth] int,
    [DisableDay] int,
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Employee_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Employee_Error];
END
GO

CREATE TABLE [dbo].[Dim_Employee_Error]
(
	 [EmpId] [INT] NULL
	,[业务员] [NVARCHAR](20) NULL
	,[StatusId] [BIT] NULL
	,[是否有效] [NVARCHAR](2) NULL
	,[SupervisorId] [INT] NULL
	,[业务员主管] [NVARCHAR](20) NULL
	,[DeptId] [INT] NULL
	,[部门] [NVARCHAR](20) NULL
	,[DistributorId] [INT] NULL
	,[经销商公司] [NVARCHAR](60) NULL
	,[DistributorContractId] [INT] NULL
	,[签约经销商] [NVARCHAR](60) NULL
	,[CompanyId] [INT] NULL
	,[账号] [NVARCHAR](60) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Org_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Org_Error];
END
GO

CREATE TABLE [dbo].[Dim_Org_Error]
(
	 [OrgId] [INT] NULL
	,[营销分公司] [NVARCHAR](20) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Product_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Product_Error];
END
GO

CREATE TABLE [Dim_Product_Error] 
(
    [ProdId] int,
    [产品代码] nvarchar(20),
    [产品] nvarchar(60),
    [ProdStatusId] bit,
    [产品状态] varchar(4),
    [产品SAP代码] nvarchar(20),
    [BrandId] int,
    [品牌] nvarchar(20),
    [ProdBreedId] int,
    [品类] nvarchar(20),
    [ProdCategroyId] int,
    [品种] varchar(400),
    [ProdLineId] int,
    [产线] nvarchar(20),
    [BusLineId] int,
    [业务线] nvarchar(20),
    [ProdSpecId] int,
    [产品规格] nvarchar(80),
    [ProdBaseSpecId] int,
    [产品基础规格] nvarchar(50),
    [ProdOtherTypeId] int,
    [产品自定义类别] nvarchar(20),
    [产品接口码] nvarchar(40),
    [重量单位] nvarchar(10),
    [WgtUnitRate] numeric(18,10),
    [外包装单位] nvarchar(10),
    [辅助单位] nvarchar(10),
    [最小单位] nvarchar(10),
    [外包装条形码] nvarchar(40),
    [BasePackRate] numeric(18,10),
    [辅助单位条形码] nvarchar(40),
    [AuxiUnitRate] numeric(18,10),
    [最小单位条形码] nvarchar(40),
    [MinUnitRate] numeric(18,10),
    [CompanyId] int,
    [账号] nvarchar(60),
    [RegionId] int,
    [大区] nvarchar(20),
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_SuppDealStatus_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_SuppDealStatus_Error];
END
GO

CREATE TABLE [dbo].[Dim_SuppDealStatus_Error]
(
	 [SuppDealStatusId] [INT] NULL
	,[单据状态说明] [NVARCHAR](40) NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Supplier_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Supplier_Error];
END
GO

CREATE TABLE [dbo].[Dim_Supplier_Error]
(
	 [SuppId] [INT] NULL
	,[供应商] [NVARCHAR](60) NULL
	,[CompanyId] [INT] NULL
	,[账号] [NVARCHAR](60) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Dim_Warehouse_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_Warehouse_Error];
END
GO

CREATE TABLE [dbo].[Dim_Warehouse_Error]
(
	 [SubWHId] [INT] NULL
	,[子仓库] [NVARCHAR](20) NULL
	,[ParWHId] [INT] NULL
	,[父仓库] [NVARCHAR](20) NULL
	,[WHTypeId] [INT] NULL
	,[仓库类型] [NVARCHAR](20) NULL
	,[StatusId] [BIT] NULL
	,[是否有效] [NVARCHAR](2) NULL
	,[DistributorId] [INT] NULL
	,[经销商公司] [NVARCHAR](60) NULL
	,[DistributorContractId] [INT] NULL
	,[签约经销商] [NVARCHAR](60) NULL
	,[CompanyId] [INT] NULL
	,[账号] [NVARCHAR](60) NULL
	,[RegionId] [INT] NULL
	,[大区] [NVARCHAR](20) NULL
	,[IsFXId] INT
	,[IsFXName] NVARCHAR(20)
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_ICVoucher_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_ICVoucher_LKP_ProdRate_Error];
END
GO

CREATE TABLE [dbo].[Fact_ICVoucher_LKP_ProdRate_Error]
(
	 [DateKey] [INT] NULL
	,[ProdId] [INT] NULL
	,[OrgId] [INT] NULL
	,[DistributorId] [INT] NULL
	,[SubWHId] [INT] NULL
	,[MoveTypeId] [INT] NULL
	,[RegionId] [INT] NULL
	,[BatchId] [NVARCHAR](31) NULL
	,[MinUnitInWHQty] [NUMERIC](35, 8) NULL
	,[InWHCostAmt] [NUMERIC](35, 8) NULL
	,[MinUnitOutWHQty] [NUMERIC](35, 8) NULL
	,[OutWHCostAmt] [NUMERIC](35, 8) NULL
	,[NextYearDateKey] [INT] NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_ICVoucher_LKP_Region_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_ICVoucher_LKP_Region_Error];
END
GO

CREATE TABLE [dbo].[Fact_ICVoucher_LKP_Region_Error]
(
	 [DateKey] [INT] NULL
	,[ProdId] [INT] NULL
	,[OrgId] [INT] NULL
	,[DistributorId] [INT] NULL
	,[OrgBranchId] [INT] NULL
	,[SubWHId] [INT] NULL
	,[MoveTypeId] [INT] NULL
	,[MinUnitInWHQty] [NUMERIC](35, 8) NULL
	,[InWHCostAmt] [NUMERIC](35, 8) NULL
	,[MinUnitOutWHQty] [NUMERIC](35, 8) NULL
	,[OutWHCostAmt] [NUMERIC](35, 8) NULL
	,[BatchId] [NVARCHAR](31) NULL
	,[NextYearDateKey] [INT] NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_MonthInve_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_MonthInve_Error];
END
GO

CREATE TABLE [dbo].[Fact_MonthInve_Error]
(
	 [DateKey] [INT] NULL
	,[ProdId] [INT] NULL
	,[OrgId] INT NULL
	,[DistributorId] [INT] NULL
	,[SubWHId] [INT] NULL
	,[BatchName] [VARCHAR](20) NULL
	,[最小单位期初库存量] [NUMERIC](38, 17) NULL
	,[辅助单位期初库存量] [NUMERIC](38, 17) NULL
	,[外包装单位期初库存量] [NUMERIC](38, 17) NULL
	,[期初库存重量] [NUMERIC](38, 17) NULL
	,[最小单位期末库存量] [NUMERIC](38, 17) NULL
	,[辅助单位期末库存量] [NUMERIC](38, 17) NULL
	,[外包装单位期末库存量] [NUMERIC](38, 17) NULL
	,[期末库存重量] [NUMERIC](38, 17) NULL
	,[最小单位入库库存量] [NUMERIC](38, 17) NULL
	,[辅助单位入库库存量] [NUMERIC](38, 17) NULL
	,[外包装单位入库库存量] [NUMERIC](38, 17) NULL
	,[入库库存重量] [NUMERIC](38, 17) NULL
	,[最小单位出库库存量] [NUMERIC](38, 17) NULL
	,[辅助单位出库库存量] [NUMERIC](38, 17) NULL
	,[外包装单位出库库存量] [NUMERIC](38, 17) NULL
	,[出库库存重量] [NUMERIC](38, 17) NULL
	,[月结库存成本额] [MONEY] NULL
	,[RegionId] [INT] NULL
	,[CompanyId] [INT] NULL
	,[NextYearDateKey] [INT] NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_Error];
END
GO

CREATE TABLE [Fact_PurcOrder_Error] 
(
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
    [采购订单量] numeric(38,7),
    [采购订单金额] numeric(38,6),
    [采购订单税额] numeric(38,6),
    [采购订单不含税金额] numeric(38,6),
    [RegionId] int,
    [OrderTypeId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcReorder_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcReorder_Error];
END
GO

CREATE TABLE [dbo].[Fact_PurcReorder_Error]
(
	 [DateKey] [INT] NULL
	,[CompBranchId] [INT] NULL
	,[BillStatusKey] [INT] NULL
	,[BillTypeId] [INT] NULL
	,[StatusId] [INT] NULL
	,[SuppDealStatusId] [INT] NULL
	,[IsElecOrderId] [BIT] NULL
	,[PurcOrderId] [INT] NULL
	,[采购订单Id] [INT] NULL
	,[OrgId] [INT] NULL
	,[RegionId] [INT] NULL
	,[NextYearDateKey] [INT] NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcSaleInve_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcSaleInve_LKP_ProdRate_Error];
END
GO

CREATE TABLE [dbo].[Fact_PurcSaleInve_LKP_ProdRate_Error]
(
	 [DateKey] [INT] NULL
	,[ProdId] [INT] NULL
	,[OrgId] [INT] NULL
	,[DistributorId] [INT] NULL
	,[BusOfficeId] [INT] NULL
	,[RegionId] [INT] NULL
	,[MinUnitPurcOrderQty] [NUMERIC](18, 6) NULL
	,[MinUnitPurcStockQty] [NUMERIC](18, 6) NULL
	,[MinUnitSaleQty] [NUMERIC](18, 6) NULL
	,[MinUnitOtherInWHQty] [NUMERIC](18, 6) NULL
	,[MinUnitOtherOutWHQty] [NUMERIC](18, 6) NULL
	,[NextYearDateKey] [INT] NULL
	,[ErrorCode] [INT] NULL
	,[ErrorColumn] [INT] NULL
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcStock_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcStock_Error];
END
GO

CREATE TABLE [Fact_PurcStock_Error] (
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [OrderTypeId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
	[SubWHId] INT,
	[MoveSubTypeId] INT,
    [InvoiceStatusId] int,
    [采购验收量] numeric(38,7),
    [采购验收金额] numeric(38,6),
    [采购验收税额] money,
    [采购验收不含税金额] numeric(38,6),
    [RegionId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [PurcStockId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_SaleBill_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_SaleBill_Error];
END
GO

CREATE TABLE [Fact_SaleBill_Error] 
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
    [MoveSubTypeKey] int,
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
    [ErrorCode] int,
    [ErrorColumn] int
)
GO


IF (OBJECT_ID(N'[dbo].[Fact_PurcOrderExec_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrderExec_Error];
END
GO

CREATE TABLE [Fact_PurcOrderExec_Error]
(
	 [DateKey] INT
	,[NextYearDateKey] INT
	,[ProdId] INT
	,[OrgId] INT
	,[CompBranchId] INT
	,[SuppId] INT
	,[PurcOrderId] INT
	,[IsCreditSaleId] BIT
	,[IsElecOrderId] BIT
	,[订单数量] NUMERIC(38, 6)
	,[订单金额] MONEY
	,[验收数量] NUMERIC(38, 6)
	,[验收金额] MONEY
	,[余量] NUMERIC(38, 6)
	,[余额] NUMERIC(36, 8)
	,[ErrorCode] INT
	,[ErrorColumn] INT
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrderExec_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrderExec_LKP_ProdRate_Error];
END
GO

CREATE TABLE [Fact_PurcOrderExec_LKP_ProdRate_Error] (
    [DateKey] int,
    [NextYearDateKey] int,
    [ProdId] int,
    [OrgId] int,
    [CompBranchId] int,
    [SuppId] int,
    [PurcOrderId] int,
    [IsCreditSaleId] bit,
	[IsElecOrderId] BIT,
    [订单数量] numeric(38,6),
    [订单金额] numeric(38,7),
    [验收数量] numeric(38,4),
    [验收金额] money,
    [在途数量] numeric(38,4),
    [在途金额] money,
    [余量] numeric(38,10),
    [余额] numeric(38,6),
    [RegionId] int,
    [CompanyId] int,
    [PurcOrderQty] numeric(18,6),
    [PurcOrderAmt] numeric(18,6),
    [PurcStockQty] numeric(18,6),
    [PurcStockAmt] numeric(18,6),
    [PurcExecResQty] numeric(18,6),
    [PurcExecResAmt] numeric(18,6),
    [PurcOnWayQty] numeric(18,6),
    [PurcOnWayAmt] numeric(18,6),
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_LKP_ProdRate_Error];
END
GO

CREATE TABLE [Fact_PurcOrder_LKP_ProdRate_Error] (
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
    [采购订单量] numeric(38,7),
    [采购订单金额] numeric(38,6),
    [采购订单税额] numeric(38,6),
    [采购订单不含税金额] numeric(38,6),
    [RegionId] int,
    [OrderTypeId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [PurcOrderQty] numeric(18,4),
    [PurcOrderAmt] numeric(18,4),
    [PurcOrderTax] numeric(18,4),
    [PurcOrderNonTaxAmt] numeric(18,4),
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcStock_LKP_ProdRate_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcStock_LKP_ProdRate_Error];
END
GO

CREATE TABLE [Fact_PurcStock_LKP_ProdRate_Error] (
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [OrderTypeId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
	[SubWHId] INT,
	[MoveSubTypeId] INT,
    [InvoiceStatusId] int,
    [采购验收量] numeric(38,7),
    [采购验收金额] numeric(38,6),
    [采购验收税额] money,
    [采购验收不含税金额] numeric(38,6),
    [RegionId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [PurcStockId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [PurcStockQty] numeric(18,4),
    [PurcStockAmt] numeric(18,4),
    [PurcStockTax] numeric(18,4),
    [PurcStockNonTaxAmt] numeric(18,4),
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrderExec_DER_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrderExec_DER_Error];
END
GO

CREATE TABLE [Fact_PurcOrderExec_DER_Error]
(
	[DateKey] INT
	,[NextYearDateKey] INT
	,[ProdId] INT
	,[OrgId] INT
	,[CompBranchId] INT
	,[SuppId] INT
	,[PurcOrderId] INT
	,[IsCreditSaleId] BIT
	,[IsElecOrderId] BIT
	,[订单数量] NUMERIC(38, 6)
	,[订单金额] NUMERIC(38, 7)
	,[验收数量] NUMERIC(38, 4)
	,[验收金额] MONEY
	,[在途数量] NUMERIC(38, 4)
	,[在途金额] MONEY
	,[余量] NUMERIC(38, 10)
	,[余额] NUMERIC(38, 6)
	,[RegionId] INT
	,[CompanyId] INT
	,[PurcOrderQty] NUMERIC(18, 6)
	,[PurcOrderAmt] NUMERIC(18, 6)
	,[PurcStockQty] NUMERIC(18, 6)
	,[PurcStockAmt] NUMERIC(18, 6)
	,[PurcExecResQty] NUMERIC(18, 6)
	,[PurcExecResAmt] NUMERIC(18, 6)
	,[PurcOnWayQty] NUMERIC(18, 6)
	,[PurcOnWayAmt] NUMERIC(18, 6)
	,[WgtUnitRate] NUMERIC(18, 10)
	,[AuxiUnitRate] NUMERIC(18, 10)
	,[MinUnitRate] NUMERIC(18, 10)
	,[ErrorCode] INT
	,[ErrorColumn] INT
	,IsDelete  BIT DEFAULT 0

)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcStock_DER_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcStock_DER_Error];
END
GO

CREATE TABLE [Fact_PurcStock_DER_Error] (
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [OrderTypeId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
	[SubWHId] INT,
	[MoveSubTypeId] INT,
    [InvoiceStatusId] int,
    [采购验收量] numeric(38,7),
    [采购验收金额] numeric(38,6),
    [采购验收税额] money,
    [采购验收不含税金额] numeric(38,6),
    [RegionId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [PurcStockId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [PurcStockQty] numeric(18,4),
    [PurcStockAmt] numeric(18,4),
    [PurcStockTax] numeric(18,4),
    [PurcStockNonTaxAmt] numeric(18,4),
    [WgtUnitRate] numeric(18,10),
    [AuxiUnitRate] numeric(18,10),
    [MinUnitRate] numeric(18,10),
    [ErrorCode] int,
    [ErrorColumn] INT
    ,IsDelete  BIT DEFAULT 0
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_PurcOrder_DER_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_PurcOrder_DER_Error];
END
GO

CREATE TABLE [Fact_PurcOrder_DER_Error] (
    [DateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [SuppId] int,
    [IsCreditSaleId] bit,
    [IsElecOrderId] bit,
    [采购订单量] numeric(38,7),
    [采购订单金额] numeric(38,6),
    [采购订单税额] numeric(38,6),
    [采购订单不含税金额] numeric(38,6),
    [RegionId] int,
    [OrderTypeId] int,
    [OrgId] int,
    [PurcOrderId] int,
    [CompanyId] int,
    [NextYearDateKey] int,
    [PurcOrderQty] numeric(18,4),
    [PurcOrderAmt] numeric(18,4),
    [PurcOrderTax] numeric(18,4),
    [PurcOrderNonTaxAmt] numeric(18,4),
    [WgtUnitRate] numeric(18,10),
    [AuxiUnitRate] numeric(18,10),
    [MinUnitRate] numeric(18,10),
    [ErrorCode] int,
    [ErrorColumn] INT
    ,IsDelete  BIT DEFAULT 0
)
GO

IF (OBJECT_ID(N'[dbo].[Fact_SaleBill_DB_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_SaleBill_DB_Error];
END
GO

CREATE TABLE [Fact_SaleBill_DB_Error]
(
	 [DateKey] int,
    [GZDateKey] int,
    [NextYearDateKey] int,
    [ProdId] int,
    [CompBranchId] int,
    [SubCustId] int,
    [SubWHId] int,
    [SaleTypeBaseId] int,
    [SaleMethodId] int,
    [IsGiveId] int,
    [OrderTypeId] int,
    [BillStatusKey] int,
    [BillTypeId] int,
    [StatusId] int,
    [MoveSubTypeId] int,
    [MoveTypeId] int,
    [InvoiceStatusId] int,
    [SaleBillId] int,
    [最小单位销售量] numeric(26,4),
    [辅助单位销售量] numeric(38,6),
    [外包装单位销售量] numeric(38,6),
    [销售重量] numeric(38,6),
    [销售金额] money,
    [销售税额] money,
    [不含税销售金额] money,
    [销售成本额] numeric(38,6),
    [赠品成本额] numeric(38,6),
    [CompanyId] int,
    [RegionId] int,
    [ErrorCode] int,
    [ErrorColumn] int
)
GO