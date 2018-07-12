

/****** Object:  Table [dbo].[SSISExecLog]    Script Date: 2017/2/13 14:13:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSISExecLog](
	[LogId] [INT] IDENTITY(1,1) NOT NULL,
	[PackageId] [NVARCHAR](50) NULL,
	[PackageName] [NVARCHAR](255) NULL,
	[CreatorName] [NVARCHAR](255) NULL,
	[MachineName] [NVARCHAR](255) NULL,
	[UserName] [NVARCHAR](255) NULL,
	[StartTime] [DATETIME] NULL
) ON [PRIMARY]

GO




CREATE PROCEDURE [dbo].[usp_InsertSSISExecLog]
(
	 @packageId NVARCHAR(50)
	,@packageName NVARCHAR(255)
	,@creatorName NVARCHAR(255)
	,@machineName NVARCHAR(255)
	,@userName NVARCHAR(255)
	,@startTime DATETIME
)
AS
INSERT INTO [dbo].[SSISExecLog]
        (
         [PackageId]
        ,[PackageName]
        ,[CreatorName]
        ,[MachineName]
        ,[UserName]
        ,[StartTime]
        )
VALUES (@packageId, @packageName, @creatorName, @machineName, @userName, @startTime)


GO

CREATE TABLE [dbo].[SSISExecLog_ODS](
	[LogId] [INT] IDENTITY(1,1) NOT NULL,
	[PackageId] [NVARCHAR](50) NULL,
	[PackageName] [NVARCHAR](255) NULL,
	[CreatorName] [NVARCHAR](255) NULL,
	[MachineName] [NVARCHAR](255) NULL,
	[UserName] [NVARCHAR](255) NULL,
	[StartTime] [DATETIME] NULL
) ON [PRIMARY]

GO


IF (OBJECT_ID(N'[dbo].[usp_InsertSSISExecLog_ODS]', 'P') IS NOT NULL)
BEGIN
	DROP PROCEDURE [dbo].[usp_InsertSSISExecLog_ODS];
END
GO

CREATE PROCEDURE [dbo].[usp_InsertSSISExecLog_ODS]
(
	 @packageId NVARCHAR(50)
	,@packageName NVARCHAR(255)
	,@creatorName NVARCHAR(255)
	,@machineName NVARCHAR(255)
	,@userName NVARCHAR(255)
	,@startTime DATETIME
)
AS
INSERT INTO [dbo].[SSISExecLog_ODS]
        (
         [PackageId]
        ,[PackageName]
        ,[CreatorName]
        ,[MachineName]
        ,[UserName]
        ,[StartTime]
        )
VALUES (@packageId, @packageName, @creatorName, @machineName, @userName, @startTime)
GO
