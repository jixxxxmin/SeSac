@echo off
setlocal enabledelayedexpansion

set "group="

for /f "skip=6 tokens=*" %%a in ('net localgroup Administrators ^| findstr /v "�����"') do (
	IF not "%%a" == "Administrator" (
		set "group=!group!, %%a"
	)
)

IF defined group (
	set "group=!group:~2!"
	
	echo ���
	echo ���� ������ �׷� Administrators�� ������ �Һи��� ����(!group!^)�� �����ϴ� �����Դϴ�.
	echo [���ͺ�]
	echo ������ �Һи��� ����(!group!^)�� ���� ������� Ȯ���� �ʿ��մϴ�.
) ELSE (
	echo ��ȣ
	echo ���� ������ �׷� Administrators�� �������� ������ ������ �����ϴ� �����Դϴ�.
)

pause