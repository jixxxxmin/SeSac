@echo off

set "locktime="

for /f "tokens=1, 2*" %%a in ('net accounts ^| findstr "임계값"') do (
	set "locktime=%%c"
)

IF "%locktime%"=="아님" (
	echo 취약
	echo 현재 계정 잠금 임계값이 설정되어있지 않은 상태입니다.
	echo [대응방안]
	echo 주요정보통신기반시설 가이드를 참고하시어 "계정 잠금" 값을 "5" 이하의 값으로 설정하여 주시기 바랍니다.
) ELSE (
	IF "%locktime%" GTR "6" (
		echo 취약
		echo 현재 계정 잠금 임계값이 설정되어 있으나 "6" 이상의 값으로 설정된 상태입니다.
		echo [대응방안]
		echo 주요정보통신기반시설 가이드를 참고하시어 "계정 잠금" 값을 "5" 이하의 값으로 설정하여 주시기 바랍니다.
	) ELSE (
		echo 양호
		echo 현재 계정 잠금 임계값이 "5" 이하의 값으로 설정되어 있는 상태입니다.
	)
)

pause