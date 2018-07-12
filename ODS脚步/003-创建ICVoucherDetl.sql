

IF (OBJECT_ID('[dbo].[ICVoucherDetl]', 'U') IS NOT NULL)
BEGIN
	TRUNCATE TABLE [dbo].[ICVoucherDetl];
	DROP TABLE [dbo].[ICVoucherDetl];
	PRINT '删除表：[dbo].[ICVoucherDetl]';
END
GO

/*
删除分区文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Data1'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Data1], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Data1];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Data2'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Data2], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Data2];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Data3'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Data3], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Data3];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Data4'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Data4], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Data4];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Data5'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Data5], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Data5];
END
GO

/*
删除分区文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index1'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index1], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index1];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index2'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index2], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index2];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index3'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index3], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index3];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index4'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index4], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index4];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index5'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index5], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index5];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index6'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index6], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index6];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index7'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index7], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index7];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index8'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index8], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index8];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index9'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index9], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index9];
END
GO
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_ICVoucherDetl_Index10'))
BEGIN
	DBCC SHRINKFILE([PF_ICVoucherDetl_Index10], EMPTYFILE);
	ALTER DATABASE [BI_ODS] REMOVE FILE [PF_ICVoucherDetl_Index10];
END
GO

/*
删除文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_ICVoucherDetl_Data'))
BEGIN
	ALTER DATABASE [BI_ODS] REMOVE FILEGROUP [FG_ICVoucherDetl_Data]
END
GO

/*
删除文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_ICVoucherDetl_Index'))
BEGIN
	ALTER DATABASE [BI_ODS] REMOVE FILEGROUP [FG_ICVoucherDetl_Index]
END
GO

/*
创建文件组
*/
ALTER DATABASE [BI_ODS] ADD
FILEGROUP [FG_ICVoucherDetl_Data]
GO

ALTER DATABASE [BI_ODS] ADD
FILEGROUP [FG_ICVoucherDetl_Index]
GO


/*
创建文件
*/
ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Data1',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Data1.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Data2',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Data2.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Data3',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Data3.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Data4',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Data4.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Data];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Data5',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Data5.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Data];
GO

/*
创建索引
*/
ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index1',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index1.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index2',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index2.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index3',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index3.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index4',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index4.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index5',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index5.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index6',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index6.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index7',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index7.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index8',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index8.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index9',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index9.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

ALTER DATABASE [BI_ODS] ADD
FILE (
	NAME = 'PF_ICVoucherDetl_Index10',
	FILENAME = 'D:\BIDatabases\ICVoucherDetl_Partitions\PF_ICVoucherDetl_Index10.NDF',
	SIZE = 2048MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_ICVoucherDetl_Index];
GO

CREATE TABLE [ICVoucherDetl]
(
	 [ProdID] INT NOT NULL
	,[BillID] INT NOT NULL
	,[LotNo] VARCHAR(20) NOT NULL
	,[MinUnitQty] NUMERIC(15, 4)
	,[BillCost] MONEY
	,[ProdCost] MONEY
	,[CostAmount] NUMERIC(15, 2)
)
ON [FG_ICVoucherDetl_Data]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_ICVoucherDetl_01'))
BEGIN
    DROP INDEX [dbo].[ICVoucherDetl].[NCIX_ICVoucherDetl_01];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_ICVoucherDetl_01] ON [dbo].[ICVoucherDetl]
(
	[ProdID] ASC,
	[BillID] ASC
)
INCLUDE ( 	[LotNo],
	[MinUnitQty],
	[BillCost],
	[ProdCost],
	[CostAmount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_ICVoucherDetl_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS a WITH(NOLOCK) WHERE [a].[name] = 'NCIX_ICVoucherDetl_02'))
BEGIN
    DROP INDEX [dbo].[ICVoucherDetl].[NCIX_ICVoucherDetl_02];
END
GO


CREATE NONCLUSTERED INDEX [NCIX_ICVoucherDetl_02] ON [dbo].[ICVoucherDetl]
(
	[BillID] ASC
)
INCLUDE ( 	[ProdID],
	[LotNo],
	[MinUnitQty],
	[BillCost],
	[ProdCost],
	[CostAmount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_ICVoucherDetl_Index]
GO
