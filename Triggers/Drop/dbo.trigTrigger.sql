PRINT 'DROP dbo.vView						Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

	DROP TRIGGER IF EXISTS dbo.trigDatabaseTable;


GO
PRINT 'DROP dbo.vView						End(' + convert(varchar(30),GetDate(),109) + ')'