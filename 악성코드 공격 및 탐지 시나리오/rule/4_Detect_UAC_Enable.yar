
rule Detect_UAC_Enable {
    meta:
        title = "UAC 해제 탐지"
        desc = "UAC 해제 .bat파일 탐지"
    strings:
        $b1 = /\@echo\s*off/i

        $s1 = /reg\s*add/i
        $s2 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System"
        $s3 = /\/d\s*0/
    condition:
        all of them
}