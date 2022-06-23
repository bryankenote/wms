USE [wms]
GO

/****** Object:  StoredProcedure [dbo].[AssignFork]    Script Date: 6/22/2022 6:45:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_assign_fork]
	-- Add the parameters for the stored procedure here
	@paramUserCode NVARCHAR(50),   
    @paramFork NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
	@userId int,
	@forkId int

	-- get user id
	SELECT @userId = id
	FROM [user]
	WHERE code = @paramUserCode

	IF @userId IS NULL
	BEGIN
		SELECT @ERROR = 'user does not exist'
		SELECT @ERROR
		RETURN
	END

	-- get fork id
	SELECT @forkId = id
	FROM [location]
	WHERE [type] = 'F'
	AND code = @paramFork
	
	IF @forkId IS NULL
	BEGIN
		SELECT @ERROR = 'fork does not exist'
		SELECT @ERROR
		RETURN
	END

	-- assign fork to user
	UPDATE dbo.[user]
	SET fork_id = @forkId
	WHERE id = @userId

	SELECT @ERROR
END
GO


