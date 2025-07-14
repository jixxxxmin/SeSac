@echo off
setlocal enabledelayedexpansion

(
secedit /export /cfg C:\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\LocalSecurityPolicy.txt' | Out-File 'C:\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "ClearTextPassword" C:\LocalSecurityPolicy_ANSI.txt
) > C:\ClearTextPassword.txt

set "textpw="

for /f "tokens=1,2,3" %%a in ('findstr "ClearTextPassword" "C:\ClearTextPassword.txt"') do (
	set "textpw=%%c" 
)

IF "%textpw%" == "0" (
	echo ���
	echo ���� "ClearTextPassword" ��å�� "���(0)"�� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "ClearTextPassword" ���� "��� ����(1)"�� �����Ͽ� �ֽñ� �ٶ��ϴ�.
) ELSE (
	echo ��ȣ
	echo ���� "ClearTextPassword" ��å�� "��� ����(1)"�� �����Դϴ�.
)

del C:\LocalSecurityPolicy.txt C:\LocalSecurityPolicy_ANSI.txt C:\ClearTextPassword.txt

pause