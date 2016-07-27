@echo Off

set resultfile="Release\Release.sql"

if exist "%resultfile%" del "%resultfile%"


Echo Header
type "header.sql","spacer.sql" >> "%resultfile%"


echo Triggers
for /f "tokens=*" %%i in ('dir /b "..\Triggers\Drop\*.sql"') do type "..\Triggers\Drop\%%i","spacer.sql" >> "%resultfile%"


echo Functions
for /f "tokens=*" %%i in ('dir /b "..\Functions\Drop\*.sql"') do type "..\Functions\Drop\%%i","spacer.sql" >> "%resultfile%"


echo View creation
for /f "tokens=*" %%i in ('dir /b "..\Views\Drop\*.sql"') do type "..\Views\Drop\%%i","spacer.sql" >> "%resultfile%"


echo StoredProcedures
for /f "tokens=*" %%i in ('dir /b "..\StoredProcedures\Drop\*.sql"') do type "..\StoredProcedures\Drop\%%i","spacer.sql" >> "%resultfile%"


Echo Remove Constraints
type "..\Constraints\Removal.sql","spacer.sql" >> "%resultfile%"


Echo Tables\DB Managed
for /f "tokens=*" %%i in ('dir /b "..\Tables\DB Managed\*.sql"') do type "..\Tables\DB Managed\%%i","spacer.sql" >> "%resultfile%"

Echo Tables\DB Managed Populations
type "..\Tables\DB Managed Populations\Populations.sql","spacer.sql" >> "%resultfile%"


Echo Tables\User Managed
for /f "tokens=*" %%i in ('dir /b "..\Tables\User Managed\*.sql"') do type "..\Tables\User Managed\%%i","spacer.sql" >> "%resultfile%"


Echo Tables\USER Managed Populations
type "..\Tables\USER Managed Populations\Populations.sql","spacer.sql" >> "%resultfile%"


Echo Add Constraints
type "..\Constraints\Creation.sql","spacer.sql" >> "%resultfile%"


echo StoredProcedures
for /f "tokens=*" %%i in ('dir /b "..\StoredProcedures\Create\*.sql"') do type "..\StoredProcedures\Create\%%i","spacer.sql" >> "%resultfile%"


echo View creation
for /f "tokens=*" %%i in ('dir /b "..\Views\Create\*.sql"') do type "..\Views\Create\%%i","spacer.sql" >> "%resultfile%"


echo Functions
for /f "tokens=*" %%i in ('dir /b "..\Functions\Create\*.sql"') do type "..\Functions\Create\%%i","spacer.sql" >> "%resultfile%"


echo Triggers
for /f "tokens=*" %%i in ('dir /b "..\Triggers\Create\*.sql"') do type "..\Triggers\Create\%%i","spacer.sql" >> "%resultfile%"


echo Footer
type "footer.sql","spacer.sql" >> "%resultfile%"

Echo Scripting Complete
Pause

Release\Release.sql