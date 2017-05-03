#SingleInstance
TileArray := [1, 2, 3, 4, 5, 6, 7, 8, 9]

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
Gui, Show, , TTT
Return

;declaring global vars
moveCount :=    


A1Action:
{
    GuiControlGet, A1Text
    If ( A1Text = "" ) 
       {
            moveCount++
            GuiControl,, Count, Moves: %moveCount%
            GuiControl,, A1Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(1, " ")
            TileArray.RemoveAt(2)      
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, A2Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(2, " ")
            TileArray.RemoveAt(3) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, A3Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(3, " ")
            TileArray.RemoveAt(4) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, B1Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(4, " ")
            TileArray.RemoveAt(5) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
               
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
            GuiControl,, B2Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(5, " ")
            TileArray.RemoveAt(6) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, B3Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(6, " ")
            TileArray.RemoveAt(7) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, C1Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(7, " ")
            TileArray.RemoveAt(8) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, C2Text, X
            Sleep 500
            WinConditions() 
            TileArray.Insert(8, " ")
            TileArray.RemoveAt(9) 
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
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
            GuiControl,, C3Text, X
            Sleep 500
            WinConditions()
            TileArray.RemoveAt(9) 
            TileArray.Insert(9, " ")
            Computer()
            moveCount++
            WinConditions()
            GuiControl,, Count, Moves: %moveCount%
       }
    Else
       { 
         Return
       }
}  
Return





RandomNum()
{
    Global
    restart:
    Random,rng,1 ,% TileArray.MaxIndex()
    rnd := TileArray[rng]
    if(rnd != " ")
    {
        
        TileArray.Insert(rng, " ")
        TileArray.RemoveAt(rng+1) 
        ;Loop 9
        ;{
        ;
        ;MsgBox % TileArray[A_Index]
        ;}
	    return rnd 
    }
    else
    {
        ;msgbox empty pass
        goto, restart
    }
}

Computer()
{
    Global
    ;msgbox computer function starts `n movecount: %moveCount%, `n last num generated: %randomNumMove%

    randomNumMove := 
    GuiControlGet, A1Text
    GuiControlGet, A2Text
    GuiControlGet, A3Text
    GuiControlGet, B1Text
    GuiControlGet, B2Text
    GuiControlGet, B3Text
    GuiControlGet, C1Text
    GuiControlGet, C2Text
    GuiControlGet, C3Text

    randomNumMove := RandomNum()
    ;msgbox the random number is %randomNumMove% after delcaring
    if(randomNumMove = 1)
    {
        if(A1Text = "")
        {
            GuiControl,, A1Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
    }
    else if(randomNumMove = 2)
    {
        if(A2Text = "")
        {
            GuiControl,, A2Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
        
    }
    else if(randomNumMove = 3)
    {
        if(A3Text = "")
        {
            GuiControl,, A3Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
        
    }
    else if(randomNumMove = 4)
    {
        if(B1Text = "")
        {
            GuiControl,, B1Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
        
    }
    else if(randomNumMove = 5)
    {
        if(B2Text = "")
        {
            GuiControl,, B2Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
        
    }
    else if(randomNumMove = 6)
    {
        if(B3Text = "")
        {
            GuiControl,, B3Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
    }
    else if(randomNumMove = 7)
    {
        if(C1Text = "")
        {
            GuiControl,, C1Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
    }
    else if(randomNumMove = 8)
    {
        if(C2Text = "")
        {
            GuiControl,, C2Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
    }
    else if(randomNumMove = 9)
    {
        if(C3Text = "")
        {
            GuiControl,, C3Text, O
        }
        else if(A1Text = "X" or A1Text = "O")
        {
           Computer()
        }
    }

    ;msgbox computer function end ,`n move count :%moveCount%, `n generated num: %randomNumMove%
    

}

ReloadFunX() 
{
    Global
    msgbox X wins
    moveCount := 
    Reload
}

ReloadFunO() 
{
    Global
    msgbox O wins
    moveCount := 
    Reload
}

WinConditions()
{
    global
   
    
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
        ReloadFunX()
        }
    else if( A1Text = "X" && B2Text = "X" && C3Text = "X")
        {
        ReloadFunX()
        }
    else if( A1Text = "X" && B1Text = "X" && C1Text = "X")
        {
        ReloadFunX()
        }
    else if( A2Text = "X" && B2Text = "X" && C2Text = "X")
        {
        ReloadFunX()
        }
    else if( A3Text = "X" && B3Text = "X" && C3Text = "X")
        {
        ReloadFunX()
        }
    else if( A3Text = "X" && B2Text = "X" && C1Text = "X")
        {
        ReloadFunX()
        }
    else if( B1Text = "X" && B2Text = "X" && B3Text = "X")
        {
        ReloadFunX()
        }
    else if( C1Text = "X" && C2Text = "X" && C3Text = "X")
        {
        ReloadFunX()
        }



    else if( A1Text = "O" && A2Text = "O" && A3Text = "O")
        {
        ReloadFunO()
        }
    else if( A1Text = "O" && B2Text = "O" && C3Text = "O")
        {
        ReloadFunO()
        }
    else if( A1Text = "O" && B1Text = "O" && C1Text = "O")
        {
        ReloadFunO()
        }
   else if( A2Text = "O" && B2Text = "O" && C2Text = "O")
        {
        ReloadFunO()
        }
    else if( A3Text = "O" && B3Text = "O" && C3Text = "O")
        {
        ReloadFunO()
        }
    else if( A3Text = "O" && B2Text = "O" && C1Text = "O")
        {
        ReloadFunO()
        }
    else if( B1Text = "O" && B2Text = "O" && B3Text = "O")
        {
        ReloadFunO()
        }
    else if( C1Text = "O" && C2Text = "O" && C3Text = "O")
        {
        ReloadFunO()
        }


     else IF(moveCount = 9)
    {
        msgbox Tie!
        moveCount := 
        Reload
    }
}
  
GuiClose:
 ExitApp