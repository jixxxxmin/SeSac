@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i /B /C:"MaximumPasswordAge" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"MaximumPasswordAge.txt

set "max="

for /f "tokens=1,2,3" %%a in ('findstr "MaximumPasswordAge" "C:\Temp\MaximumPasswordAge.txt"') do (
	set "max=%%c" 
)

IF %max% leq 90 (
	echo ��ȣ
	echo ���� "�ִ� ��ȣ ��� �Ⱓ"�� "%max%"�Ϸ� �����Ǿ� �ִ� �����Դϴ�.	
) ELSE (
	echo ���
	echo ���� "�ִ� ��ȣ ��� �Ⱓ"�� "%max%"�Ϸ� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "�ִ� ��ȣ ��� �Ⱓ"�� "90"�� ���Ϸ� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\MaximumPasswordAge.txt


pause