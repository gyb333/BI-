

DBCC CHECKIDENT('HP_LoopSetting', RESEED, 10)
--DBCC CHECKIDENT('HP_LoopSetting', NORESEED)

INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'�ͻ������ȡ' , 1 , 12 , 1 ,3 ,N'MONTH' )
GO       
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'���������ȡ' ,1 ,12 ,1 ,3 , N'MONTH')
GO 
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'Ӧ������ȡ' ,1 ,12 ,1 ,3 , N'MONTH')
GO
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'Ӧ��ƾ֤��ȡ' ,1 ,12 ,1 ,3 , N'MONTH')
GO  
INSERT INTO dbo.HP_LoopSetting( LoopDesc ,InitValue ,MaxValue ,ZL_MaxValue ,AssignValue ,ValueUnit) VALUES  ( N'�ᵥռ�ó�ȡ' ,1 ,12 ,1 ,3 , N'MONTH')
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
