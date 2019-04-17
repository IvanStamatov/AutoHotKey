#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen

state := 0
loopSleep := 50
blockTime := 500
timeBetweenActions := 200
iCount := 1
xTT := 50
yTT := 50
yPosMove := 
xPosMove := 


While, state = 0
{
    ;MsgBox, in loop
    MouseGetPos, posX, posY, , , 
    ToolTip, x: %posX%`ny: %posY%, xTT, yTT 
    sleep, loopSleep
}

q::
{
    state := 1
    BlockInput, MouseMove
    ToolTip, Coordinates have been saved, xTT, yTT 
    FileAppend, Point N[%iCount%] - x: %posX% | y: %posY%`n, coordsForHumans.txt
    FileAppend, %posX%`n%posY%`n, coordsForRobots.txt
    iCount += 1
    Sleep, blockTime
    state := 0
    BlockInput, MouseMoveOff
}
Return

^q::
{
    state := 1
    ToolTip, Starting Action Cycle..., xTT, yTT, 1
    SetTimer, RemoveToolTip, -1000

    Loop
    {
        FileReadLine, coordLine, coordsForRobots.txt, %A_Index%
        if ErrorLevel
            break
        If Mod(A_Index, 2)=0
        {
            ;y coords, also if it reaches y then it means it has x => go to moving 
            yPosMove := coordLine
            MouseActionMove(xPosMove, yPosMove)
        }
        Else 
        {
            ;x coords
            xPosMove := coordLine
        }
    }
}
Return

MouseActionMove(x, y)
{
    MouseMove, x, y
    Sleep, 500
}
Return



RemoveToolTip:
ToolTip,,,,1
return


Esc::ExitApp