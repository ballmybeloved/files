#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe Overwatch.exe")

~WheelDown:: {
    SendEvent "{F24 down}"
    Sleep 100
    SendEvent "{F24 up}"
}

#HotIf
