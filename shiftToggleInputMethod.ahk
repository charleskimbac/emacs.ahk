;;使用Shift切换中/英文

Shift::
    if WinActive("ahk_class Emacs") or WinActive("ahk_class  X410_XAppWin")
        Send {f9}
Return

^Space::
    if WinActive("ahk_class Emacs") or WinActive("ahk_class  X410_XAppWin")
        Send ^{@}
Return