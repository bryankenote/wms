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

	SELECT order_number
	FROM t_order_master

END
GO
