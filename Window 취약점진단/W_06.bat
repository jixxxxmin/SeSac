@echo off
setlocal enabledelayedexpansion

set /p ADgroup= ������ �������� �Է��Ͻÿ�:

cls

for /f "skip=6 tokens=*" %%a in ('net localgroup %ADgroup% ^| findstr /v "�����"') do (
	echo %%a
)

pause