BalanceTime:=0
ElapsedTime := A_YYYY
Gui, Add, Button, x2 y20 w130 h40 vButtonStartStop gStartStop Default, Start
Gui, Add, Button, x2 y70 w130 h40 gSave, Save
Gui, Add, Text, x200 y65 w150 h40 vDisplayTime, 0:00:00
Gui, Show, x127 y87 h130 w300, Study Timer
Return

StartStop:
{
   GuiControlGet, ButtonStartStop
   If (ButtonStartStop = "Start")
   {
      StartTickCount := A_TickCount - BalanceTime
      SetTimer, StopWatch, 10
      GuiControl, , ButtonStartStop, Stop
   } 
   Else 
   {
      BalanceTime := A_TickCount - StartTickCount
      SetTimer, StopWatch, Off
      GuiControl, , ButtonStartStop, Start
   }
}
Return

StopWatch:
   If ((A_TickCount - StartTickCount) >= 1000) 
   {
      StartTickCount += 1000
      ElapsedTime += 1, S
      FormatTime, DisplayTime, %ElapsedTime%, H:mm:ss
      GuiControl, , DisplayTime, %DisplayTime%
   }
Return

Save:
{
    FileAppend,%A_DD%/%A_MM%/%A_YYYY% - %DisplayTime%`n, studytime.txt
}
Return

GuiClose:
ExitApp