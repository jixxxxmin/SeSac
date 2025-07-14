@echo off
setlocal enabledelayedexpansion

set "ADaccounts="

for /f "tokens=1*" %%i in ('dsquery user') do (
	set "ADaccounts=%%i %%j"
	echo !ADaccounts!
)

pause