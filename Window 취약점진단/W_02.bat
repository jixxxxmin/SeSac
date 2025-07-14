@echo off

set "guest="

for /f "tokens=1, 2*" %%i in ('net user guest ^| findstr /C:"활성 계정"') do (
	set "guest=%%i %%j : %%k" 
)

echo %guest%

pause