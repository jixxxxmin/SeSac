
rule Detect_AutoRun {
    meta:
        title = "자동실행 탐지"
        desc = "자동실행 등록 .bat파일 탐지"
    strings:
        $b1 = /\@echo\s*off/i

        $s1 = /reg\s*add/i
        $s2 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
    condition:
        $b1 and $s1 and $s2
}