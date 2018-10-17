USE [Database]
GO
PRINT '*** Database Script														Start(' + convert(varchar(30),GetDate(),109) + ')'
GO
/*


	HEADER FILE


*/
PRINT '******TEMP DEV DROPS*******			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO
/* Following Tables are dropped only in development */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserTable')
BEGIN
	DROP TABLE UserTable
END


-- Create Audit Schema
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE CATALOG_NAME = '[Database]' AND [SCHEMA_NAME] = 'audit')
BEGIN
	PRINT 'Create Schema: audit				Start(' + convert(varchar(30),GetDate(),109) + ')'
	exec('CREATE SCHEMA audit AUTHORIZATION dbo')
END 




GO
/*==================================================================================*/

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

GO
/*==================================================================================*/

PRINT 'PROC: dbo.spStoredProc			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'spStoredProc')
Drop Proc dbo.spStoredProc


GO
PRINT 'PROC: dbo.spStoredProc			End(' + convert(varchar(30),GetDate(),109) + ')'


GO
/*==================================================================================*/

/* 
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
											Constraint Removal
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
*/

/* EXAMPLE *

IF EXISTS (	SELECT TOP 1 * 
			FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
			WHERE CONSTRAINT_NAME = '[FKNAME]' )
BEGIN
	ALTER TABLE [Table]
	DROP CONSTRAINT [FKName] 
END

*/
PRINT 'CONSTRAINT: Removal					Start(' + convert(varchar(30),GetDate(),109) + ')'
GO




GO
PRINT 'CONSTRAINT: Removal					End(' + convert(varchar(30),GetDate(),109) + ')'




GO
/*==================================================================================*/

PRINT 'TABLE: dbo.DatabaseTable			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO
/* 
======================================================================							
Data can not be changed by users, it's safe to drop and re-populate
======================================================================
*/

IF  EXISTS (	SELECT TOP 1 *
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE TABLE_NAME = 'DatabaseTable'
				  AND TABLE_SCHEMA = 'dbo' )
BEGIN	
	DROP TABLE dbo.DatabaseTable
	PRINT '---- DROP'
END
GO


/* 
======================================================================
Create table
======================================================================
*/

PRINT '---- CREATE'

CREATE TABLE dbo.DatabaseTable
(
	DatabaseTableID						int	identity(1,1)	NOT NULL	PRIMARY KEY,

	-----------------------------------------------------------------------------------------------------
	IsDeleted							bit					NOT NULL	Default(0),
	ModifiedOn							datetime			NOT NULL	Default(GetDate()),
	ModifiedBy							varchar(255)		NOT NULL	Default('SystemProcess'),	
	CreatedOn							datetime			NOT NULL	Default(GetDate()),
	CreatedBy							varchar(255)		NOT NULL	Default('SystemProcess')
)
GO	

CREATE INDEX IDX_DatabaseTable_IsDeleted ON dbo.DatabaseTable (IsDeleted)
GO

PRINT 'TABLE: dbo.DatabaseTable			End(' + convert(varchar(30),GetDate(),109) + ')'




GO
/*==================================================================================*/

/* 
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
											Table Population (DB Managed)
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
*/
PRINT 'POPULATIONS: (DB Managed)			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO








GO
PRINT 'POPULATIONS: (DB Managed)			End(' + convert(varchar(30),GetDate(),109) + ')'


GO
/*==================================================================================*/

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

GO
/*==================================================================================*/

/* 
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
											Table Population (User Managed)
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
*/
PRINT 'POPULATIONS: (User Managed)			Start(' + convert(varchar(30),GetDate(),109) + ')'
GO








GO
PRINT 'POPULATIONS: (User Managed)			End(' + convert(varchar(30),GetDate(),109) + ')'
	

GO
/*==================================================================================*/

/* 
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
											Constraint Creation
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
================================================================================================================
*/

/* EXAMPLE *

IF NOT EXISTS (	SELECT TOP 1 * 
				FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
				WHERE CONSTRAINT_NAME = '[FKNAME]' )
BEGIN
	ALTER TABLE [Table]
	--WITH CHECK 
	ADD CONSTRAINT [FKName] 
	FOREIGN KEY ([FKID]) REFERENCES [PKTable] ([PK])
END
GO

*/
PRINT 'CONSTRAINT: Creation				Start(' + convert(varchar(30),GetDate(),109) + ')'
GO



GO
PRINT 'CONSTRAINT: Creation				End(' + convert(varchar(30),GetDate(),109) + ')'


GO
/*==================================================================================*/

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


GO
/*==================================================================================*/

PRINT 'CREATE dbo.vView					Start(' + convert(varchar(30),GetDate(),109) + ')'
GO

	
	CREATE VIEW dbo.vView 
	AS
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLES



GO
PRINT 'CREATE dbo.vView					End(' + convert(varchar(30),GetDate(),109) + ')'

GO
/*==================================================================================*/

/*


	FOOTER FILE


*/
GO
PRINT '*** Database Script														End(' + convert(varchar(30),GetDate(),109) + ')'


GO
/*==================================================================================*/

