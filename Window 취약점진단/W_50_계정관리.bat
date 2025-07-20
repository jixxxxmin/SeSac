@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i /B /C:"MaximumPasswordAge" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"MaximumPasswordAge.txt

set "max="

for /f "tokens=1,2,3" %%a in ('findstr "MaximumPasswordAge" "C:\Temp\MaximumPasswordAge.txt"') do (
	set "max=%%c" 
)

IF %max% leq 90 (
	echo 양호
	echo 현재 "최대 암호 사용 기간"이 "%max%"일로 설정되어 있는 상태입니다.	
) ELSE (
	echo 취약
	echo 현재 "최대 암호 사용 기간"이 "%max%"일로 설정되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "최대 암호 사용 기간"을 "90"일 이하로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\MaximumPasswordAge.txt


pause