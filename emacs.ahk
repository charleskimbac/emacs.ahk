;; An autohotkey script that provides emacs-like keybindings on Windows
;; https://github.com/charleskimbac/emacs.ahk
#Requires AutoHotKey v2.0

; SETTINGS | 0 = off, 1 = on | remember to reload the script after modifying
global USING_ACTIVE_ICON := 0 ; show icon while keybinds are active
global USING_EXE_AUTO_SUSPEND := 1 ; if on, add .exe's below

; ===========================================================================

;; suspend if certain windows are active, add .exe's below
if (USING_EXE_AUTO_SUSPEND) {
	DllCall("RegisterShellHookWindow", "Ptr", A_ScriptHwnd)
	OnMessage(DllCall("RegisterWindowMessage", "Str", "SHELLHOOK"), SuspendIfActive)

	SuspendIfActive(event, hwnd, *) {
		if event != 32772 ; HSHELL_RUDEAPPACTIVATED
			return

		; ADD/REMOVE EXEs BELOW AS NEEDED! <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		if WinActive("ahk_exe RobloxPlayerBeta.exe") or 
			WinActive("ahk_exe League of Legends.exe") or 
			WinActive("ahk_exe VALORANT-Win64-Shipping.exe") or 
			WinActive("ahk_exe Overwatch.exe") or 
			WinActive("ahk_exe destiny2.exe")
			{
				; then Suspend=true
				if (USING_ACTIVE_ICON) {
					ToggleSuspend(1)
				} else {
					Suspend(1)
				}
		} else { ; then Suspend=false
			if (USING_ACTIVE_ICON) {
				ToggleSuspend(0)
			} else {
				Suspend(0)
			}
		}
	}
}

if (USING_ACTIVE_ICON) {
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
}

;; binds
InstallKeybdHook
#UseHook
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
global IS_PRE_X := 0

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

!d::delete_word()

^k::kill_line()

^o::open_line_emacs()

^l::newline_emacs()

^a::move_beginning_of_line()

^e::move_end_of_line()

^p::previous_line()

^n::next_line()

^b::backward_char()

^+a::select_all()

^+z::redo()

NumpadEnter::Send "{Enter}"

$F1::return

!0::Send "👍"
!Numpad0::Send "👍"

^+p::Send "^p"

^+k::Send "^k"

^+b::Send "^b"

Ins::return

SetNumLockState "AlwaysOn"



; where: ctrl = ^, alt = !, shift = +