PRINT 'DROP dbo.vView						Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vView' and TABLE_SCHEMA = 'dbo')
	BEGIN		
		DROP VIEW vView
	END
	ELSE
	BEGIN
		PRINT 'SKIP --- dbo.vView (Doesn''t Exists)'
	END


GO
PRINT 'DROP dbo.vView						End(' + convert(varchar(30),GetDate(),109) + ')'