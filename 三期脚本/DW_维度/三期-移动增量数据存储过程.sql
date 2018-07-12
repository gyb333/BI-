

-- =============================================
-- 把增量表Fact_CustARAmount_ZL中的数据移动到全量表Fact_CustARAmount
-- =============================================

IF EXISTS ( SELECT  * FROM    INFORMATION_SCHEMA.ROUTINES WHERE   SPECIFIC_NAME = N'usp_MoveZLDataByTran_Fact_CustARAmount' )
    DROP PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_CustARAmount]
GO

CREATE PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_CustARAmount] ( @beginDate INT )
AS
    DECLARE @errorCount INT;

    SET @errorCount = 0;

    BEGIN TRANSACTION

    INSERT  INTO [dbo].[Fact_CustARAmount]
            SELECT  *
            FROM    [dbo].[Fact_CustARAmount_ZL] AS a
            WHERE   [a].[DateKey] <= @beginDate
                    AND [a].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    UPDATE  [dbo].[Fact_CustARAmount_ZL]
    SET     [Fact_CustARAmount_ZL].[IsProced] = 1
    WHERE   [Fact_CustARAmount_ZL].[DateKey] <= @beginDate AND [Fact_CustARAmount_ZL].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    IF ( @errorCount > 0 )
        BEGIN

            ROLLBACK TRANSACTION

        END

    ELSE
        BEGIN

            COMMIT TRANSACTION

        END



GO


-- =============================================
-- 把增量表Fact_SDInvoice_ZL中的数据移动到全量表Fact_SDInvoice
-- =============================================

IF EXISTS ( SELECT  * FROM    INFORMATION_SCHEMA.ROUTINES WHERE   SPECIFIC_NAME = N'usp_MoveZLDataByTran_Fact_SDInvoice' )
    DROP PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_SDInvoice]
GO

CREATE PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_SDInvoice] ( @beginDate INT )
AS
    DECLARE @errorCount INT;

    SET @errorCount = 0;

    BEGIN TRANSACTION

    INSERT  INTO [dbo].[Fact_SDInvoice]
            SELECT  *
            FROM    [dbo].[Fact_SDInvoice_ZL] AS a
            WHERE   [a].[DateKey] <= @beginDate
                    AND [a].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    UPDATE  [dbo].[Fact_SDInvoice_ZL]
    SET     [Fact_SDInvoice_ZL].[IsProced] = 1
    WHERE   [Fact_SDInvoice_ZL].[DateKey] <= @beginDate AND [Fact_SDInvoice_ZL].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    IF ( @errorCount > 0 )
        BEGIN

            ROLLBACK TRANSACTION

        END

    ELSE
        BEGIN

            COMMIT TRANSACTION

        END



GO

-- =============================================
-- 把增量表Fact_ARMonthInve_ZL中的数据移动到全量表Fact_ARMonthInve
-- =============================================

IF EXISTS ( SELECT  * FROM    INFORMATION_SCHEMA.ROUTINES WHERE   SPECIFIC_NAME = N'usp_MoveZLDataByTran_Fact_ARMonthInve' )
    DROP PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_ARMonthInve]
GO

CREATE PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_ARMonthInve] ( @beginDate INT )
AS
    DECLARE @errorCount INT;

    SET @errorCount = 0;

    BEGIN TRANSACTION

    INSERT  INTO [dbo].[Fact_ARMonthInve]
            SELECT  *
            FROM    [dbo].[Fact_ARMonthInve_ZL] AS a
            WHERE   [a].[DateKey] <= @beginDate
                    AND [a].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    UPDATE  [dbo].[Fact_ARMonthInve_ZL]
    SET     [Fact_ARMonthInve_ZL].[IsProced] = 1
    WHERE   [Fact_ARMonthInve_ZL].[DateKey] <= @beginDate AND [Fact_ARMonthInve_ZL].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    IF ( @errorCount > 0 )
        BEGIN

            ROLLBACK TRANSACTION

        END

    ELSE
        BEGIN

            COMMIT TRANSACTION

        END



GO

-- =============================================
-- 把增量表Fact_ARVoucher_ZL中的数据移动到全量表Fact_ARVoucher
-- =============================================

IF EXISTS ( SELECT  * FROM    INFORMATION_SCHEMA.ROUTINES WHERE   SPECIFIC_NAME = N'usp_MoveZLDataByTran_Fact_ARVoucher' )
    DROP PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_ARVoucher]
GO

CREATE PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_ARVoucher] ( @beginDate INT )
AS
    DECLARE @errorCount INT;

    SET @errorCount = 0;

    BEGIN TRANSACTION

    INSERT  INTO [dbo].[Fact_ARVoucher]
            SELECT  *
            FROM    [dbo].[Fact_ARVoucher_ZL] AS a
            WHERE   [a].[DateKey] <= @beginDate
                    AND [a].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    UPDATE  [dbo].[Fact_ARVoucher_ZL]
    SET     [Fact_ARVoucher_ZL].[IsProced] = 1
    WHERE   [Fact_ARVoucher_ZL].[DateKey] <= @beginDate AND [Fact_ARVoucher_ZL].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    IF ( @errorCount > 0 )
        BEGIN

            ROLLBACK TRANSACTION

        END

    ELSE
        BEGIN

            COMMIT TRANSACTION

        END



GO

-- =============================================
-- 把增量表Fact_SEDO_ZL中的数据移动到全量表Fact_SEDO
-- =============================================

IF EXISTS ( SELECT  * FROM    INFORMATION_SCHEMA.ROUTINES WHERE   SPECIFIC_NAME = N'usp_MoveZLDataByTran_Fact_SEDO' )
    DROP PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_SEDO]
GO

CREATE PROCEDURE [dbo].[usp_MoveZLDataByTran_Fact_SEDO] ( @beginDate INT )
AS
    DECLARE @errorCount INT;

    SET @errorCount = 0;

    BEGIN TRANSACTION

    INSERT  INTO [dbo].[Fact_SEDO]
            SELECT  *
            FROM    [dbo].[Fact_SEDO_ZL] AS a
            WHERE   [a].[DateKey] <= @beginDate
                    AND [a].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    UPDATE  [dbo].[Fact_SEDO_ZL]
    SET     [Fact_SEDO_ZL].[IsProced] = 1
    WHERE   [Fact_SEDO_ZL].[DateKey] <= @beginDate AND [Fact_SEDO_ZL].[IsProced] IS NULL;

    SET @errorCount = @errorCount + @@ERROR;

    IF ( @errorCount > 0 )
        BEGIN

            ROLLBACK TRANSACTION

        END

    ELSE
        BEGIN

            COMMIT TRANSACTION

        END



GO
