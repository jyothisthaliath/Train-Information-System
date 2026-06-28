VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Location Tracking"
   ClientHeight    =   5790
   ClientLeft      =   5160
   ClientTop       =   1980
   ClientWidth     =   8355
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5790
   ScaleWidth      =   8355
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Height          =   2415
      Left            =   0
      TabIndex        =   27
      Top             =   3360
      Width           =   8295
      Begin VB.CommandButton Command18 
         Caption         =   "Space"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   7080
         TabIndex        =   40
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton Command17 
         Caption         =   "Clear"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   5880
         Style           =   1  'Graphical
         TabIndex        =   39
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton Command16 
         Caption         =   "Dot"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   4680
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   1440
         Width           =   1095
      End
      Begin VB.CommandButton Command15 
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   2400
         TabIndex        =   37
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton Command14 
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   3600
         TabIndex        =   36
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command13 
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   2400
         TabIndex        =   35
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command12 
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   1320
         TabIndex        =   34
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command7 
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command6 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   3600
         TabIndex        =   32
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton Command10 
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   240
         TabIndex        =   31
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton Command9 
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   5880
         TabIndex        =   30
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton Command8 
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   4680
         TabIndex        =   29
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton Command11 
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   1320
         TabIndex        =   28
         Top             =   1440
         Width           =   975
      End
   End
   Begin VB.Frame Frame5 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Sending Message"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2175
      Left            =   8160
      TabIndex        =   24
      Top             =   6600
      Width           =   2535
      Begin VB.CommandButton Command5 
         BackColor       =   &H008080FF&
         Caption         =   "Senddata"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   840
         Width           =   1575
      End
   End
   Begin VB.TextBox Text7 
      Height          =   495
      Left            =   8880
      TabIndex        =   23
      Top             =   5160
      Width           =   1215
   End
   Begin VB.TextBox Text6 
      Height          =   495
      Left            =   8880
      TabIndex        =   22
      Top             =   4560
      Width           =   1215
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   8880
      TabIndex        =   21
      Top             =   3840
      Width           =   1215
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   8880
      TabIndex        =   20
      Top             =   3240
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      Height          =   615
      Left            =   360
      TabIndex        =   19
      Top             =   2280
      Width           =   1455
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   120
      Top             =   4560
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   2655
      Left            =   0
      TabIndex        =   13
      Top             =   720
      Width           =   8295
      Begin VB.CommandButton Command19 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Exit"
         BeginProperty Font 
            Name            =   "Georgia"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   5040
         Style           =   1  'Graphical
         TabIndex        =   45
         Top             =   240
         Width           =   975
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Connect to phone"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2535
         Left            =   6120
         TabIndex        =   41
         Top             =   120
         Width           =   2175
         Begin VB.TextBox Text1 
            Height          =   495
            Left            =   2280
            TabIndex        =   44
            Top             =   360
            Visible         =   0   'False
            Width           =   1215
         End
         Begin VB.ComboBox Combo2 
            Height          =   315
            Left            =   240
            TabIndex        =   43
            Top             =   720
            Width           =   1695
         End
         Begin VB.CommandButton Command4 
            BackColor       =   &H00C0E0FF&
            Caption         =   "Connect"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   480
            Style           =   1  'Graphical
            TabIndex        =   42
            Top             =   1320
            Width           =   1215
         End
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Data"
         BeginProperty Font 
            Name            =   "Georgia"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4440
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   1680
         Width           =   1095
      End
      Begin VB.TextBox Text2 
         Height          =   495
         Left            =   1560
         TabIndex        =   17
         Top             =   240
         Width           =   2175
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Transmit"
         BeginProperty Font 
            Name            =   "Georgia"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3840
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Connected"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2040
         TabIndex        =   15
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Tracking"
         BeginProperty Font 
            Name            =   "Georgia"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   1440
         Width           =   1935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "IP Addresses"
         BeginProperty Font 
            Name            =   "Georgia"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   18
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.TextBox Text17 
      Height          =   615
      Left            =   10440
      TabIndex        =   12
      Top             =   5640
      Width           =   2055
   End
   Begin VB.TextBox Text16 
      Height          =   855
      Left            =   10440
      TabIndex        =   11
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox Text15 
      Height          =   615
      Left            =   8760
      TabIndex        =   10
      Top             =   840
      Width           =   10575
   End
   Begin VB.TextBox Text14 
      Height          =   495
      Left            =   8880
      TabIndex        =   9
      Top             =   5880
      Width           =   1935
   End
   Begin VB.TextBox Text13 
      Height          =   495
      Left            =   10440
      TabIndex        =   8
      Top             =   3120
      Width           =   1215
   End
   Begin VB.TextBox Text12 
      Height          =   495
      Left            =   10440
      TabIndex        =   7
      Top             =   3720
      Width           =   1215
   End
   Begin VB.TextBox Text22 
      Height          =   525
      Left            =   10440
      TabIndex        =   5
      Top             =   4320
      Width           =   1215
   End
   Begin VB.TextBox Text21 
      Height          =   495
      Left            =   10440
      TabIndex        =   4
      Top             =   6480
      Width           =   2055
   End
   Begin VB.TextBox Text20 
      Height          =   495
      Left            =   10440
      TabIndex        =   3
      Top             =   2520
      Width           =   1335
   End
   Begin VB.TextBox Text19 
      Height          =   495
      Left            =   10440
      TabIndex        =   2
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Timer timCap 
      Left            =   240
      Top             =   7560
   End
   Begin VB.TextBox Text18 
      Height          =   495
      Left            =   10440
      TabIndex        =   1
      Top             =   7680
      Visible         =   0   'False
      Width           =   2175
   End
   Begin MSCommLib.MSComm MSComm2 
      Left            =   11760
      Top             =   3480
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.TextBox Text11 
      Height          =   495
      Left            =   10440
      TabIndex        =   0
      Top             =   7080
      Visible         =   0   'False
      Width           =   2175
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   330
      Left            =   960
      Top             =   7680
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=database\railway.mdb;Persist Security Info=False"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=database\railway.mdb;Persist Security Info=False"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Details"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000009&
      BackStyle       =   0  'Transparent
      Caption         =   "Train Tracking"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   1920
      TabIndex        =   6
      Top             =   120
      Width           =   7815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim buf As String
