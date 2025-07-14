@echo off
setlocal enabledelayedexpansion

set "accounts="

for /f "skip=4 tokens=*" %%a in ('net user ^| findstr /v "∏Ì∑…¿ª"') do (
	for %%b in (%%a) do (
		echo %%b
	)
)

pause