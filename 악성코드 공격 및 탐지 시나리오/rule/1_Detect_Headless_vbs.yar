
rule Detect_Headless_vbs {
    meta:
        title = ".bat파일 headless mode로 실행"
        desc = ".bat파일을 headless mode로 실행하기 위해 사용되는 .vbs 파일이 존재"
    strings:
        $s1 = /WScript.Shell/i
        $s2 = /set/i
        $s3 = /\.Run/i
        $s4 = /,\s*0\s*,\s*false/i
    condition:
        all of them
}