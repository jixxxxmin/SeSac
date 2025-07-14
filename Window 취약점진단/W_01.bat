@echo off

set "admin="

for /f "tokens=1*" %%i in ('wmic useraccount get name^, sid ^| findstr "500"') do (
	set "admin=%%i : %%j"
)

echo %admin%

pause