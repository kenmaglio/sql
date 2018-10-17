PRINT 'PROC: dbo.spStoredProc			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

Create Proc dbo.spStoredProc
(
	 @param1 as bigint
	,@param2 as nvarchar(1024)
	,@param3 as varchar(128)
)
AS
BEGIN		
	-- Do some work here

  -- just a placeholder remove this.
  SELECT *
  FROM dbo.DatabaseTable

END
GO

GO
PRINT 'PROC: dbo.spStoredProc			End(' + convert(varchar(30),GetDate(),109) + ')'
