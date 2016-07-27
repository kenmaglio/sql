PRINT 'CREATE dbo.vView					Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

	
	CREATE VIEW dbo.vView 
	AS
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLES				



GO
PRINT 'CREATE dbo.vView					End(' + convert(varchar(30),GetDate(),109) + ')'