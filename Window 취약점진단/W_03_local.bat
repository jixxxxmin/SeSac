@echo off
setlocal enabledelayedexpansion

set "accounts="
set "exclude_list=Administrator DefaultAccount WDAGUtilityAccount"

for /f "skip=4 tokens=*" %%a in ('net user ^| findstr /v "명령을"') do (
	for %%b in (%%a) do (
		set "account_name=%%b"
		set "account_name=!account_name:"=!"
		echo !exclude_list! | findstr /i /c:"!account_name!" >nul
		IF errorlevel 1 (
			set "accounts=!accounts!, !account_name!"
		)
	)
)

IF defined accounts (
	set "accounts=!accounts:~2!"
	
	echo 취약
	echo 현재 목적이 불분명한 계정(!accounts!^)이 활성화되어 있는 상태입니다.
	echo [인터뷰]
	echo 목적이 불분명한 계정(!accounts!^)에 대한 담당자의 확인이 필요합니다.
) ELSE (
	echo 양호
	echo 현재 불필요한 계정이 활성화되어 있지 않은 상태입니다.
)

pause