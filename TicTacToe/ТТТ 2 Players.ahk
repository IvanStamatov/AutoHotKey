#SingleInstance
; if nothing then X/O
; if X/O then nothing
; Keep count of moves and switch between X and O depending on if its either odd(O) or even(X)




Gui, Add, Button, x10 y5 w50 h50 gA1Action vA1Text, 
Gui, Add, Button, x70 y5 w50 h50 gA2Action vA2Text, 
Gui, Add, Button, x130 y5 w50 h50 gA3Action vA3Text, 

Gui, Add, Button, x10 y65 w50 h50 gB1Action vB1Text, 
Gui, Add, Button, x70 y65 w50 h50 gB2Action vB2Text, 
Gui, Add, Button, x130 y65 w50 h50 gB3Action vB3Text, 


Gui, Add, Button, x10 y125 w50 h50 gC1Action vC1Text, 
Gui, Add, Button, x70 y125 w50 h50 gC2Action vC2Text, 
Gui, Add, Button, x130 y125 w50 h50 gC3Action vC3Text, 

Gui, Add, Text, x10 y190 w170 Left vCount, Moves:
Gui, Add, Text, x10 y210 w170 Left vXses, X:
Gui, Add, Text, x10 y230 w170 Left vOs, O:
Gui, Show, , TTT
Return

;declaring global vars
moveCount :=    
xCount :=
oCount :=

WinConditions()
{
    global
    IF(moveCount = 9)
    {
        msgbox Tie!
        Reload
    }
    GuiControlGet, A1Text
    GuiControlGet, A2Text
    GuiControlGet, A3Text
    GuiControlGet, B1Text
    GuiControlGet, B2Text
    GuiControlGet, B3Text
    GuiControlGet, C1Text
    GuiControlGet, C2Text
    GuiControlGet, C3Text

    if( A1Text = "X" && A2Text = "X" && A3Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( A1Text = "X" && B2Text = "X" && C3Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( A1Text = "X" && B1Text = "X" && C1Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( A2Text = "X" && B2Text = "X" && C2Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( A3Text = "X" && B3Text = "X" && C3Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( A3Text = "X" && B2Text = "X" && C1Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( B1Text = "X" && B2Text = "X" && B3Text = "X")
        {
        msgbox X wins
        Reload
        }
    if( C1Text = "X" && C2Text = "X" && C3Text = "X")
        {
        msgbox X wins
        Reload
        }



    if( A1Text = "O" && A2Text = "O" && A3Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( A1Text = "O" && B2Text = "O" && C3Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( A1Text = "O" && B1Text = "O" && C1Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( A2Text = "O" && B2Text = "O" && C2Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( A3Text = "O" && B3Text = "O" && C3Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( A3Text = "O" && B2Text = "O" && C1Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( B1Text = "O" && B2Text = "O" && B3Text = "O")
        {
        msgbox O wins
        Reload
        }
    if( C1Text = "O" && C2Text = "O" && C3Text = "O")
        {
        msgbox O wins
        Reload
        }
}
  


A1Action:
{
    GuiControlGet, A1Text
    If ( A1Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, A1Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%             
            }
            Else
            {
                GuiControl,, A1Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

A2Action:
{
    GuiControlGet, A2Text
    If ( A2Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, A2Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, A2Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
} 
Return

A3Action:
{
    GuiControlGet, A3Text
    If ( A3Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, A3Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, A3Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return


B1Action:
{
    GuiControlGet, B1Text
    If ( B1Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, B1Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, B1Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

B2Action:
{
    GuiControlGet, B2Text
    If ( B2Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, B2Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, B2Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

B3Action:
{
    GuiControlGet, B3Text
    If ( B3Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, B3Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, B3Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

C1Action:
{
    GuiControlGet, C1Text
    If ( C1Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, C1Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, C1Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

C2Action:
{
    GuiControlGet, C2Text
    If ( C2Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, C2Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, C2Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

C3Action:
{
    GuiControlGet, C3Text
    If ( C3Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            If((moveCount & 1) != 0)
            { 
               GuiControl,, C3Text, X
               xCount++
               GuiControl,, Xses, X: %xCount%
            }
            Else
            {
                GuiControl,, C3Text, O
                oCount++
                GuiControl,, Os, O: %oCount%
            }
            WinConditions()
       }
    Else
       { 
         Return
       }
}  
Return

GuiClose:
 ExitApp