IF (OBJECT_ID(N'[dbo].[HP_LoopSetting]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[HP_LoopSetting];
END
GO

CREATE TABLE [dbo].[HP_LoopSetting]
(
	 [LoopId] INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
	,[LoopDesc] NVARCHAR(255) NOT NULL
	,[InitValue] INT NOT NULL
	,[MaxValue] INT NOT NULL
	,[ZL_MaxValue] INT NOT NULL
	,[AssignValue] INT NOT NULL
	,[ValueUnit] NVARCHAR(20) NOT NULL
)
GO

INSERT INTO [dbo].[HP_LoopSetting]
        (
         [LoopDesc]
        ,[InitValue]
        ,[MaxValue]
        ,[ZL_MaxValue]
        ,[AssignValue]
        ,[ValueUnit]
        )
SELECT N'销售提单全量抽取', 1, 36, 3, 1, N'MONTH'
UNION ALL
SELECT N'销售提单打印全量抽取', 1, 36, 3, 1, N'MONTH'
UNION ALL
SELECT N'月结库存全量抽取', 1, 12, 1, 3, N'MONTH'
UNION ALL
SELECT N'收发存全量抽取', 1, 36, 3, 1, N'MONTH'
UNION ALL
SELECT N'进销存全量抽取', 1, 12, 3, 3, N'MONTH'
UNION ALL
SELECT N'采购订单', 1, 36, 3, 36, N'MONTH'
UNION ALL
SELECT N'采购验收', 1, 36, 3, 36, N'MONTH'
UNION ALL
SELECT N'采购订单打印', 1, 36, 3, 36, N'MONTH'
UNION ALL
SELECT N'采购订单执行', 1, 36, 3, 36, N'MONTH'
GO

IF (OBJECT_ID(N'[dbo].[usp_GetDateRangeByLoopId]', 'P') IS NOT NULL)
BEGIN
	DROP PROCEDURE [dbo].[usp_GetDateRangeByLoopId];
END
GO

CREATE PROCEDURE [dbo].[usp_GetDateRangeByLoopId]
(
	@loopId INT,
	@IsAddFlag BIT =1	--默认获取时间增量
)
AS
	DECLARE @beginDate NVARCHAR(10), @endDate NVARCHAR(10), @sql NVARCHAR(2000), @isError INT, @maxValue INT, @valueUnit NVARCHAR(50), @initBeginDate NVARCHAR(10), @zl_MaxValue INT;
	SET @isError = 0;
	IF (@loopId IS NULL OR @loopId <= 0)
	BEGIN
		SET @isError = 1;
	END
	IF (NOT EXISTS(SELECT 1 FROM [dbo].[HP_LoopSetting] AS h WHERE [h].[LoopId] = @loopId))
	BEGIN
		SET @isError = 1;
	END
    
	IF (@isError = 1)
	BEGIN
		SET @beginDate = CONVERT(NVARCHAR(10), DATEADD(YEAR, -3, GETDATE()-1), 120);
		SET @endDate = CONVERT(NVARCHAR(10), GETDATE() - 1, 120);
	END
	ELSE
    BEGIN
		SELECT @valueUnit = [a].[ValueUnit], @maxValue = [a].[MaxValue], @zl_MaxValue = [a].[ZL_MaxValue] FROM [dbo].[HP_LoopSetting] AS a WITH(NOLOCK) WHERE [a].[LoopId] = @loopId;
		IF (@valueUnit IS NULL OR LTRIM(RTRIM(@valueUnit)) = '' OR UPPER(@valueUnit) NOT IN ('DAY', 'MONTH', 'QUARTER', 'YEAR'))
		BEGIN
			SET @valueUnit = 'MONTH';
		END;
		SET @sql = N'SELECT @initBeginDate = CONVERT(NVARCHAR(10), DATEADD(' + @valueUnit + ', -1 * @zl_MaxValue, GETDATE() - 1), 120);';
		PRINT @sql;
		EXEC [sys].[sp_executesql] @sql, N'@initBeginDate nvarchar(10) out, @zl_MaxValue int', @initBeginDate OUT, @zl_MaxValue;
		IF @IsAddFlag=0
		BEGIN
			SET @sql = N'SELECT @beginDate = CONVERT(NVARCHAR(10), DATEADD(' + @valueUnit + ', -1 * @maxValue, CONVERT(DATETIME, ''' + @initBeginDate + ''')), 120), @endDate = CONVERT(NVARCHAR(10),CONVERT(DATETIME, ''' + @initBeginDate + ''') - 1, 120);';
			EXEC [sys].[sp_executesql] @sql, N'@beginDate nvarchar(10) out, @endDate nvarchar(10) out, @maxValue int', @beginDate OUT, @endDate OUT, @maxValue;
		END
		ELSE 
		BEGIN 
			SET @sql = N'SELECT @beginDate = @initBeginDate, @endDate = CONVERT(NVARCHAR(10), GETDATE() - 1, 120);';
			EXEC [sys].[sp_executesql] @sql, N'@beginDate nvarchar(10) out, @initBeginDate nvarchar(10), @endDate nvarchar(10) out', @beginDate OUT, @initBeginDate, @endDate OUT;
		END  		
		
	END
    
	SELECT @beginDate AS BeginDate, @endDate AS EndDate;
GO

EXEC [dbo].[usp_GetDateRangeByLoopId] @loopId = 1,@IsAddFlag=0

EXEC [dbo].[usp_GetDateRangeByLoopId] @loopId = 7










