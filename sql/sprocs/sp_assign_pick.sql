USE [wms]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_assign_pick]
    @paramWhId INT,
	@paramUserCode NVARCHAR(50),
    @paramOrder NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
	@userId INT,
    @orderId INT,
	@pickMasterId INT

	-- get user id
	SELECT @userId = id
	FROM [t_user]
	WHERE code = @paramUserCode
    AND wh_id = @paramWhId

	IF @userId IS NULL
	BEGIN
		SELECT @ERROR = 'user does not exist'
		SELECT @ERROR
		RETURN
	END
	
	-- assign pkm id to pkmid variable
	SELECT TOP 1 @pickMasterId = pkm.id
	FROM t_pick_master pkm
	INNER JOIN t_order_master orm
		ON orm.id = pkm.order_master_id
		and orm.wh_id = pkm.wh_id
	WHERE orm.order_number = @paramOrder
		AND pkm.wh_id = @paramWhId
		AND pkm.assigned IS NULL

	-- assign user id under assigned in the pick master
	UPDATE dbo.[t_pick_master]
	SET assigned = @userId
	WHERE id = @pickMasterId

	SELECT @ERROR
END
