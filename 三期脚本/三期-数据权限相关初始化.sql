BEGIN TRAN
DBCC CHECKIDENT('TBL_DimPermDefinition', RESEED, 8)
DBCC CHECKIDENT('TBL_DimPermDefinition', NORESEED)
GO
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'300-��ͷ' ,N'�˺�' ,N'��ͷ-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'300-������' ,N'�˺�' ,N'������-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'300-ǩԼ������' ,N'�˺�' ,N'ǩԼ������-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'300-�ʺ�' ,N'�˺�' ,N'�ʺ�-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'301-����Ա' ,N'�˺�' ,N'����Ա-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'308-����Ա����' ,N'�˺�' ,N'����Ա����-Ȩ�޹���', GETDATE())
INSERT INTO [dbo].[TBL_DimPermDefinition]( [Dimension] ,[Property] ,[Remark] ,[CreateDate]) VALUES  ( N'321-�ͻ�' ,N'�˺�' ,N'�ͻ�-Ȩ�޹���', GETDATE())

go
--SELECT * FROM [TBL_DimPermDefinition]

INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,9 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,10 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,11 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,12 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,13 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,14 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
INSERT INTO dbo.TBL_CompanyPermissAccess( CompanyID ,DefinitionId ,Member ,CreateDate)
SELECT CompanyID,15 AS DefinitionId,Member,GETDATE() FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=1
GO
SELECT * FROM dbo.TBL_CompanyPermissAccess WHERE DefinitionId=13
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,9 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,10 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,11 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,12 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,13 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,14 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_OrgPermissAccess( OrgID ,DefinitionId ,Member ,CreateDate) SELECT OrgID,15 DefinitionId,Member,GETDATE() FROM dbo.TBL_OrgPermissAccess WHERE DefinitionId=1
--GO

--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,9 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,10 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,11 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,12 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,13 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,14 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
--INSERT INTO dbo.TBL_UserDimPermissionAccess ( UserCode , DefinitionId , Member , CompanyID ) SELECT UserCode,15 DefinitionId,Member,CompanyID FROM dbo.TBL_UserDimPermissionAccess WHERE DefinitionId=1
--GO
COMMIT


--DELETE TBL_OrgPermissAccess WHERE DefinitionId IN (9,10,11,12,13,14,15)
--DELETE dbo.TBL_UserDimPermissionAccess WHERE DefinitionId IN (9,10,11,12,13,14,15)

