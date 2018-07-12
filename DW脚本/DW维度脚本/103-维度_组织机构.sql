--大区
IF (OBJECT_ID(N'[Dim_Org]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Org];
END
GO

CREATE TABLE [Dim_Org]
(
	 [OrgId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[OrgName] NVARCHAR(20)
	,[RegionName] NVARCHAR(20)
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Org_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Org].[CIX_Dim_Org_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Org_01] ON [dbo].[Dim_Org]
(
	[OrgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Org] ADD CONSTRAINT PK_Dim_Org_OrgId PRIMARY KEY([OrgId])
GO



IF (OBJECT_ID(N'[Dim_Org_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Org_Error];
END
GO
CREATE TABLE [dbo].[Dim_Org_Error](
	[OrgId] [INT] NULL,
	[营销分公司] [NVARCHAR](20) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

-------营业所

IF (OBJECT_ID(N'[Dim_BusOffice]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_BusOffice];
END
GO

CREATE TABLE [Dim_BusOffice]
(
	 [BusOfficeId] INT NOT NULL
	,[BusOfficeCode] NVARCHAR(40) NOT NULL
	,[BusOfficeName] NVARCHAR(40) NOT NULL
	,[OrgId] INT NOT NULL
	,[OrgName] NVARCHAR(20) NOT NULL
	,[StatusId] SMALLINT NOT NULL
	,[StautsName] NVARCHAR(10) NOT NULL
	,[RegionId] INT NOT NULL
	,[RegionName] NVARCHAR(20) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_BusOffice_01'))
BEGIN
	DROP INDEX [dbo].[Dim_BusOffice].[CIX_Dim_BusOffice_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_BusOffice_01] ON [dbo].[Dim_BusOffice]
(
	[BusOfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_BusOffice] ADD CONSTRAINT PK_Dim_BusOffice_BusOfficeId PRIMARY KEY([BusOfficeId])
GO



IF (OBJECT_ID(N'[Dim_BusOffice_Error]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_BusOffice_Error];
END
GO
CREATE TABLE [dbo].[Dim_BusOffice_Error](
	[BusOfficeId] [INT] NULL,
	[营业所代码] [NVARCHAR](40) NULL,
	[营业所] [NVARCHAR](40) NULL,
	[StatusId] [SMALLINT] NULL,
	[是否有效] [NVARCHAR](10) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[OrgId] [INT] NULL,
	[OrgName] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

/*
KDS是不到营销分公司的，因次没有org这个字段
ORG两个字段是给KBP使用的。
*/
IF (OBJECT_ID(N'[Dim_Company]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Company];
END
GO

CREATE TABLE [Dim_Company]
(
	 [CompBranchId] INT NOT NULL
	,[DistributorId] INT NOT NULL
	,[DistributorContractID] INT NOT NULL
	,[CompanyId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[CompBranchName] NVARCHAR(60) NOT NULL
	,[CompBranchSAPCode] NVARCHAR(20) NOT NULL
	,[DistributorName] NVARCHAR(60) NOT NULL
	,[DistributorContractName] NVARCHAR(60) NOT NULL
	,[DistributorContractSAPCode] NVARCHAR(20) NOT NULL
	,[CompanyName] NVARCHAR(60) NOT NULL
	,[RegionName] NVARCHAR(20) NOT NULL
	,[OrgId] INT NOT NULL
	,[OrgName] NVARCHAR(20) NOT NULL
)
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Company_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Company].[CIX_Dim_Company_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Company_01] ON [dbo].[Dim_Company]
(
	[CompBranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Company] ADD CONSTRAINT PK_Dim_Company_CompBranchId PRIMARY KEY([CompBranchId])
GO


IF (OBJECT_ID(N'[Dim_Company_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Company_Error];
END
GO
CREATE TABLE [dbo].[Dim_Company_Error](
	[CompBranchId] [INT] NULL,
	[户头] [NVARCHAR](60) NULL,
	[户头SAP代码] [NVARCHAR](20) NULL,
	[DistributorId] [INT] NULL,
	[经销商公司] [NVARCHAR](60) NULL,
	[DistributorContractID] [INT] NULL,
	[签约经销商] [NVARCHAR](60) NULL,
	[签约经销商SAP代码] [NVARCHAR](20) NULL,
	[CompanyId] [INT] NULL,
	[账号] [NVARCHAR](60) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[OrgId] [INT] NULL,
	[OrgName] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO


--DROP TABLE [Dim_Org_Error];
--DROP TABLE [Dim_BusOffice_Error];
--DROP TABLE [Dim_Company_Error];
