@echo off

set "admin="

for /f "tokens=1*" %%i in ('wmic useraccount get name^, sid ^| findstr "500"') do (
	set "admin=%%i"
)

IF "%admin%" == "Administrator" (
	echo ���
	echo ���� �����ڰ������� "%admin%" �״�� ����ϰ� �ִ� ����� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "%admin%" ������ �������� ���߰� �Ұ����� ���������� �����Ͽ� �ֽñ� �ٶ��ϴ�.
) ELSE (
	echo ��ȣ
	echo ���� �����ڰ������� "Administrator"�� �ƴ� "%admin%"�� ����ϰ� �ִ� �����Դϴ�.
)

pause