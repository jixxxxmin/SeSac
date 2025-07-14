@echo off
setlocal enabledelayedexpansion

set "group="

for /f "skip=6 tokens=*" %%a in ('net localgroup Administrators ^| findstr /v "명령을"') do (
	IF not "%%a" == "Administrator" (
		set "group=!group!, %%a"
	)
)

IF defined group (
	set "group=!group:~2!"
	
	echo 취약
	echo 현재 관리자 그룹 Administrators에 목적이 불분명한 계정(!group!^)이 존재하는 상태입니다.
	echo [인터뷰]
	echo 목적이 불분명한 계정(!group!^)에 대한 담당자의 확인이 필요합니다.
) ELSE (
	echo 양호
	echo 현재 관리자 그룹 Administrators의 구성원이 관리자 계정만 존재하는 상태입니다.
)

pause