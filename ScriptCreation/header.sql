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


