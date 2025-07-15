@echo off
setlocal enabledelayedexpansion


(
secedit /export /cfg C:\Temp\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\Temp\LocalSecurityPolicy.txt' | Out-File 'C:\Temp\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "EveryoneIncludesAnonymous" C:\Temp\LocalSecurityPolicy_ANSI.txt
) > C:\Temp\EveryoneIncludesAnonymous.txt

set "everyone="

for /f "tokens=1*" %%a in ('findstr "EveryoneIncludesAnonymous" "C:\Temp\EveryoneIncludesAnonymous.txt"') do (
	set "everyone=%%a" 
)

for /f %%a in ('powershell -NoProfile -Command "$s='%everyone%'; $s[-1]"') do set everyone=%%a

IF "%everyone%" == "0" (
	echo ��ȣ
	echo ���� "Everyone ��� ������ �͸� ����ڿ��� ����" ��å�� "��� ����(%everyone%)���� �����Ǿ� �ִ� �����Դϴ�.
) ELSE (
	echo ���
	echo ���� "Everyone ��� ������ �͸� ����ڿ��� ����" ��å�� "���(%everyone%)���� �����Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "Everyone ��� ������ �͸� ����ڿ��� ����" ��å�� "��� ����(0)"���� �����Ͽ� �ֽñ� �ٶ��ϴ�.
)

del C:\Temp\LocalSecurityPolicy.txt C:\Temp\LocalSecurityPolicy_ANSI.txt C:\Temp\EveryoneIncludesAnonymous.txt


pause