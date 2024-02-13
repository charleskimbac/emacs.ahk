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

delete_char()
{
    Send "{Del}"
    global IS_PRE_SPC := 0
}

delete_word()
{
    Send "^{Del}"
    global IS_PRE_SPC := 0
}

delete_backward_char()
{
    Send "{BS}"
    global IS_PRE_SPC := 0
}

kill_line()
{
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
    global IS_PRE_SPC := 0
}

open_line()
{
    Send "{END}{Enter}{Up}"
    global IS_PRE_SPC := 0
}

open_line_emacs()
{
    Send "{Home}{Enter}{Up}"
    global IS_PRE_SPC := 0
}

quit()
{
    Send "{ESC}"
    global IS_PRE_SPC := 0
}

newline()
{
    Send "{Enter}"
    global IS_PRE_SPC := 0
}

duplicate_line()
{
    Send "^d"
    global IS_PRE_SPC := 0
}

newline_emacs()
{
    Send "{END}{Enter}"
    global IS_PRE_SPC := 0
}

indent_for_tab_command()
{
    Send "{Tab}"
    global IS_PRE_SPC := 0
}

indent_for_tab_command_invert()
{
    Send "+{Tab}"
    global IS_PRE_SPC := 0
}

newline_and_indent()
{
    Send "{Enter}{Tab}"
    global IS_PRE_SPC := 0
}

isearch_forward()
{
    Send "^f"
    global IS_PRE_SPC := 0
}

isearch_backward()
{
    Send "^f"
    global IS_PRE_SPC := 0
}

kill_region()
{
    Send "^x"
    global IS_PRE_SPC := 0
}

kill_ring_save()
{
    Send "^c"
    global IS_PRE_SPC := 0
}

yank()
{
    Send "^v"
    global IS_PRE_SPC := 0
}

undo()
{
    Send "^z"
    global IS_PRE_SPC := 0
}

redo()
{
    Send "^y"
    global IS_PRE_SPC := 0
}

find_file()
{
    Send "^o"
    global IS_PRE_X := 0
}

save_buffer()
{
    Send "^s"
    global IS_PRE_X := 0
}

move_beginning_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{HOME}"
    else
        Send "{HOME}"
}

move_end_of_line()
{
    global
    if IS_PRE_SPC
        Send "+{END}"
    else
        Send "{END}"
}

previous_line()
{
    global
    if IS_PRE_SPC
        Send "+{Up}"
    else
        Send "{Up}"
}

next_line()
{
    global
    if IS_PRE_SPC
        Send "+{Down}"
    else
        Send "{Down}"
}

forward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Right}"
    else
        Send "{Right}"
}

backward_char()
{
    global
    if IS_PRE_SPC
        Send "+{Left}"
    else
        Send "{Left}"
}

forward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Right}"
    else
        Send "^{Right}"
}

backward_word()
{
    global
    if IS_PRE_SPC
        Send "^+{Left}"
    else
        Send "^{Left}"
}

mark_whole_buffer()
{
    Send "^{End}^+{Home}"
    global IS_PRE_SPC := 0
}


^x::
{
    global IS_PRE_X := 1
}

^f::
{
    if IS_PRE_X
        find_file()
    else
        forward_char()
}

!f::
{
        forward_word()
}

!b::
{
    backward_word()
}

^d::
{
    delete_char()
}

!d::
{
    delete_word()
}

^h::
{
    delete_backward_char()
}

^k::
{
    kill_line()
}

^o::
{
    open_line_emacs()
}

^g::
{
    quit()
}

^l::
{
    newline_emacs()
}

^j::
{
    newline_and_indent()
}

^m::
{
    newline()
}

^i::
{
    indent_for_tab_command_invert()
}

!i::
{
    indent_for_tab_command()
}

^s::
{
    if IS_PRE_X
        save_buffer()
    else
        isearch_forward()
}

^r::
{
    isearch_backward()
}

^w::
{
    kill_region()
}

!w::
{
    kill_ring_save()
}

^y::
{
    yank()
}

^/::
{
    undo()
}

^+/::
{
    redo()
}

;; Set the mark with C-SPC in Emacs
^Space::
{
    if IS_PRE_SPC
        global IS_PRE_SPC := 0
    else
        global IS_PRE_SPC := 1
}

!h::
{
    if IS_PRE_SPC
        global IS_PRE_SPC := 0
    else
        global IS_PRE_SPC := 1
}

^a::
{
    move_beginning_of_line()
}

^e::
{
    move_end_of_line()
}

^p::
{
    previous_line()
}

^n::
{
    next_line()
}

^b::
{
    backward_char()
}

;;text scale increase
#=::
{
    Send "^{WheelUp}"
}

;;text scale decrease
#-::
{
    Send "^{WheelDown}"
}

;; maximize and restore window
#f::
{
WinGetPos &X, &Y,,, "A"
if  X < -5
    WinRestore("A")
else
    WinMaximize("A")
}

h::
{
    if IS_PRE_X
    {
        mark_whole_buffer()
        global IS_PRE_X := 0
    }
    else
        Send(A_ThisHotkey)
}

;; For Visual Studio
;; Goto Document M-.
!.::
{
    Send "{F12}"
}

;; Back to last location M-,
!,::
{
    Send "^{-}"
}

;; Toggle line comment C-x,C-;
^;::
{
    if IS_PRE_X
    {
        Send "^{k}"
        Sleep 50
        Send "^{/}"
        next_line()
        global IS_PRE_X := 0
    }
    else
        Send(A_ThisHotkey)
}
