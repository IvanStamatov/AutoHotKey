FileSelectFolder, installFolderPath, , 0, Select where to install.
if installFolderPath =
{
MsgBox, You didn't select a folder.
ExitApp
}

IfNotExist, %installFolderPath%\StudyTimer\settings.ini
{
    FileCreateDir, %installFolderPath%\StudyTimer
    FileCreateDir, %installFolderPath%\StudyTimer\Projects
    FileAppend, , %installFolderPath%\StudyTimer\Projects\_projectNames.ini
    FileAppend, , %installFolderPath%\StudyTimer\settings.ini
}
IfExist, %installFolderPath%\StudyTimer\settings.ini
{
    msgbox, Folder already exists.
}


;add a shortcut to the desktop
path = %installFolderPath%\StudyTimer
FileAppend, %path%`n, %path%\settings.ini


;create script file
msgbox done
ExitApp