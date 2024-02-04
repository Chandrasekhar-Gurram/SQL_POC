USE [master]
GO

/****** Object:  Table [dbo].[books]    Script Date: 04-02-2024 20:48:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[books](
	[id] [int] NULL,
	[title] [varchar](100) NOT NULL,
	[author] [varchar](100) NOT NULL,
	[isbn] [char](12) NULL
) ON [PRIMARY]
GO


