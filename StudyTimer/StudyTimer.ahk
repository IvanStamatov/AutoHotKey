#SingleInstance force
#include STLibrary.ahk

;----- TODO
; custom path saved in settings - DONE
; tabs to display time saved by projects
; save projects - DONE
; set goals and notification when a goal is reached
; LATER - countdown option
; Menu
; Option to delete projects
; Preselect last used project
; 




;----- Set up variable
BalanceTime := 0    ;timestuff
ElapsedTime := A_YYYY   ;time format
currentDate = %A_DD%/%A_MM%/%A_YYYY% ;timestuff

FileReadLine, path, settings.ini, 1 ;getting the path, /Study Time folder
projectPath = %path%\Projects
FileReadLine,prjcts, Projects\_projectNames.ini, 1  ;get already created projects

;Menu, HelpMenu, Add, &DOSOMETHING, HelpAbout  ;Create the sub-menus for the menu bar
;Menu, MyMenuBar, Add, &Options, :HelpMenu  ;Create the menu bar by attaching the sub-menus to it



;----- GUI:
GUI, FONT, S11
;Gui, Menu, MyMenuBar
;GUI, +owner    ;minimizes to taskbar
Gui, Add, DropDownList, x10 y10 w170 vProjectList gOnSelectDDL, %prjcts% 
Gui, Add, Button, x210 y10 w70 h25 gNewButton, New
Gui, Add, Button, x10 y60 w130 h40 vButtonStartStop gStartStop, Start
Gui, Add, Button, x10 y110 w130 h40 vSaveButton gSave, Save
Gui, Add, Button, x150 y110 w130 h40 vResetButton gReset, Reset
Gui, Add, Text, x195 y70 w75 h20 vDisplayTime, 0:00:00
Gui, Show, AutoSize, Study Timer
Return


;----- Functions:
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
    FileAppend, %newProject%|, Projects\_projectNames.txt
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
        msgbox You have not selected a project ot started the timer!
        Return
    }
    GuiControl, , SaveButton, Time saved!
    sleep, 500
    GuiControl, , SaveButton, Save
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
    
    TF_ReplaceLine(pathVar, numLineToDelete, numLineToDelete, timeFormatToSave)
     return
}
return

;----- code above is working correctly -------------------------------------------------------




;HelpAbout:
;{
;
;}
;return








GuiClose:
{
    ExitApp
}
