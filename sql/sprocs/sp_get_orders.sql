USE [wms]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_get_orders]
    @paramWhId INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200)

	SELECT orm.order_number
	FROM t_order_master orm
	INNER JOIN t_pick_master pkm 
	ON pkm.wh_id = orm.wh_id
	AND pkm.order_master_id = orm.id
	WHERE
		EXISTS (SELECT TOP 1 8 FROM t_pick_detail pkd WHERE pkd.pick_master_id = pkm.id AND pkd.status = 'U')
	GROUP BY orm.order_number

END
