IF (OBJECT_ID('[dbo].[usp_GetLoopPeriod]', 'P') IS NOT NULL)
BEGIN
	DROP PROCEDURE [dbo].[usp_GetLoopPeriod];
END
GO

CREATE PROCEDURE [dbo].[usp_GetLoopPeriod]
(
	@currLoopValue INT,
	@loopId INT,
	@IsAddFlag BIT =1	--默认获取时间增量
)
AS
	DECLARE @beginDate INT, @endDate INT, @sql NVARCHAR(2000), @sqlForDate NVARCHAR(1000), @assignValue INT, @valueUnit NVARCHAR(50), @isError INT, @initBeginDate NVARCHAR(10), @zl_MaxValue INT;
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
		SET @beginDate = 0;
		SET @endDate = 0;
	END
	ELSE
	BEGIN
		SELECT @valueUnit = [a].[ValueUnit], @assignValue = [a].[AssignValue], @zl_MaxValue = [a].[ZL_MaxValue] FROM [dbo].[HP_LoopSetting] AS a WITH(NOLOCK) WHERE [a].[LoopId] = @loopId;
		IF (@valueUnit IS NULL OR LTRIM(RTRIM(@valueUnit)) = '' OR UPPER(@valueUnit) NOT IN ('DAY', 'MONTH', 'QUARTER', 'YEAR'))
		BEGIN
			SET @valueUnit = 'MONTH';
		END;
		IF @IsAddFlag!=1
		BEGIN
			IF (@assignValue IS NULL) SET @assignValue = 0;
			SET @sql = N'SELECT @initBeginDate = CONVERT(NVARCHAR(10), DATEADD(' + @valueUnit + ', -1 * @assignValue * @zl_MaxValue, GETDATE() - 1), 120);';
			PRINT @sql;
			EXEC [sys].[sp_executesql] @sql, N'@initBeginDate nvarchar(10) out, @assignValue int, @zl_MaxValue int', @initBeginDate OUT, @assignValue, @zl_MaxValue;

			SET @sqlForDate = N'SELECT @beginDate = CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(' + @valueUnit + ', -1 * @currLoopValue * @assignValue, CONVERT(DATETIME, ''' + @initBeginDate + ''')), 112));';
			--PRINT @sqlForDate;
			EXEC [sys].[sp_executesql] @sqlForDate, N'@beginDate int out, @currLoopValue int, @assignValue int', @beginDate OUT, @currLoopValue, @assignValue;
			--SELECT @beginDate;

			SET @sqlForDate = N'SELECT @endDate = CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(' + @valueUnit + ', -1 * (@currLoopValue - 1) * @assignValue, CONVERT(DATETIME, ''' + @initBeginDate + ''') - 1), 112));';
			EXEC [sys].[sp_executesql] @sqlForDate, N'@endDate int out, @currLoopValue int, @assignValue int', @endDate OUT, @currLoopValue, @assignValue;
		END 
		ELSE
		BEGIN
			IF (@assignValue IS NULL) SET @assignValue = 0;
			SET @sqlForDate = N'SELECT @beginDate = CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(' + @valueUnit + ', -1 * @currLoopValue * @assignValue, GETDATE() - 1), 112));';
			--PRINT @sqlForDate;
			EXEC [sys].[sp_executesql] @sqlForDate, N'@beginDate int out, @currLoopValue int, @assignValue int', @beginDate OUT, @currLoopValue, @assignValue;
			--SELECT @beginDate;
			IF (@currLoopValue = 1)
			BEGIN
				SET @sqlForDate = N'SELECT @endDate = CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(' + @valueUnit + ', -1 * (@currLoopValue - 1) * @assignValue, GETDATE() - 1), 112));';
			END
			ELSE
			BEGIN
				SET @sqlForDate = N'SELECT @endDate = CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(' + @valueUnit + ', -1 * (@currLoopValue - 1) * @assignValue, GETDATE() - 2), 112));';
			END
			EXEC [sys].[sp_executesql] @sqlForDate, N'@endDate int out, @currLoopValue int, @assignValue int', @endDate OUT, @currLoopValue, @assignValue;
		END 
	END
	SELECT @beginDate AS BeginDate, @endDate AS EndDate;
GO

EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 11, @loopId = 3,@IsAddFlag=0

EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 1, @loopId = 3