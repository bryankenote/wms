USE [wms]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_assign_fork]
    @paramWhId INT,
	@paramUserCode NVARCHAR(50),   
    @paramFork NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
	@userId int,
	@forkId int,
	@assignedUser int

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

	-- get fork id
	SELECT @forkId = loc.id,
			@assignedUser = usr.id
	FROM [t_location] loc
    LEFT JOIN [t_user] usr
        ON usr.fork_id = loc.id
        AND usr.wh_id = loc.wh_id
	WHERE [type] = 'F'
	AND loc.code = @paramFork
    AND loc.wh_id = @paramWhId
	
	IF @forkId IS NULL
	BEGIN
		SELECT @ERROR = 'fork does not exist'
		SELECT @ERROR
		RETURN
	END

	IF @assignedUser IS NOT NULL
	BEGIN
		SELECT @ERROR = 'fork is assigned to another user'
		SELECT @ERROR
		RETURN
	END

	-- assign fork to user
	UPDATE dbo.[t_user]
	SET fork_id = @forkId
	WHERE id = @userId
    AND wh_id = @paramWhId

	SELECT @ERROR
END
GO
