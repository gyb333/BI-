------------------------------
IF ( OBJECT_ID(N'[dbo].[ODS_CustomerBase]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_CustomerBase];
    END
GO

CREATE TABLE [ODS_CustomerBase]
    (
      [CustID] [INT] NOT NULL ,
      [CustOtherTypeID] [INT] NOT NULL ,
      [CustName] [NVARCHAR](60) NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_CustomerBase_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_CustomerBase].[CIX_ODS_CustomerBase_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_CustomerBase_01] ON [dbo].[ODS_CustomerBase]
(
[CustID] ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_CustomerBase_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_CustomerBase].[CIX_ODS_CustomerBase_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_CustomerBase_02] ON [dbo].[ODS_CustomerBase]
(
[CustID] ASC 
) INCLUDE(
[CustOtherTypeID] ,
[CustName]  )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
 

 ------------------------------
IF ( OBJECT_ID(N'[dbo].[ODS_ProdExtension]', N'U') IS NOT NULL )
    BEGIN
        DROP TABLE [dbo].[ODS_ProdExtension];
    END
GO

CREATE TABLE [ODS_ProdExtension]
    (
      [ProdID] [INT] NOT NULL ,
      [CompanyID] [INT] NOT NULL ,
      [ProdOtherTypeID] [INT] NOT NULL
    )
GO
 
IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_ProdExtension_01' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_ProdExtension].[CIX_ODS_ProdExtension_01]
    END
GO

CREATE CLUSTERED INDEX [CIX_ODS_ProdExtension_01] ON [dbo].[ODS_ProdExtension]
(
[ProdID],[CompanyID] ASC 
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

IF ( EXISTS ( SELECT    1
              FROM      [sys].[indexes] AS ix
              WHERE     [ix].[name] = 'CIX_ODS_ProdExtension_02' ) )
    BEGIN
        DROP INDEX [dbo].[ODS_ProdExtension].[CIX_ODS_ProdExtension_02]
    END
GO
CREATE NONCLUSTERED INDEX [CIX_ODS_ProdExtension_02] ON [dbo].[ODS_ProdExtension]
(
[ProdID],[CompanyID] ASC 
) INCLUDE(
[ProdOtherTypeID] )

WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO
 



