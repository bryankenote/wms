USE [wms]
GO

/****** Object:  Table [dbo].[item_detail]    Script Date: 6/22/2022 6:33:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_item_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wh_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_item_detail]  WITH CHECK ADD  CONSTRAINT [FK_item_detail_wh] FOREIGN KEY([wh_id])
REFERENCES [dbo].[t_wh] ([id])
GO

ALTER TABLE [dbo].[t_item_detail] CHECK CONSTRAINT [FK_item_detail_wh]
GO

ALTER TABLE [dbo].[t_item_detail]  WITH CHECK ADD  CONSTRAINT [FK_item_detail_item_master] FOREIGN KEY([item_id])
REFERENCES [dbo].[t_item_master] ([id])
GO

ALTER TABLE [dbo].[t_item_detail] CHECK CONSTRAINT [FK_item_detail_item_master]
GO

ALTER TABLE [dbo].[t_item_detail]  WITH CHECK ADD  CONSTRAINT [FK_item_detail_location] FOREIGN KEY([location_id])
REFERENCES [dbo].[t_location] ([id])
GO

ALTER TABLE [dbo].[t_item_detail] CHECK CONSTRAINT [FK_item_detail_location]
GO


