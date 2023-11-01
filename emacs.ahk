;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
global IS_PRE_X := 0
; turns to be 1 when ctrl-space is pressed
global IS_PRE_SPC := 0
; turns to be 1 when Ctrl-c is pressed
global IS_PRE_C := 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
if WinActive("ahk_class ConsoleWindowClass") ; Cygwin
    return 1
if WinActive("ahk_exe Code.exe") ;vscode
    return 1
if WinActive("ahk_class VMwareUnityHostWndClass") ; Avoid VMwareUnity with AutoHotkey
    return 1
if WinActive("ahk_class mintty")
    return 1
if WinActive("ahk_class Window Class")
    return 1
if WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") ;Windows 10 terminal
    return 1
if WinActive("ahk_class Vim") ; GVI
    return 1
if WinActive("ahk_class Emacs") ; NTEmacs
    return 1
if WinActive("ahk_class X410_XAppWin")
    return 1
if WinActive("ahk_class RAIL_WINDOW")
    return 1
return 0
}

is_smatraPDF()
{
if WinActive("ahk_class SUMATRA_PDF_FRAME") ; smatraPDF
    return 1
return 0
}

delete_char()
{
    Send "{Del}"
    global IS_PRE_SPC := 0
    return
}

delete_word()
{
    Send "^{Del}"
    global IS_PRE_SPC := 0
    return
}

delete_backward_char()
{
    Send "{BS}"
    global IS_PRE_SPC := 0
    return
}
kill_line()
{
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
    global IS_PRE_SPC := 0
    return
}
open_line()
{
    Send "{END}{Enter}{Up}"
    global IS_PRE_SPC := 0
    return
}

open_line_emacs()
{
    Send "{Home}{Enter}{Up}"
    global IS_PRE_SPC := 0
    return
}
quit()
{
    Send "{ESC}"
    global IS_PRE_SPC := 0
    return
}
newline()
{
    Send "{Enter}"
    global IS_PRE_SPC := 0
    return
}

duplicate_line()
{
    Send "^d"
    global IS_PRE_SPC := 0
    return
}

newline_emacs()
{
    Send "{END}{Enter}"
    global IS_PRE_SPC := 0
    return
}
indent_for_tab_command()
{
    Send "{Tab}"
    global IS_PRE_SPC := 0
    return
}

indent_for_tab_command_invert()
{
    Send "+{Tab}"
    global IS_PRE_SPC := 0
    return
}
newline_and_indent()
{
    Send "{Enter}{Tab}"
    global IS_PRE_SPC := 0
    return
}
isearch_forward()
{
    Send "^f"
    global IS_PRE_SPC := 0
    return
}
isearch_backward()
{
    Send "^f"
    global IS_PRE_SPC := 0
    return
}
kill_region()
{
    Send "^x"
    global IS_PRE_SPC := 0
    return
}
kill_ring_save()
{
    Send "^c"
    global IS_PRE_SPC := 0
    return
}
yank()
{
    Send "^v"
    global IS_PRE_SPC := 0
    return
}
undo()
{
    Send "^z"
    global IS_PRE_SPC := 0
    return
}

redo()
{
    Send "^y"
    global IS_PRE_SPC := 0
    return
}
find_file()
{
    Send "^o"
    global IS_PRE_X := 0
    return
}
save_buffer()
{
    Send "^s"
    global IS_PRE_X := 0
    return
}
kill_emacs()
{
    Send "!{F4}"
    global IS_PRE_X := 0
    return
}

move_beginning_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{HOME}"
    Else
        Send "{HOME}"
        return
}
move_end_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{END}"
    Else
        Send "{END}"
        return
}
previous_line()
{
    global
    if IS_PRE_SPC
        Send "+{Up}"
    Else
        Send "{Up}"
        return
}
next_line()
{
    global
    if IS_PRE_SPC
        Send "+{Down}"
    Else
        Send "{Down}"
        return
}
forward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Right}"
    Else
        Send "{Right}"
        return
}
backward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Left}"
    Else
        Send "{Left}"
        return
}

forward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Right}"
    Else
        Send "^{Right}"
        return
}

backward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Left}"
    Else
        Send "^{Left}"
        return
}

scroll_up()
{
    global
    if IS_PRE_SPC
        Send "+{PgUp}"
    Else
        Send "{PgUp}"
        return
}
scroll_down()
{
    global
    if IS_PRE_SPC
        Send "+{PgDn}"
    Else
        Send "{PgDn}"
        return
}

mark_whole_buffer()
{
    Send "^{End}^+{Home}"
    global IS_PRE_SPC := 0
}


^x::
{
if is_target()
    Send(A_ThisHotkey)
else
    global IS_PRE_X := 1
return
}
^f::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_X
        find_file()
    Else
        forward_char()
}
return
}
!f::
{
If is_target()
    Send(A_ThisHotkey)
Else
    forward_word()
return
}
!b::
{
If is_target()
    Send(A_ThisHotkey)
Else
    backward_word()
return
}

