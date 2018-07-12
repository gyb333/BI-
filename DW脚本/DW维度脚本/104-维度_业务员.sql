IF (OBJECT_ID(N'[Dim_Employee]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Employee];
END
GO

CREATE TABLE [Dim_Employee] 
(
    [EmpId] INT NOT NULL,
    [StatusId] BIT NOT NULL,
    [SupervisorId] int NOT NULL,
    [DeptId] int NOT NULL,
    [DistributorId] int NOT NULL,
    [DistributorContractId] int NOT NULL,
    [CompanyId] int NOT NULL,
    [RegionId] int NOT NULL,
    [CompanyName] nvarchar(60) NOT NULL,
    [RegionName] nvarchar(20) NOT NULL,
    [EmpName] nvarchar(20) NOT NULL,
    [StatusName] nvarchar(10) NOT NULL,
    [SupervisorName] nvarchar(20) NOT NULL,
    [DeptName] nvarchar(20) NOT NULL,
    [DistributorName] nvarchar(60) NOT NULL,
    [DistributorContractName] nvarchar(60) NOT NULL
)
GO

IF (EXISTS(SELECT 1 FROM [sys].[indexes] AS ix WHERE [ix].[name] = 'CIX_Dim_Employee_01'))
BEGIN
	DROP INDEX [dbo].[Dim_Employee].[CIX_Dim_Employee_01]
END
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Dim_Employee_01] ON [dbo].[Dim_Employee]
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_PRIMARY_Index]
GO

ALTER TABLE [dbo].[Dim_Employee] ADD CONSTRAINT PK_Dim_Employee_EmpId PRIMARY KEY([EmpId])
GO

IF (OBJECT_ID(N'[Dim_Employee_Error]', 'U') IS NOT NULL)
BEGIN
	DROP TABLE [Dim_Employee_Error];
END
GO
CREATE TABLE [dbo].[Dim_Employee_Error](
	[EmpId] [INT] NULL,
	[业务员] [NVARCHAR](20) NULL,
	[StatusId] [BIT] NULL,
	[是否有效] [NVARCHAR](2) NULL,
	[SupervisorId] [INT] NULL,
	[业务员主管] [NVARCHAR](20) NULL,
	[DeptId] [INT] NULL,
	[部门] [NVARCHAR](20) NULL,
	[DistributorId] [INT] NULL,
	[经销商公司] [NVARCHAR](60) NULL,
	[DistributorContractId] [INT] NULL,
	[签约经销商] [NVARCHAR](60) NULL,
	[CompanyId] [INT] NULL,
	[账号] [NVARCHAR](60) NULL,
	[RegionId] [INT] NULL,
	[大区] [NVARCHAR](20) NULL,
	[ErrorCode] [INT] NULL,
	[ErrorColumn] [INT] NULL
) ON [PRIMARY]

GO

--DROP TABLE [Dim_Employee_Error];