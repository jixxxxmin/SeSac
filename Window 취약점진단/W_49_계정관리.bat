@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "MinimumPasswordLength" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"MinimumPasswordLength.txt

set "min="

for /f "tokens=1,2,3" %%a in ('findstr "MinimumPasswordLength" "C:\Temp\MinimumPasswordLength.txt"') do (
	set "min=%%c" 
)

IF %min% geq 8 (
	echo 양호
	echo 현재 "최소 암호 길이"가 "%min%"문자 이상으로 설정되어 있는 상태입니다.	
) ELSE (
	echo 취약
	echo 현재 "최소 암호 길이"가 "%min%"문자로 설정되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "최소 암호 길이"를 "8"문자 이상으로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\MinimumPasswordLength.txt


pause