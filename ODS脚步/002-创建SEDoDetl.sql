

 

IF (OBJECT_ID('[dbo].[SEDoDetl]', 'U') IS NOT NULL)
BEGIN
	TRUNCATE TABLE [dbo].[SEDoDetl];
	DROP TABLE [dbo].[SEDoDetl];
	PRINT '删除表：[dbo].[SEDoDetl]';
END
GO

/*
删除分区文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Data1'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Data1], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Data1];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Data2'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Data2], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Data2];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Data3'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Data3], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Data3];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Data4'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Data4], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Data4];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Data5'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Data5], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Data5];
END
GO

/*
删除分区文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index1'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index1], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index1];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index2'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index2], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index2];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index3'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index3], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index3];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index4'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index4], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index4];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index5'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index5], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index5];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index6'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index6], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index6];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index7'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index7], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index7];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index8'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index8], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index8];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index9'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index9], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index9];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_SEDoDetl_Index10'))
BEGIN
	DBCC SHRINKFILE([PF_SEDoDetl_Index10], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_SEDoDetl_Index10];
END
GO


/*
删除文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_SEDoDetl_Data'))
BEGIN
	ALTER DATABASE [BI_ODS] REMOVE FILEGROUP [FG_SEDoDetl_Data]
END
GO

/*
删除文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_SEDoDetl_Index'))
BEGIN
	ALTER DATABASE [BI_ODS] REMOVE FILEGROUP [FG_SEDoDetl_Index]
END
GO

/*
创建文件组
*/
ALTER DATABASE [BI_ODS] ADD
FILEGROUP [FG_SEDoDetl_Data]
GO

ALTER DATABASE [BI_ODS] ADD
FILEGROUP [FG_SEDoDetl_Index]
GO


/*
创建文件
*/
ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Data1',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Data1.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Data2',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Data2.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Data3',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Data3.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Data4',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Data4.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Data5',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Data5.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Data];
GO

/*
创建文件
*/
ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index1',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index1.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index2',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index2.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index3',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index3.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index4',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index4.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index5',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index5.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index6',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index6.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index7',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index7.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index8',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index8.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index9',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index9.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_SEDoDetl_Index10',
	FILENAME = 'D:\BIDatabases\SEDoDetl_Partitions\PF_SEDoDetl_Index10.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_SEDoDetl_Index];
GO

CREATE TABLE [SEDoDetl]
(
	 [BillID] INT NOT NULL
	,[ProdID] INT NOT NULL
	,[MinUnitQty] NUMERIC(15, 4)
	,[Amount] MONEY
	,[TaxAmount] MONEY
	,[ProdCost] MONEY
	,[ItemType] INT
	,[LotNo] VARCHAR(20)
	,[PromotBillID] INT NOT NULL
	,[NotIncTaxAmount] MONEY
	,[WareHouseID] INT NOT NULL
) ON [FG_SEDoDetl_Data]
GO

CREATE NONCLUSTERED INDEX [NCIX_SEDoDetl_01] ON [dbo].[SEDoDetl]
(
	[BillID] ASC,
	[ProdID] ASC,
	[WareHouseID] ASC
)
INCLUDE ( 	[MinUnitQty],
	[Amount],
	[TaxAmount],
	[ProdCost],
	[ItemType],
	[LotNo],
	[PromotBillID],
	[NotIncTaxAmount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_SEDoDetl_Index]
GO

CREATE CLUSTERED INDEX [CIX_SEDoDetl_BillId] ON [dbo].[SEDoDetl]
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_SEDoDetl_Index]
GO
