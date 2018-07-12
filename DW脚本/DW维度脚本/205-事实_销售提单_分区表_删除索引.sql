IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'CIX_Fact_SaleBill_01'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill].[CIX_Fact_SaleBill_01];
END
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WITH(NOLOCK) WHERE [ix].[name] = 'NCIX_Fact_SaleBill_02'))
BEGIN
	DROP INDEX [dbo].[Fact_SaleBill].[NCIX_Fact_SaleBill_02];
END
GO