DECLARE @maxDateKey INT, @maxDate DATETIME, @now INT, @RCount INT, @AllCount INT;
DECLARE @b1 DATETIME, @e1 DATETIME;
SET @now = CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112));
SELECT @RCount = COUNT(1) FROM [dbo].[Dim_Date];
--������ʼ����
--SET @b1 = CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(8), DATEADD(YEAR, -3, GETDATE()), 112), 4) + '-01-01');
SET @b1 = '2013-01-01'
SET @e1 = DATEADD(DD, 1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(8), GETDATE(), 112), 4) + '-12-31'));
SELECT @AllCount = DATEDIFF(DAY, @b1, @e1);
IF (@RCount < @AllCount)
BEGIN
TRUNCATE TABLE [dbo].[Dim_Date];
SET DATEFIRST 1--����1Ϊÿ�ܵĵ�һ��
--�����ֵ��1��7��1��ʾһ�ܵĵ�һ��������һ��7��ʾһ�ܵĵ�һ���ӦΪ�����ա�Ĭ��ֵ��7(��һ�ܵĵ�һ��Ϊ������)
--��ʱ����������
WHILE (@b1 < @e1)
BEGIN
	INSERT  INTO dbo.[Dim_Date]
	(
		 [DateKey]
		,[DateKeyOfCNWeekName]
		,[FullDateAlternateKey]
		--��
		,[CalendarYear]
		,[DayNumberOfYear]
		--����
		,[CalendarSemesterNumberOfYearCode]
		,[CalendarSemesterNumberOfYear]
		,[CalendarENCalendarSemesterOfYear]
		,[CalendarCNCalendarSemesterOfYear]
		--����
		,[CalendarQuarterNumberOfYearCode]
		,[CalendarQuarterNumberOfYear]
		,[CalendarENQuarterNameOfYear]
		,[CalendarCNQuarterNameOfYear]
		,[CalendarCNQuarterNameOfYear_II]
		--�·�
		,[CalendarMonthNumberOfYearCode]
		,[CalendarMonthNumberOfYear]
		,[CalendarENMonthNameOfYear]
		,[CalendarENMonthShortNameOfYear]
		,[CalendarCNMonthNameOfYear]
		,[CalendarCNMonthNameOfYear_II]
		,[CalendarMonthNameOfYear]
		,[PeriodOfTenDays]
		,[DayNumberOfMonth]
		--��
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
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN N'����һ'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN N'���ڶ�'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN N'������'
			ELSE N'������'
		 END + ')'--[DateKeyOfCNWeekName]
		,@b1 --[FullDateAlternateKey]
		--��
		,DATEPART(YEAR, @b1) --[CalendarYear]
		,DATENAME(DAY, @b1) --[DayNumberOfYear]
		--����
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
			WHEN DATEPART(MONTH, @b1) <= 6 THEN N'�ϰ���'
			ELSE N'�°���'
		 END
		--����
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
			WHEN DATENAME(QUARTER, @b1) = '1' THEN N'һ����'
			WHEN DATENAME(QUARTER, @b1) = '2' THEN N'������'
			WHEN DATENAME(QUARTER, @b1) = '3' THEN N'������'
			ELSE N'�ļ���'
		 END
		,CASE --[CalendarCNQuarterNameOfYear]
			WHEN DATENAME(QUARTER, @b1) = '1' THEN N'1����'
			WHEN DATENAME(QUARTER, @b1) = '2' THEN N'2����'
			WHEN DATENAME(QUARTER, @b1) = '3' THEN N'3����'
			ELSE N'4����'
		 END
		--�·�
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
			WHEN (DATEPART(MONTH, @b1)) = '1' THEN N'һ��'
			WHEN (DATEPART(MONTH, @b1)) = '2' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '3' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '4' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '5' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '6' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '7' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '8' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '9' THEN N'����'
			WHEN (DATEPART(MONTH, @b1)) = '10' THEN N'ʮ��'
			WHEN (DATEPART(MONTH, @b1)) = '11' THEN N'ʮһ��'
			ELSE N'ʮ����'
		 END
		,CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1))) + N'��'
		,CASE
			WHEN (DATEPART(MONTH, @b1)) <= 9 THEN N'0' + CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1)))
			ELSE CONVERT(NVARCHAR(5), (DATEPART(MONTH, @b1)))
		 END
		,CASE --[PeriodOfTenDays]
			WHEN DATENAME(DAY, @b1) <= 10 THEN N'��Ѯ'
			WHEN DATENAME(DAY, @b1) > 20 THEN N'��Ѯ'
			ELSE N'��Ѯ'
		 END
		,DATEPART(DAY, @b1) --[DayNumberOfMonth]
		--��
		,CASE --[WeekNumberOfYearCode]
			WHEN CONVERT(INT, DATENAME(WEEK, @b1)) <= 9
			THEN CONVERT(VARCHAR(4), DATEPART(YEAR, @b1)) + N'0'
				+ CONVERT(VARCHAR(2), DATENAME(WEEK, @b1))
			ELSE CONVERT(VARCHAR(4), DATEPART(YEAR, @b1))
				+ CONVERT(VARCHAR(2), DATENAME(WEEK, @b1))
		 END
		,DATENAME(WEEK, @b1) --[CalendarWeekNumberOfYear]
		,N'��' + CONVERT(NVARCHAR(2), DATENAME(WEEK, @b1)) + N'��' --[CalendarCNWeekNameOfYear]
		,DATEPART(WEEKDAY, @b1)--[DayNumberOfWeek]
		,CASE --[Weekend]
			WHEN (DATEDIFF(DAY, '1753-01-01', @b1) % 7 / 5) = 1 THEN '��ĩ' 
			ELSE 'ƽʱ'
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
		,CASE --[ENDayShortNameOfWeek]--ע��,�趨���ܼ��ǵ�һ��.
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN 'Mon'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN 'Tue'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN 'Wed'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN 'Thu'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN 'Fri'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN 'Sat'
			ELSE 'Sun'
		 END
		,CASE --[CNDayNameOfWeek]
			WHEN DATEPART(WEEKDAY, @b1) = 1 THEN N'����һ'
			WHEN DATEPART(WEEKDAY, @b1) = 2 THEN N'���ڶ�'
			WHEN DATEPART(WEEKDAY, @b1) = 3 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 4 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 5 THEN N'������'
			WHEN DATEPART(WEEKDAY, @b1) = 6 THEN N'������'
			ELSE N'������'
		 END
	)
	--���ڼ�1��
	SET @b1 = DATEADD(DAY, 1, @b1);
