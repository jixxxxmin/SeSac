@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "PasswordComplexity" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\PasswordComplexity.txt

set "complex="

for /f "tokens=1,2,3" %%a in ('findstr "PasswordComplexity" "C:\Temp\PasswordComplexity.txt"') do (
	set "complex=%%c" 
)


IF "%complex%" == "1" (
	echo ��ȣ
	echo ���� "��ȣ�� ���⼺�� �����ؾ� ��" ��å�� "���(%complex%)���� �����Ǿ� �ִ� �����Դϴ�.
) ELSE (
	echo ���
	echo ���� "��ȣ�� ���⼺�� �����ؾ� ��" ��å�� "��� ����(%complex%)���� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "��ȣ�� ���⼺�� �����ؾ� ��" ��å�� "���(1)"���� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\PasswordComplexity.txt


pause