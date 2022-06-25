USE [wms]
GO

/****** Object:  Table [dbo].[location]    Script Date: 6/22/2022 6:36:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wh_id] [int] NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[type] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_location]  WITH CHECK ADD  CONSTRAINT [FK_location_wh] FOREIGN KEY([wh_id])
REFERENCES [dbo].[t_wh] ([id])
GO

ALTER TABLE [dbo].[t_location] CHECK CONSTRAINT [FK_location_wh]
GO
