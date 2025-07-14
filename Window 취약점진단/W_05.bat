@echo off
setlocal enabledelayedexpansion

(
secedit /export /cfg C:\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\LocalSecurityPolicy.txt' | Out-File 'C:\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "ClearTextPassword" C:\LocalSecurityPolicy_ANSI.txt
) > C:\ClearTextPassword.txt

set "textpw="

for /f "tokens=1,2,3" %%a in ('findstr "ClearTextPassword" "C:\ClearTextPassword.txt"') do (
	set "textpw=%%c" 
)

IF "%textpw%" == "0" (
	echo 취약
	echo 현재 "ClearTextPassword" 정책이 "사용(0)"인 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "ClearTextPassword" 값을 "사용 안함(1)"로 설정하여 주시기 바랍니다.
) ELSE (
	echo 양호
	echo 현재 "ClearTextPassword" 정책이 "사용 안함(1)"인 상태입니다.
)

del C:\LocalSecurityPolicy.txt C:\LocalSecurityPolicy_ANSI.txt C:\ClearTextPassword.txt

pause