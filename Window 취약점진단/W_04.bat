@echo off

set "locktime="

for /f "tokens=1, 2*" %%a in ('net accounts ^| findstr "�Ӱ谪"') do (
	set "locktime=%%a %%b %%c"
)

echo %locktime%

pause