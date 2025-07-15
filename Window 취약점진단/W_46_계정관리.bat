@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "EveryoneIncludesAnonymous" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\EveryoneIncludesAnonymous.txt

set "everyone="

for /f "tokens=1*" %%a in ('findstr "EveryoneIncludesAnonymous" "C:\Temp\EveryoneIncludesAnonymous.txt"') do (
	set "everyone=%%a" 
)

for /f %%a in ('powershell -NoProfile -Command "$s='%everyone%'; $s[-1]"') do set everyone=%%a

IF "%everyone%" == "0" (
	echo 양호
	echo 현재 "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용 안함(%everyone%)으로 설정되어 있는 상태입니다.
) ELSE (
	echo 취약
	echo 현재 "Everyone 사용 권한을 익명 사용자에게 적용" 정책이 "사용(%everyone%)으로 설정되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "Everyone 사용 권한을 익명 사용자에게 적용" 정책을 "사용 안함(0)"으로 설정하여 주시기 바랍니다.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\EveryoneIncludesAnonymous.txt


pause