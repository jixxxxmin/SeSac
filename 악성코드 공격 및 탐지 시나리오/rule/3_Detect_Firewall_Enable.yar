
rule Detect_Firewall_Enable {
    meta:
        title = "방화벽 해제 탐지"
        desc = "방화벽 해제 .bat파일 탐지"
    strings:
        $b1 = /\@echo\s*off/i

        $s1 = /reg\s*add/i
        $s2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile"
        $s3 = /\/v\s*\"EnableFirewall\"/i
        $s4 = /\/d\s*0/
    condition:
        all of them
}