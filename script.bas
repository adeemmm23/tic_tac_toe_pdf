' Paste the Output.txt here
' Run Main then if it's too slow or it crashes
' You can run Main with less iterations but you SHOULD keep it organized
' When i did this the shunk size was 6 
' Since it was impossible for me to run all of it on my slow Pc

Sub CreateBoard(ParamArray Board() As Variant)
    Dim lastSlideIndex As Integer
    Dim newSlide As SlideRange
    Dim i As Integer
    Dim j As Integer
    
    lastSlideIndex = ActivePresentation.Slides.Count
    Set newSlide = ActivePresentation.Slides(1).Duplicate
    newSlide.MoveTo (2)
    
    For i = 1 To 9
        PickBox CInt(Board(i - 1)), i, newSlide
    Next i
    
    For j = 10 To 18
        SelectAction CInt(Board(j - 1)), j - 9, newSlide
    Next j
End Sub

Sub PickBox(Player As Integer, Box As Integer, Slide As SlideRange)
    Dim CurrentPlayer As ShapeRange
    Dim SelectedBox As Shape
    
    Select Case Player
    Case 0
        Exit Sub
    Case 1
        Set CurrentPlayer = Slide.Shapes("XBOX").Duplicate
    Case 2
        Set CurrentPlayer = Slide.Shapes("OBOX").Duplicate
    End Select
    
    Select Case Box
    Case 1
        Set SelectedBox = Slide.Shapes("A")
    Case 2
        Set SelectedBox = Slide.Shapes("B")
    Case 3
        Set SelectedBox = Slide.Shapes("C")
    Case 4
        Set SelectedBox = Slide.Shapes("D")
    Case 5
        Set SelectedBox = Slide.Shapes("E")
    Case 6
        Set SelectedBox = Slide.Shapes("F")
    Case 7
        Set SelectedBox = Slide.Shapes("G")
    Case 8
        Set SelectedBox = Slide.Shapes("H")
    Case 9
        Set SelectedBox = Slide.Shapes("I")
    End Select
    
    CurrentPlayer.Left = SelectedBox.Left
    CurrentPlayer.Top = SelectedBox.Top
    
    SelectedBox.Delete
End Sub

Sub SelectAction(NextBox As Integer, Box As Integer, Slide As SlideRange)
    Dim SelectedBox As Shape
    Dim totalSlides As Integer
    
    If NextBox = 0 Then Exit Sub
    
    Select Case Box
    Case 1
        Set SelectedBox = Slide.Shapes("A")
    Case 2
        Set SelectedBox = Slide.Shapes("B")
    Case 3
        Set SelectedBox = Slide.Shapes("C")
    Case 4
        Set SelectedBox = Slide.Shapes("D")
    Case 5
        Set SelectedBox = Slide.Shapes("E")
    Case 6
        Set SelectedBox = Slide.Shapes("F")
    Case 7
        Set SelectedBox = Slide.Shapes("G")
    Case 8
        Set SelectedBox = Slide.Shapes("H")
    Case 9
        Set SelectedBox = Slide.Shapes("I")
    End Select
    
    totalSlides = ActivePresentation.Slides.Count
    SelectedBox.ActionSettings(ppMouseClick).Hyperlink.SubAddress = CStr(Abs(5477 - NextBox - totalSlides))
End Sub
