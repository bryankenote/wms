USE [wms]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_get_pick]
    @paramWhId INT,
    @paramUserCode NVARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
	@pickMasterId INT

	-- get user code and assign pickMasterId 
	SELECT @pickMasterId = pkm.id
	FROM t_pick_master pkm
	LEFT JOIN t_user usr
		ON pkm.wh_id = usr.wh_id
		AND pkm.assigned = usr.id
	WHERE usr.code = @paramUserCode
	AND pkm.wh_id = @paramWhId

	IF @pickMasterId IS NULL
	BEGIN
		SELECT @ERROR = 'No Work for User'
		SELECT @ERROR
		RETURN
	END

	SELECT TOP 1
	 pkd.id
	,loc.code
	,name
	FROM t_pick_detail pkd
	LEFT JOIN t_location loc
		ON pkd.wh_id = loc.wh_id
		AND pkd.pick_location = loc.id
	LEFT JOIN t_order_detail ord
		ON pkd.wh_id = ord.wh_id
		AND pkd.order_detail_id = ord.id
	LEFT JOIN t_item_master itm
		ON ord.wh_id = itm.wh_id
		AND ord.item_id = itm.id
	LEFT JOIN t_pick_master pkm
		ON pkd.wh_id = pkm.wh_id
		AND pkd.pick_master_id = pkm.id
	WHERE pkm.id = @pickMasterId
	AND pkm.wh_id = @paramWhId
	AND pkd.status = 'U'

	UPDATE TOP (1) t_pick_detail
	SET status = 'A'
	WHERE wh_id = @paramWhId
	AND pick_master_id = @pickMasterId
	AND status != 'A'
	AND status != 'D'

END
