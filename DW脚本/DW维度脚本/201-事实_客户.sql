IF (OBJECT_ID(N'[Fact_Customer]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_Customer];
END
GO


CREATE TABLE [Fact_Customer]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[SubCustId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[CustCount] INT
	,[OrgId] INT NOT NULL
	,[RegionId] INT NOT NULL
	,[IsProced] BIT
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] ix WITH(NOLOCK) WHERE [ix].[name] = 'CIX_Fact_Customer_01'))
BEGIN
	DROP INDEX [dbo].[Fact_Customer].[CIX_Fact_Customer_01];
END
GO

CREATE CLUSTERED INDEX [CIX_Fact_Customer_01] ON [dbo].[Fact_Customer]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] ix WITH(NOLOCK) WHERE [ix].[name] = 'CIX_Fact_Customer_02'))
BEGIN
	DROP INDEX [dbo].[Fact_Customer].[CIX_Fact_Customer_02];
END
GO

CREATE NONCLUSTERED INDEX [NCIX_Fact_Customer_02] ON [dbo].[Fact_Customer]
(
	[NextYearDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF (OBJECT_ID(N'[Fact_Customer_ZL]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [dbo].[Fact_Customer_ZL];
END
GO

SELECT TOP 0
	*
INTO [dbo].[Fact_Customer_ZL]
FROM [dbo].[Fact_Customer]
GO


--½ûÓÃ¿Í»§
IF (OBJECT_ID(N'[Fact_DisCustomer]', N'U') IS NOT NULL)
BEGIN
	DROP TABLE [Fact_DisCustomer];
END
GO

CREATE TABLE [dbo].[Fact_DisCustomer]
(
	 [DateKey] INT NOT NULL
	,[NextYearDateKey] INT NOT NULL
	,[SubCustId] INT NOT NULL
	,[CompBranchId] INT NOT NULL
	,[CustCount] INT NOT NULL
	,[OrgId] INT NOT NULL
	,[RegionId] INT NOT NULL
)
GO