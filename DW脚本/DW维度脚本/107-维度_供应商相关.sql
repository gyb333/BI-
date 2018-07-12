IF (OBJECT_ID(N'[Dim_Supplier]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Supplier];
END
GO

CREATE TABLE [Dim_Supplier]
(
	 [SuppId] INT NOT NULL
	,[CompanyId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[SuppName] NVARCHAR(60) NOT NULL
	,[CompanyName] NVARCHAR(60) NOT NULL
	,[RegionName] NVARCHAR(20) NOT NULL
)
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Supplier_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Supplier].[CIX_Dim_Supplier_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Supplier_01] ON [dbo].[Dim_Supplier]
(
	[SuppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Supplier] ADD CONSTRAINT PK_Dim_Supplier_SuppId PRIMARY KEY([SuppId])
GO


IF (OBJECT_ID(N'[Dim_Supplier_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Supplier_Error];
END
GO
CREATE TABLE [dbo].[Dim_Supplier_Error](
	[SuppId] [INT] NULL,
	[供应商] [NVARCHAR](60) NULL,
	[CompanyId] [INT] NULL,
	[账号] [NVARCHAR](60) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

IF (OBJECT_ID(N'[Dim_SuppDealStatus]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_SuppDealStatus];
END
GO

CREATE TABLE [Dim_SuppDealStatus]
(
	 [SuppDealStatusId] INT NOT NULL
	,[SuppDealtatusDesc] NVARCHAR(40) NOT NULL
 )
 GO

 
IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_SuppDealStatus_01'))
BEGIN
	DROP INDEX [dbo].[Dim_SuppDealStatus].[CIX_Dim_SuppDealStatus_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_SuppDealStatus_01] ON [dbo].[Dim_SuppDealStatus]
(
	[SuppDealStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_SuppDealStatus] ADD CONSTRAINT PK_Dim_SuppDealStatus_Id PRIMARY KEY([SuppDealStatusId])
GO


IF (OBJECT_ID(N'[Dim_SuppDealStatus_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_SuppDealStatus_Error];
END
GO
CREATE TABLE [dbo].[Dim_SuppDealStatus_Error](
	[SuppDealStatusId] [INT] NULL,
	[单据状态说明] [NVARCHAR](40) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

--DROP TABLE [Dim_Supplier_Error];
--DROP TABLE [Dim_SuppDealStatus_Error];