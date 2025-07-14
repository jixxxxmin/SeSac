@echo off
setlocal enabledelayedexpansion

set "accounts="
set "exclude_list=Administrator DefaultAccount WDAGUtilityAccount"

for /f "skip=4 tokens=*" %%a in ('net user ^| findstr /v "�����"') do (
	for %%b in (%%a) do (
		set "account_name=%%b"
		set "account_name=!account_name:"=!"
		echo !exclude_list! | findstr /i /c:"!account_name!" >nul
		IF errorlevel 1 (
			set "accounts=!accounts!, !account_name!"
		)
	)
)

IF defined accounts (
	set "accounts=!accounts:~2!"
	
	echo ���
	echo ���� ������ �Һи��� ����(!accounts!^)�� Ȱ��ȭ�Ǿ� �ִ� �����Դϴ�.
	echo [���ͺ�]
	echo ������ �Һи��� ����(!accounts!^)�� ���� ������� Ȯ���� �ʿ��մϴ�.
) ELSE (
	echo ��ȣ
	echo ���� ���ʿ��� ������ Ȱ��ȭ�Ǿ� ���� ���� �����Դϴ�.
)

pause