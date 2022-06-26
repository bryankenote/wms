USE [wms]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_unassign_fork]
    @paramWhId INT,
	@paramUserCode NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
	@userId int

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

	-- assign fork to user
	UPDATE dbo.[t_user]
	SET fork_id = NULL
	WHERE id = @userId
    AND wh_id = @paramWhId

	SELECT @ERROR
END
GO