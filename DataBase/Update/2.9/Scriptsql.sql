ALTER TABLE Navigation ADD Html NVARCHAR(max)
GO
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationEntity@Html', N'zh-CN', N'HTML����', N'NavigationEntity', N'EntityProperty')
GO