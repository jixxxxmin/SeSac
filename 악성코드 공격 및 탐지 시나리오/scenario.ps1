# 디렉토리 존재 확인 및 생성
$dir = "D:\kisia_test\project"
if (!(Test-Path -Path $dir)) {
    New-Item -Path $dir -ItemType Directory | Out-Null
}

# 네트워크 및 계정 정보 수집 결과를 ps1_netinfo.txt로 저장
Get-NetIPAddress | Out-File -FilePath "D:\kisia_test\project\ps1_netinfo.txt" -Encoding utf8
Get-LocalUser | Out-File -Append -FilePath "D:\kisia_test\project\ps1_netinfo.txt" -Encoding utf8

# 실행 중인 프로세스 목록 저장 결과를 ps1_processlist.txt로 저장
Get-Process | Out-File -FilePath "D:\kisia_test\project\ps1_processlist.txt" -Encoding utf8


# 1. '자동으로 표준 시간대 설정'을 '끔'으로 변경
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "Start" -Value 4

# 3. 화면보호기 설정을 '없음'으로 변경
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveActive" -Value "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "SCRNSAVE.EXE" -Value ""