^c::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_X
        kill_emacs()
    Else
        global IS_PRE_C := 1
}
return
}
^d::
{
If is_target()
    Send(A_ThisHotkey)
Else If is_smatraPDF()
{
    Send "^b"
}

Else
    delete_char()
return
}
!d::
{
If is_target()
    Send(A_ThisHotkey)
Else
    delete_word()
return

}
^h::
{
If is_target()
    Send(A_ThisHotkey)
Else
    delete_backward_char()
return
}
^k::
{
If is_target()
    Send(A_ThisHotkey)
Else
    kill_line()
return
}
^o::
{
If is_target()
    Send(A_ThisHotkey)
Else
    open_line_emacs()
return
}
^g::
{
If is_target()
    Send(A_ThisHotkey)
Else
    quit()
return
}
^l::
{
If (is_target() || is_smatraPDF())
    Send(A_ThisHotkey)
Else
    newline_emacs()
return
}
^j::
{
If is_target()
    Send(A_ThisHotkey)
Else
    newline_and_indent()
return
}
^m::
{
If is_target()
    Send(A_ThisHotkey)
Else
    newline()
return
}
^i::
{
If is_target()
    Send(A_ThisHotkey)
Else
    indent_for_tab_command_invert()
return

}
!i::
{
If is_target()
    Send(A_ThisHotkey)
Else
    indent_for_tab_command()
return
}
^s::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_X
        save_buffer()
    Else
        isearch_forward()
}
return
}
^r::
{
If is_target()
    Send(A_ThisHotkey)
Else
    isearch_backward()
return
}
^w::
{
If (is_target() || is_smatraPDF())
    Send(A_ThisHotkey)
Else
    kill_region()
return
}
!w::
{
If is_target()
    Send(A_ThisHotkey)
Else
    kill_ring_save()
return
}
^y::
{
If is_target()
    Send(A_ThisHotkey)
Else
    yank()
return
}
^/::
{
If is_target()
    Send(A_ThisHotkey)
Else
    undo()
return
}
^+/::
{
If is_target()
    Send(A_ThisHotkey)
Else
    redo()
return
}
;$^{Space}::
;^vk20sc039::
^vk20::
{
If is_target()
    Send "{CtrlDown}{Space}{CtrlUp}"
Else
{
    If IS_PRE_SPC
       global IS_PRE_SPC := 0
    Else
       global IS_PRE_SPC := 1
}
return
}
!h::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_SPC
        global IS_PRE_SPC := 0
    Else
        global IS_PRE_SPC := 1
}
return
}
^a::
{
If is_target()
    Send(A_ThisHotkey)
Else
    move_beginning_of_line()
return
}
^e::
{
If is_target()
    Send(A_ThisHotkey)
Else
    move_end_of_line()
return
}
^p::
{
If is_target()
    Send(A_ThisHotkey)
Else
    previous_line()
return
}
^n::
{
If is_target()
    Send(A_ThisHotkey)
Else
    next_line()
return
}
^b::
{
If is_target()
    Send(A_ThisHotkey)
Else
    backward_char()
return
}
^v::
{
If is_target()
    Send(A_ThisHotkey)
Else
    scroll_down()
return
}
!v::
{
If is_target()
    Send(A_ThisHotkey)
Else
    scroll_up()
return
}
;;text scale increase
#=::
{
If is_target()
    Send(A_ThisHotkey)
Else
    Send "^{WheelUp}"
return
}
;;text scale decrease
#-::
{
If is_target()
    Send(A_ThisHotkey)
Else
    Send "^{WheelDown}"
return
}
;; maximize and restore window
#f::
{
WinGetPos &X, &Y,,, "A"
If  x < -5
    WinRestore("A")
Else
    WinMaximize("A")
return
}
h::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_X
    {
        mark_whole_buffer()
        global IS_PRE_X := 0
    }
    Else
        Send(A_ThisHotkey)
}
return
}
d::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_C
    {
        duplicate_line()
        next_line()
        global IS_PRE_C := 0
    }
    Else
        Send(A_ThisHotkey)
}
return
}
;; For Visual Studio
;; 转到文档 M-.
!.::
{
If is_target()
    Send(A_ThisHotkey)
Else
    Send "{F12}"
return
}
;; 返回上一个位置 M-,
!,::
{
If is_target()
    Send(A_ThisHotkey)
Else
    Send "^{-}"
return
}
;; 切换行注释 C-x,C-;
^;::
{
If is_target()
    Send(A_ThisHotkey)
Else
{
    If IS_PRE_X
    {
        Send "^{k}"
        Sleep 50
        Send "^{/}"
        next_line()
        global IS_PRE_X := 0
    }
    Else
        Send(A_ThisHotkey)
}
return
}
