@echo off

(
secedit /export /cfg C:\LocalSecurityPolicy.txt

powershell -Command "Get-Content 'C:\LocalSecurityPolicy.txt' | Out-File 'C:\LocalSecurityPolicy_ANSI.txt' -Encoding Default"

findstr /i "ClearTextPassword" C:\LocalSecurityPolicy_ANSI.txt
) > C:\ClearTextPassword.txt

findstr "ClearTextPassword" C:\ClearTextPassword.txt

del C:\LocalSecurityPolicy.txt C:\LocalSecurityPolicy_ANSI.txt C:\ClearTextPassword.txt

pause