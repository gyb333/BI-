IF (OBJECT_ID(N'[Dim_Warehouse]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Warehouse];
END
GO

CREATE TABLE [Dim_Warehouse] 
(
    [SubWHId] INT NOT NULL,
    [ParWHId] INT ,
    [WHTypeId] int,
	[IsFXId] INT,
	[IsFXName] NVARCHAR(20),
	[IsSecondCustId] INT,
	[IsSecondCustDesc] NVARCHAR(20),
    [StatusId] bit,
    [DistributorId] int NOT NULL,
    [DistributorContractId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [RegionId] int NOT NULL,
    [SubWHName] nvarchar(40) NOT NULL,
    [ParWHName] nvarchar(40) NOT NULL,
    [WHTypeName] nvarchar(20),
    [StatusName] nvarchar(10),
    [DistributorName] nvarchar(60) NOT NULL,
    [DistributorContractName] nvarchar(60) NOT NULL,
    [CompanyName] nvarchar(60) NOT NULL,
    [RegionName] nvarchar(20) NOT NULL
)
GO


IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Warehouse_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Warehouse].[CIX_Dim_Warehouse_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Warehouse_01] ON [dbo].[Dim_Warehouse]
(
	[SubWHId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Warehouse] ADD CONSTRAINT PK_Dim_Warehouse_SubWHId PRIMARY KEY([SubWHId])
GO

IF (OBJECT_ID(N'[Dim_Warehouse_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Warehouse_Error];
END
GO
CREATE TABLE [dbo].[Dim_Warehouse_Error](
	[SubWHId] [INT] NULL,
	[�Ӳֿ�] [NVARCHAR](20) NULL,
	[ParWHId] [INT] NULL,
	[���ֿ�] [NVARCHAR](20) NULL,
	[WHTypeId] [INT] NULL,
	[�ֿ�����] [NVARCHAR](20) NULL,
	[StatusId] [BIT] NULL,
	[�Ƿ���Ч] [NVARCHAR](2) NULL,
	[DistributorId] [INT] NULL,
	[�����̹�˾] [NVARCHAR](60) NULL,
	[DistributorContractId] [INT] NULL,
	[ǩԼ������] [NVARCHAR](60) NULL,
	[CompanyId] [INT] NULL,
	[�˺�] [NVARCHAR](60) NULL,
	[RegionId] [INT] NULL,
	[����] [NVARCHAR](20) NULL,
	[IsFXId] [INT] NULL,
	[IsFXName] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO
--DROP TABLE [Dim_Warehouse_Error];