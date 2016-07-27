PRINT 'TABLE: dbo.UserTable				Start(' + convert(varchar(30),GetDate(),109) + ')'
GO
/* 
================================================================================================================
Successive Alter Statements To Perpetually Upgrade Every Version of the table.
================================================================================================================
*/
IF EXISTS (	SELECT TOP 1 *
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_NAME = 'UserTable'
			  AND TABLE_SCHEMA = 'dbo' )
BEGIN
	PRINT '---- ALTERS'	

END

/* 
================================================================================================================
Create table if it doesn't exsist - Always include changes from alters in Create Table scripts.
================================================================================================================
*/
	
IF NOT EXISTS (	SELECT TOP 1 *
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE TABLE_NAME = 'UserTable'
				  AND TABLE_SCHEMA = 'dbo' )
BEGIN
	PRINT '---- CREATE'

	CREATE TABLE dbo.UserTable 
	(
		UserTableID						bigint identity(1,1)	NOT NULL	PRIMARY KEY,
		-----------------------------------------------------------------------------------------------------
		FirstName						varchar(100)			NULL,
		MiddleName						varchar(100)			NULL,
		LastName						varchar(255)			NULL,							
		-----------------------------------------------------------------------------------------------------
		IsDeleted						bit						NOT NULL	Default(0),
		ModifiedOn						datetime				NOT NULL	Default(GetDate()),
		ModifiedBy						int						NOT NULL	Default(1),	
		CreatedOn						datetime				NOT NULL	Default(GetDate()),
		CreatedBy						int						NOT NULL	Default(1)
	)


	CREATE INDEX IDX_UserTable_IsDeleted ON UserTable (IsDeleted)
	


	/* 
	================================================================================================================
							Populate table only when we create it
	================================================================================================================
	*/
END
GO

PRINT 'TABLE: dbo.UserTable				End(' + convert(varchar(30),GetDate(),109) + ')'