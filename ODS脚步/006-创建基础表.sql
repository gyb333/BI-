IF (OBJECT_ID(N'[t_CompanyDept]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_CompanyDept];
END
GO
CREATE TABLE [dbo].[t_CompanyDept](
	[DeptID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[Disabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


IF (OBJECT_ID(N'[t_CompanyEmployee]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_CompanyEmployee];
END
GO
CREATE TABLE [dbo].[t_CompanyEmployee](
	[EmpID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[Disabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_t_CompanyEmployee_02'))
BEGIN
    DROP INDEX [NCIX_t_CompanyEmployee_02] ON [dbo].[t_CompanyEmployee];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_t_CompanyEmployee_02] ON [dbo].[t_CompanyEmployee]
(
	[CompanyID] ASC,
	[DeptID] ASC
)
INCLUDE ( 	[Disabled]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[T_CustomerBase]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[T_CustomerBase];
END
GO
CREATE TABLE [dbo].[T_CustomerBase](
	[CustID] [int] NOT NULL,
	[SaleAreaID] [int] NULL,
	[CompBranchID] [int] NULL,
 CONSTRAINT [PK_T_CustomerBase_CustID] PRIMARY KEY NONCLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
) ON [FG_PRIMARY_Index]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'CIX_T_CustomerBase_01'))
BEGIN
    DROP INDEX [dbo].[T_CustomerBase].[CIX_T_CustomerBase_01];
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_T_CustomerBase_01] ON [dbo].[T_CustomerBase]
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO




 
IF (OBJECT_ID(N'[t_Distributor]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_Distributor];
END
GO
CREATE TABLE [dbo].[t_Distributor](
	[DistributorID] [int] NOT NULL,
	[DistributorContractID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[t_DistributorContract]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_DistributorContract];
END
GO
CREATE TABLE [dbo].[t_DistributorContract](
	[DistributorContractID] [int] NOT NULL,
	[OrgBranchID] [int] NOT NULL
) ON [FG_PRIMARY_Index]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_t_DistributorContract_01'))
BEGIN
	DROP INDEX [dbo].[t_DistributorContract].[CIX_t_DistributorContract_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_t_DistributorContract_01] ON [dbo].[t_DistributorContract]
(
	[DistributorContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (OBJECT_ID(N'[t_MoveType]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_MoveType];
END
GO
CREATE TABLE [dbo].[t_MoveType](
	[MoveTypeID] [int] NULL,
	[MoveType] [int] NULL,
	[UpdateCost] [bit] NULL
) ON [FG_PRIMARY_Index]

GO
CREATE CLUSTERED INDEX [CIX_t_MoveType_01] ON [dbo].[t_MoveType]
(
	[MoveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]

GO



IF (OBJECT_ID(N'[t_OrderType]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_OrderType];
END
GO
CREATE TABLE [dbo].[t_OrderType](
	[OrderTypeID] [int] NOT NULL,
	[MoveTypeID] [int] NULL
) ON [FG_PRIMARY_Index]

GO
IF(EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_t_OrderType_01'))
BEGIN
	DROP INDEX [dbo].[t_OrderType].[CIX_t_OrderType_01];
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_t_OrderType_01] ON [dbo].[t_OrderType]
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (OBJECT_ID(N'[t_Org]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_Org];
END
GO
CREATE TABLE [dbo].[t_Org](
	[OrgID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[OrgName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_t_Org_Id] PRIMARY KEY NONCLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
) ON [FG_PRIMARY_Index]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_t_Org_01'))
BEGIN
	DROP INDEX [dbo].[t_Org].[CIX_t_Org_01];
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_t_Org_01] ON [dbo].[t_Org]
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO




IF (OBJECT_ID(N'[t_ProdRoyalty]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_ProdRoyalty];
END
GO
CREATE TABLE [dbo].[t_ProdRoyalty](
	[ProdID] [int] NULL,
	[RoyaltyUnit] [nvarchar](10) NULL,
	[RoyaltyMoney] [numeric](18, 10) NULL
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[t_Product]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_Product];
END
GO
CREATE TABLE [dbo].[t_Product](
	[ProdID] [int] NOT NULL,
	[AuxUnitRate] [numeric](18, 10) NULL,
	[MinUnitRate] [numeric](18, 10) NULL,
	[WgtUnitRate] [numeric](18, 10) NULL,
	[AuxUnit] [nvarchar](10) NULL,
	[MinUnit] [nvarchar](10) NULL,
	[BaseUnit] [nvarchar](10) NULL,
	[WgtUnit] [nvarchar](10) NULL,
	[CompanyID] [int] NOT NULL,
	[ProdLineID] [int] NOT NULL
) ON [FG_PRIMARY_Index]

GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WHERE [a].[name] = 'CIX_t_Product_01'))
BEGIN
	DROP INDEX [dbo].[t_Product].[CIX_t_Product_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_t_Product_01] ON [dbo].[t_Product]
(
	[ProdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WHERE [a].[name] = 'NCIX_t_Product_02'))
BEGIN
	DROP INDEX [dbo].[t_Product].[NCIX_t_Product_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_t_Product_02] ON [dbo].[t_Product]
(
	[CompanyID] ASC,
	[ProdLineID] ASC
)
INCLUDE ( 	[AuxUnitRate],
	[MinUnitRate],
	[WgtUnitRate],
	[AuxUnit],
	[MinUnit],
	[BaseUnit],
	[WgtUnit]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


IF (OBJECT_ID(N'[t_SaleArea]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_SaleArea];
END
GO
CREATE TABLE [dbo].[t_SaleArea](
	[SaleAreaID] [int] NOT NULL,
	[SaleAreaParentID] [int] NULL,
	[Disabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[t_SubSysData]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_SubSysData];
END
GO
CREATE TABLE [dbo].[t_SubSysData](
	[CompanyID] [int] NULL,
	[KeyName] [nvarchar](40) NULL,
	[DistributorID] [int] NULL,
	[KeyValue] [nvarchar](200) NULL
) ON [PRIMARY]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'CIX_t_SubSysData_01'))
BEGIN
 DROP INDEX [CIX_t_SubSysData_01] ON [dbo].[t_SubSysData]
END
GO

CREATE NONCLUSTERED INDEX [CIX_t_SubSysData_01] ON [dbo].[t_SubSysData]
(
	[CompanyID] ASC,
	[DistributorID] ASC
)
INCLUDE ( 	[KeyValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO


IF (OBJECT_ID(N'[t_Warehouse]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[t_Warehouse];
END
GO
CREATE TABLE [dbo].[t_Warehouse](
	[WarehouseID] [int] NOT NULL,
	[Disabled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[V_t_CustomerCounty]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[V_t_CustomerCounty];
END
GO
CREATE TABLE [dbo].[V_t_CustomerCounty](
	[CustID] [int] NOT NULL,
	[CountyID] [int] NULL,
	[SaleAreaID] [int] NULL
) ON [FG_PRIMARY_Index]

GO
IF(EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_V_t_CustomerCounty_01'))
BEGIN
	DROP INDEX [dbo].[V_t_CustomerCounty].[CIX_V_t_CustomerCounty_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_V_t_CustomerCounty_01] ON [dbo].[V_t_CustomerCounty]
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO



IF (OBJECT_ID(N'[V_t_MutileDistriContractBusinessOfficeShip]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[V_t_MutileDistriContractBusinessOfficeShip];
END
GO
CREATE TABLE [dbo].[V_t_MutileDistriContractBusinessOfficeShip](
	[DistributorContractID] [int] NULL,
	[ProdLineID] [int] NULL,
	[OrgID] [int] NULL,
	[AreaID] [int] NULL,
	[BusinessOfficeID] [int] NULL,
	[RegionId] [int] NULL
) ON [PRIMARY]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_V_t_MutileDistriContractBusinessOfficeShip_01'))
BEGIN
	DROP INDEX [dbo].[V_t_MutileDistriContractBusinessOfficeShip].[NCIX_V_t_MutileDistriContractBusinessOfficeShip_01]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_V_t_MutileDistriContractBusinessOfficeShip_01] ON [dbo].[V_t_MutileDistriContractBusinessOfficeShip]
(
	[DistributorContractID] ASC,
	[ProdLineID] ASC,
	[OrgID] ASC
)
INCLUDE ( 	[AreaID],
	[BusinessOfficeID],
	[RegionId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_V_t_MutileDistriContractBusinessOfficeShip_02'))
BEGIN
	DROP INDEX [dbo].[V_t_MutileDistriContractBusinessOfficeShip].[NCIX_V_t_MutileDistriContractBusinessOfficeShip_02]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_V_t_MutileDistriContractBusinessOfficeShip_02] ON [dbo].[V_t_MutileDistriContractBusinessOfficeShip]
(
	[DistributorContractID] ASC,
	[ProdLineID] ASC,
	[OrgID] ASC,
	[AreaID] ASC
)
INCLUDE (
	[BusinessOfficeID],
	[RegionId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO


IF (OBJECT_ID(N'[V_t_OneDistriContractBusinessOffice]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[V_t_OneDistriContractBusinessOffice];
END
GO
CREATE TABLE [dbo].[V_t_OneDistriContractBusinessOffice](
	[RegionId] [int] NULL,
	[RegionName] [nvarchar](20) NULL,
	[OrgID] [int] NULL,
	[DistributorContractID] [int] NULL,
	[BusinessOfficeID] [int] NULL
) ON [PRIMARY]

GO
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'NCIX_V_t_OneDistriContractBusinessOffice_01'))
BEGIN
	DROP INDEX [dbo].[V_t_OneDistriContractBusinessOffice].[NCIX_V_t_OneDistriContractBusinessOffice_01]
END
GO

CREATE NONCLUSTERED INDEX [NCIX_V_t_OneDistriContractBusinessOffice_01] ON [dbo].[V_t_OneDistriContractBusinessOffice]
(
	[DistributorContractID] ASC
)
INCLUDE ( 	[RegionId],
	[RegionName],
	[OrgID],
	[BusinessOfficeID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (OBJECT_ID(N'[V_t_WareHouse]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[V_t_WareHouse];
END
GO
CREATE TABLE [dbo].[V_t_WareHouse](
	[WareHouseID] [int] NOT NULL,
	[CountyID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL
) ON [PRIMARY]

GO










 



 

