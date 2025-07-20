
rule Detect_Userinit_Edit {
    meta:
        title = "Userinit값 수정 탐지"
        desc = "Userinit(사용자 로그온 후 최초 실행되는 프로그램 지정)에 악성파일을 추가하는 .bat파일 탐지"
    strings:
        $b1 = /\@echo\s*off/i

        $s1 = /reg\s*add/i
        $s2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon"
    condition:
        all of them
}