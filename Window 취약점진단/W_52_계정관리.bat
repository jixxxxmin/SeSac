@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "DontDisplayLastUserName" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\DontDisplayLastUserName.txt

set "last="

for /f "tokens=1*" %%a in ('findstr "DontDisplayLastUserName" "C:\Temp\DontDisplayLastUserName.txt"') do (
	set "last=%%a" 
)

for /f %%a in ('powershell -NoProfile -Command "$s='%last%'; $s[-1]"') do set last=%%a

IF "%last%" == "1" (
	echo ��ȣ
	echo ���� "������ ����� �̸� ǥ�� �� ��" ��å�� "���(%last%)"���� �����Ǿ� �ִ� �����Դϴ�.
) ELSE (
	echo ���
	echo ���� "������ ����� �̸� ǥ�� �� ��" ��å�� "��� ����(%last%)"���� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "������ ����� �̸� ǥ�� �� ��" ��å�� "���"���� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\DontDisplayLastUserName.txt


pause