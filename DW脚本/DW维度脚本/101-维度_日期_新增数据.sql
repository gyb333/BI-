DECLARE @maxDateKey INT, @maxDate DATETIME, @now INT, @RCount INT, @AllCount INT;
DECLARE @b1 DATETIME, @e1 DATETIME;
SET @now = CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112));
SELECT @RCount = COUNT(1) FROM [dbo].[Dim_Date];
--设置起始日期
--SET @b1 = CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(8), DATEADD(YEAR, -3, GETDATE()), 112), 4) + '-01-01');
SET @b1 = '2013-01-01'
SET @e1 = DATEADD(DD, 1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(8), GETDATE(), 112), 4) + '-12-31'));
SELECT @AllCount = DATEDIFF(DAY, @b1, @e1);
IF (@RCount < @AllCount)
BEGIN
TRUNCATE TABLE [dbo].[Dim_Date];
SET DATEFIRST 1--设周1为每周的第一天
--允许的值是1～7，1表示一周的第一天是星期一，7表示一周的第一天对应为星期日。默认值是7(即一周的第一天为星期日)
--向时间表插入数据
WHILE (@b1 < @e1)
BEGIN
	INSERT  INTO dbo.[Dim_Date]
	(
		 [DateKey]
		,[DateKeyOfCNWeekName]
		,[FullDateAlternateKey]
		--年
		,[CalendarYear]
		,[DayNumberOfYear]
		--半年
		,[CalendarSemesterNumberOfYearCode]
		,[CalendarSemesterNumberOfYear]
		,[CalendarENCalendarSemesterOfYear]
		,[CalendarCNCalendarSemesterOfYear]
		--季度
		,[CalendarQuarterNumberOfYearCode]
		,[CalendarQuarterNumberOfYear]
		,[CalendarENQuarterNameOfYear]
		,[CalendarCNQuarterNameOfYear]
		,[CalendarCNQuarterNameOfYear_II]
		--月份
		,[CalendarMonthNumberOfYearCode]
		,[CalendarMonthNumberOfYear]
		,[CalendarENMonthNameOfYear]
		,[CalendarENMonthShortNameOfYear]
		,[CalendarCNMonthNameOfYear]
		,[CalendarCNMonthNameOfYear_II]
		,[CalendarMonthNameOfYear]
		,[PeriodOfTenDays]
		,[DayNumberOfMonth]
		--周
		,[CalendarWeekNumberOfYearCode]
		,[CalendarWeekNumberOfYear]
		,[CalendarCNWeekNameOfYear]
		,[DayNumberOfWeek]
		,[IsWeekend]

		,[ENDayNameOfWeek]
		,[ENDayShortNameOfWeek]
		,[CNDayNameOfWeek]
	)
	VALUES
	(
		 CONVERT(INT, CONVERT(NVARCHAR(8), @b1, 112)) --[DateKey]
		,CONVERT(NVARCHAR(8), @b1, 112) + '(' + CASE
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN N'星期一'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN N'星期二'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN N'星期三'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN N'星期四'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN N'星期五'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN N'星期六'
			ELSE N'星期日'
		 END + ')'--[DateKeyOfCNWeekName]
		,@b1 --[FullDateAlternateKey]
		--年
		,DATEPART(YEAR, @b1) --[CalendarYear]
		,DATENAME(DAY, @b1) --[DayNumberOfYear]
		--半年
		,CASE --[CalendarSemesterNumberOfYearCode]
			WHEN DATEPART(MONTH, @b1) <= 6
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'01'
			ELSE CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'02'
		 END
		,CASE --[CalendarSemesterNumberOfYear]
			WHEN DATEPART(MONTH, @b1) <= 6 THEN N'1'
			ELSE N'2'
		 END
		,CASE --[CalendarENCalendarSemesterOfYear]
			WHEN DATEPART(MONTH, @b1) <= 6 THEN N'Half1'
			ELSE N'Half2'
		 END
		,CASE --[CalendarCNCalendarSemesterOfYear]
			WHEN DATEPART(MONTH, @b1) <= 6 THEN N'上半年'
			ELSE N'下半年'
		 END
		--季度
		,CASE --[CalendarQuarterNumberOfYearCode]
			WHEN DATEPART(MONTH, @b1) <= 3
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'01'
			WHEN DATEPART(MONTH, @b1) > 3
				AND DATEPART(MONTH, @b1) <= 6
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'02'
			WHEN DATEPART(MONTH, @b1) > 6
				AND DATEPART(MONTH, @b1) <= 9
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'03'
			ELSE CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'04'
		 END
		,DATENAME(QUARTER, @b1) --[CalendarQuarterNumberOfYear]
		,CASE --[CalendarENQuarterNameOfYear]
			WHEN DATENAME(QUARTER, @b1) = '1' THEN 'Q1'
			WHEN DATENAME(QUARTER, @b1) = '2' THEN 'Q2'
			WHEN DATENAME(QUARTER, @b1) = '3' THEN 'Q3'
			ELSE 'Q4'
		END
		,CASE --[CalendarCNQuarterNameOfYear]
			WHEN DATENAME(QUARTER, @b1) = '1' THEN N'一季度'
			WHEN DATENAME(QUARTER, @b1) = '2' THEN N'二季度'
			WHEN DATENAME(QUARTER, @b1) = '3' THEN N'三季度'
			ELSE N'四季度'
		 END
		,CASE --[CalendarCNQuarterNameOfYear]
			WHEN DATENAME(QUARTER, @b1) = '1' THEN N'1季度'
			WHEN DATENAME(QUARTER, @b1) = '2' THEN N'2季度'
			WHEN DATENAME(QUARTER, @b1) = '3' THEN N'3季度'
			ELSE N'4季度'
		 END
		--月份
		,CASE --[CalendarMonthNumberOfYearCode]
			WHEN DATEPART(MONTH, @b1) <= 9
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'0'
				+ CONVERT(VARCHAR(2), DATEPART(MONTH, @b1))
			ELSE CONVERT(VARCHAR(4), DATEPART(YEAR, @b1))
				+ CONVERT(VARCHAR(2), DATEPART(MONTH, @b1))
		 END
		,DATEPART(MONTH, @b1) --[CalendarMonthNumberOfYear]
		,CASE --[CalendarENMonthNameOfYear]
			WHEN (DATEPART(MONTH, @b1)) = '1' THEN 'January'
			WHEN (DATEPART(MONTH, @b1)) = '2' THEN 'February'
			WHEN (DATEPART(MONTH, @b1)) = '3' THEN 'March'
			WHEN (DATEPART(MONTH, @b1)) = '4' THEN 'April'
			WHEN (DATEPART(MONTH, @b1)) = '5' THEN 'May'
			WHEN (DATEPART(MONTH, @b1)) = '6' THEN 'June'
			WHEN (DATEPART(MONTH, @b1)) = '7' THEN 'July'
			WHEN (DATEPART(MONTH, @b1)) = '8' THEN 'August'
			WHEN (DATEPART(MONTH, @b1)) = '9' THEN 'September'
			WHEN (DATEPART(MONTH, @b1)) = '10' THEN 'October'
			WHEN (DATEPART(MONTH, @b1)) = '11' THEN 'November'
			ELSE 'December'
		 END
		,CASE --[CalendarENMonthShortNameOfYear]
			WHEN (DATEPART(MONTH, @b1)) = '1' THEN 'Jan'
			WHEN (DATEPART(MONTH, @b1)) = '2' THEN 'Feb'
			WHEN (DATEPART(MONTH, @b1)) = '3' THEN 'Mar'
			WHEN (DATEPART(MONTH, @b1)) = '4' THEN 'Apr'
			WHEN (DATEPART(MONTH, @b1)) = '5' THEN 'May'
			WHEN (DATEPART(MONTH, @b1)) = '6' THEN 'Jun'
			WHEN (DATEPART(MONTH, @b1)) = '7' THEN 'Jul'
			WHEN (DATEPART(MONTH, @b1)) = '8' THEN 'Aug'
			WHEN (DATEPART(MONTH, @b1)) = '9' THEN 'Sep'
			WHEN (DATEPART(MONTH, @b1)) = '10' THEN 'Oct'
			WHEN (DATEPART(MONTH, @b1)) = '11' THEN 'Nov'
			ELSE 'Dec'
		 END
		,CASE --[CalendarCNMonthNameOfYear]
			WHEN (DATEPART(MONTH, @b1)) = '1' THEN N'一月'
			WHEN (DATEPART(MONTH, @b1)) = '2' THEN N'二月'
			WHEN (DATEPART(MONTH, @b1)) = '3' THEN N'三月'
			WHEN (DATEPART(MONTH, @b1)) = '4' THEN N'四月'
			WHEN (DATEPART(MONTH, @b1)) = '5' THEN N'五月'
			WHEN (DATEPART(MONTH, @b1)) = '6' THEN N'六月'
			WHEN (DATEPART(MONTH, @b1)) = '7' THEN N'七月'
			WHEN (DATEPART(MONTH, @b1)) = '8' THEN N'八月'
			WHEN (DATEPART(MONTH, @b1)) = '9' THEN N'九月'
			WHEN (DATEPART(MONTH, @b1)) = '10' THEN N'十月'
			WHEN (DATEPART(MONTH, @b1)) = '11' THEN N'十一月'
			ELSE N'十二月'
		 END
		,CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1))) + N'月'
		,CASE
			WHEN (DATEPART(MONTH, @b1)) <= 9 THEN N'0' + CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1)))
			ELSE CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1)))
		 END
		,CASE --[PeriodOfTenDays]
			WHEN DATENAME(DAY, @b1) <= 10 THEN N'上旬'
			WHEN DATENAME(DAY, @b1) > 20 THEN N'下旬'
			ELSE N'中旬'
		 END
		,DATEPART(DAY, @b1) --[DayNumberOfMonth]
		--周
		,CASE --[WeekNumberOfYearCode]
			WHEN CONVERT(INT, DATENAME(WEEK, @b1)) <= 9
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'0'
				+ CONVERT(VARCHAR(2), DATENAME(WEEK, @b1))
			ELSE CONVERT(VARCHAR(4), DATEPART(YEAR, @b1))
				+ CONVERT(VARCHAR(2), DATENAME(WEEK, @b1))
		 END
		,DATENAME(WEEK, @b1) --[CalendarWeekNumberOfYear]
		,N'第' + CONVERT(NVARCHAR(2), DATENAME(WEEK, @b1)) + N'周' --[CalendarCNWeekNameOfYear]
		,DATEPART(WEEKDAY, @b1)--[DayNumberOfWeek]
		,CASE --[Weekend]
			WHEN (DATEDIFF(DAY, '1753-01-01', @b1) % 7 / 5) = 1 THEN '周末' 
			ELSE '平时'
		 END

		,CASE --[ENDayNameOfWeek]
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN 'Monday'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN 'Tuesday'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN 'Wednesday'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN 'Thursday'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN 'Friday'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN 'Saturday'
			ELSE 'Sunday'
		 END
		,CASE --[ENDayShortNameOfWeek]--注意,设定的周几是第一天.
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN 'Mon'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN 'Tue'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN 'Wed'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN 'Thu'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN 'Fri'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN 'Sat'
			ELSE 'Sun'
		 END
		,CASE --[CNDayNameOfWeek]
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN N'星期一'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN N'星期二'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN N'星期三'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN N'星期四'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN N'星期五'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN N'星期六'
			ELSE N'星期日'
		 END
	)
	--日期加1天
	SET @b1 = DATEADD(DAY, 1, @b1);
