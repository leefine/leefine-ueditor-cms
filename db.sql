USE [EPower]
GO
/****** Object:  Table [dbo].[ALT_CAT_ROLE]    Script Date: 2017/4/27 17:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_CAT_ROLE](
	[CAT_ID] [numeric](6, 0) NOT NULL,
	[ROLE_ID] [numeric](6, 0) NOT NULL,
 CONSTRAINT [PK_ALT_CAT_ROLE] PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC,
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ATL_CAT]    Script Date: 2017/4/27 17:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATL_CAT](
	[ID] [numeric](6, 0) IDENTITY(1,1) NOT NULL,
	[PID] [numeric](6, 0) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Status] [numeric](1, 0) NOT NULL,
	[Descr] [nvarchar](max) NULL,
	[PageType] [numeric](1, 0) NULL DEFAULT ((0)),
	[IfMainMenu] [numeric](1, 0) NULL,
	[CRTOn] [datetime] NOT NULL,
	[CRTBy] [numeric](6, 0) NOT NULL,
	[MDFOn] [datetime] NOT NULL,
	[MDFBy] [numeric](6, 0) NOT NULL,
 CONSTRAINT [PK_ATL_INFOTREE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATL_INFO]    Script Date: 2017/4/27 17:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATL_INFO](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[TitleColor] [varchar](20) NULL,
	[Author] [nvarchar](20) NULL,
	[Descr] [nvarchar](max) NOT NULL,
	[PicPath] [nvarchar](200) NULL,
	[PV] [numeric](6, 0) NOT NULL DEFAULT ((0)),
	[CRTOn] [datetime] NOT NULL,
	[CRTBy] [numeric](6, 0) NOT NULL,
	[MDFOn] [datetime] NOT NULL,
	[MDFBy] [numeric](6, 0) NOT NULL,
 CONSTRAINT [PK_ATL_INFO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATL_INFO_CAT]    Script Date: 2017/4/27 17:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATL_INFO_CAT](
	[INFO_ID] [numeric](18, 0) NOT NULL,
	[CAT_ID] [numeric](6, 0) NOT NULL,
	[IsMain] [numeric](1, 0) NULL,
 CONSTRAINT [PK_ATL_INFO_CAT] PRIMARY KEY CLUSTERED 
(
	[INFO_ID] ASC,
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ATL_INFO_CAT] ADD  DEFAULT ((0)) FOR [IsMain]
GO

 
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(350 AS Numeric(6, 0)), CAST(3 AS Numeric(6, 0)), N'InfoTree', N'/cms_infotree/index', CAST(1 AS Numeric(2, 0)), N'&#xf068c;')
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(351 AS Numeric(6, 0)), CAST(3 AS Numeric(6, 0)), N'Info', N'/cms_info/index', CAST(2 AS Numeric(2, 0)), N'&#xf05fe;')
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35000 AS Numeric(6, 0)), CAST(350 AS Numeric(6, 0)), N'Create', N'/cms_infotree/create', CAST(1 AS Numeric(2, 0)), NULL)
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35001 AS Numeric(6, 0)), CAST(350 AS Numeric(6, 0)), N'Delete', N'/cms_infotree/delete', CAST(2 AS Numeric(2, 0)), NULL)
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35002 AS Numeric(6, 0)), CAST(350 AS Numeric(6, 0)), N'Edit', N'/cms_infotree/edit', CAST(3 AS Numeric(2, 0)), NULL)
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35100 AS Numeric(6, 0)), CAST(351 AS Numeric(6, 0)), N'Create', N'/cms_info/create', CAST(1 AS Numeric(2, 0)), NULL)
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35101 AS Numeric(6, 0)), CAST(351 AS Numeric(6, 0)), N'Edit', N'/cms_info/edit', CAST(2 AS Numeric(2, 0)), NULL)
GO
INSERT [dbo].[sys_page] ([ID], [ParentID], [Name], [URL], [OrderNo], [ICO]) VALUES (CAST(35102 AS Numeric(6, 0)), CAST(351 AS Numeric(6, 0)), N'Delete', N'/cms_info/delete', CAST(3 AS Numeric(2, 0)), NULL)
GO


insert into [dbo].[SYS_ROLE_PAGE](Page_ID,Role_ID) select id,1 from [dbo].[SYS_PAGE] where id not in (select page_id from [SYS_ROLE_PAGE])

Go