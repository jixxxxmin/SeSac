@echo off

set "guest="

for /f "tokens=1, 2*" %%i in ('net user guest ^| findstr /C:"활성 계정"') do (
	set "guest=%%k" 
)

IF "%guest%" == "아니요" (
	echo 양호
	echo 현재 "guest" 계정이 비활성화 되어 있는 상태입니다.
) ELSE (
	echo 취약
	echo 현재 "guest" 계정이 활성화 되어 있는 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "guest" 계정을 비활성화하여 주시기 바랍니다.
)
pause