USE [wms]
GO

/****** Object:  Table [dbo].[order_master]    Script Date: 6/22/2022 6:41:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_pick_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wh_id] [int] NOT NULL,
	[order_master_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_pick_master]  WITH CHECK ADD  CONSTRAINT [FK_pick_master_wh] FOREIGN KEY([wh_id])
REFERENCES [dbo].[t_wh] ([id])
GO

ALTER TABLE [dbo].[t_pick_master] CHECK CONSTRAINT [FK_pick_master_wh]
GO

ALTER TABLE [dbo].[t_pick_master]  WITH CHECK ADD  CONSTRAINT [FK_pick_master_order] FOREIGN KEY([order_master_id])
REFERENCES [dbo].[t_order_master] ([id])
GO

ALTER TABLE [dbo].[t_pick_master] CHECK CONSTRAINT [FK_pick_master_order]
GO
