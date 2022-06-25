USE [wms]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_assign_device]
    @paramWhId INT,
    @paramDeviceId INT,
	@paramUserCode NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
	@ERROR NVARCHAR(200),
    @deviceId int,
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

	-- get device  id
	SELECT @deviceId = dev.id
	FROM [t_device] dev
    LEFT JOIN [t_user] usr
        ON usr.device_id = dev.id
        AND usr.wh_id = dev.wh_id
	WHERE dev.id = @paramDeviceId
    AND dev.wh_id = @paramWhId
	
	IF @deviceId IS NULL
	BEGIN
		SELECT @ERROR = 'invalid device'
		SELECT @ERROR
		RETURN
	END

	-- assign device to user
	UPDATE dbo.[t_user]
	SET device_id = @deviceId
	WHERE id = @userId
    AND wh_id = @paramWhId

	SELECT @ERROR
END
GO