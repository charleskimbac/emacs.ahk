;; An autohotkey script that provides emacs-like keybindings on Windows
;; https://github.com/charleskimbac/emacs.ahk

#Requires AutoHotKey v2.0

;; SETTINGS | 0 = off, 1 = on | remember to reload the script after modifying
; show small image at top right of screen while keybinds are active
global USING_ACTIVE_ICON := 0
global IMAGE_PATH := "emacsLogo.png"

; auto-suspend keybindings if .exe is currently active, add .exe's below
global USING_EXE_AUTO_SUSPEND := 1

; ===========================================================================

;; suspend if certain windows are active, add .exe's below
if (USING_EXE_AUTO_SUSPEND) {
	DllCall("RegisterShellHookWindow", "Ptr", A_ScriptHwnd)
	OnMessage(DllCall("RegisterWindowMessage", "Str", "SHELLHOOK"), SuspendIfActive)

	SuspendIfActive(event, hwnd, *) {
		if event != 32772 ; HSHELL_RUDEAPPACTIVATED
			return

		; ADD/REMOVE EXEs BELOW AS NEEDED! <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	global image := ImageShow(IMAGE_PATH,, [1850, 30], 0x90000000, 0x80088 | 0x20)
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

;; define key functions
InstallKeybdHook
#UseHook
SetKeyDelay 0

kill_line()
{
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50
    Send "^x"
}

newline_above()
{
    Send "{Home}{Enter}{Up}"
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

newline_below()
{
    Send "{END}{Enter}"
}

redo()
{
	Send "^y"
}


;; BINDS START
; where: ctrl = ^, alt = !, shift = +

^l::forward_char()

!l::forward_word()

^h::backward_char()

!h::backward_word()

^k::previous_line()

^j::next_line()

^m::kill_line()

^u::newline_above()

^i::newline_below()

^q::move_beginning_of_line()

^e::move_end_of_line()

^+z::redo()

NumpadEnter::Send "{Enter}"

$F1::return

!0::Send "👍"
!Numpad0::Send "👍"

Ins::return

SetNumLockState "AlwaysOn"

^x::return ; temp bc i keep pressing it...