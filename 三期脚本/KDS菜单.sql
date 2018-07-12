

 SELECT * FROM dbo.t_OLAPServiceRegionUri

BEGIN TRAN
--DELETE dbo.t_App WHERE AppID >=10141 AND AppID<=10149
--GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10141 ,N'促销员工资' ,N'ExtUI' , N'reportid=-774533841&folderid=1551892034&token=WUFBQUFnQUFBQXdQK1hxOERmS1h0K2E3SnA4a2JHTlNiZ1Z0MWZOMGhXcVl0U3lGN0NpdDNOZ1ZBSnY0Vmp3aA&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10142 ,N'固定任务达成' ,N'ExtUI' , N'reportid=15357144&folderid=1551892034&token=WUFBQUFnQUFBQUFqeCtJdldXY0I4eC80dVRoa1h2UVQxUWxyR2J1K3M3MmFHQUl1eldWR0ptSjZSamhTdURGYw&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10143 ,N'客户信用' ,N'ExtUI' , N'reportid=-764894303&folderid=1551892034&token=WUFBQUFnQUFBQUFERXpjWmY3M1hKZTlIRXhYWXBld2xhR2gvSWc0ckovaExPVkpGRmMyTGY3TVROMFdnQjF5eA&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10144 ,N'客户到款明细' ,N'ExtUI' , N'reportid=-1273889396&folderid=1551892034&token=WUFBQUFnQUFBQVFKRThnZENzcERCYWpSeFZiME5Od3U4eUxrN2YxZWQrM0p6aW00am5raXgwR2JyZkpkWXZDWA&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10145 ,N'应付货款汇总' ,N'ExtUI' , N'reportid=1200747706&folderid=1551892034&token=WUFBQUFnQUFBQXd5RTkvb0lqcWRtMVdHQnhJaytCamhsRlF5MXZyS2JGRVBIU3R5SnpNckRtRitlN3ZvNm1JVg&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10146 ,N'应收账款汇总' ,N'ExtUI' , N'reportid=701668890&folderid=1551892034&token=WUFBQUFnQUFBQWdmc3NJclY2Ynk5amVtOElOR2V2Nmg5UGQ4SkVsamNuVDhOSzZiMEFiWkl5ckRQaW1HL2wyNQ&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10147 ,N'销售收入汇总' ,N'ExtUI' , N'reportid=-405992144&folderid=1551892034&token=WUFBQUFnQUFBQUFSODlVR3hDa096K0NwejhwWWdJcnNhalIzNHYyUHlLMTdyQm9ZTlBPblhOZ3FNMkJ0V01pYg&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10148 ,N'销售计划' ,N'ExtUI' , N'reportid=861809083&folderid=1551892034&token=WUFBQUFnQUFBQWd3cU1aQ0Uwci9ncjFPVzcxVW5lUSttRkRRcVdrOG9lTjNRZVcwaTVkbFFiT0ZnR2R4Tm5NYQ&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10149 ,N'销售费用汇总' ,N'ExtUI' , N'reportid=186370899&folderid=1551892034&token=WUFBQUFnQUFBQXdQamczNitPTTR6WXRRdVFKTTJaNGRiNStsbUVVdlJNdkNtZUJCQXhTRDNLUkhtNUpmQXJZag&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10150 ,N'销售金额汇总' ,N'ExtUI' , N'reportid=-2054824861&folderid=1551892034&token=WUFBQUFnQUFBQVF3d0tzdWRKdDFsSnVjYlFyaTFnRWRSbk1pNEY5blkralpGWFd2YnZpZm1QczhuUGV2M3UxLw&tb=1' ,N'[查看]' , 2 , 1 )
GO
INSERT INTO dbo.t_App( AppID ,AppName ,DLLName ,AppCommand ,AvailableFunc ,SubSysTypeMultiply ,SvrID)
VALUES  ( 10151 ,N'业务员应收账款汇总' ,N'ExtUI' , N'reportid=-1350495602&folderid=1551892034&token=WUFBQUFnQUFBQVFDRFlUN01FZCtGMkY5RE1vM1NSL0hQQVBNNnZSN25ZVkxTaXh2V21oNjgranF6WTF5cENHbw&tb=1' ,N'[查看]' , 2 , 1 )
GO

INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20054 ,N'三期报表' ,N'' ,N'' ,1 ,1 , 20000 ,2 ,0 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20081 ,N'促销员工资' ,N'' ,N'' ,1 ,1 , 20054 ,2 ,10141 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20082 ,N'固定任务达成' ,N'' ,N'' ,2 ,1 , 20054 ,2 ,10142 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20083 ,N'客户信用' ,N'' ,N'' ,3 ,1 , 20054 ,2 ,10143,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20084 ,N'客户到款明细' ,N'' ,N'' ,4,1 , 20054 ,2 ,10144 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20085 ,N'应付货款汇总' ,N'' ,N'' ,5 ,1 , 20054 ,2 ,10145 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20086 ,N'应收账款汇总' ,N'' ,N'' ,6 ,1 , 20054 ,2 ,10146 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20087 ,N'销售收入汇总' ,N'' ,N'' ,7 ,1 , 20054 ,2 ,10147 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20088 ,N'销售计划' ,N'' ,N'' ,8 ,1 , 20054 ,2 ,10148 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20089 ,N'销售费用汇总' ,N'' ,N'' ,9 ,1 , 20054 ,2 ,10149 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20090 ,N'销售金额汇总' ,N'' ,N'' ,10 ,1 , 20054 ,2 ,10150 ,0 ,1 )
GO
INSERT INTO dbo.t_Menu( MenuID ,MenuCaption ,MenuHotKey ,Message ,Sort ,Visible ,ParentMenuID ,SubSysType ,AppID ,SubFuncID ,SvrID) VALUES  ( 20091 ,N'业务员应收账款汇总' ,N'' ,N'' ,11 ,1 , 20054 ,2 ,10151 ,0 ,1 )
GO
COMMIT