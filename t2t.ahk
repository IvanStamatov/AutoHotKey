#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

indexString :=
mainArray := 
firstRow :=
q::
{
    ;FileDelete, t2touput.txt
    indexString := clipboard
    InputBox, rowNum, Rows,, , 100, 100, A_ScreenWidth / 2, A_ScreenHeight / 2, , ,Number of rows
    Loop
    {
        indexString := StrReplace(indexString, "`r`n`r`n", "`r`n", Count)
        if Count = 0
            break
    }
    ;FileAppend, %indexString%`n, t2touput.txt

    oArray := StrSplit(indexString, "`r`n")
    ;MsgBox, % oArray.4
    Loop,%rowNum%
    {
        row := oArray[A_Index]
        spaceTxt := " : " 
        finalRow := row spaceTxt oArray[A_Index + 4]
        FileAppend, %finalRow%`n, endrow.txt
    }
    MsgBox done
    
    
    
    


}
Return



















Escape::ExitApp
