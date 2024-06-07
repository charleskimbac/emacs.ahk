;; An autohotkey script that provides emacs-like keybinding on Windows

#Requires AutoHotKey v2.0

/* UNCOMMENT IF YOU WANT TO AUTOSUSPEND THE SCRIPT BASED ON WHAT WINDOW IS ACTIVE
;; suspend if certain windows are active, EDIT BELOW
DllCall("RegisterShellHookWindow", "Ptr", A_ScriptHwnd)
OnMessage(DllCall("RegisterWindowMessage", "Str", "SHELLHOOK"), SuspendIfActive)

SuspendIfActive(event, hwnd, *) {
    if event != 32772 ; HSHELL_RUDEAPPACTIVATED
        return

    ; if Notepad is active
    if WinActive("ahk_exe EXAMPLE1.exe") or WinActive("ahk_exe EXAMPLE2.exe") { ; ADD EXEs AS NEEDED! USE WINDOWS SPY APPLICATION (included in AHK)
        ;Suspend true
		ToggleSuspend(1)
	} else {
        ;Suspend false
		ToggleSuspend(0)
    }
}
*/

;; show image while script is *not* suspended
#Include ImagePut.ahk

OnMessage(0x111, OnSuspend)
OnSuspend(wParam, *) {
    if (wParam = 65305 || wParam = 65404)
        return (Suspend(), ToggleSuspend(wParam), 0)
}

; show image on first run
global image := ImageShow("emacsLogo.png",, [1850, 30], 0x90000000, 0x80088 | 0x20)
; image location = (1850, 30)
ToggleSuspend(Mode := -1)
{
	global image
    if (Mode >= -1 && Mode <= 1)
        Suspend(Mode)
    
    Sleep(20)

    if (not A_IsSuspended and not image)
    {
        image := ImageShow("emacsLogo.png",, [1850, 30], 0x90000000, 0x80088 | 0x20)
    }
    else if (A_IsSuspended and image)
    {
        ImageDestroy({window: image})
        image := 0
    }
}


;; binds
InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
global IS_PRE_X := 0

delete_char()
{
    Send "{Del}"
}

delete_word()
{
    Send "^{Del}"
}

kill_line()
{
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
}

delete_line()
{
	Send "{ShiftDown}{END}{SHIFTUP}"
	Sleep 50 ;[ms] this value depends on your environment
	Send "{Del}"
}

open_line_emacs()
{
    Send "{Home}{Enter}{Up}"
}

isearch_forward()
{
    Send "^f"
}

isearch_backward()
{
    Send "^f"
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
	Send "{HOME}"
}

move_end_of_line()
{
    Send "{END}"
}

previous_line()
{
    Send "{Up}"
}

next_line()
{
    Send "{Down}"
}

forward_char()
{
    Send "{Right}"
}

backward_char()
{
    Send "{Left}"
}

forward_word()
{
    Send "^{Right}"
}

backward_word()
{
    Send "^{Left}"
}

newline_emacs()
{
    Send "{END}{Enter}"
}

select_all()
{
	Send "^a"
}

redo()
{
	Send "^y"
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

^s::
{
    if IS_PRE_X
        save_buffer()
    else
        isearch_forward()
}

!f::forward_word()

!b::backward_word()

^d::delete_char()

!d::delete_word()

^k::kill_line()

^o::open_line_emacs()

^l::newline_emacs()

^r::isearch_backward()

^a::move_beginning_of_line()

^e::move_end_of_line()

^p::previous_line()

^n::next_line()

^b::backward_char()

^+a::select_all()

^+z::redo()

^+k::delete_line()

NumpadEnter::Send "{Enter}"
