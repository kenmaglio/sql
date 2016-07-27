# SQL - Script Versioning

This is a template for you to utilize to build database scripts.

The templating is broken into the following folders ( some folder do not exist, however the pattern for them is like views )

* Tables ( this is the odd-ball, the rest follow the drop/create pattern)
* Views
* Stored Proceedures
* Functions
* Triggers

Each object you create should be a different .SQL file in the directory and should contain the counter-part script to remove it.
e.g. vMyView -- will have two scripts, one in the Create folder and one in the Drop folder

There are some example scripts in the Tables and Views folder to get you started

There is also a Script Creation folder which provides a windows command-line batch file, to build an Release.sql file containing the merged single script run - for all objects you create. 
