USE [wms]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_update_qty_picked]
	@paramWhId INT,
	@paramItmQty INT,
	@paramPkdId INT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE 
	@ERROR NVARCHAR(200),
	@qtyLeft INT

	-- get qty left value
	SELECT @qtyLeft = qty_needed - qty_picked 
	FROM t_pick_detail
	WHERE id = @paramPkdId
	AND wh_id = @paramWhId

	-- send error if qty scanned is greater than qty left to scan
	IF @paramItmQty > @qtyLeft
	BEGIN
		SELECT @ERROR = 'Too many of this item picked'
		SELECT @ERROR
		RETURN
	END
	
	-- update status to done when qty left is zero
	IF @paramItmQty - @qtyLeft = 0
	BEGIN
		UPDATE t_pick_detail
		SET status = 'D'
		WHERE id = @paramPkdId
		AND wh_id = @paramWhId
	END
	
	-- add the qty scanned to what has been picked
	UPDATE t_pick_detail
	SET qty_picked = @paramItmQty + qty_picked
	WHERE id = @paramPkdId
	AND wh_id = @paramWhId

	-- return the status 
	SELECT status
	FROM t_pick_detail
	WHERE wh_id = @paramWhId
	AND id = @paramPkdId

END

