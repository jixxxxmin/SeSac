@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i /B /C:"MinimumPasswordAge" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\"MinimumPasswordAge.txt

set "min="

for /f "tokens=1,2,3" %%a in ('findstr "MinimumPasswordAge" "C:\Temp\MinimumPasswordAge.txt"') do (
	set "min=%%c" 
)

IF %min% gtr 0 (
	echo ��ȣ
	echo ���� "�ּ� ��ȣ ��� �Ⱓ"�� "%min%"�Ϸ� �����Ǿ� �ִ� �����Դϴ�.	
) ELSE (
	echo ���
	echo ���� "�ּ� ��ȣ ��� �Ⱓ"�� "%min%"�Ϸ� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "�ּ� ��ȣ ��� �Ⱓ"�� "1"�� �̻����� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\MinimumPasswordAge.txt


pause