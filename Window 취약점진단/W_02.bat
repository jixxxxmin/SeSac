@echo off

set "guest="

for /f "tokens=1, 2*" %%i in ('net user guest ^| findstr /C:"Ȱ�� ����"') do (
	set "guest=%%i %%j : %%k" 
)

echo %guest%

pause