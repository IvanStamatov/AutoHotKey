#Include tflibrary.ahk

Gui, Add, Text, Center x2 y0 w150 h30 , Treasure Goblin
Gui, Add, Text, Center x2 y30 w150 h30 , Blood Thief
Gui, Add, Text, Center x2 y60 w150 h30 , Gem Hoarder
Gui, Add, Text, Center x2 y90 w150 h30 , Odious Collector
Gui, Add, Text, Center x2 y120 w150 h30 , Gilded Baron
Gui, Add, Text, Center x2 y150 w150 h30 , Gelatinous Sire
Gui, Add, Text, Center x2 y180 w150 h30 , Insufferable Tormentor
Gui, Add, Text, Center x2 y210 w150 h30 , Menagerist Goblin
Gui, Add, Text, Center x2 y240 w150 h30 , Rainbow Goblin
Gui, Add, Text, Center x2 y270 w150 h30 , Run 

Gui, Add, Button, x182 y0 w30 h20 gGob1, +
Gui, Add, Button, x182 y30 w30 h20 gGob2, +
Gui, Add, Button, x182 y60 w30 h20 gGob3, +
Gui, Add, Button, x182 y90 w30 h20 gGob4, +
Gui, Add, Button, x182 y120 w30 h20 gGob5, +
Gui, Add, Button, x182 y150 w30 h20 gGob6, +
Gui, Add, Button, x182 y180 w30 h20 gGob7, +
Gui, Add, Button, x182 y210 w30 h20 gGob8, +
Gui, Add, Button, x182 y240 w30 h20 gGob9, +
Gui, Add, Button, x182 y270 w30 h20 gRun, +

Gui, Add, Text, Center x152 y0 w30 h30 vScore1, % count1:=TF_ReadLines("GobCount.txt",1,1)
Gui, Add, Text, Center x152 y30 w30 h30 vScore2, % count2:=TF_ReadLines("GobCount.txt",2,2)
Gui, Add, Text, Center x152 y60 w30 h30 vScore3, % count3:=TF_ReadLines("GobCount.txt",3,3)
Gui, Add, Text, Center x152 y90 w30 h30 vScore4, % count4:=TF_ReadLines("GobCount.txt",4,4)
Gui, Add, Text, Center x152 y120 w30 h30 vScore5, % count5:=TF_ReadLines("GobCount.txt",5,5)
Gui, Add, Text, Center x152 y150 w30 h30 vScore6, % count6:=TF_ReadLines("GobCount.txt",6,6)
Gui, Add, Text, Center x152 y180 w30 h30 vScore7, % count7:=TF_ReadLines("GobCount.txt",7,7)
Gui, Add, Text, Center x152 y210 w30 h30 vScore8, % count8:=TF_ReadLines("GobCount.txt",8,8)
Gui, Add, Text, Center x152 y240 w30 h30 vScore9, % count9:=TF_ReadLines("GobCount.txt",9,9)
Gui, Add, Text, Center x152 y270 w30 h30 vScore10, % count10:=TF_ReadLines("GobCount.txt",10,10)
Gui, Show, x127 y87 h290 w217, Goblins Count
Return

;------------------

Gob1:
{
    count1:=TF_ReadLines("GobCount.txt",1,1)
    count1 += 0
    count1:=++count1
    GuiControl,,Score1,%count1%

    TF_ReplaceLine("GobCount.txt", 1,1, count1)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob2:
{
    count2:=TF_ReadLines("GobCount.txt",2,2)
    count2 += 0
    count2:=++count2
    GuiControl,,Score2,%count2%

    TF_ReplaceLine("GobCount.txt", 2,2, count2)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob3:
{
    count3:=TF_ReadLines("GobCount.txt",3,3)
    count3 += 0
    count3:=++count3
    GuiControl,,Score3,%count3%

    TF_ReplaceLine("GobCount.txt", 3,3, count3)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob4:
{
    count4:=TF_ReadLines("GobCount.txt",4,4)
    count4 += 0
    count4:=++count4
    GuiControl,,Score4,%count4%

    TF_ReplaceLine("GobCount.txt", 4,4, count4)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob5:
{
    count5:=TF_ReadLines("GobCount.txt",5,5)
    count5 += 0
    count5:=++count5
    GuiControl,,Score5,%count5%

    TF_ReplaceLine("GobCount.txt", 5,5, count5)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob6:
{
    count6:=TF_ReadLines("GobCount.txt",6,6)
    count6 += 0
    count6:=++count6
    GuiControl,,Score6,%count6%

    TF_ReplaceLine("GobCount.txt", 6,6, count6)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob7:
{
    count7:=TF_ReadLines("GobCount.txt",7,7)
    count7 += 0
    count7:=++count7
    GuiControl,,Score7,%count7%

    TF_ReplaceLine("GobCount.txt", 7,7, count7)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob8:
{
    count8:=TF_ReadLines("GobCount.txt",8,8)
    count8 += 0
    count8:=++count8
    GuiControl,,Score8,%count8%

    TF_ReplaceLine("GobCount.txt", 8,8, count8)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Gob9:
{
    count9:=TF_ReadLines("GobCount.txt",9,9)
    count9 += 0
    count9:=++count9
    GuiControl,,Score9,%count9%

    TF_ReplaceLine("GobCount.txt", 9,9, count9)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}
Run:
{
    count10:=TF_ReadLines("GobCount.txt",10,10)
    count10 += 0
    count10:=++count10
    GuiControl,,Score10,%count10%

    TF_ReplaceLine("GobCount.txt", 10,10, count10)
    FileDelete, GobCount.txt
    FileMove, GobCount_copy.txt, GobCount.txt
    return
}

;------------------

GuiClose:
ExitApp