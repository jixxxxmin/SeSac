@echo off
setlocal enabledelayedexpansion

set /p ADgroup= 관리자 계정명을 입력하시오:

cls

for /f "skip=6 tokens=*" %%a in ('net localgroup %ADgroup% ^| findstr /v "명령을"') do (
	for %%b in (%%a) do (
		echo %%b
	)
)

pause