Dim RecArray() As String
Dim Connected As Boolean
Dim NDelay As Integer
Dim msgCount As String

Private Sub Command1_Click()
Form2.Visible = True

End Sub

Private Sub Command10_Click()
Text2.Text = Text2.Text & 7

End Sub

Private Sub Command11_Click()
Text2.Text = Text2.Text & 8

End Sub

Private Sub Command12_Click()
Text2.Text = Text2.Text & 2

End Sub

Private Sub Command13_Click()
Text2.Text = Text2.Text & 3

End Sub

Private Sub Command14_Click()
Text2.Text = Text2.Text & 4

End Sub

Private Sub Command15_Click()
Text2.Text = Text2.Text & 9

End Sub

Private Sub Command16_Click()
Text2.Text = Text2.Text & "."

End Sub

Private Sub Command17_Click()
Text2.Text = ""

End Sub

Private Sub Command18_Click()
Text2.Text = Text2.Text & " "

End Sub

Private Sub Command19_Click()
Unload Me
End Sub

Private Sub Command2_Click()
Winsock1.RemoteHost = Text2.Text
Winsock1.RemotePort = 2050
Winsock1.Connect Text2.Text, 2050

 
End Sub

Private Sub Command3_Click()
If Text3.Text = "" Then
Else
Dim gpsData As String
    Dim gpsdata2 As String
    StrData = Text3.Text
    gpsData = StrData
   'frmBrowser.Shape1.FillStyle = 0
   

   
   
        t = InStr(StrData, ",")
        Lat = Left$(StrData, t - 1)
        Lng = Mid$(StrData, t + 1)
     
     
        t = InStr(Lat, ".")
        T2 = Left$(Lat, t - 3)
   
        T3 = T2 + (Mid$(Lat, t - 2)) / 60
       Lat = Round(T3, 5)
       frmBrowser.Text1.Text = Lat
    
        t = InStr(Lng, ".")
        't = InStr
        T2 = Left$(Lng, t - 3)
        T3 = T2 + (Mid$(Lng, t - 2)) / 60
       Lng = Round(T3, 5)
     frmBrowser.Text2.Text = Lng
     frmBrowser.Show
     End If
End Sub


Private Sub Command4_Click()
If Not MSComm2.PortOpen Then
   With MSComm2
            .CommPort = Combo2.ListIndex + 1
            .Handshaking = comNone
            .RThreshold = 1
            .RTSEnable = True
            .Settings = "9600,n,8,1"
            .SThreshold = 0
            .InputLen = 1
            .PortOpen = True
End With
            Command4.Enabled = False
   
    End If

 Connected = False
    Call Sleep(500)
    Call Sleep(500)
    Call SendComm("AT" & vbCrLf)
    Call Sleep(100)
    Call SendComm("ATE0" & vbCrLf)
    Call Sleep(100)
    Call SendComm("AT+CMGF=1" & vbCrLf)
    Call Sleep(100)
    Call SendComm("AT+CNMI=2,1,0,0,0" & vbCrLf)
    Text15.Text = ""
    'rs.Open "update Details set pa=1 where id=" + Text6.Text + " or id=" + Text7.Text + " or id=" + Text8.Text + " or id=" + Text9.Text + " or id=" + Text10.Text + "", con
End Sub

Private Sub Command5_Click()

SendComm ("AT+CMGS=" & Chr$(34) & Text16.Text & Chr$(34) & vbCrLf)


SendComm ("Test message from Train Tracking System" & Chr$(26))
Call Sleep(1000)



Text1.Text = ""


End Sub

Private Sub Command6_Click()
 Text2.Text = Text2.Text & 0

    
    End Sub

Private Sub Command7_Click()
Text2.Text = Text2.Text & 1

End Sub

Private Sub Command8_Click()
Text2.Text = Text2.Text & 5


End Sub

Private Sub Command9_Click()
Text2.Text = Text2.Text & 6

