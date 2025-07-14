@echo off

set "admin="

for /f "tokens=1*" %%i in ('wmic useraccount get name^, sid ^| findstr "500"') do (
	set "admin=%%i"
)

IF "%admin%" == "Administrator" (
	echo 취약
	echo 현재 관리자계정명을 "%admin%" 그대로 사용하고 있는 취약한 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "%admin%" 관리자 계정명을 유추가 불가능한 계정명으로 변경하여 주시기 바랍니다.
) ELSE (
	echo 양호
	echo 현재 관리자계정명을 "Administrator"가 아닌 "%admin%"을 사용하고 있는 상태입니다.
)

pause