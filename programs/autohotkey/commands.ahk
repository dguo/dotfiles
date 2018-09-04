; Remap caps lock to escape when tapped and control when held
; https://superuser.com/a/581988/922801

*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown) < 150)  ; Modify the threshold (in ms) as needed
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return
