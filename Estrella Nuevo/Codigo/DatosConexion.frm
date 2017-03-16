VERSION 5.00
Begin VB.Form DatosConexion 
   Caption         =   "Datos de Conexion"
   ClientHeight    =   3780
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9645
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   18
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   3780
   ScaleWidth      =   9645
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Desconectar"
      Height          =   495
      Left            =   6960
      TabIndex        =   11
      Top             =   3120
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Guardar"
      Height          =   495
      Left            =   2400
      TabIndex        =   10
      Top             =   3120
      Width           =   2055
   End
   Begin VB.TextBox TxtContra 
      Height          =   555
      Left            =   4320
      TabIndex        =   8
      Top             =   2280
      Width           =   3735
   End
   Begin VB.TextBox TxtUsuario 
      Height          =   555
      Left            =   4320
      TabIndex        =   6
      Top             =   1560
      Width           =   3735
   End
   Begin VB.TextBox TxtPuerto 
      Height          =   555
      Left            =   4320
      TabIndex        =   4
      Top             =   840
      Width           =   3735
   End
   Begin VB.TextBox TxtIP 
      Height          =   555
      Left            =   4320
      TabIndex        =   2
      Top             =   160
      Width           =   3735
   End
   Begin VB.CommandButton Command32 
      Caption         =   "Conectar"
      Height          =   495
      Left            =   4680
      TabIndex        =   1
      Top             =   3120
      Width           =   2055
   End
   Begin VB.CommandButton Command33 
      Caption         =   "Cancelar"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   3120
      Width           =   1935
   End
   Begin VB.Label lblInformacion 
      Alignment       =   2  'Center
      Caption         =   "Contraseña"
      Height          =   375
      Index           =   2
      Left            =   240
      TabIndex        =   9
      Top             =   2355
      Width           =   3735
   End
   Begin VB.Label lblInformacion 
      Alignment       =   2  'Center
      Caption         =   "Usuario"
      Height          =   375
      Index           =   1
      Left            =   240
      TabIndex        =   7
      Top             =   1635
      Width           =   3735
   End
   Begin VB.Label lblInformacion 
      Alignment       =   2  'Center
      Caption         =   "Puerto"
      Height          =   375
      Index           =   0
      Left            =   240
      TabIndex        =   5
      Top             =   915
      Width           =   3735
   End
   Begin VB.Label lblInformacion 
      Alignment       =   2  'Center
      Caption         =   "Dirección IP"
      Height          =   375
      Index           =   6
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "DatosConexion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Dim rutaArchivo As String
rutaArchivo = App.Path & "\DatosConexion.txt"
Call GrabarDato(rutaArchivo, "informacion", "ip", TxtIP.Text)
Call GrabarDato(rutaArchivo, "informacion", "puerto", TxtPuerto.Text)
Call GrabarDato(rutaArchivo, "informacion", "usuario", TxtUsuario.Text)
Call GrabarDato(rutaArchivo, "informacion", "password", TxtContra.Text)
MsgBox "Datos guardados correctamente."
End Sub

Private Sub Command2_Click()
If Not Conectado Then MsgBox "No hay ninguna conexion establecida.":   Exit Sub
Call desconectarBaseDatos
Conectado = False
End Sub

Private Sub Command32_Click()
If Conectado Then MsgBox "La conexion ya esta establecida.": Exit Sub
Dim rutaArchivo As String
rutaArchivo = App.Path & "\DatosConexion.txt"
Call GrabarDato(rutaArchivo, "informacion", "ip", TxtIP.Text)
Call GrabarDato(rutaArchivo, "informacion", "puerto", TxtPuerto.Text)
Call GrabarDato(rutaArchivo, "informacion", "usuario", TxtUsuario.Text)
Call GrabarDato(rutaArchivo, "informacion", "password", TxtContra.Text)
Call conectarBaseDatos
If Conectado Then MsgBox "Conexion establecida correctamente."
End Sub

Private Sub Command33_Click()
Me.Hide
End Sub
