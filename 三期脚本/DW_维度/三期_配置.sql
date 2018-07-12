

DBCC CHECKIDENT('HP_LoopSetting', RESEED, 10)
--DBCC CHECKIDENT('HP_LoopSetting', NORESEED)

INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'客户到款抽取' , 1 , 12 , 1 ,3 ,N'MONTH' )
GO       
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'销售收入抽取' ,1 ,12 ,1 ,3 , N'MONTH')
GO 
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'应收余额抽取' ,1 ,12 ,1 ,3 , N'MONTH')
GO
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'应收凭证抽取' ,1 ,12 ,1 ,3 , N'MONTH')
GO  
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'提单占用抽取' ,1 ,12 ,1 ,3 , N'MONTH')
GO 

		SELECT * FROM dbo.HP_LoopSetting 
		EXEC [dbo].[usp_GetZLDataKeyByLoopId] @loopId = 11

		--DELETE FROM dbo.HP_LoopSetting WHERE LoopId=11
		EXEC [dbo].[usp_GetDateRangeByLoopId] @loopId = 11
		EXEC [dbo].[usp_GetDateRangeByLoopId_ZL] @loopId =11

		EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 1, @loopId = 11

		SELECT
  [a].[InitValue]
 ,[a].[MaxValue] - [a].[ZL_MaxValue] AS [MaxValue]
FROM [dbo].[HP_LoopSetting] AS a WITH(NOLOCK)
WHERE [a].[LoopId] =11
EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = -1, @loopId = 11
EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 1, @loopId = 11
EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 2, @loopId = 11
EXEC [dbo].[usp_GetLoopPeriod] @currLoopValue = 9, @loopId = 11



DROP TABLE dbo.aatemp
