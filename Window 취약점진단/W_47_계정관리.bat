@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "LockoutDuration" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"LockoutDuration.txt

set "lockdu="

for /f "tokens=1,2,3" %%a in ('findstr "LockoutDuration" "C:\Temp\LockoutDuration.txt"') do (
	set "lockdu=%%c" 
)

IF defined lockdu (
	IF !lockdu!	geq 60 (
		echo ��ȣ
		echo ���� "���� ��� �Ⱓ"�� "%lockdu%"�� �̻����� �����Ǿ� �ִ� �����Դϴ�.	
	) ELSE (
		echo ���
		echo ���� "���� ��� �Ⱓ"�� "%lockdu%"������ �����Ǿ� �ִ� �����Դϴ�.
		echo [�������]
		echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "���� ��� �Ⱓ"�� "60"�� �̻����� �����Ͽ� �ֽñ� �ٶ��ϴ�.
	)
) ELSE (
	echo ���
	echo ���� "���� ��� �Ⱓ"�� �����Ǿ� ���� �ʴ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "���� ��� �Ⱓ"�� "60"�� �̻����� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\LockoutDuration.txt


pause