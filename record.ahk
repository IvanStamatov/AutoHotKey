#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen
#Persistent

running := 0
loopSleep := 500
;blockTime := 500
;timeBetweenActions := 200
iCount := 1
xTT := 50
yTT := 50
yPosMove := 
xPosMove := 


;BlockInput, MouseMove

e::
{
    running := 1
    ToolTip, [Recording], 0, A_ScreenHeight - 140, 9
}
Return

r::
{
    running := 0
    ToolTip, [Paused], 0, A_ScreenHeight - 140, 9
}
Return

q::
{
    running := 0
    ToolTip, [Executing], 0, A_ScreenHeight - 140, 9
    ToolTip,,,, 2
    Loop
    {
        FileReadLine, coordLine, coordsForRobots.txt, %A_Index%
        if ErrorLevel
            break
        clickArray := StrSplit(coordLine, A_Space)  ; Omits periods.
        xPosMove := clickArray[2]
        yPosMove := clickArray[3]
        If clickArray[1] = "r"
            Click, right, %xPosMove%, %yPosMove%
        If clickArray[1] = "l"
        {
            If clickArray[4] = "d"
            {
                MouseMove, %xPosMove%, %yPosMove%
                Sleep, 100
                Click, 2
            }
            else
                Click, %xPosMove%, %yPosMove%
        }
        
        sleep, loopSleep
    }
    ToolTip, [Finished], 0, A_ScreenHeight - 140, 9
}
Return


~LButton::
{
    if running = 1
    {
        MouseGetPos, posX,posY
        If (A_TimeSincePriorHotkey<300) and (A_TimeSincePriorHotkey<>-1)
        {
            ToolTip, Double click at %posX% / %posY%, 0, A_ScreenHeight - 100, 2
            FileAppend, Double Click N[%iCount%] @ x: %posX% | y: %posY%`n, coordsForHumans.txt
            FileAppend, l %posX% %posY% d`n, coordsForRobots.txt
        }
        else
        {
            ToolTip, Left click at %posX% / %posY%, 0, A_ScreenHeight - 100, 2
            FileAppend, Left  Click N[%iCount%] @ x: %posX% | y: %posY%`n, coordsForHumans.txt
            FileAppend, l %posX% %posY%`n, coordsForRobots.txt
        }

        iCount += 1
    }

}
return

~RButton::
{
    if running = 1
    {
        MouseGetPos, posX,posY
        ToolTip, Right click at %posX% / %posY%, 0, A_ScreenHeight - 100, 2
        FileAppend, Right Click N[%iCount%] @ x: %posX% | y: %posY%`n, coordsForHumans.txt
        FileAppend, r %posX% %posY%`n, coordsForRobots.txt
        iCount += 1
    }

}
return


Esc::ExitApp