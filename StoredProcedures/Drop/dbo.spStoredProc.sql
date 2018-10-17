PRINT 'PROC: dbo.spStoredProc			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'spStoredProc')
Drop Proc dbo.spStoredProc


GO
PRINT 'PROC: dbo.spStoredProc			End(' + convert(varchar(30),GetDate(),109) + ')'