END
END
GO

/*
,[IsYesterdayId] INT
,[IsYesterdayDesc] NVARCHAR(10)
*/

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[IsYesterdayId] = 0,[Dim_Date].[IsYesterdayDesc] = N'否'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[IsYesterdayId] = 0,[Dim_Date].[IsYesterdayDesc] = N'否'
WHERE [Dim_Date].[DateKey] = CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

/*
,[WeekConFilterId] INT
,[WeekConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 3,[Dim_Date].[WeekConFilterDesc] = N'其它'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 1,[Dim_Date].[WeekConFilterDesc] = N'本周'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 7, 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 2,[Dim_Date].[WeekConFilterDesc] = N'上周'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 14, 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 8, 112))
GO

/*
,[MonthConFilterId] INT
,[MonthConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 4,[Dim_Date].[MonthConFilterDesc] = N'其它'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 1,[Dim_Date].[MonthConFilterDesc] = N'本月'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), GETDATE() - 1, 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 2,[Dim_Date].[MonthConFilterDesc] = N'上月'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), DATEADD(MONTH, -1, GETDATE() - 1), 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(10), GETDATE() - 1, 120), 8) + '01')), 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 3,[Dim_Date].[MonthConFilterDesc] = N'前月'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), DATEADD(MONTH, -2, GETDATE() - 1), 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(MONTH, -1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(10), GETDATE() - 1, 120), 8) + '01'))), 112))
GO

/*
,[QuaConFilterId] INT
,[QuaConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 3,[Dim_Date].[QuaConFilterDesc] = N'其它'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 1,[Dim_Date].[QuaConFilterDesc] = N'本季度'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0), 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 2,[Dim_Date].[QuaConFilterDesc] = N'上季度'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(QUARTER, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0)), 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0)), 112))
GO

/*
,[IsLastTwoYearId] INT
,[IsLastTwoYearDesc] NVARCHAR(10)
*/
UPDATE [dbo].[Dim_Date]
SET [IsLastTwoYearId] = 0, [IsLastTwoYearDesc] = N'否'
GO

UPDATE [dbo].[Dim_Date]
SET [IsLastTwoYearId] = 1, [IsLastTwoYearDesc] = N'是'
WHERE [Dim_Date].[CalendarYear] IN (DATEPART(YEAR, GETDATE()), DATEPART(YEAR, GETDATE()) - 1)
GO
