@echo off

set "guest="

for /f "tokens=1, 2*" %%i in ('net user guest ^| findstr /C:"Ȱ�� ����"') do (
	set "guest=%%k" 
)

IF "%guest%" == "�ƴϿ�" (
	echo ��ȣ
	echo ���� "guest" ������ ��Ȱ��ȭ �Ǿ� �ִ� �����Դϴ�.
) ELSE (
	echo ���
	echo ���� "guest" ������ Ȱ��ȭ �Ǿ� �ִ� �����Դϴ�.
	echo [�������]
	echo �ֿ�������ű�ݽü� ���̵带 �����Ͻþ� "guest" ������ ��Ȱ��ȭ�Ͽ� �ֽñ� �ٶ��ϴ�.
)
pause