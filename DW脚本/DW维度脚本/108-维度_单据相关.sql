---是否赊销
IF (OBJECT_ID(N'[Dim_IsCreditSale]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_IsCreditSale];
END
GO

CREATE TABLE [Dim_IsCreditSale]
(
	 [IsCreditSaleId] BIT NOT NULL
	,[IsCreditSaleName] NVARCHAR(10) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_IsCreditSale_01'))
BEGIN
	DROP INDEX [dbo].[Dim_IsCreditSale].[CIX_Dim_IsCreditSale_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_IsCreditSale_01] ON [dbo].[Dim_IsCreditSale]
(
	[IsCreditSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_IsCreditSale] ADD CONSTRAINT PK_Dim_IsCreditSale_Id PRIMARY KEY([IsCreditSaleId])
GO


--是否电子订单
IF (OBJECT_ID(N'[Dim_IsElecOrder]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_IsElecOrder];
END
GO

CREATE TABLE [dbo].[Dim_IsElecOrder]
(
	 [IsElecOrderId] BIT NOT NULL
	,[IsElecOrderName] NVARCHAR(10) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_IsElecOrder_01'))
BEGIN
	DROP INDEX [dbo].[Dim_IsElecOrder].[CIX_Dim_IsElecOrder_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_IsElecOrder_01] ON [dbo].[Dim_IsElecOrder]
(
	[IsElecOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_IsElecOrder] ADD CONSTRAINT PK_Dim_IsElecOrder_Id PRIMARY KEY([IsElecOrderId])
GO


--订单类型
IF (OBJECT_ID(N'[Dim_OrderType]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_OrderType];
END
GO

CREATE TABLE [Dim_OrderType]
(
	 [OrderTypeId] INT NOT NULL
	,[OrderTypeName] NVARCHAR(20) NOT NULL
	,[OrderTypeCateId] INT NOT NULL
	,[OrderTypeCateName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_OrderType_01'))
BEGIN
	DROP INDEX [dbo].[Dim_OrderType].[CIX_Dim_OrderType_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_OrderType_01] ON [dbo].[Dim_OrderType]
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_OrderType] ADD CONSTRAINT PK_Dim_OrderType_Id PRIMARY KEY([OrderTypeId])
GO


--单据来源
IF (OBJECT_ID(N'[Dim_BillSource]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_BillSource];
END
GO

CREATE TABLE [Dim_BillSource]
(
	 [BillSrcId] INT NOT NULL
	,[BillSrcName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_BillSource_01'))
BEGIN
	DROP INDEX [dbo].[Dim_BillSource].[CIX_Dim_BillSource_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_BillSource_01] ON [dbo].[Dim_BillSource]
(
	[BillSrcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_BillSource] ADD CONSTRAINT PK_Dim_BillSource_Id PRIMARY KEY([BillSrcId])
GO



--单据状态
IF (OBJECT_ID(N'[Dim_BillStatus]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_BillStatus];
END
GO

CREATE TABLE [Dim_BillStatus]
(
	[BillStatusKey] INT NOT NULL
	,[StatusId] INT NOT NULL
	,[StatusDesc] NVARCHAR(40) NOT NULL
	,[BillTypeId] INT NOT NULL
	,[BillTypeDesc] NVARCHAR(250) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_BillStatus_01'))
BEGIN
	DROP INDEX [dbo].[Dim_BillStatus].[CIX_Dim_BillStatus_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_BillStatus_01] ON [dbo].[Dim_BillStatus]
(
	[BillStatusKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_BillStatus] ADD CONSTRAINT PK_Dim_BillStatus_Key PRIMARY KEY([BillStatusKey])
GO



--移动子类型
IF (OBJECT_ID(N'[Dim_MoveSubType]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_MoveSubType];
END
GO

CREATE TABLE [Dim_MoveSubType]
(
	 [MoveSubTypeKey] INT NOT NULL
	,[MoveTypeSubID] INT NOT NULL
	,[MoveTypeSubName] NVARCHAR(20) NOT NULL
	,[MoveTypeID] INT NOT NULL
	,[MoveTypeName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_MoveSubType_01'))
BEGIN
	DROP INDEX [dbo].[Dim_MoveSubType].[CIX_Dim_MoveSubType_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_MoveSubType_01] ON [dbo].[Dim_MoveSubType]
(
	[MoveSubTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_MoveSubType] ADD CONSTRAINT PK_Dim_MoveSubType_Key PRIMARY KEY([MoveSubTypeKey])
GO






--销售方式
IF (OBJECT_ID(N'[Dim_SaleMethod]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_SaleMethod];
END
GO

CREATE TABLE [Dim_SaleMethod]
(
	 [SaleMethodId] INT NOT NULL
	,[SaleMethodName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_SaleMethod_01'))
BEGIN
	DROP INDEX [dbo].[Dim_SaleMethod].[CIX_Dim_SaleMethod_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_SaleMethod_01] ON [dbo].[Dim_SaleMethod]
(
	[SaleMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_SaleMethod] ADD CONSTRAINT PK_Dim_SaleMethod_Id PRIMARY KEY([SaleMethodId])
GO


--移动类型
IF (OBJECT_ID(N'[Dim_MoveType]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Dim_MoveType]
END
GO

CREATE TABLE [dbo].[Dim_MoveType]
(
	[MoveTypeId] INT NOT NULL,
	[MoveTypeName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_MoveType_01'))
BEGIN
	DROP INDEX [dbo].[Dim_MoveType].[CIX_Dim_MoveType_01];
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_MoveType_01] ON [dbo].[Dim_MoveType]
(
	[MoveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_MoveType] ADD CONSTRAINT PK_Dim_MoveType PRIMARY KEY([MoveTypeId])
GO


--是否赠品
IF (OBJECT_ID(N'[Dim_IsGive]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_IsGive];
END
GO

CREATE TABLE [Dim_IsGive]
(
	[IsGiveId] INT NOT NULL
	,[IsGiveName] NVARCHAR(10) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_IsGive_01'))
BEGIN
	DROP INDEX [dbo].[Dim_IsGive].[CIX_Dim_IsGive_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_IsGive_01] ON [dbo].[Dim_IsGive]
(
	[IsGiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_IsGive] ADD CONSTRAINT PK_Dim_IsGive_Id PRIMARY KEY([IsGiveId])
GO



--是否禁用
IF (OBJECT_ID(N'[Dim_IsDisabled]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_IsDisabled];
END
GO

CREATE TABLE [dbo].[Dim_IsDisabled]
(
	 [IsDisabledId] BIT NOT NULL
	,[IsDisabledName] NVARCHAR(10) NOT NULL
	,[IsDisabledDescId] INT NOT NULL
	,[IsDisabledDesc] NVARCHAR(100) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_IsDisabled_01'))
BEGIN
	DROP INDEX [dbo].[Dim_IsDisabled].[CIX_Dim_IsDisabled_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_IsDisabled_01] ON [dbo].[Dim_IsDisabled]
(
	[IsDisabledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_IsDisabled] ADD CONSTRAINT PK_Dim_IsDisabled_Id PRIMARY KEY([IsDisabledId])
GO



--销量基础类型
IF (OBJECT_ID(N'[Dim_SaleTypeBase]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_SaleTypeBase];
END
GO

CREATE TABLE [dbo].[Dim_SaleTypeBase]
(
    [SaleTypeBaseId] INT NOT NULL,
    [SaleTypeBaseName] nvarchar(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'CIX_Dim_SaleTypeBase_01'))
BEGIN
	DROP TABLE [dbo].[Dim_SaleTypeBase].[CIX_Dim_SaleTypeBase_01];
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_SaleTypeBase_01] ON [dbo].[Dim_SaleTypeBase]
(
	[SaleTypeBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_SaleTypeBase] ADD CONSTRAINT PK_Dim_SaleTypeBase_Id PRIMARY KEY([SaleTypeBaseId])
GO






--发票类型
IF (OBJECT_ID(N'[Dim_InvoiceType]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_InvoiceType];
END
GO

CREATE TABLE [Dim_InvoiceType]
(
	 [InvoiceTypeId] INT NOT NULL
	,[InvoiceTypeName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_InvoiceType_01'))
BEGIN
	DROP INDEX [dbo].[Dim_InvoiceType].[CIX_Dim_InvoiceType_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_InvoiceType_01] ON [dbo].[Dim_InvoiceType]
(
	[InvoiceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_InvoiceType] ADD CONSTRAINT PK_Dim_InvoiceType_Id PRIMARY KEY([InvoiceTypeId])
GO


--开票状态
IF (OBJECT_ID(N'[Dim_InvoiceStatus]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_InvoiceStatus];
END
GO

CREATE TABLE [Dim_InvoiceStatus]
(
	 [InvoiceStatusId] INT NOT NULL
	,[InvoiceStatusName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_InvoiceStatus_01'))
BEGIN
	DROP INDEX [dbo].[Dim_InvoiceStatus].[CIX_Dim_InvoiceStatus_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_InvoiceStatus_01] ON [dbo].[Dim_InvoiceStatus]
(
	[InvoiceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_InvoiceStatus] ADD CONSTRAINT PK_Dim_InvoiceStatus_Id PRIMARY KEY([InvoiceStatusId])
GO

--批次

IF (OBJECT_ID(N'[Dim_Batch]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Batch];
END
GO

CREATE TABLE [Dim_Batch]
(
	 [BatchId] NVARCHAR(31) NOT NULL
	,[BatchName] VARCHAR(20) NOT NULL
	,[DistributorID] INT NOT NULL
	,[DistributorName] NVARCHAR(60)
	,[RegionId] INT NOT NULL
	,[RegionName] NVARCHAR(20)
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Batch_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Batch].[CIX_Dim_Batch_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Batch_01] ON [dbo].[Dim_Batch]
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Batch] ADD CONSTRAINT PK_Dim_Batch_Id PRIMARY KEY([BatchId])
GO
