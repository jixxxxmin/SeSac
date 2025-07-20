@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "PasswordComplexity" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\PasswordComplexity.txt

set "complex="

for /f "tokens=1,2,3" %%a in ('findstr "PasswordComplexity" "C:\Temp\PasswordComplexity.txt"') do (
	set "complex=%%c" 
)


IF "%complex%" == "1" (
	echo 양호
	echo 현재 "암호는 복잡성을 만족해야 함" 정책이 "사용(%complex%)으로 설정되어 있는 상태입니다.
) ELSE (
	echo 취약
	echo 현재 "암호는 복잡성을 만족해야 함" 정책이 "사용 안함(%complex%)으로 설정되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "암호는 복잡성을 만족해야 함" 정책을 "사용(1)"으로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\PasswordComplexity.txt


pause