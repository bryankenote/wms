USE [wms]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wh_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_wh] FOREIGN KEY([wh_id])
REFERENCES [dbo].[t_wh] ([id])
GO

ALTER TABLE [dbo].[t_order_detail] CHECK CONSTRAINT [FK_order_detail_wh]
GO

ALTER TABLE [dbo].[t_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_item_master] FOREIGN KEY([item_id])
REFERENCES [dbo].[t_item_master] ([id])
GO

ALTER TABLE [dbo].[t_order_detail] CHECK CONSTRAINT [FK_item_master]
GO

ALTER TABLE [dbo].[t_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_master] FOREIGN KEY([order_id])
REFERENCES [dbo].[t_order_master] ([id])
GO

ALTER TABLE [dbo].[t_order_detail] CHECK CONSTRAINT [FK_order_master]
GO


