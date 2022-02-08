
Declare Sub MainMenu()
Declare Sub Pause()
Declare Sub Create()
Declare Sub Add()
Declare Sub Show()
Declare Sub Edit()
Declare Sub Delete()
Declare Sub Search()
Declare Sub Decay()


Call MainMenu

Sub MainMenu ()
    10:
    Cls
    Print
    Print Tab(35); "Flower Shop"
    Print
    Rem Locate 5, 5
    Print Tab(5); "1. Create New Record (Caution: It will overwrite previous records)"
    Print Tab(5); "2. Add Record"
    Print Tab(5); "3. Display Record"
    Print Tab(5); "4. Edit Records"
    Print Tab(5); "5. Delete Records"
    Print Tab(5); "6. Search Records"
    Print Tab(5); "7. Exit Program"
    Print
    Input "Choose a number from the options printed in the menu above"; opt

    If opt = 1 Then
        Call Create
    ElseIf opt = 2 Then
        Call Add
    ElseIf opt = 3 Then
        Call Show
    ElseIf opt = 4 Then
        Call Edit
    ElseIf opt = 5 Then
        Call Delete
    ElseIf opt = 6 Then
        Call Search
    ElseIf opt = 7 Then
        Call Decay
    Else
        Cls
        Print "Error!!"
        Print "Try again"
        Call Pause
        GoTo 10
    End If

    End

End Sub

Sub Create ()
    Cls
    Open "record.txt" For Output As #1
    20:
    Print
    Input "Enter the name of the flower: "; name$
    Input "Enter the price (in Nrs): "; price
    Write #1, name$, price
    Input "Want to add more records ?? (y/n): "; choice$
    If LCase$(choice$) = "y" Then
        GoTo 20
    ElseIf LCase$(choice$) = "n" Then
        Close #1
        Call MainMenu
    Else
        Close #1
        Print "Error"
        Print "Press any key to continue"
        Call Pause
        Call MainMenu
    End If
End Sub

Sub Add ()
    Cls
    Open "record.txt" For Append As #2
    30:
    Input "Enter the name of the flower: "; n$
    Input "Enter the price (in Nrs): "; p
    Write #2, n$, p
    Input "Want to add more records ?? (y/n): "; c$
    If LCase$(c$) = "y" Then
        GoTo 30
    ElseIf LCase$(c$) = "n" Then
        Close #2
        Call MainMenu
    Else
        Close #2
        Print "Error !!! Press any key to continue"
        Call Pause
        Call MainMenu
    End If
End Sub
 
Sub Show ()
    Cls
    Open "record.txt" For Input As #3
    While Not EOF(3)
        Print
        Input #3, na$, pr
        Print "Name: "; na$
        Print "Price (In Nrs): "; pr
    Wend
    Close #3
    Print
    Print "Press any key to continue"
    Call Pause
    Call MainMenu
End Sub


Sub Edit ()
    Cls
    Open "record.txt" For Input As #4
    Open "out.txt" For Output As #5
    While Not EOF(4)
        Input #4, n1$, pr2
        Print "Name: "; n1$
        Print "Price: "; pr2
        Input "Do you want to edit the record [y/n]?: "; c$
        If LCase$(c$) = "y" Then
            Input "Input the name of the flower: "; n2$
            Input "Input the price (In Nrs)"; pri
            Write #5, n2$, pri
        ElseIf LCase$(c$) = "n" Then
            Write #5, n1$, pr2
        Else
            Write #5, n1$, pr2
            Print "Error!!"
            Print "Press any key to continue"
            Call Pause
        End If
    Wend
    Close #5
    Close #4
    Kill "record.txt"
    Name "out.txt" As "record.txt"
    Print
    Print "Press any key to continue"
    Call Pause
    Call MainMenu
End Sub

Sub Delete ()
    Cls
    Open "record.txt" For Input As #6
    Open "out.txt" For Output As #7
    While Not EOF(6)
        Input #6, n5$, r5
        Print "Name: "; n5$
        Print "Price (In Nrs): "; r5
        Input "Do you want to remove this record [y/n]?: "; a5$
        If LCase$(a5$) = "y" Then
        ElseIf LCase$(a5$) = "n" Then
            Write #7, n5$, r5
        Else
            Write #7, n5$, r5
            Print
            Print "ERROR!!!"
            Print "Press any key to continue"
            Call Pause
        End If
    Wend
    Close #7
    Close #6
    Kill "record.txt"
    Name "out.txt" As "record.txt"
    Print
    Print "Press any key to continue"
    Call Pause
    Call MainMenu
End Sub


Sub Search ()
    Cls
    Print
    Input "Do you want to search? [y/n]: "; qtr$

    If LCase$(qtr$) = "y" Then
        GoTo 40
    ElseIf LCase$(qtr$) = "n" Then
        Call MainMenu
    Else
        Print
        Print "ERROR!!!"
        Print "Press any key to continue"
        Call Pause
        Call Search
    End If

    40:
    Cls
    tr = 0
    Open "record.txt" For Input As #8
    Input "Enter the name of the flower: "; name1$
    While Not EOF(8)
        Input #8, n40$, pr40
        If name1$ = n40$ Then
            Print
            Print "Name of the flower: "; n40$
            Print "Price of the flower: "; pr40
            tr = tr + 1
            Print
            Print "Press any key to continue"
            Call Pause
        End If
    Wend
    If tr = 0 Then
        Print "Error!!! Name Not Found"
        Print "Try again"
        Print "Press any key to continue"
        Call Pause
        Call Search
    End If
    Close #8
    Call Search
End Sub

Sub Decay ()
    Cls
    End
End Sub

Sub Pause ()
    While InKey$ = ""
    Wend
End Sub


            











































