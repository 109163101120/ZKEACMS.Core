CREATE TABLE [dbo].[CMS_Rule](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ZoneName] [nvarchar](50) NULL,
	[RuleExpression] [nvarchar](800) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
	[RuleItems] [nvarchar](max) NULL,
 CONSTRAINT [PK_CMS_Rule] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.CMS_WidgetBase ADD RuleID int
GO

INSERT INTO DataDictionary(DicName,Title,DicValue,[Order],Pid,IsSystem,[Status])
SELECT N'RuleItem@Condition',N'����',N'and',1,0,1,0 UNION ALL
SELECT N'RuleItem@Condition',N'����',N'or',2,0,1,0 UNION ALL

SELECT N'RuleItem@FunctionName',N'����',N'Equals',1,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'������',N'NotEquals',2,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'�ԡ���ͷ',N'StartsWith',3,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'��...��β',N'EndsWith',4,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'����',N'Contains',5,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'���ԡ���ͷ',N'NotStartsWith',6,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'����...��β',N'NotEndsWith',7,0,1,0 UNION ALL
SELECT N'RuleItem@FunctionName',N'������',N'NotContains',8,0,1,0 UNION ALL

SELECT N'RuleItem@Property',N'Url',N'ValueOf(''Url'')',1,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'Url����',N'ValueOf(''QueryString'')',2,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'User-Agent',N'ValueOf(''UserAgent'')',3,0,1,0 UNION ALL
SELECT N'RuleItem@Property',N'��ǰ����',N'ValueOf(''Now'')',4,0,1,0


GO

ALTER TABLE dbo.CMS_LayoutHtml ADD PageId NVARCHAR(100)
ALTER TABLE dbo.CMS_Zone ADD PageId NVARCHAR(100)

GO