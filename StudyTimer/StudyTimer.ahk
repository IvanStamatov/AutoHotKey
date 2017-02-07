#SingleInstance force
#include tflibrary.ahk
BalanceTime := 0
ElapsedTime := A_YYYY
path := "C:\Users\Stamy\Desktop\StudyTimer\studytime.txt"
currentDate = %A_DD%/%A_MM%/%A_YYYY%
GUI, FONT, S11
GUI, +owner 
Gui, Add, Button, x10 y20 w130 h40 vButtonStartStop gStartStop, Start
Gui, Add, Button, x10 y70 w130 h40 vSaveButton gSave, Save
Gui, Add, Button, x150 y70 w130 h40 vResetButton gReset, Reset
Gui, Add, Text, x195 y30 w75 h20 vDisplayTime, 0:00:00
Gui, Show, AutoSize, Study Timer
Return

FormatSeconds(NumberOfSeconds)
{
    time = 19990101
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
    return NumberOfSeconds//3600 ":" mmss
}

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
    GuiControlGet, SaveButton

    if(BalanceTime == 0)
    {
        msgbox You have not started the timer!
        Return
    }
    
    if (SaveButton = "Save")
    {   
        ; TODO: figure out how to keep the path after closing the program
        ;ifNotExist, %path%
        ;    FileSelectFile, savePath, S 24 , studytime.txt
        ; save it in an .ini file?
        
        GuiControl, , SaveButton, Update
        Gosub, TimeLoop
    }
    Else
    {
        Gosub, TimeLoop
    }
}
Return

Reset:
{
    SetTimer, StopWatch, Off
    GuiControl, , ButtonStartStop, Start
    GuiControl, , DisplayTime, 0:00:00
    BalanceTime := 0
    ElapsedTime := A_YYYY    
}
Return

TimeLoop:
Loop
{
    numLineToDelete := % TF_Find(path, "", "", currentDate, 1, 0)   ; get index of line 
    If(numLineToDelete = 0)
        break

    lineString := % TF_ReadLines(path, numLineToDelete, numLineToDelete, 1)
    StringMid, hours, lineString, 14, 1
    StringMid, minutes, lineString, 16, 2
    StringRight, seconds, lineString, 2
    totalSec := (hours*3600) + (minutes*60) + seconds
    totalSec += 0

    timeInFile2 = %DisplayTime%
    time2 := timeInFile2
    StringMid, hours, time2, 1, 1
    StringMid, minutes, time2, 3, 2
    StringRight, seconds, time2, 2
    totalSec2 := (hours*3600) + (minutes*60) + seconds
    totalSec2 += 0
    
    totaltime := % totalSec + totalSec2
    totaltimeConverted := % FormatSeconds(totaltime)

    tekst = %currentDate% - %totaltimeConverted%

    TF_ReplaceLine(path, numLineToDelete, numLineToDelete, tekst) 
    FileDelete, %path%
    FileRead, tempFile, C:\Users\Stamy\Desktop\StudyTimer\studytime_copy.txt
    FileAppend, %tempFile%, %path%
    FileDelete, C:\Users\Stamy\Desktop\StudyTimer\studytime_copy.txt
     msgbox end of loop
     return
}
return



GuiClose:
ExitApp