End Sub

Private Sub connect_Click()
If Not MSComm1.PortOpen Then
   With MSComm1
            .CommPort = Combo1.ListIndex + 1
            .Handshaking = comNone
            .RThreshold = 1
            .RTSEnable = True
            .Settings = "9600,n,8,1"
            .SThreshold = 0
            .InputLen = 1
            .PortOpen = True
    End With
    Connect.Caption = "DisConnect"
Else
Connect.Caption = "Connect"
MSComm1.PortOpen = False
End If
End Sub

Private Sub Form_Load()

  
  Combo2.AddItem "COM1"
  Combo2.AddItem "COM2"
  Combo2.AddItem "COM3"
  Combo2.AddItem "COM4"
  Combo2.AddItem "COM5"
  Combo2.AddItem "COM6"
  Combo2.AddItem "COM7"
  Combo2.ListIndex = 0
  
  
      ReDim RecArray(0) As String
  

End Sub

Private Sub Form_Unload(Cancel As Integer)
Dim a As Variant
a = MsgBox("Are you sure want to quit", vbYesNo, "Close")
If a = vbYes Then
End
Else
Cancel = True
End If
End Sub

Private Sub Frame6_DragDrop(Source As Control, X As Single, Y As Single)

End Sub
Sub SendComm(data As String)

    Dim i As Integer
    For i = 1 To Len(data)
        MSComm2.Output = Mid(data, i, 1)
        Call Sleep(25)
    Next
    
End Sub


Sub HandleInput(InBuff As String)
    If InBuff = "?" Then
        ReDim RecArray(0) As String
        Connected = True
    ElseIf InBuff = "*" And Connected Then
        Connected = False
        'call the function
        Call ProcessInput
     ElseIf Connected = True Then
        RecArray(UBound(RecArray)) = RecArray(UBound(RecArray)) & InBuff
    End If
   
    
    If Not Connected Then
        If InBuff = "+" Then
            RecArray(LBound(RecArray)) = "+"
        Else
            RecArray(LBound(RecArray)) = RecArray(LBound(RecArray)) + InBuff
            If Len(RecArray(LBound(RecArray))) = 11 Then
                If RecArray(LBound(RecArray)) = "+CMTI:""SM""," Then
                    NDelay = 1
                    timCap.Interval = 250
                End If
            End If
        End If
    End If
    
End Sub


Private Sub timCap_Timer()

    If NDelay = 4 Then
        timCap.Interval = 0
        msgCount = Right(RecArray(LBound(RecArray)), Len(RecArray(LBound(RecArray))) - 11)
        SendComm ("AT+CMGR=" & msgCount & vbCrLf)
        Call Sleep(1000)
    End If
    NDelay = NDelay + 1
    
End Sub

Sub ProcessInput()
    
    Text18.Text = RecArray(0)
    
    SendComm ("AT+CMGD=" & msgCount & vbCrLf)
    Call Sleep(1000)
    msgCount = ""
   
Dim a() As String
a = Split(Text15.Text, ",")
Text13.Text = a(1)
Text12.Text = a(2)
Text22.Text = a(3)

 Text19.Text = Right(Text12.Text, 11)
 Text16.Text = Val(Text19.Text)

 Text15.Text = ""
 
  Call connect1
    rs.Open "select * from Details where latlon='" + Text3.Text + "'"
    While rs.EOF = False
    Text4.Text = rs(0)
    Text5.Text = rs(1)
    Text6.Text = rs(2)
    Text7.Text = rs(3)
    rs.MoveNext
    Wend
    
  SendComm ("AT+CMGS=" & Chr$(34) & Text16.Text & Chr$(34) & vbCrLf)
  Call Sleep(1000)
  Call Sleep(1000)
   SendComm ("Current Location:" & Text5.Text)
  Call Sleep(100)
  SendComm ("Next Location:" & Text6.Text)
  Call Sleep(100)
  SendComm (" Distance: " & Text7.Text & "Km")
  Call Sleep(100)
   SendComm (" Thank You" & Chr$(26))

  con.Close
  Text6.Text = ""
  Text7.Text = ""
  Text5.Text = ""
  Text4.Text = ""
  Text15.Text = ""
End Sub

Private Sub MSComm2_OnComm()
 Dim InBuff As String
    Select Case MSComm2.CommEvent
        Case comEvReceive
            InBuff = MSComm2.Input
            Text15.Text = Text15.Text + InBuff
            Call HandleInput(InBuff)
        End Select

      
  
End Sub
Sub AR()
Dim a() As String
'A = Split(InBuff, ",")
Text13.Text = RecArray(0)

End Sub

Private Sub Winsock1_Connect()
Option1.Value = True

End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim buf As String
Dim lft As String
Dim rgt As String
Dim a() As String
Winsock1.GetData buf
        'buf = Text1.Text
  lft = Left(buf, 1)
  rgt = Right(buf, 1)
            If lft = "#" And rgt = "*" Then
                a = Split(buf, "$")
                Text3.Text = a(1)
                Form2.Text1.Text = a(1)
                
             End If

End Sub

