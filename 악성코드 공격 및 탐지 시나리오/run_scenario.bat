@echo off
REM 배치 파일 및 PowerShell 스크립트 실행 (절대경로 사용)

REM 1. scenario.bat 실행
call "D:\kisia_test\project\scenario.bat"

REM 2. scenario.ps1 실행 (관리자 필요 시 -ExecutionPolicy Bypass 옵션 권장)
powershell.exe -ExecutionPolicy Bypass -File "D:\kisia_test\project\scenario.ps1"

pause