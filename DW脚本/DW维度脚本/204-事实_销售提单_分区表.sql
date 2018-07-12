 

--/*清空日志*/
--ALTER DATABASE [BI_DW]
--SET RECOVERY SIMPLE
--DBCC SHRINKFILE (BI_DW_Log, 1)
--ALTER DATABASE [BI_DW]
--SET RECOVERY FULL
--GO

IF (OBJECT_ID('[dbo].[Fact_SaleBill]', 'U') IS NOT NULL)
BEGIN
	TRUNCATE TABLE [dbo].[Fact_SaleBill];
	DROP TABLE [dbo].[Fact_SaleBill];
	PRINT '删除表：[dbo].[Fact_SaleBill]';
END
GO

/*
删除分区架构
*/
IF (EXISTS(SELECT 1 FROM [sys].[partition_schemes] AS psc WITH(NOLOCK) WHERE [psc].[name] = 'Sch_Fact_SaleBill_DateKey'))
BEGIN
	DROP PARTITION SCHEME [Sch_Fact_SaleBill_DateKey];
END
GO
/*删除分区函数*/
IF (EXISTS(SELECT 1 FROM [sys].[partition_functions] AS pf WITH(NOLOCK) WHERE [pf].[name] = 'Fun_Fact_SaleBill_DateKey'))
BEGIN
	DROP PARTITION FUNCTION [Fun_Fact_SaleBill_DateKey];
END
GO

/*
删除分区文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2013H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2013H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2013H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2013H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2013H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2013H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2013H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2013H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2013H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2013H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2013H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2013H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2014H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2014H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2014H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2014H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2014H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2014H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2014H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2014H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2014H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2014H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2014H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2014H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2015H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2015H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2015H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2015H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2015H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2015H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2015H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2015H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2015H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2015H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2015H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2015H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2016H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2016H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2016H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2016H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2016H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2016H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2016H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2016H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2016H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2016H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2016H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2016H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2017H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2017H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2017H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2017H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2017H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2017H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2017H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2017H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2017H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2017H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2017H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2017H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2018H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2018H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2018H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2018H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2018H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2018H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2018H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2018H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2018H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2018H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2018H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2018H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2019H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2019H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2019H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2019H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2019H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2019H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2019H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2019H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2019H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2019H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2019H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2019H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2020H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2020H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2020H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2020H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2020H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2020H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2020H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2020H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2020H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2020H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2020H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2020H2Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2021H1Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2021H1Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2021H1Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2021H1Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2021H1Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2021H1Data2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2021H2Data1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2021H2Data1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2021H2Data1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_2021H2Data2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_2021H2Data2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_2021H2Data2];
END
GO

/*
索引文件
*/
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_Index1'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_Index1], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_Index1];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_Index2'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_Index2], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_Index2];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_Index3'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_Index3], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_Index3];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_Index4'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_Index4], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_Index4];
END
IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = 'PF_Fact_SaleBill_Index5'))
BEGIN
	DBCC SHRINKFILE([PF_Fact_SaleBill_Index5], EMPTYFILE);
	ALTER DATABASE [BI_DW] REMOVE FILE [PF_Fact_SaleBill_Index5];
END
GO



/*
删除分区文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2013H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2013H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2013H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2013H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2014H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2014H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2014H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2014H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2015H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2015H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2015H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2015H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2016H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2016H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2016H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2016H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2017H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2017H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2017H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2017H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2018H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2018H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2018H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2018H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2019H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2019H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2019H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2019H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2020H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2020H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2020H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2020H2]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2021H1'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2021H1]
END
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_2021H2'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_2021H2]
END
GO

/*
索引文件组
*/
IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = 'FG_Fact_SaleBill_Index'))
BEGIN
	ALTER DATABASE [BI_DW] REMOVE FILEGROUP [FG_Fact_SaleBill_Index]
END
GO


/*
创建文件组
*/
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2013H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2013H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2014H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2014H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2015H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2015H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2016H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2016H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2017H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2017H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2018H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2018H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2019H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2019H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2020H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2020H2]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2021H1]
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_2021H2]
GO

/*
索引文件组
*/
ALTER DATABASE [BI_DW] ADD
FILEGROUP [FG_Fact_SaleBill_Index]
GO


/*创建分区文件*/
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2013H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2013H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2013H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2013H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2013H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2013H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2013H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2013H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2013H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2013H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2013H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2013H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2014H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2014H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2014H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2014H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2014H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2014H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2014H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2014H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2014H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2014H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2014H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2014H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2015H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2015H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2015H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2015H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2015H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2015H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2015H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2015H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2015H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2015H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2015H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2015H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2016H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2016H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2016H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2016H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2016H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2016H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2016H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2016H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2016H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2016H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2016H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2016H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2017H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2017H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2017H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2017H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2017H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2017H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2017H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2017H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2017H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2017H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2017H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2017H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2018H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2018H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2018H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2018H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2018H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2018H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2018H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2018H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2018H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2018H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2018H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2018H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2019H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2019H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2019H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2019H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2019H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2019H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2019H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2019H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2019H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2019H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2019H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2019H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2020H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2020H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2020H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2020H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2020H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2020H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2020H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2020H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2020H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2020H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2020H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2020H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2021H1Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2021H1Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2021H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2021H1Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2021H1Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2021H1]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2021H2Data1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2021H2Data1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2021H2]
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_2021H2Data2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Partitions\PF_Fact_SaleBill_2021H2Data2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_2021H2]
GO

/*
创建索引文件
*/
ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_Index1',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Indexs\PF_Fact_SaleBill_Index1.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_Index];
GO

ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_Index2',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Indexs\PF_Fact_SaleBill_Index2.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_Index];
GO

ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_Index3',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Indexs\PF_Fact_SaleBill_Index3.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_Index];
GO

ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_Index4',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Indexs\PF_Fact_SaleBill_Index4.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_Index];
GO

