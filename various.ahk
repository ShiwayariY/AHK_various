#NoEnv

saved_width := 0
saved_height := 0

~^!r::
Menu, Tray, Icon
Reload
return

~^!y::
Menu, Tray, NoIcon
return

; -------- focus windows explorer file area ---------

#IfWinActive ahk_exe explorer.exe
!f::
ControlFocus, DirectUIHWND2, A
return
#IfWinActive

; -------------- copy / paste window size -----------

<^>!c::
WinGetPos,,, saved_width, saved_height, A
return

<^>!v::
WinMove, A,,,, saved_width, saved_height
return

; -------------- force windowed fullscreen ----------

<^>!f::
WinSet, Style, ^0xC00000, A ; remove window title & borders
WinMove, A,, 3840, 0, 1920, 1080
return

; ---------------- Enter Loop, better ---------------

Enter::
SendInput {Enter}
loop_num = 0
SetTimer, loop_enter, 50
return

loop_enter:
if (loop_num < 4) {
	++loop_num
} else {
	SendInput {Enter}
}
return

Enter UP::
SetTimer, loop_enter, Off
return


; --------------------- unused ---------------------
/*
; ------------------- Enter Loop -------------------

Enter::
Send {Enter}
loopNum := 0
Loop, 25 {
	if GetKeyState("Enter", "P") {
		Sleep 10
		++loopNum
	} else {
		break
	}
}
if (loopNum = 25) {
	Loop {
		if GetKeyState("Enter", "P") {
			Send {Enter}
		} else {
			break
		}
		waitNum := 0
		Loop, 2 {
			if GetKeyState("Enter", "P") {
				Sleep 10
				++waitNum
			} else {
				break
			}
		}
		if (waitNum != 2) {
			break
		}
	}
}
return

; ------------------- Record / replay mouse position -------------------


F12::
MouseGetPos, x, y
FileAppend,
(
MouseMove, %x%, %y%, 1

), D:\moves.txt
Loop {
	if GetKeyState("F12", "P") {
		if GetKeyState("1", "P") {
			MouseGetPos, x, y
			FileAppend,
(
MouseMove, %x%, %y%, 1

), D:\moves.txt
			Sleep, 10
		}
		if GetKeyState("2", "P") {
			Run %A_AHKPath% "D:\moves.txt"
		}
	} else {
		break
	}
}
return
*/