@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "LockoutDuration" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"LockoutDuration.txt

set "lockdu="

for /f "tokens=1,2,3" %%a in ('findstr "LockoutDuration" "C:\Temp\LockoutDuration.txt"') do (
	set "lockdu=%%c" 
)

IF defined lockdu (
	IF !lockdu!	geq 60 (
		echo 양호
		echo 현재 "계정 잠금 기간"이 "%lockdu%"분 이상으로 설정되어 있는 상태입니다.	
	) ELSE (
		echo 취약
		echo 현재 "계정 잠금 기간"이 "%lockdu%"분으로 설정되어 있는 상태입니다.
		echo [대응방안]
		echo 주요정보통신기반시설 가이드를 참고하시어 "계정 잠금 기간"을 "60"분 이상으로 설정하여 주시기 바랍니다.
	)
) ELSE (
	echo 취약
	echo 현재 "계정 잠금 기간"이 설정되어 있지 않는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "계정 잠금 기간"을 "60"분 이상으로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\LockoutDuration.txt


pause