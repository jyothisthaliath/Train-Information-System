Attribute VB_Name = "Module2"

Option Explicit
Public usrCnt As Integer
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Public Function NumericField(KeyAscii As Integer) As Integer
If Chr(KeyAscii) = vbBack Then
    NumericField = KeyAscii
    Exit Function
End If
    If Not IsNumeric(Chr(KeyAscii)) Then
        NumericField = 0
    Else
        NumericField = KeyAscii
     End If
End Function



Public Function EnterKey(KeyAscii As Integer) As Integer
If KeyAscii = 13 Then
    EnterKey = 9
Else
    EnterKey = KeyAscii
End If
End Function


