USE [wms]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_get_pkd_qty_needed]
    @paramWhId INT,
	@paramPkdId INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200)

	SELECT qty_needed - qty_picked AS qty_needed
	FROM t_pick_detail
	WHERE id = @paramPkdId
	AND wh_id = @paramWhId

END
