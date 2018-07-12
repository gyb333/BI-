/*
创建分区文件
*/
DECLARE @beginYear INT, @endYear INT, @sql NVARCHAR(2000), @partFileName NVARCHAR(500), @partPath NVARCHAR(2000), @fileGroupName NVARCHAR(200), @dbName NVARCHAR(50), @dfCount INT, @i INT, @hCount INT, @j INT, @hName NVARCHAR(50);
SET @beginYear = 2013;
SET @endYear = 2021;
SET @partPath = 'E:\BIDatabases\YHJLBI_DW\Fact_SaleBill_Partitions\';
SET @dbName = N'[YHJLBI_DW]';
WHILE (@beginYear <= @endYear)
BEGIN
	SET @hCount = 2;
	SET @j = 1;
	WHILE (@j <= @hCount)
	BEGIN
		SET @dfCount = 2;
		SET @i = 1;
		SET @hName = N'H' + CONVERT(NVARCHAR(5), @j);
		SET @fileGroupName = 'FG_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName;
		WHILE (@i <= @dfCount)
		BEGIN
			SET @partFileName = 'PF_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName + 'Data' + CONVERT(NVARCHAR(5), @i);
			SET @sql = 'ALTER DATABASE ' + @dbName + ' ADD
FILE (
	NAME = ''' + @partFileName + ''',
	FILENAME = ''' + @partPath + @partFileName + '.NDF'',
	SIZE = 4096MB,
	FILEGROWTH = 512MB
) TO FILEGROUP [' + @fileGroupName + ']';
			PRINT @sql;
			SET @i = @i + 1;
		END
		SET @j = @j + 1;
	END
	SET @beginYear = @beginYear + 1;
END
GO

/*
删除分区文件
*/
DECLARE @beginYear INT, @endYear INT, @sql NVARCHAR(2000), @partFileName NVARCHAR(500), @fileGroupName NVARCHAR(200), @dbName NVARCHAR(50), @dfCount INT, @i INT, @hCount INT, @j INT, @hName NVARCHAR(50);
SET @beginYear = 2013;
SET @endYear = 2021;
SET @dbName = N'[YHJLBI_DW]';
WHILE (@beginYear <= @endYear)
BEGIN
	SET @hCount = 2;
	SET @j = 1;
	WHILE (@j <= @hCount)
	BEGIN
		SET @dfCount = 2;
		SET @i = 1;
		SET @hName = N'H' + CONVERT(NVARCHAR(5), @j);
		SET @fileGroupName = 'FG_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName;
		WHILE (@i <= @dfCount)
		BEGIN
			SET @partFileName = 'PF_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName + 'Data' + CONVERT(NVARCHAR(5), @i);
			SET @sql = 'IF (EXISTS(SELECT 1 FROM [sys].[sysfiles] AS sf WITH(NOLOCK) WHERE [sf].[name] = ''' + @partFileName + '''))
BEGIN
	DBCC SHRINKFILE([' + @partFileName + '], EMPTYFILE);
	ALTER DATABASE ' + @dbName + ' REMOVE FILE [' + @partFileName + '];
END';
			PRINT @sql;
			SET @i = @i + 1;
		END
		SET @j = @j + 1;
	END
	SET @beginYear = @beginYear + 1;
END
GO

/*
创建文件组
*/
DECLARE @beginYear INT, @endYear INT, @sql NVARCHAR(2000), @partFileName NVARCHAR(500), @fileGroupName NVARCHAR(200), @dbName NVARCHAR(50), @dfCount INT, @i INT, @hCount INT, @j INT, @hName NVARCHAR(50);
SET @beginYear = 2013;
SET @endYear = 2021;
SET @dbName = N'[YHJLBI_DW]';
WHILE (@beginYear <= @endYear)
BEGIN
	SET @hCount = 2;
	SET @j = 1;
	WHILE (@j <= @hCount)
	BEGIN
		SET @dfCount = 2;
		SET @i = 1;
		SET @hName = N'H' + CONVERT(NVARCHAR(5), @j);
		SET @fileGroupName = 'FG_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName;
		SET @sql = 'ALTER DATABASE ' + @dbName + ' ADD
FILEGROUP [' + @fileGroupName + ']';
		PRINT @sql;
		--PRINT '[' + @fileGroupName + '],';
		SET @j = @j + 1;
	END
	SET @beginYear = @beginYear + 1;
END
GO

/*删除文件组*/
DECLARE @beginYear INT, @endYear INT, @sql NVARCHAR(2000), @partFileName NVARCHAR(500), @fileGroupName NVARCHAR(200), @dbName NVARCHAR(50), @dfCount INT, @i INT, @hCount INT, @j INT, @hName NVARCHAR(50);
SET @beginYear = 2013;
SET @endYear = 2021;
SET @dbName = N'[YHJLBI_DW]';
WHILE (@beginYear <= @endYear)
BEGIN
	SET @hCount = 2;
	SET @j = 1;
	WHILE (@j <= @hCount)
	BEGIN
		SET @dfCount = 2;
		SET @i = 1;
		SET @hName = N'H' + CONVERT(NVARCHAR(5), @j);
		SET @fileGroupName = 'FG_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName;
		SET @sql = 'IF (EXISTS(SELECT 1 FROM [sys].[filegroups] AS fg WITH(NOLOCK) WHERE [fg].[name] = ''' + @fileGroupName + '''))
BEGIN
	ALTER DATABASE ' + @dbName + ' REMOVE FILEGROUP [' + @fileGroupName + ']
END';
		PRINT @sql;
		SET @j = @j + 1;
	END
	SET @beginYear = @beginYear + 1;
END
GO



/*
创建分区函数
*/
DECLARE @beginDate DATETIME, @endDate DATETIME, @loop INT, @range NVARCHAR(1000);
SET @loop = 1;
SET @beginDate = '2013-01-01';
--SELECT CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(MONTH, 6, @beginDate)), 112));
SET @endDate = '2021-12-31';
--SELECT @endDate
SET @range = '';
WHILE (@beginDate <= @endDate)
BEGIN
	SET @range = @range + CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(MONTH, 6, @beginDate)), 112) + ',';
	SET @beginDate = DATEADD(MONTH, 6, @beginDate);
END
--PRINT LEFT(@range, LEN(@range) - 1);
PRINT 'CREATE PARTITION FUNCTION Fun_Fact_SaleBill_DateKey(INT) AS RANGE LEFT FOR VALUES(' + LEFT(@range, LEN(@range) - 1) + ');'
GO


/*
创建分区架构
*/
DECLARE @beginYear INT, @endYear INT, @sql NVARCHAR(2000), @fileGroupName NVARCHAR(2000), @hCount INT, @j INT, @hName NVARCHAR(50);
SET @beginYear = 2013;
SET @endYear = 2021;
SET @fileGroupName = '';
WHILE (@beginYear <= @endYear)
BEGIN
	SET @hCount = 2;
	SET @j = 1;
	WHILE (@j <= @hCount)
	BEGIN
		SET @hName = N'H' + CONVERT(NVARCHAR(5), @j);
		SET @fileGroupName = @fileGroupName + '[FG_Fact_SaleBill_' + CONVERT(NVARCHAR(4), @beginYear) + @hName + '],';
		SET @j = @j + 1;
	END
	SET @beginYear = @beginYear + 1;
END
PRINT N'CREATE PARTITION SCHEME Sch_Fact_SaleBill_DateKey AS PARTITION Fun_Fact_SaleBill_DateKey TO (' + @fileGroupName + ' [PRIMARY])';
GO