END
END
GO

/*
,[IsYesterdayId] INT
,[IsYesterdayDesc] NVARCHAR(10)
*/

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[IsYesterdayId] = 0,[Dim_Date].[IsYesterdayDesc] = N'��'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[IsYesterdayId] = 0,[Dim_Date].[IsYesterdayDesc] = N'��'
WHERE [Dim_Date].[DateKey] = CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

/*
,[WeekConFilterId] INT
,[WeekConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 3,[Dim_Date].[WeekConFilterDesc] = N'����'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 1,[Dim_Date].[WeekConFilterDesc] = N'����'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 7, 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[WeekConFilterId] = 2,[Dim_Date].[WeekConFilterDesc] = N'����'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 14, 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 8, 112))
GO

/*
,[MonthConFilterId] INT
,[MonthConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 4,[Dim_Date].[MonthConFilterDesc] = N'����'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 1,[Dim_Date].[MonthConFilterDesc] = N'����'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), GETDATE() - 1, 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 2,[Dim_Date].[MonthConFilterDesc] = N'����'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), DATEADD(MONTH, -1, GETDATE() - 1), 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(10), GETDATE() - 1, 120), 8) + '01')), 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[MonthConFilterId] = 3,[Dim_Date].[MonthConFilterDesc] = N'ǰ��'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, LEFT(CONVERT(NVARCHAR(8), DATEADD(MONTH, -2, GETDATE() - 1), 112), 6) + '01') AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(MONTH, -1, CONVERT(DATETIME, LEFT(CONVERT(NVARCHAR(10), GETDATE() - 1, 120), 8) + '01'))), 112))
GO

/*
,[QuaConFilterId] INT
,[QuaConFilterDesc] NVARCHAR(20)
*/
UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 3,[Dim_Date].[QuaConFilterDesc] = N'����'
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 1,[Dim_Date].[QuaConFilterDesc] = N'������'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0), 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), GETDATE() - 1, 112))
GO

UPDATE [dbo].[Dim_Date]
SET [Dim_Date].[QuaConFilterId] = 2,[Dim_Date].[QuaConFilterDesc] = N'�ϼ���'
WHERE [Dim_Date].[DateKey] >= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(QUARTER, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0)), 112)) AND [Dim_Date].[DateKey] <= CONVERT(INT, CONVERT(NVARCHAR(8), DATEADD(DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE() - 1), 0)), 112))
GO

/*
,[IsLastTwoYearId] INT
,[IsLastTwoYearDesc] NVARCHAR(10)
*/
UPDATE [dbo].[Dim_Date]
SET [IsLastTwoYearId] = 0, [IsLastTwoYearDesc] = N'��'
GO

UPDATE [dbo].[Dim_Date]
SET [IsLastTwoYearId] = 1, [IsLastTwoYearDesc] = N'��'
WHERE [Dim_Date].[CalendarYear] IN (DATEPART(YEAR, GETDATE()), DATEPART(YEAR, GETDATE()) - 1)
GO
