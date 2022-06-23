USE [wms]
GO

/****** Object:  Table [dbo].[user]    Script Date: 6/22/2022 6:36:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[fork_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_fork] FOREIGN KEY([fork_id])
REFERENCES [dbo].[t_location] ([id])
GO

ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_fork]
GO


