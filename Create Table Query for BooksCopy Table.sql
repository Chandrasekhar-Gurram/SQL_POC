USE [master]
GO

/****** Object:  Table [dbo].[booksCopy]    Script Date: 04-02-2024 20:49:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[booksCopy](
	[id] [int] NULL,
	[title] [varchar](100) NOT NULL,
	[author] [varchar](100) NOT NULL,
	[isbn] [char](12) NULL
) ON [PRIMARY]
GO


