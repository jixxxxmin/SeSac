
rule Detect_CMD_Command {
    meta:
        title = "cmd 명령어 탐지"
        desc = "5개의 정보 수집을 위한 cmd 명령어 중 하나를 실행하는 .bat파일 탐지"
    strings:
        $b1 = /\@echo\s*off/i

        $s1 = /systeminfo/i
        $s2 = /whoami/i
        $s3 = /netstat/i
        $s4 = /ipconfig/i
        $s5 = /tasklist/i
    condition:
        $b1 and ($s1 or $s2 or $s3 or $s4 or $s5)
}