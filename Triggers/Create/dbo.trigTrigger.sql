PRINT 'CREATE dbo.trigDatabaseTable					Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

	
	CREATE TRIGGER dbo.trigDatabaseTable 
	ON dbo.DatabaseTable
  AFTER INSERT, UPDATE
  AS RAISERROR ('DatabaseTable Trigger Notification', 16, 10);


GO
PRINT 'CREATE dbo.trigDatabaseTable					End(' + convert(varchar(30),GetDate(),109) + ')'