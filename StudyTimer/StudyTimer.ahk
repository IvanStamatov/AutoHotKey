#SingleInstance force
#include tflibrary.ahk

; TODO
; custom path saved in settings - DONE
; tabs to display time by projects
; save projects
; set goals and notification when a goal is reached
; LATER - countdown option
; set a work time



BalanceTime := 0    ;timestuff
ElapsedTime := A_YYYY   ;time format
currentDate = %A_DD%/%A_MM%/%A_YYYY% ;timestuff

FileReadLine, path, settings.ini, 1 ;getting the path, /Study Time folder
FileAppend, ,%path%\data.txt    ;creating file for storing data
dataPath = %path%\data.txt  ;variable to hold the data file path
projectPath = %path%\Projects
;session checker, if in same session and same day replace time, if not add time
;   session = % TF_ReadLines("settings.ini", 2,2)
;   msgbox %session%
;   TF_ReplaceLine("!settings.ini", 2,2, "open")
;   desiredSessionState := open
;   currentSessionState := session
;Line2: open=1/0
;TF_ReplaceLine("!settings.ini", 2,2, "open=1")
FileReadLine,prjcts, projectNames.txt, 1



GUI, FONT, S11
;GUI, +owner
Gui, Add, DropDownList, x10 y10 w170 vProjectList gOnSelectDDL, %prjcts% 
Gui, Add, Button, x210 y10 w70 h25 gNewButton, New
Gui, Add, Button, x10 y60 w130 h40 vButtonStartStop gStartStop, Start
Gui, Add, Button, x10 y110 w130 h40 vSaveButton gSave, Save
Gui, Add, Button, x150 y110 w130 h40 vResetButton gReset, Reset
Gui, Add, Text, x195 y70 w75 h20 vDisplayTime, 0:00:00
Gui, Show, AutoSize, Study Timer
Return

OnSelectDDL:
{
    Gui, Submit, nohide
    currentProject := ProjectList
    projectName = %ProjectList%.txt
    projectpathpath = %projectPath%\%projectName%
    Gosub, Reset

}
Return

NewButton:
{
    InputBox, newProject, Create new project, , , 200, 100
    GuiControl, , ProjectList, %newProject%|
    FileAppend, %newProject%|, projectNames.txt
    FileAppend, , %path%\Projects\%newProject%.txt
}
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
    
        Gosub, TimeLoop
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
    numLineToDelete := % TF_Find(projectpathpath, "", "", currentDate, 1, 0)
    If(numLineToDelete = 0)
    {
    FileAppend,%A_DD%/%A_MM%/%A_YYYY% - %DisplayTime%`n, %projectPath%\%projectName%
    break
    }
    
    lineString := % TF_ReadLines(projectpathpath, numLineToDelete, numLineToDelete, 1)
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

    timeFormatToSave = %currentDate% - %totaltimeConverted%
    timeFormatToSaveDisplayTime = %currentDate% - %DisplayTime%
    pathVar = !%projectpathpath%
    
    
      
       ; TF_ReplaceLine(pathVar, numLineToDelete, numLineToDelete, timeFormatToSaveDisplayTime)

        TF_ReplaceLine(pathVar, numLineToDelete, numLineToDelete, timeFormatToSave)
     return
}
return


GuiClose:
{
    TF_ReplaceLine("!settings.ini", 2,2, "closed")
    ExitApp
}