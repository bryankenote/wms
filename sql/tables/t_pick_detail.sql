USE [wms]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_pick_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wh_id] [int] NOT NULL,
	[pick_master_id] [int] NOT NULL,
	[order_detail_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_pick_detail]  WITH CHECK ADD  CONSTRAINT [FK_pick_detail_wh] FOREIGN KEY([wh_id])
REFERENCES [dbo].[t_wh] ([id])
GO

ALTER TABLE [dbo].[t_pick_detail] CHECK CONSTRAINT [FK_pick_detail_wh]
GO

ALTER TABLE [dbo].[t_pick_detail]  WITH CHECK ADD  CONSTRAINT [FK_pick_detail_order_detail] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[t_order_detail] ([id])
GO

ALTER TABLE [dbo].[t_pick_detail] CHECK CONSTRAINT [FK_pick_detail_order_detail]
GO

ALTER TABLE [dbo].[t_pick_detail]  WITH CHECK ADD  CONSTRAINT [FK_pick_master] FOREIGN KEY([pick_master_id])
REFERENCES [dbo].[t_pick_master] ([id])
GO

ALTER TABLE [dbo].[t_pick_detail] CHECK CONSTRAINT [FK_pick_master]
GO
