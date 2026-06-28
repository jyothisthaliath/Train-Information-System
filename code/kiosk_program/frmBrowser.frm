VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmBrowser 
   Caption         =   "gps"
   ClientHeight    =   8370
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10845
   LinkTopic       =   "Form3"
   ScaleHeight     =   8370
   ScaleWidth      =   10845
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   20000
      Left            =   240
      Top             =   0
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1440
      TabIndex        =   4
      Text            =   "8.16946"
      Top             =   0
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   3840
      TabIndex        =   3
      Text            =   "77.4228"
      Top             =   0
      Width           =   855
   End
   Begin VB.TextBox Text3 
      Height          =   405
      Left            =   7800
      TabIndex        =   2
      Top             =   0
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   8760
      TabIndex        =   1
      Top             =   0
      Width           =   975
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   4920
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin SHDocVwCtl.WebBrowser brwWebBrowser 
      Height          =   8640
      Left            =   240
      TabIndex        =   5
      Top             =   600
      Width           =   10920
      ExtentX         =   19262
      ExtentY         =   15240
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   0
      Top             =   240
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.Label Label1 
      Caption         =   "Latitude:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   8
      Top             =   0
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "Longitude:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      TabIndex        =   7
      Top             =   0
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Refresh Rate"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6240
      TabIndex        =   6
      Top             =   0
      Width           =   1455
   End
End
Attribute VB_Name = "frmBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

On Error Resume Next

Timer1.Enabled = True
       
    Text1.Text = 9.885088 '9.983088
    Text2.Text = 78.282092 '76.284092
    Text3.Text = 10

End Sub
Private Sub brwWebBrowser_NavigateComplete2 _
    (ByVal pDisp As Object, URL As Variant)
    
    Dim i As Integer
    Dim bFound As Boolean
    
    On Error Resume Next
    
    mbDontNavigateNow = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
Timer1.Enabled = False
End Sub

Private Sub Timer1_Timer()

        'Mainfrm.Winsock1.SendData ("abcd")
        StartingAddress = "http://www.8051projects.info/maps.asp?lat=" & Text1.Text & "&lon=" & Text2.Text
      'Try to navigate to the starting address
        'StartingAddress = "http://www.google.co.in/"
        brwWebBrowser.Navigate StartingAddress
End Sub