ALTER DATABASE [BI_DW] ADD
FILE (
	NAME = 'PF_Fact_SaleBill_Index5',
	FILENAME = 'D:\BIDatabases\BI_DW\Fact_SaleBill_Indexs\PF_Fact_SaleBill_Index5.NDF',
	SIZE = 1024MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [FG_Fact_SaleBill_Index];
GO


/*
创建分区函数
*/
CREATE PARTITION FUNCTION Fun_Fact_SaleBill_DateKey(INT) AS RANGE LEFT FOR VALUES(20130630,20131231,20140630,20141231,20150630,20151231,20160630,20161231,20170630,20171231,20180630,20181231,20190630,20191231,20200630,20201231,20210630,20211231);
GO


/*
创建分区架构
*/
CREATE PARTITION SCHEME Sch_Fact_SaleBill_DateKey AS PARTITION Fun_Fact_SaleBill_DateKey TO ([FG_Fact_SaleBill_2013H1],[FG_Fact_SaleBill_2013H2],[FG_Fact_SaleBill_2014H1],[FG_Fact_SaleBill_2014H2],[FG_Fact_SaleBill_2015H1],[FG_Fact_SaleBill_2015H2],[FG_Fact_SaleBill_2016H1],[FG_Fact_SaleBill_2016H2],[FG_Fact_SaleBill_2017H1],[FG_Fact_SaleBill_2017H2],[FG_Fact_SaleBill_2018H1],[FG_Fact_SaleBill_2018H2],[FG_Fact_SaleBill_2019H1],[FG_Fact_SaleBill_2019H2],[FG_Fact_SaleBill_2020H1],[FG_Fact_SaleBill_2020H2],[FG_Fact_SaleBill_2021H1],[FG_Fact_SaleBill_2021H2], [PRIMARY])
GO


/*创建表结构*/
CREATE TABLE [dbo].[Fact_SaleBill]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[GZDateKey] INT NOT NULL
	,[ProdId] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[BusOfficeId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[EmpId] INT NOT NULL
	,[SubCustId] INT NOT NULL
	,[SubWHId] INT NOT NULL
	,[SaleTypeBaseId] INT NOT NULL
	,[SaleMethodId] INT NOT NULL
	,[IsGiveId] INT NOT NULL
	,[OrderTypeId] INT NOT NULL
	,[BillStatusKey] INT NOT NULL
	,[BillTypeId] INT NOT NULL
    ,[StatusId] INT NOT NULL
	,[MoveSubTypeId] INT NOT NULL
	,[MoveTypeId] INT NOT NULL
	,[BillSrcId] INT
	,[BatchId] NCHAR(31) NOT NULL
	,[InvoiceStatusId] INT NOT NULL
	,[IsDisabledId] BIT NOT NULL
	,[SaleBillId] INT NOT NULL
	,[MinUnitSaleQty] NUMERIC(18, 6)
	,[AuxiUnitSaleQty] NUMERIC(18, 6)
	,[BasePackUnitSaleQty] NUMERIC(18, 6)
	,[SaleWeight] NUMERIC(18, 6)
	,[SaleAmt] NUMERIC(18, 6)
	,[SaleTax] NUMERIC(18, 6)
	,[NonTaxSaleAmt] NUMERIC(18, 6)
	,[CommAmt] NUMERIC(18, 6)
	,[SaleCostAmt] NUMERIC(18, 6)
	,[GiveProdCostAmt] NUMERIC(18, 6)
	,[SaleGPAmt] NUMERIC(18, 6)
	,[RegionId] INT NOT NULL
    ,[IsProced] BIT
) ON Sch_Fact_SaleBill_DateKey([DateKey])
GO

/*
创建索引
*/
CREATE CLUSTERED INDEX [CIX_Fact_SaleBill_01] ON [dbo].[Fact_SaleBill]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Sch_Fact_SaleBill_DateKey]([DateKey])

CREATE NONCLUSTERED INDEX [NCIX_Fact_SaleBill_02] ON [dbo].[Fact_SaleBill]
(
	[NextYearDateKey] ASC
)
INCLUDE ( 	[GZDateKey],
	[ProdId],
	[OrgId],
	[BusOfficeId],
	[CompBranchId],
	[EmpId],
	[SubCustId],
	[SubWHId],
	[SaleTypeBaseId],
	[SaleMethodId],
	[IsGiveId],
	[OrderTypeId],
	[BillStatusKey],
	[BillTypeId],
	[StatusId],
	[MoveSubTypeId],
	[MoveTypeId],
	[BillSrcId],
	[BatchId],
	[InvoiceStatusId],
	[IsDisabledId],
	[SaleBillId],
	[MinUnitSaleQty],
	[AuxiUnitSaleQty],
	[BasePackUnitSaleQty],
	[SaleWeight],
	[SaleAmt],
	[SaleTax],
	[NonTaxSaleAmt],
	[CommAmt],
	[SaleCostAmt],
	[GiveProdCostAmt],
	[SaleGPAmt],
	[IsProced],
	[RegionId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

/*创建表：[dbo].[Fact_SaleBill_ZL]*/
IF (OBJECT_ID('[dbo].[Fact_SaleBill_ZL]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_SaleBill_ZL];
	PRINT '删除表：[dbo].[Fact_SaleBill_ZL]';
END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_SaleBill_ZL]
FROM [dbo].[Fact_SaleBill]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Fact_SaleBill_ZL_01'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill_ZL].[CIX_Fact_SaleBill_ZL_01]
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_SaleBill_ZL_01] ON [dbo].[Fact_SaleBill_ZL]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO