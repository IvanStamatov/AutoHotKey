#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
CoordMode, mouse, Screen


loopbreak :=

Loop
{
    if loopbreak = 1
        break

    MouseGetPos, posX, posY, 
    PixelGetColor, pColor, %posX%, %posY%, RGB
    ToolTip, X = %posX% / Y = %posY%`nColor = %pColor%
    Sleep 20
}






q::
{
    loopbreak = 1
    ToolTip, Snapshotted
    FileAppend, X = %posX%`nY = %posY%`nColor(RGB) = %pColor%`n`n, snapshot.txt
    loopbreak = 0
}
Return

