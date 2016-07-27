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


