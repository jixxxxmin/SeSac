@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "DontDisplayLastUserName" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\DontDisplayLastUserName.txt

set "last="

for /f "tokens=1*" %%a in ('findstr "DontDisplayLastUserName" "C:\Temp\DontDisplayLastUserName.txt"') do (
	set "last=%%a" 
)

for /f %%a in ('powershell -NoProfile -Command "$s='%last%'; $s[-1]"') do set last=%%a

IF "%last%" == "1" (
	echo 양호
	echo 현재 "마지막 사용자 이름 표시 안 함" 정책이 "사용(%last%)"으로 설정되어 있는 상태입니다.
) ELSE (
	echo 취약
	echo 현재 "마지막 사용자 이름 표시 안 함" 정책이 "사용 안함(%last%)"으로 설정되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "마지막 사용자 이름 표시 안 함" 정책을 "사용"으로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\DontDisplayLastUserName.txt


pause