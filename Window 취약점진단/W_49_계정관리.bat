@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "MinimumPasswordLength" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"MinimumPasswordLength.txt

set "min="

for /f "tokens=1,2,3" %%a in ('findstr "MinimumPasswordLength" "C:\Temp\MinimumPasswordLength.txt"') do (
	set "min=%%c" 
)

IF %min% geq 8 (
	echo ��ȣ
	echo ���� "�ּ� ��ȣ ����"�� "%min%"���� �̻����� �����Ǿ� �ִ� �����Դϴ�.	
) ELSE (
	echo ���
	echo ���� "�ּ� ��ȣ ����"�� "%min%"���ڷ� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "�ּ� ��ȣ ����"�� "8"���� �̻����� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\MinimumPasswordLength.txt


pause