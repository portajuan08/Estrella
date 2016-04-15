VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Inicio 
   Caption         =   "Inicio"
   ClientHeight    =   10740
   ClientLeft      =   60
   ClientTop       =   1785
   ClientWidth     =   15240
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   18
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   10740
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   7320
      Top             =   0
   End
   Begin VB.Frame IMPRIMIR_VIAJE 
      Caption         =   "Imprimir Viaje"
      Height          =   4335
      Left            =   5513
      TabIndex        =   266
      Top             =   2948
      Visible         =   0   'False
      Width           =   4215
      Begin VB.CommandButton Command33 
         Caption         =   "Cancelar"
         Height          =   495
         Left            =   240
         TabIndex        =   272
         Top             =   3360
         Width           =   1695
      End
      Begin VB.CommandButton Command32 
         Caption         =   "Imprimir"
         Height          =   495
         Left            =   2280
         TabIndex        =   271
         Top             =   3360
         Width           =   1695
      End
      Begin VB.TextBox Text26 
         Height          =   555
         Left            =   240
         TabIndex        =   270
         Top             =   2400
         Width           =   3735
      End
      Begin VB.ComboBox Combo9 
         Height          =   555
         Left            =   240
         TabIndex        =   268
         Top             =   1080
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Interno"
         Height          =   375
         Index           =   6
         Left            =   240
         TabIndex        =   269
         Top             =   1800
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Chofer"
         Height          =   375
         Index           =   5
         Left            =   240
         TabIndex        =   267
         Top             =   480
         Width           =   3735
      End
   End
   Begin VB.Frame AG_USUARIO 
      Caption         =   "Agregar Usuario"
      Height          =   3135
      Left            =   4680
      TabIndex        =   313
      Top             =   4080
      Visible         =   0   'False
      Width           =   5655
      Begin VB.TextBox Text34 
         Height          =   555
         Left            =   2400
         TabIndex        =   316
         Top             =   720
         Width           =   3015
      End
      Begin VB.CommandButton Command37 
         Caption         =   "Aceptar"
         Height          =   615
         Left            =   2040
         TabIndex        =   315
         Top             =   2400
         Width           =   2055
      End
      Begin VB.TextBox Text33 
         Height          =   555
         IMEMode         =   3  'DISABLE
         Left            =   2400
         PasswordChar    =   "*"
         TabIndex        =   314
         Top             =   1560
         Width           =   3015
      End
      Begin VB.Label Label3 
         Caption         =   "X"
         Height          =   375
         Left            =   5280
         TabIndex        =   319
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Usuario:"
         Height          =   495
         Index           =   71
         Left            =   240
         TabIndex        =   318
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Contraseña:"
         Height          =   495
         Index           =   70
         Left            =   240
         TabIndex        =   317
         Top             =   1560
         Width           =   2175
      End
   End
   Begin VB.Frame LOGUEO 
      Caption         =   "Iniciar"
      Height          =   3255
      Left            =   4680
      TabIndex        =   298
      Top             =   3960
      Width           =   5655
      Begin VB.TextBox Text30 
         Height          =   555
         IMEMode         =   3  'DISABLE
         Left            =   2280
         PasswordChar    =   "*"
         TabIndex        =   302
         Top             =   1560
         Width           =   3015
      End
      Begin VB.CommandButton Command35 
         Caption         =   "Aceptar"
         Height          =   615
         Left            =   1920
         TabIndex        =   304
         Top             =   2400
         Width           =   2055
      End
      Begin VB.TextBox Text28 
         Height          =   555
         Left            =   2280
         TabIndex        =   300
         Top             =   720
         Width           =   3015
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Contraseña:"
         Height          =   495
         Index           =   67
         Left            =   120
         TabIndex        =   301
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Usuario:"
         Height          =   495
         Index           =   66
         Left            =   120
         TabIndex        =   299
         Top             =   720
         Width           =   1575
      End
   End
   Begin VB.Frame CA_COMBI 
      Caption         =   "Cambiar Combi"
      Height          =   1935
      Left            =   5280
      TabIndex        =   195
      Top             =   4200
      Visible         =   0   'False
      Width           =   4575
      Begin VB.CommandButton Command26 
         Caption         =   "Aceptar"
         Height          =   435
         Left            =   2640
         TabIndex        =   199
         Top             =   1320
         Width           =   1695
      End
      Begin VB.CommandButton Command25 
         Caption         =   "Cancelar"
         Height          =   435
         Left            =   240
         TabIndex        =   198
         Top             =   1320
         Width           =   1695
      End
      Begin VB.ComboBox Combo7 
         Height          =   555
         Left            =   1920
         TabIndex        =   197
         Top             =   600
         Width           =   2415
      End
      Begin VB.Label lblIdCambiarCombi 
         Height          =   375
         Left            =   3120
         TabIndex        =   200
         Top             =   360
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Combi:"
         Height          =   375
         Index           =   40
         Left            =   240
         TabIndex        =   196
         Top             =   600
         Width           =   1455
      End
   End
   Begin VB.Frame VIAJES_FIJOS_BSAS 
      Caption         =   "Viajes FIJOS REGRESO"
      ForeColor       =   &H00008000&
      Height          =   10095
      Left            =   2753
      TabIndex        =   71
      Top             =   75
      Visible         =   0   'False
      Width           =   9735
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Feriados"
         Height          =   495
         Index           =   8
         Left            =   240
         TabIndex        =   236
         Top             =   4560
         Width           =   2055
      End
      Begin VB.Frame Frame8 
         Caption         =   "Datos del Viaje a Agregar"
         Height          =   1335
         Left            =   240
         TabIndex        =   80
         Top             =   8640
         Visible         =   0   'False
         Width           =   9255
         Begin VB.CommandButton Command14 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   7200
            TabIndex        =   82
            Top             =   480
            Width           =   1815
         End
         Begin MSComCtl2.DTPicker DTPicker2 
            Height          =   495
            Left            =   1320
            TabIndex        =   81
            Top             =   480
            Width           =   1575
            _ExtentX        =   2778
            _ExtentY        =   873
            _Version        =   393216
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            CustomFormat    =   "HH:mm"
            Format          =   81199107
            UpDown          =   -1  'True
            CurrentDate     =   42273
         End
         Begin MSMask.MaskEdBox MaskEdBox3 
            Height          =   495
            Left            =   4920
            TabIndex        =   83
            Top             =   480
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   873
            _Version        =   393216
            MaxLength       =   6
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PromptChar      =   "_"
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Hora"
            Height          =   375
            Index           =   41
            Left            =   240
            TabIndex        =   86
            Top             =   480
            Width           =   1095
         End
         Begin VB.Label Label21 
            Caption         =   "Hora"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            TabIndex        =   85
            Top             =   480
            Width           =   1575
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Patente Combi"
            Height          =   375
            Index           =   42
            Left            =   3120
            TabIndex        =   84
            Top             =   480
            Width           =   2055
         End
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Todos"
         Height          =   495
         Index           =   0
         Left            =   240
         TabIndex        =   79
         Top             =   720
         Width           =   1575
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Domingo"
         Height          =   495
         Index           =   1
         Left            =   240
         TabIndex        =   78
         Top             =   1200
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Lunes"
         Height          =   495
         Index           =   2
         Left            =   240
         TabIndex        =   77
         Top             =   1680
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Martes"
         Height          =   495
         Index           =   3
         Left            =   240
         TabIndex        =   76
         Top             =   2160
         Width           =   1695
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Miercoles"
         Height          =   495
         Index           =   4
         Left            =   240
         TabIndex        =   75
         Top             =   2640
         Width           =   2175
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Jueves"
         Height          =   495
         Index           =   5
         Left            =   240
         TabIndex        =   74
         Top             =   3120
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Viernes"
         Height          =   495
         Index           =   6
         Left            =   240
         TabIndex        =   73
         Top             =   3600
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemanaBsAs 
         Caption         =   "Sabado"
         Height          =   495
         Index           =   7
         Left            =   240
         TabIndex        =   72
         Top             =   4080
         Width           =   1815
      End
      Begin MSComctlLib.ListView ListView9 
         Height          =   7815
         Left            =   2400
         TabIndex        =   87
         Top             =   720
         Width           =   7095
         _ExtentX        =   12515
         _ExtentY        =   13785
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Hora"
            Object.Width           =   2028
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Dia"
            Object.Width           =   3881
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Patente"
            Object.Width           =   3263
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Asientos"
            Object.Width           =   3175
         EndProperty
      End
      Begin VB.Label Label23 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   495
         Left            =   9240
         TabIndex        =   88
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame VIAJES_FIJOS_MERCEDES 
      Caption         =   "Viajes FIJOS SALIDA"
      ForeColor       =   &H00C00000&
      Height          =   10095
      Left            =   2753
      TabIndex        =   45
      Top             =   75
      Visible         =   0   'False
      Width           =   9735
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Feriados"
         Height          =   495
         Index           =   8
         Left            =   240
         TabIndex        =   237
         Top             =   4560
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Sabado"
         Height          =   495
         Index           =   7
         Left            =   240
         TabIndex        =   58
         Top             =   4080
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Viernes"
         Height          =   495
         Index           =   6
         Left            =   240
         TabIndex        =   57
         Top             =   3600
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Jueves"
         Height          =   495
         Index           =   5
         Left            =   240
         TabIndex        =   56
         Top             =   3120
         Width           =   1695
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Miercoles"
         Height          =   495
         Index           =   4
         Left            =   240
         TabIndex        =   55
         Top             =   2640
         Width           =   2175
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Martes"
         Height          =   495
         Index           =   3
         Left            =   240
         TabIndex        =   54
         Top             =   2160
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Lunes"
         Height          =   495
         Index           =   2
         Left            =   240
         TabIndex        =   53
         Top             =   1680
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Domingo"
         Height          =   495
         Index           =   1
         Left            =   240
         TabIndex        =   52
         Top             =   1200
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemanaMercedes 
         Caption         =   "Todos"
         Height          =   495
         Index           =   0
         Left            =   240
         TabIndex        =   51
         Top             =   720
         Width           =   1575
      End
      Begin VB.Frame Frame7 
         Caption         =   "Datos del Viaje a Agregar"
         Height          =   1335
         Left            =   240
         TabIndex        =   46
         Top             =   8640
         Visible         =   0   'False
         Width           =   9255
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   495
            Left            =   1320
            TabIndex        =   59
            Top             =   480
            Width           =   1575
            _ExtentX        =   2778
            _ExtentY        =   873
            _Version        =   393216
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            CustomFormat    =   "HH:mm"
            Format          =   81199107
            UpDown          =   -1  'True
            CurrentDate     =   42273
         End
         Begin VB.CommandButton Command10 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   7200
            TabIndex        =   47
            Top             =   480
            Width           =   1815
         End
         Begin MSMask.MaskEdBox MaskEdBox2 
            Height          =   495
            Left            =   4920
            TabIndex        =   61
            Top             =   480
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   873
            _Version        =   393216
            MaxLength       =   6
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PromptChar      =   "_"
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Patente"
            Height          =   375
            Index           =   44
            Left            =   3120
            TabIndex        =   60
            Top             =   480
            Width           =   2415
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Hora"
            Height          =   375
            Index           =   43
            Left            =   240
            TabIndex        =   48
            Top             =   480
            Width           =   1575
         End
      End
      Begin MSComctlLib.ListView ListView6 
         Height          =   7815
         Left            =   2400
         TabIndex        =   49
         Top             =   720
         Width           =   7095
         _ExtentX        =   12515
         _ExtentY        =   13785
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Hora"
            Object.Width           =   2028
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Dia"
            Object.Width           =   3881
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Patente"
            Object.Width           =   3263
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Asientos"
            Object.Width           =   3175
         EndProperty
      End
      Begin VB.Label Label17 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   9240
         TabIndex        =   50
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame PASAR_OCUPADO 
      Caption         =   "Indique la Parada"
      Height          =   2175
      Left            =   5573
      TabIndex        =   254
      Top             =   4028
      Visible         =   0   'False
      Width           =   4095
      Begin VB.CommandButton Command30 
         Caption         =   "Cancelar"
         Height          =   435
         Left            =   120
         TabIndex        =   257
         Top             =   1560
         Width           =   1815
      End
      Begin VB.CommandButton Command31 
         Caption         =   "Aceptar"
         Height          =   435
         Left            =   2160
         TabIndex        =   256
         Top             =   1560
         Width           =   1815
      End
      Begin VB.ComboBox Combo8 
         Height          =   555
         Left            =   120
         TabIndex        =   255
         Top             =   720
         Width           =   3855
      End
   End
   Begin VB.Frame COMBI 
      Caption         =   "Combis"
      Height          =   9975
      Left            =   2213
      TabIndex        =   7
      Top             =   75
      Visible         =   0   'False
      Width           =   10815
      Begin VB.Frame Frame3 
         Caption         =   "Datos de la Combi"
         Height          =   1935
         Left            =   120
         TabIndex        =   8
         Top             =   7920
         Width           =   10575
         Begin MSMask.MaskEdBox MaskEdBox1 
            Height          =   495
            Left            =   1800
            TabIndex        =   11
            Top             =   480
            Width           =   2895
            _ExtentX        =   5106
            _ExtentY        =   873
            _Version        =   393216
            MaxLength       =   6
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PromptChar      =   "_"
         End
         Begin VB.TextBox Text4 
            Height          =   555
            Left            =   7080
            TabIndex        =   12
            Top             =   480
            Width           =   3255
         End
         Begin VB.TextBox Text3 
            Height          =   555
            Left            =   1800
            TabIndex        =   13
            Top             =   1200
            Width           =   2895
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   8400
            TabIndex        =   15
            Top             =   1320
            Width           =   1935
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Descripcion"
            Height          =   375
            Index           =   46
            Left            =   4920
            TabIndex        =   17
            Top             =   480
            Width           =   2175
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Asientos Disponibles"
            Height          =   495
            Index           =   47
            Left            =   240
            TabIndex        =   16
            Top             =   1200
            Width           =   2775
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Patente"
            Height          =   375
            Index           =   45
            Left            =   240
            TabIndex        =   9
            Top             =   480
            Width           =   1455
         End
      End
      Begin MSComctlLib.ListView ListView2 
         Height          =   7215
         Left            =   120
         TabIndex        =   10
         Top             =   720
         Width           =   10575
         _ExtentX        =   18653
         _ExtentY        =   12726
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Patente"
            Object.Width           =   6174
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Descripcion"
            Object.Width           =   6174
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Asientos"
            Object.Width           =   6174
         EndProperty
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   10320
         TabIndex        =   14
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame PARADA_BSAS 
      Caption         =   "Paradas BS AS"
      Height          =   9975
      Left            =   4133
      TabIndex        =   28
      Top             =   195
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Frame Frame5 
         Caption         =   "Parada"
         Height          =   1335
         Left            =   240
         TabIndex        =   31
         Top             =   8400
         Width           =   6495
         Begin VB.TextBox Text5 
            Height          =   555
            Left            =   1560
            TabIndex        =   33
            Top             =   480
            Width           =   2775
         End
         Begin VB.CommandButton Command8 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   4560
            TabIndex        =   32
            Top             =   480
            Width           =   1815
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Parada"
            Height          =   375
            Index           =   48
            Left            =   240
            TabIndex        =   35
            Top             =   480
            Width           =   1575
         End
         Begin VB.Label Label8 
            Caption         =   "Parada"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            TabIndex        =   34
            Top             =   480
            Width           =   1575
         End
      End
      Begin VB.CommandButton Command7 
         Caption         =   "S"
         Height          =   375
         Left            =   6480
         TabIndex        =   30
         Top             =   4320
         Width           =   375
      End
      Begin VB.CommandButton Command6 
         Caption         =   "B"
         Height          =   375
         Left            =   6480
         TabIndex        =   29
         Top             =   4920
         Width           =   375
      End
      Begin MSComctlLib.ListView ListView4 
         Height          =   7935
         Left            =   240
         TabIndex        =   36
         Top             =   480
         Width           =   6135
         _ExtentX        =   10821
         _ExtentY        =   13996
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Parada"
            Object.Width           =   10672
         EndProperty
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   495
         Left            =   6480
         TabIndex        =   37
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame CHOFER 
      Caption         =   "Choferes"
      Height          =   9855
      Left            =   4133
      TabIndex        =   0
      Top             =   195
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Frame Frame1 
         Caption         =   "Datos Chofer"
         Height          =   1215
         Left            =   120
         TabIndex        =   3
         Top             =   8400
         Width           =   6735
         Begin VB.CommandButton Command4 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   4800
            TabIndex        =   6
            Top             =   480
            Width           =   1815
         End
         Begin VB.TextBox Text1 
            Height          =   555
            Left            =   1920
            TabIndex        =   5
            Top             =   480
            Width           =   2655
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Nombre"
            Height          =   375
            Index           =   49
            Left            =   240
            TabIndex        =   4
            Top             =   480
            Width           =   1455
         End
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   7695
         Left            =   120
         TabIndex        =   2
         Top             =   720
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   13573
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Nombre"
            Object.Width           =   11730
         EndProperty
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   6480
         TabIndex        =   1
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame GRUPO 
      Caption         =   "Grupos"
      Height          =   9855
      Left            =   4133
      TabIndex        =   38
      Top             =   195
      Visible         =   0   'False
      Width           =   6975
      Begin VB.Frame Frame6 
         Caption         =   "Datos Grupo"
         Height          =   1215
         Left            =   120
         TabIndex        =   39
         Top             =   8520
         Width           =   6735
         Begin VB.TextBox Text6 
            Height          =   555
            Left            =   1920
            TabIndex        =   41
            Top             =   480
            Width           =   2535
         End
         Begin VB.CommandButton Command9 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   4680
            TabIndex        =   40
            Top             =   480
            Width           =   1815
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Nombre"
            Height          =   375
            Index           =   50
            Left            =   240
            TabIndex        =   42
            Top             =   480
            Width           =   1455
         End
      End
      Begin MSComctlLib.ListView ListView5 
         Height          =   7815
         Left            =   120
         TabIndex        =   43
         Top             =   720
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   13785
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Grupo"
            Object.Width           =   11730
         EndProperty
      End
      Begin VB.Label Label14 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   6480
         TabIndex        =   44
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame CAMBIOS_VIAJE 
      Caption         =   "Cambios del Viaje"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   9975
      Left            =   0
      TabIndex        =   283
      Top             =   120
      Visible         =   0   'False
      Width           =   15255
      Begin MSComctlLib.ListView ListView8 
         Height          =   7815
         Left            =   240
         TabIndex        =   285
         Top             =   2040
         Width           =   7380
         _ExtentX        =   13018
         _ExtentY        =   13785
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   192
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Nombre"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "DNI"
            Object.Width           =   4322
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Precio"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Parada"
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComctlLib.ListView ListView10 
         Height          =   7815
         Left            =   7680
         TabIndex        =   286
         Top             =   2040
         Width           =   7380
         _ExtentX        =   13018
         _ExtentY        =   13785
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   16384
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Nombre"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "DNI"
            Object.Width           =   4322
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Precio"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Parada"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.Label Label24 
         Caption         =   "X"
         Height          =   375
         Left            =   14760
         TabIndex        =   289
         Top             =   360
         Width           =   255
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Altas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00004000&
         Height          =   495
         Index           =   22
         Left            =   7800
         TabIndex        =   288
         Top             =   1440
         Width           =   7095
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Bajas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   495
         Index           =   21
         Left            =   240
         TabIndex        =   287
         Top             =   1440
         Width           =   7215
      End
      Begin VB.Label lblInfoCambio 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   600
         TabIndex        =   284
         Top             =   600
         Width           =   14175
      End
   End
   Begin VB.Frame AG_FERIADO 
      Caption         =   "Feriados"
      Height          =   9735
      Left            =   533
      TabIndex        =   238
      Top             =   240
      Visible         =   0   'False
      Width           =   14175
      Begin VB.Frame Frame13 
         Caption         =   "Datos Feriado Nuevo"
         Height          =   9015
         Left            =   120
         TabIndex        =   239
         Top             =   600
         Width           =   6015
         Begin VB.TextBox Text25 
            Height          =   555
            Left            =   120
            TabIndex        =   241
            Top             =   6480
            Width           =   5775
         End
         Begin VB.CommandButton Command29 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   120
            TabIndex        =   240
            Top             =   7800
            Width           =   1815
         End
         Begin MSComCtl2.MonthView MonthView2 
            Height          =   4770
            Left            =   120
            TabIndex        =   245
            Top             =   600
            Width           =   5745
            _ExtentX        =   10134
            _ExtentY        =   8414
            _Version        =   393216
            ForeColor       =   192
            BackColor       =   -2147483633
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ShowToday       =   0   'False
            StartOfWeek     =   81199106
            TitleBackColor  =   -2147483646
            TitleForeColor  =   -2147483639
            TrailingForeColor=   -2147483632
            CurrentDate     =   42280
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Descripcion"
            Height          =   375
            Index           =   23
            Left            =   120
            TabIndex        =   242
            Top             =   5760
            Width           =   2415
         End
      End
      Begin MSComctlLib.ListView ListView17 
         Height          =   8895
         Left            =   6240
         TabIndex        =   243
         Top             =   720
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   15690
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Dia"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Feriado"
            Object.Width           =   9031
         EndProperty
      End
      Begin VB.Label Label70 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   13680
         TabIndex        =   244
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame MO_CLIENTE 
      Caption         =   "Modificar Cliente"
      Height          =   9855
      Left            =   113
      TabIndex        =   164
      Top             =   188
      Visible         =   0   'False
      Width           =   15015
      Begin VB.CheckBox MensualM 
         Caption         =   "Abona Mensual"
         Height          =   435
         Left            =   4800
         TabIndex        =   320
         Top             =   5520
         Width           =   3735
      End
      Begin VB.TextBox Text21 
         Height          =   555
         Left            =   360
         TabIndex        =   174
         Top             =   7800
         Width           =   3735
      End
      Begin VB.OptionButton SexoM 
         Caption         =   "Femenino"
         Height          =   435
         Index           =   1
         Left            =   6000
         TabIndex        =   173
         Top             =   4680
         Width           =   2295
      End
      Begin VB.OptionButton SexoM 
         Caption         =   "Masculino"
         Height          =   435
         Index           =   0
         Left            =   6000
         TabIndex        =   172
         Top             =   4080
         Value           =   -1  'True
         Width           =   2295
      End
      Begin VB.TextBox Text20 
         Height          =   555
         Left            =   360
         TabIndex        =   171
         Top             =   6600
         Width           =   3735
      End
      Begin VB.ComboBox Combo6 
         Height          =   555
         ItemData        =   "Inicio.frx":0000
         Left            =   360
         List            =   "Inicio.frx":0002
         TabIndex        =   170
         Top             =   5400
         Width           =   3735
      End
      Begin VB.ComboBox Combo5 
         Height          =   555
         ItemData        =   "Inicio.frx":0004
         Left            =   360
         List            =   "Inicio.frx":0006
         TabIndex        =   169
         Top             =   4200
         Width           =   3735
      End
      Begin VB.CommandButton Command19 
         Caption         =   "ATRAS"
         Height          =   435
         Left            =   600
         TabIndex        =   168
         Top             =   9000
         Width           =   2055
      End
      Begin VB.CommandButton Command12 
         Caption         =   "Modificar"
         Height          =   435
         Left            =   11640
         TabIndex        =   167
         Top             =   9000
         Width           =   2055
      End
      Begin VB.TextBox Text19 
         Height          =   4095
         Left            =   9000
         TabIndex        =   166
         Top             =   960
         Width           =   5775
      End
      Begin MSMask.MaskEdBox MaskEdBox5 
         Height          =   495
         Left            =   360
         TabIndex        =   165
         Top             =   960
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox6 
         Height          =   495
         Left            =   360
         TabIndex        =   175
         Top             =   2040
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox7 
         Height          =   495
         Left            =   360
         TabIndex        =   176
         Top             =   3120
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox8 
         Height          =   495
         Left            =   4800
         TabIndex        =   177
         Top             =   960
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox9 
         Height          =   495
         Left            =   4800
         TabIndex        =   178
         Top             =   2040
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox10 
         Height          =   495
         Left            =   4800
         TabIndex        =   179
         Top             =   3120
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         PromptChar      =   "_"
      End
      Begin VB.Label lblIdModificar 
         Height          =   375
         Left            =   120
         TabIndex        =   192
         Top             =   480
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Nombre"
         Height          =   375
         Index           =   24
         Left            =   360
         TabIndex        =   191
         Top             =   480
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Mail"
         Height          =   375
         Index           =   25
         Left            =   360
         TabIndex        =   190
         Top             =   1560
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Direccion"
         Height          =   375
         Index           =   26
         Left            =   360
         TabIndex        =   189
         Top             =   2640
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio de Bs As"
         Height          =   375
         Index           =   30
         Left            =   360
         TabIndex        =   188
         Top             =   7320
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Sexo"
         Height          =   375
         Index           =   51
         Left            =   4800
         TabIndex        =   187
         Top             =   4080
         Width           =   1455
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "DNI"
         Height          =   375
         Index           =   33
         Left            =   4800
         TabIndex        =   186
         Top             =   2640
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Casa"
         Height          =   375
         Index           =   32
         Left            =   4800
         TabIndex        =   185
         Top             =   1560
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Celular"
         Height          =   375
         Index           =   31
         Left            =   4800
         TabIndex        =   184
         Top             =   480
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio de Mercedes"
         Height          =   375
         Index           =   29
         Left            =   360
         TabIndex        =   183
         Top             =   6120
         Width           =   3615
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada Bs As"
         Height          =   375
         Index           =   28
         Left            =   360
         TabIndex        =   182
         Top             =   4920
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada Mercedes"
         Height          =   375
         Index           =   27
         Left            =   360
         TabIndex        =   181
         Top             =   3720
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Observaciones"
         Height          =   375
         Index           =   52
         Left            =   9000
         TabIndex        =   180
         Top             =   480
         Width           =   5775
      End
   End
   Begin VB.Frame AGENDA 
      Caption         =   "Agenda"
      Height          =   10095
      Left            =   0
      TabIndex        =   62
      Top             =   120
      Visible         =   0   'False
      Width           =   15255
      Begin VB.CommandButton ultimaPagina 
         Caption         =   ">>"
         Height          =   435
         Left            =   14160
         TabIndex        =   253
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton siguientePagina 
         Caption         =   ">"
         Height          =   435
         Left            =   12960
         TabIndex        =   252
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton AnteriorPagina 
         Caption         =   "<"
         Height          =   435
         Left            =   11760
         TabIndex        =   251
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton primerPagina 
         Caption         =   "<<"
         Height          =   435
         Left            =   10560
         TabIndex        =   250
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton Command18 
         Caption         =   "Imprimir Listado"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   4560
         TabIndex        =   163
         Top             =   720
         Visible         =   0   'False
         Width           =   3135
      End
      Begin VB.TextBox Text7 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   10320
         TabIndex        =   66
         Top             =   720
         Width           =   4815
      End
      Begin VB.CommandButton Command13 
         Caption         =   "Buscar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   8520
         TabIndex        =   65
         Top             =   720
         Width           =   1695
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Agregar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   64
         Top             =   720
         Width           =   2055
      End
      Begin MSComctlLib.ListView ListView7 
         Height          =   7935
         Left            =   120
         TabIndex        =   63
         Top             =   1440
         Width           =   15015
         _ExtentX        =   26485
         _ExtentY        =   13996
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Nombre"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "DNI"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Parada Mercedes"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   4
            Text            =   "Parada BsAs"
            Object.Width           =   8819
         EndProperty
      End
      Begin VB.Label cantidadPaginas 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "100"
         Height          =   375
         Left            =   3240
         TabIndex        =   249
         Top             =   9480
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "de"
         Height          =   375
         Index           =   54
         Left            =   2640
         TabIndex        =   248
         Top             =   9480
         Width           =   615
      End
      Begin VB.Label numeroPagina 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "1"
         Height          =   375
         Left            =   1680
         TabIndex        =   247
         Top             =   9480
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Pagina:"
         Height          =   495
         Index           =   53
         Left            =   240
         TabIndex        =   246
         Top             =   9480
         Width           =   1335
      End
      Begin VB.Label Label19 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   14760
         TabIndex        =   67
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame HISTORIAL 
      Caption         =   "Ver Historial"
      Height          =   10095
      Left            =   0
      TabIndex        =   222
      Top             =   120
      Visible         =   0   'False
      Width           =   15255
      Begin VB.CommandButton botonPaginar 
         Caption         =   ">>"
         Height          =   435
         Index           =   7
         Left            =   14160
         TabIndex        =   276
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   ">"
         Height          =   435
         Index           =   6
         Left            =   12960
         TabIndex        =   275
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   "<"
         Height          =   435
         Index           =   5
         Left            =   11760
         TabIndex        =   274
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   "<<"
         Height          =   435
         Index           =   4
         Left            =   10560
         TabIndex        =   273
         Top             =   9480
         Width           =   975
      End
      Begin MSComctlLib.ListView ListView16 
         Height          =   7335
         Left            =   4800
         TabIndex        =   233
         Top             =   2100
         Width           =   10335
         _ExtentX        =   18230
         _ExtentY        =   12938
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Dia Viaje"
            Object.Width           =   4498
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Hora Viaje"
            Object.Width           =   4498
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Tipo Viaje"
            Object.Width           =   4498
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Empleado"
            Object.Width           =   4498
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   4
            Text            =   "Razon"
            Object.Width           =   4498
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   5
            Text            =   "Observación"
            Object.Width           =   4498
         EndProperty
      End
      Begin VB.Frame Frame11 
         Caption         =   "Razones"
         Height          =   6135
         Left            =   120
         TabIndex        =   226
         Top             =   1920
         Width           =   4575
         Begin VB.OptionButton Razones 
            Caption         =   "Venta Pasaje Manual"
            Height          =   495
            Index           =   5
            Left            =   240
            TabIndex        =   232
            Top             =   5160
            Width           =   4095
         End
         Begin VB.OptionButton Razones 
            Caption         =   "Venta Pasaje Fijo"
            Height          =   495
            Index           =   4
            Left            =   240
            TabIndex        =   231
            Top             =   4200
            Width           =   3615
         End
         Begin VB.OptionButton Razones 
            Caption         =   "Aviso con Tiempo"
            Height          =   495
            Index           =   3
            Left            =   240
            TabIndex        =   230
            Top             =   3360
            Width           =   3735
         End
         Begin VB.OptionButton Razones 
            Caption         =   "Cambio de Horario"
            Height          =   495
            Index           =   2
            Left            =   240
            TabIndex        =   229
            Top             =   2520
            Width           =   3735
         End
         Begin VB.OptionButton Razones 
            Caption         =   "No Aviso"
            Height          =   495
            Index           =   1
            Left            =   240
            TabIndex        =   228
            Top             =   1680
            Width           =   2295
         End
         Begin VB.OptionButton Razones 
            Caption         =   "Todos"
            Height          =   495
            Index           =   0
            Left            =   240
            TabIndex        =   227
            Top             =   840
            Width           =   2295
         End
      End
      Begin VB.Frame Frame10 
         Caption         =   "Datos del Cliente"
         Height          =   1215
         Left            =   120
         TabIndex        =   223
         Top             =   600
         Width           =   15015
         Begin VB.Label DNI_HISTORIAL 
            Caption         =   "DNI: 37030422"
            Height          =   495
            Left            =   11760
            TabIndex        =   225
            Top             =   480
            Width           =   3015
         End
         Begin VB.Label NOMBRE_HISTORIAL 
            Caption         =   "Nombre del Cliente: JUAN ROBERTO PORTA"
            Height          =   615
            Left            =   120
            TabIndex        =   224
            Top             =   480
            Width           =   10455
         End
      End
      Begin VB.Label lblCantidadPaginaHistorial 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "100"
         Height          =   375
         Left            =   3240
         TabIndex        =   280
         Top             =   9480
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "de"
         Height          =   375
         Index           =   20
         Left            =   2640
         TabIndex        =   279
         Top             =   9480
         Width           =   615
      End
      Begin VB.Label lblPaginaHistorial 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "1"
         Height          =   375
         Left            =   1680
         TabIndex        =   278
         Top             =   9480
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Pagina"
         Height          =   495
         Index           =   7
         Left            =   240
         TabIndex        =   277
         Top             =   9480
         Width           =   1335
      End
      Begin VB.Label Label68 
         Caption         =   "X"
         Height          =   495
         Left            =   14760
         TabIndex        =   234
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame AG_CLIENTE 
      Caption         =   "Agregar Cliente"
      Height          =   9855
      Left            =   60
      TabIndex        =   92
      Top             =   188
      Visible         =   0   'False
      Width           =   15135
      Begin VB.CheckBox MensualA 
         Caption         =   "Abona Mensual"
         Height          =   495
         Left            =   4800
         TabIndex        =   321
         Top             =   5520
         Width           =   3855
      End
      Begin MSMask.MaskEdBox Text8 
         Height          =   495
         Left            =   360
         TabIndex        =   106
         Top             =   960
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin VB.TextBox Text15 
         Height          =   4095
         Left            =   9000
         TabIndex        =   123
         Top             =   960
         Width           =   5775
      End
      Begin VB.CommandButton Command16 
         Caption         =   "AGREGAR"
         Height          =   435
         Left            =   11640
         TabIndex        =   125
         Top             =   9000
         Width           =   2055
      End
      Begin VB.CommandButton Command15 
         Caption         =   "ATRAS"
         Height          =   435
         Left            =   600
         TabIndex        =   127
         Top             =   9000
         Width           =   2055
      End
      Begin VB.ComboBox Combo1 
         Height          =   555
         ItemData        =   "Inicio.frx":0008
         Left            =   360
         List            =   "Inicio.frx":000A
         TabIndex        =   109
         Top             =   4200
         Width           =   3735
      End
      Begin VB.ComboBox Combo2 
         Height          =   555
         ItemData        =   "Inicio.frx":000C
         Left            =   360
         List            =   "Inicio.frx":000E
         TabIndex        =   110
         Top             =   5400
         Width           =   3735
      End
      Begin VB.TextBox Text14 
         Height          =   555
         Left            =   360
         TabIndex        =   111
         Text            =   "00"
         Top             =   6600
         Width           =   3735
      End
      Begin VB.OptionButton Sexo 
         Caption         =   "Masculino"
         Height          =   435
         Index           =   0
         Left            =   6000
         TabIndex        =   121
         Top             =   4080
         Value           =   -1  'True
         Width           =   2295
      End
      Begin VB.OptionButton Sexo 
         Caption         =   "Femenino"
         Height          =   435
         Index           =   1
         Left            =   6000
         TabIndex        =   94
         Top             =   4680
         Width           =   2295
      End
      Begin VB.TextBox Text29 
         Height          =   555
         Left            =   360
         TabIndex        =   113
         Text            =   "00"
         Top             =   7800
         Width           =   3735
      End
      Begin MSMask.MaskEdBox Text9 
         Height          =   495
         Left            =   360
         TabIndex        =   107
         Top             =   2040
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox Text10 
         Height          =   495
         Left            =   360
         TabIndex        =   108
         Top             =   3120
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox Text13 
         Height          =   495
         Left            =   4800
         TabIndex        =   115
         Top             =   960
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox Text11 
         Height          =   495
         Left            =   4800
         TabIndex        =   117
         Top             =   2040
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox Text12 
         Height          =   495
         Left            =   4800
         TabIndex        =   119
         Top             =   3120
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   18
         PromptChar      =   "_"
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Observaciones"
         Height          =   375
         Index           =   18
         Left            =   9000
         TabIndex        =   105
         Top             =   480
         Width           =   5775
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada Mercedes"
         Height          =   375
         Index           =   11
         Left            =   360
         TabIndex        =   104
         Top             =   3720
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada Bs As"
         Height          =   375
         Index           =   12
         Left            =   360
         TabIndex        =   103
         Top             =   4920
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio de Mercedes"
         Height          =   375
         Index           =   13
         Left            =   360
         TabIndex        =   102
         Top             =   6120
         Width           =   3615
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Celular"
         Height          =   375
         Index           =   17
         Left            =   4800
         TabIndex        =   101
         Top             =   480
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Casa"
         Height          =   375
         Index           =   16
         Left            =   4800
         TabIndex        =   100
         Top             =   1560
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "DNI"
         Height          =   375
         Index           =   15
         Left            =   4800
         TabIndex        =   99
         Top             =   2640
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Sexo"
         Height          =   375
         Index           =   19
         Left            =   4800
         TabIndex        =   98
         Top             =   4080
         Width           =   1455
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio de Bs As"
         Height          =   375
         Index           =   14
         Left            =   360
         TabIndex        =   97
         Top             =   7320
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Direccion"
         Height          =   375
         Index           =   10
         Left            =   360
         TabIndex        =   96
         Top             =   2640
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Mail"
         Height          =   375
         Index           =   9
         Left            =   360
         TabIndex        =   95
         Top             =   1560
         Width           =   3735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Nombre"
         Height          =   375
         Index           =   8
         Left            =   360
         TabIndex        =   93
         Top             =   480
         Width           =   3735
      End
   End
   Begin VB.Frame AG_VIAJES_FIJOS 
      Caption         =   "Viajes Fijos Por Persona"
      Height          =   10095
      Left            =   0
      TabIndex        =   112
      Top             =   120
      Visible         =   0   'False
      Width           =   15255
      Begin VB.CommandButton botonPaginar 
         Caption         =   "<<"
         Height          =   435
         Index           =   0
         Left            =   120
         TabIndex        =   261
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   "<"
         Height          =   435
         Index           =   1
         Left            =   1320
         TabIndex        =   260
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   ">"
         Height          =   435
         Index           =   2
         Left            =   2520
         TabIndex        =   259
         Top             =   9480
         Width           =   975
      End
      Begin VB.CommandButton botonPaginar 
         Caption         =   ">>"
         Height          =   435
         Index           =   3
         Left            =   3720
         TabIndex        =   258
         Top             =   9480
         Width           =   975
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Feriados"
         Height          =   495
         Index           =   8
         Left            =   5760
         TabIndex        =   235
         Top             =   5520
         Width           =   1935
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Sabado"
         Height          =   495
         Index           =   7
         Left            =   5760
         TabIndex        =   209
         Top             =   5060
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Viernes"
         Height          =   495
         Index           =   6
         Left            =   5760
         TabIndex        =   208
         Top             =   4560
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Jueves"
         Height          =   495
         Index           =   5
         Left            =   5760
         TabIndex        =   207
         Top             =   4060
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Miercoles"
         Height          =   495
         Index           =   4
         Left            =   5760
         TabIndex        =   206
         Top             =   3560
         Width           =   2175
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Martes"
         Height          =   495
         Index           =   3
         Left            =   5760
         TabIndex        =   205
         Top             =   3060
         Width           =   1695
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Lunes"
         Height          =   495
         Index           =   2
         Left            =   5760
         TabIndex        =   204
         Top             =   2560
         Width           =   1815
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Domingo"
         Height          =   495
         Index           =   1
         Left            =   5760
         TabIndex        =   203
         Top             =   2060
         Width           =   2055
      End
      Begin VB.OptionButton DiaSemana 
         Caption         =   "Todos"
         Height          =   495
         Index           =   0
         Left            =   5760
         TabIndex        =   202
         Top             =   1560
         Width           =   1575
      End
      Begin VB.CommandButton Command17 
         Caption         =   "Filtrar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5760
         TabIndex        =   126
         Top             =   960
         Width           =   1455
      End
      Begin VB.TextBox Text16 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   120
         TabIndex        =   124
         Top             =   960
         Width           =   5535
      End
      Begin MSComctlLib.ListView ListView11 
         Height          =   7215
         Left            =   120
         TabIndex        =   114
         Top             =   1680
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   12726
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Id"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Nombre"
            Object.Width           =   10769
         EndProperty
      End
      Begin MSComctlLib.ListView ListSalidaPorPersona 
         Height          =   8415
         Left            =   8040
         TabIndex        =   116
         Top             =   1560
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   14843
         View            =   3
         LabelWrap       =   0   'False
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         HoverSelection  =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Hora"
            Object.Width           =   3836
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Dia"
            Object.Width           =   5821
         EndProperty
      End
      Begin MSComctlLib.ListView ListRegresoPorPersona 
         Height          =   8415
         Left            =   11640
         TabIndex        =   118
         Top             =   1560
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   14843
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Hora"
            Object.Width           =   3836
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Dia"
            Object.Width           =   5821
         EndProperty
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Pagina"
         Height          =   495
         Index           =   55
         Left            =   120
         TabIndex        =   265
         Top             =   9000
         Width           =   1335
      End
      Begin VB.Label lblPaginaFijos 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "1"
         Height          =   375
         Left            =   1560
         TabIndex        =   264
         Top             =   9000
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Caption         =   "de"
         Height          =   375
         Index           =   56
         Left            =   2520
         TabIndex        =   263
         Top             =   9000
         Width           =   615
      End
      Begin VB.Label lblCantidadPaginasFijos 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "100"
         Height          =   375
         Left            =   3120
         TabIndex        =   262
         Top             =   9000
         Width           =   735
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Viajes REGRESO"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00008000&
         Height          =   495
         Index           =   58
         Left            =   11640
         TabIndex        =   122
         Top             =   1080
         Width           =   3495
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Viajes SALIDA"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   375
         Index           =   57
         Left            =   8040
         TabIndex        =   120
         Top             =   1080
         Width           =   3495
      End
   End
   Begin VB.Frame CAMBIAR_CONTRA 
      Caption         =   "Cambiar Contraseña"
      Height          =   4815
      Left            =   4373
      TabIndex        =   303
      Top             =   2708
      Visible         =   0   'False
      Width           =   6495
      Begin VB.TextBox Text32 
         Height          =   555
         IMEMode         =   3  'DISABLE
         Left            =   2520
         PasswordChar    =   "*"
         TabIndex        =   310
         Top             =   2880
         Width           =   3855
      End
      Begin VB.TextBox Text31 
         Height          =   555
         IMEMode         =   3  'DISABLE
         Left            =   2520
         PasswordChar    =   "*"
         TabIndex        =   307
         Top             =   960
         Width           =   3855
      End
      Begin VB.CommandButton Command36 
         Caption         =   "Aceptar"
         Height          =   615
         Left            =   2400
         TabIndex        =   306
         Top             =   3840
         Width           =   2055
      End
      Begin VB.TextBox Text24 
         Height          =   555
         IMEMode         =   3  'DISABLE
         Left            =   2520
         PasswordChar    =   "*"
         TabIndex        =   305
         Top             =   1920
         Width           =   3855
      End
      Begin VB.Label Label1 
         Caption         =   "X"
         Height          =   375
         Left            =   6120
         TabIndex        =   312
         Top             =   360
         Width           =   255
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Confirmar Contraseña:"
         Height          =   975
         Index           =   69
         Left            =   120
         TabIndex        =   311
         Top             =   2640
         Width           =   2175
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Contraseña Anterior"
         Height          =   855
         Index           =   68
         Left            =   120
         TabIndex        =   309
         Top             =   720
         Width           =   2175
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Contraseña Nueva:"
         Height          =   975
         Index           =   39
         Left            =   120
         TabIndex        =   308
         Top             =   1680
         Width           =   2175
      End
   End
   Begin VB.Frame EL_PASAJE 
      Caption         =   "Borrar Pasaje"
      Height          =   8055
      Left            =   2993
      TabIndex        =   210
      Top             =   1080
      Visible         =   0   'False
      Width           =   9255
      Begin VB.CommandButton Command28 
         Caption         =   "Cancelar"
         Height          =   615
         Left            =   480
         TabIndex        =   218
         Top             =   6960
         Width           =   2295
      End
      Begin VB.CommandButton Command27 
         Caption         =   "Eliminar"
         Height          =   615
         Left            =   6600
         TabIndex        =   217
         Top             =   6960
         Width           =   2295
      End
      Begin VB.TextBox Text23 
         Height          =   1695
         Left            =   3000
         TabIndex        =   216
         Top             =   3840
         Width           =   5895
      End
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "Aviso con Tiempo"
         Height          =   435
         Index           =   3
         Left            =   3000
         TabIndex        =   213
         Top             =   2880
         Width           =   4095
      End
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "Cambio de Horario"
         Height          =   435
         Index           =   2
         Left            =   3000
         TabIndex        =   212
         Top             =   2280
         Width           =   3855
      End
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "No Aviso"
         Height          =   435
         Index           =   1
         Left            =   3000
         TabIndex        =   211
         Top             =   1800
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.Label lblNombreEliminar 
         Height          =   495
         Left            =   240
         TabIndex        =   221
         Top             =   3000
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label lblDescripEliminar 
         Height          =   1095
         Left            =   240
         TabIndex        =   220
         Top             =   480
         Width           =   8655
      End
      Begin VB.Label lblIdEliminar 
         Height          =   495
         Left            =   480
         TabIndex        =   219
         Top             =   1200
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Observación"
         Height          =   495
         Index           =   38
         Left            =   480
         TabIndex        =   215
         Top             =   3840
         Width           =   2535
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Razon"
         Height          =   495
         Index           =   37
         Left            =   360
         TabIndex        =   214
         Top             =   1800
         Width           =   1335
      End
   End
   Begin VB.Frame PARADA_MERCEDES 
      Caption         =   "Paradas MERCEDES"
      Height          =   10095
      Left            =   4133
      TabIndex        =   18
      Top             =   75
      Visible         =   0   'False
      Width           =   6975
      Begin VB.CommandButton Command5 
         Caption         =   "B"
         Height          =   435
         Left            =   6480
         TabIndex        =   27
         Top             =   4920
         Width           =   375
      End
      Begin VB.CommandButton Command3 
         Caption         =   "S"
         Height          =   435
         Left            =   6480
         TabIndex        =   26
         Top             =   4320
         Width           =   375
      End
      Begin VB.Frame Frame4 
         Caption         =   "Parada"
         Height          =   1335
         Left            =   240
         TabIndex        =   19
         Top             =   8520
         Width           =   6495
         Begin VB.CommandButton Command2 
            Caption         =   "Agregar"
            Height          =   435
            Left            =   4560
            TabIndex        =   24
            Top             =   480
            Width           =   1815
         End
         Begin VB.TextBox Text2 
            Height          =   555
            Left            =   1560
            TabIndex        =   20
            Top             =   480
            Width           =   2775
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Parada"
            Height          =   375
            Index           =   36
            Left            =   240
            TabIndex        =   25
            Top             =   480
            Width           =   1575
         End
         Begin VB.Label Label9 
            Caption         =   "Parada"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            TabIndex        =   21
            Top             =   480
            Width           =   1095
         End
      End
      Begin MSComctlLib.ListView ListView3 
         Height          =   8055
         Left            =   240
         TabIndex        =   22
         Top             =   480
         Width           =   6135
         _ExtentX        =   10821
         _ExtentY        =   14208
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Id"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Parada"
            Object.Width           =   10584
         EndProperty
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Caption         =   "X"
         Height          =   375
         Left            =   6480
         TabIndex        =   23
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame ED_PASAJE 
      Caption         =   "Editar Pasaje"
      Height          =   4575
      Left            =   5273
      TabIndex        =   290
      Top             =   2828
      Visible         =   0   'False
      Width           =   4695
      Begin VB.CommandButton Command34 
         Caption         =   "Editar"
         Height          =   615
         Left            =   840
         TabIndex        =   295
         Top             =   3600
         Width           =   3135
      End
      Begin VB.TextBox Text27 
         Height          =   555
         Left            =   240
         TabIndex        =   294
         Top             =   2640
         Width           =   4215
      End
      Begin VB.ComboBox Combo10 
         Height          =   555
         Left            =   240
         TabIndex        =   291
         Top             =   1200
         Width           =   4215
      End
      Begin VB.Label Label25 
         Caption         =   "X"
         Height          =   495
         Left            =   4320
         TabIndex        =   296
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio"
         Height          =   495
         Index           =   35
         Left            =   240
         TabIndex        =   293
         Top             =   2040
         Width           =   4215
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada"
         Height          =   495
         Index           =   34
         Left            =   240
         TabIndex        =   292
         Top             =   600
         Width           =   4215
      End
   End
   Begin VB.Frame VENTA_PASAJES 
      Caption         =   "Venta de Pasajes"
      Height          =   10095
      Left            =   0
      TabIndex        =   68
      Top             =   75
      Visible         =   0   'False
      Width           =   15255
      Begin VB.CommandButton Command22 
         Caption         =   "Imprimir"
         Height          =   360
         Left            =   2640
         TabIndex        =   162
         Top             =   8400
         Width           =   1935
      End
      Begin VB.OptionButton Ciudad 
         Caption         =   "REGRESO"
         ForeColor       =   &H00008000&
         Height          =   435
         Index           =   1
         Left            =   3840
         TabIndex        =   157
         Top             =   7680
         Width           =   2295
      End
      Begin VB.OptionButton Ciudad 
         Caption         =   "SALIDA"
         ForeColor       =   &H00FF0000&
         Height          =   435
         Index           =   0
         Left            =   2040
         TabIndex        =   156
         Top             =   7680
         Value           =   -1  'True
         Width           =   2295
      End
      Begin VB.CommandButton Command21 
         Caption         =   "Agregar"
         Height          =   375
         Left            =   240
         TabIndex        =   150
         Top             =   8400
         Width           =   1935
      End
      Begin MSComCtl2.MonthView MonthView1 
         Height          =   4770
         Left            =   240
         TabIndex        =   69
         Top             =   1320
         Width           =   5745
         _ExtentX        =   10134
         _ExtentY        =   8414
         _Version        =   393216
         ForeColor       =   192
         BackColor       =   -2147483633
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShowToday       =   0   'False
         StartOfWeek     =   81199106
         TitleBackColor  =   -2147483646
         TitleForeColor  =   -2147483639
         TrailingForeColor=   -2147483632
         CurrentDate     =   42280
      End
      Begin MSComctlLib.ListView ListViajesRegreso 
         Height          =   4365
         Left            =   6120
         TabIndex        =   89
         Top             =   5640
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   7699
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Hora"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Patente"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Total"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   3
            Text            =   "Libres"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Espera"
            Object.Width           =   4233
         EndProperty
      End
      Begin MSComCtl2.DTPicker DTPicker3 
         Height          =   495
         Left            =   1680
         TabIndex        =   151
         Top             =   6240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   873
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CustomFormat    =   "HH:mm"
         Format          =   81199107
         UpDown          =   -1  'True
         CurrentDate     =   42273
      End
      Begin MSMask.MaskEdBox MaskEdBox4 
         Height          =   495
         Left            =   1680
         TabIndex        =   152
         Top             =   6960
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   873
         _Version        =   393216
         MaxLength       =   6
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PromptChar      =   "_"
      End
      Begin MSComctlLib.ListView ListViajesSalida 
         Height          =   4365
         Left            =   6120
         TabIndex        =   70
         Top             =   800
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   7699
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Hora"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "Patente"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Total"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Libres"
            Object.Width           =   4233
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Espera"
            Object.Width           =   4233
         EndProperty
      End
      Begin VB.Label lblDiaClikeado 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   495
         Left            =   240
         TabIndex        =   281
         Top             =   600
         Width           =   5775
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Tipo Viaje"
         Height          =   615
         Index           =   0
         Left            =   120
         TabIndex        =   155
         Top             =   7680
         Width           =   1935
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Patente"
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   154
         Top             =   6960
         Width           =   1695
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Hora:"
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   153
         Top             =   6240
         Width           =   1095
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "REGRESO"
         ForeColor       =   &H00008000&
         Height          =   375
         Index           =   4
         Left            =   6240
         TabIndex        =   91
         Top             =   5160
         Width           =   8775
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "SALIDA"
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   3
         Left            =   6240
         TabIndex        =   90
         Top             =   320
         Width           =   8775
      End
   End
   Begin VB.Frame VENDER_PASAJE 
      Caption         =   "Vender Pasaje"
      Height          =   10215
      Left            =   60
      TabIndex        =   128
      Top             =   0
      Visible         =   0   'False
      Width           =   15135
      Begin MSComDlg.CommonDialog ColorOcupado 
         Left            =   9480
         Top             =   5040
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton Command24 
         Caption         =   ">>"
         Height          =   435
         Left            =   9360
         TabIndex        =   194
         Top             =   7200
         Width           =   615
      End
      Begin VB.CommandButton Command23 
         Caption         =   "<<"
         Height          =   435
         Left            =   9360
         TabIndex        =   193
         Top             =   7800
         Width           =   615
      End
      Begin VB.CommandButton Command20 
         Caption         =   "Vender"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   12960
         TabIndex        =   149
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Frame Frame9 
         Caption         =   "Pasajes"
         Height          =   1575
         Left            =   120
         TabIndex        =   138
         Top             =   1440
         Width           =   14895
         Begin VB.CheckBox enEspera 
            Caption         =   "En Espera"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Left            =   10800
            TabIndex        =   297
            Top             =   720
            Width           =   1935
         End
         Begin VB.TextBox Text22 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   9000
            TabIndex        =   147
            Top             =   840
            Width           =   1455
         End
         Begin VB.TextBox Text18 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   7680
            TabIndex        =   146
            Top             =   840
            Width           =   1215
         End
         Begin VB.TextBox Text17 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   5880
            TabIndex        =   144
            Top             =   840
            Width           =   1695
         End
         Begin VB.ComboBox Combo3 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   120
            TabIndex        =   139
            Top             =   840
            Width           =   3615
         End
         Begin VB.ComboBox Combo4 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   3840
            TabIndex        =   142
            Top             =   840
            Width           =   1935
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Celular"
            Height          =   375
            Index           =   63
            Left            =   9000
            TabIndex        =   201
            Top             =   360
            Width           =   2055
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Precio"
            Height          =   375
            Index           =   62
            Left            =   7680
            TabIndex        =   145
            Top             =   360
            Width           =   1335
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Dni"
            Height          =   375
            Index           =   61
            Left            =   5880
            TabIndex        =   143
            Top             =   360
            Width           =   855
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Parada"
            Height          =   375
            Index           =   60
            Left            =   3840
            TabIndex        =   141
            Top             =   360
            Width           =   1815
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Cliente"
            Height          =   375
            Index           =   59
            Left            =   120
            TabIndex        =   140
            Top             =   360
            Width           =   2535
         End
      End
      Begin MSComctlLib.ListView ListView14 
         Height          =   6495
         Left            =   120
         TabIndex        =   134
         Top             =   3600
         Width           =   9195
         _ExtentX        =   16219
         _ExtentY        =   11456
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "N"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Parada"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Cliente"
            Object.Width           =   7937
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   4
            Text            =   "Pre"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   5
            Text            =   "DNI"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   6
            Text            =   "Celular"
            Object.Width           =   4939
         EndProperty
      End
      Begin VB.Frame Frame2 
         Caption         =   "Datos Viaje"
         Height          =   855
         Left            =   120
         TabIndex        =   129
         Top             =   600
         Width           =   14895
         Begin VB.Label lblCapacidad 
            Caption         =   "100"
            Height          =   375
            Left            =   9360
            TabIndex        =   136
            Top             =   360
            Width           =   975
         End
         Begin VB.Label lblDestino 
            Alignment       =   2  'Center
            Caption         =   "Destino: Buenos Aires"
            Height          =   375
            Left            =   10440
            TabIndex        =   133
            Top             =   360
            Width           =   3975
         End
         Begin VB.Label lblDia 
            Caption         =   "Dia: 99/99/9999"
            Height          =   375
            Left            =   1800
            TabIndex        =   159
            Top             =   360
            Width           =   2775
         End
         Begin VB.Label lblciudad 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   13.5
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   13800
            TabIndex        =   158
            Top             =   360
            Visible         =   0   'False
            Width           =   255
         End
         Begin VB.Label Label40 
            Caption         =   "Capacidad:"
            Height          =   375
            Left            =   7320
            TabIndex        =   135
            Top             =   360
            Width           =   2175
         End
         Begin VB.Label lblHora 
            Alignment       =   2  'Center
            Caption         =   "Hora: 22:30"
            Height          =   375
            Left            =   4680
            TabIndex        =   132
            Top             =   360
            Width           =   2655
         End
         Begin VB.Label lblId 
            Height          =   375
            Left            =   600
            TabIndex        =   131
            Top             =   360
            Width           =   975
         End
         Begin VB.Label Label39 
            Caption         =   "Id:"
            Height          =   375
            Left            =   120
            TabIndex        =   130
            Top             =   360
            Width           =   495
         End
      End
      Begin MSComctlLib.ListView ListView15 
         Height          =   6495
         Left            =   10005
         TabIndex        =   137
         Top             =   3600
         Width           =   4965
         _ExtentX        =   8758
         _ExtentY        =   11456
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "N"
            Object.Width           =   882
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Cliente"
            Object.Width           =   7849
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Celular"
            Object.Width           =   3528
         EndProperty
      End
      Begin MSComDlg.CommonDialog ColorEspera 
         Left            =   9480
         Top             =   4320
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Lista de Espera"
         Height          =   375
         Index           =   64
         Left            =   10080
         TabIndex        =   161
         Top             =   3120
         Width           =   4815
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Lista de Ocupados"
         Height          =   375
         Index           =   65
         Left            =   240
         TabIndex        =   160
         Top             =   3120
         Width           =   9015
      End
      Begin VB.Label Label45 
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   14640
         TabIndex        =   148
         Top             =   240
         Width           =   255
      End
   End
   Begin VB.Label lblEstado 
      Caption         =   "Label24"
      Height          =   495
      Left            =   720
      TabIndex        =   282
      Top             =   120
      Visible         =   0   'False
      Width           =   4455
   End
   Begin VB.Menu mnu_agenda 
      Caption         =   "Agenda"
      WindowList      =   -1  'True
      Begin VB.Menu mnu_ver_agenda 
         Caption         =   "Ver Agenda"
      End
      Begin VB.Menu mnu_viajes_fijos 
         Caption         =   "Agregar Viajes Fijos a Clientes"
      End
      Begin VB.Menu mnu_imprimir_clientes_fijos 
         Caption         =   "Imprimir Listado Clientes Fijos"
      End
   End
   Begin VB.Menu mnu_pasajes 
      Caption         =   "Venta de Pasajes"
   End
   Begin VB.Menu mnu_viajesFijos 
      Caption         =   "Viajes Fijos"
      Begin VB.Menu name_fijo_mercedes 
         Caption         =   "Viajes Fijos SALIDA"
      End
      Begin VB.Menu nme_Fijos_BsAS 
         Caption         =   "Viajes Fijos REGRESO"
      End
      Begin VB.Menu mnu_feriados 
         Caption         =   "Feriados"
      End
   End
   Begin VB.Menu mnu_choferes 
      Caption         =   "Choferes"
   End
   Begin VB.Menu mnu_grupos 
      Caption         =   "Grupos"
   End
   Begin VB.Menu mnu_combis 
      Caption         =   "Combis"
   End
   Begin VB.Menu mnu_paradas 
      Caption         =   "Paradas"
      Begin VB.Menu mnu_mercedes 
         Caption         =   "Paradas Mercedes"
      End
      Begin VB.Menu mnu_bsas 
         Caption         =   "Paradas Bs As"
      End
   End
   Begin VB.Menu mnu_cambiar_combi_mercedes 
      Caption         =   "Cambiar combi"
      Visible         =   0   'False
      Begin VB.Menu mnu_cambiar_combi_mercedes_sub 
         Caption         =   "Cambiar combi"
      End
      Begin VB.Menu mnu_cambios_viaje_mercedes 
         Caption         =   "Cambios Viaje"
      End
   End
   Begin VB.Menu mnu_cambiar_combi_bsas 
      Caption         =   "Cambiar combi"
      Visible         =   0   'False
      Begin VB.Menu mnu_cambiar_combi_bsas_sub 
         Caption         =   "Cambiar Combi"
      End
      Begin VB.Menu mnu_cambios_viaje_bsas 
         Caption         =   "Cambios Viaje"
      End
   End
   Begin VB.Menu mnu_agenda_list 
      Caption         =   "Agenda"
      Visible         =   0   'False
      Begin VB.Menu mnu_mod_agenda 
         Caption         =   "Modificar"
      End
      Begin VB.Menu mnu_ver_historial 
         Caption         =   "Ver Historial"
      End
   End
   Begin VB.Menu mnu_pasajes_ocupados 
      Caption         =   "Pasajes"
      Visible         =   0   'False
      Begin VB.Menu mnu_pintar_pasaje_ocupado 
         Caption         =   "Pintar Pasaje"
      End
   End
   Begin VB.Menu mnu_pasajes_espera 
      Caption         =   "Pasajes"
      Visible         =   0   'False
      Begin VB.Menu mnu_pintar_pasaje_espera 
         Caption         =   "Pintar Pasaje"
      End
   End
   Begin VB.Menu mnu_usuario 
      Caption         =   "Usuario"
      Begin VB.Menu mnu_cambiar_contraseña 
         Caption         =   "Cambiar Contraseña"
      End
      Begin VB.Menu mnu_agregar_usuario 
         Caption         =   "Agregar Usuario"
      End
      Begin VB.Menu mnu_desconectarse 
         Caption         =   "Desconectarse"
      End
   End
End
Attribute VB_Name = "Inicio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" ( _
    ByVal hwnd As Long, _
    ByVal wMsg As Long, _
    ByVal wParam As Long, _
    lParam As Any) As Long
Private WithEvents cSubLV As cSubclassListView
Attribute cSubLV.VB_VarHelpID = -1

Dim MyForm As FRMSIZE
      Dim DesignX As Integer
      Dim DesignY As Integer

Private Sub AnteriorPagina_Click()
Call cargarClientes(ListView7, Val(numeroPagina.Caption) - 1, Text7.Text)
End Sub

Private Sub botonPaginar_Click(Index As Integer)
If Index = 0 Then
    Call cargarClientesVFC(ListView11, 1, Text16.Text)
ElseIf Index = 1 Then
    Call cargarClientesVFC(ListView11, Val(lblPaginaFijos.Caption) - 1, Text16.Text)
ElseIf Index = 2 Then
    Call cargarClientesVFC(ListView11, Val(lblPaginaFijos.Caption) + 1, Text16.Text)
ElseIf Index = 3 Then
    Call cargarClientesVFC(ListView11, Val(lblCantidadPaginasFijos.Caption), Text16.Text)
ElseIf Index = 4 Then
    Call cargarHistorialCliente(1, ListView7.SelectedItem.Text, ListView7.SelectedItem.SubItems(1), ListView7.SelectedItem.SubItems(2), ObtenerIndexRazon)
ElseIf Index = 5 Then
    Call cargarHistorialCliente(Val(lblPaginaHistorial.Caption) - 1, ListView7.SelectedItem.Text, ListView7.SelectedItem.SubItems(1), ListView7.SelectedItem.SubItems(2), ObtenerIndexRazon)
ElseIf Index = 6 Then
    Call cargarHistorialCliente(Val(lblPaginaHistorial.Caption) + 1, ListView7.SelectedItem.Text, ListView7.SelectedItem.SubItems(1), ListView7.SelectedItem.SubItems(2), ObtenerIndexRazon)
ElseIf Index = 7 Then
    Call cargarHistorialCliente(Val(lblCantidadPaginaHistorial.Caption), ListView7.SelectedItem.Text, ListView7.SelectedItem.SubItems(1), ListView7.SelectedItem.SubItems(2), ObtenerIndexRazon)
End If
End Sub

Private Sub Combo3_GotFocus()
Combo3.SelStart = Len(Combo3.Text)
End Sub

Private Sub Combo3_LostFocus()
Call cargarDatosVentaPasajero(Combo3.Text, lblId)
End Sub

Private Sub Combo4_GotFocus()
Combo4.SelStart = Len(Combo4.Text)
End Sub

Private Sub Command1_Click()
Call agregarCombi(MaskEdBox1.Text, Text4.Text, Text3.Text)
Call cargarCombis(ListView2)
End Sub

Private Sub Command10_Click()
Dim i As Integer
For i = 0 To 7
    If DiaSemanaMercedes(i).Value = True Then Exit For
Next i
Call agregarViajeFijo(DTPicker1.Hour, DTPicker1.Minute, i, MaskEdBox2.Text, 0)
Call cargarViajesFijos(ListView6, i, 0)
End Sub

Private Sub Command11_Click()
Call OcultarFrames(AG_CLIENTE)
Call limpiarAgregarCliente
End Sub

Private Sub Command12_Click()
If MaskEdBox5.Text = vbNullString Then MsgBox "Llene el campo nombre.": Exit Sub
Dim iSexo As Byte, iMensual As Byte
iSexo = IIf(SexoM(0).Value = True, 0, 1)
Call modificarCliente(lblIdModificar.Caption, MaskEdBox5.Text, MaskEdBox10.Text, iSexo, MaskEdBox6.Text, MaskEdBox7.Text, Combo5.Text, Combo6.Text, Text20.Text, Text21.Text, MaskEdBox8.Text, MaskEdBox9.Text, Text19.Text, MensualM.Value)
End Sub

Private Sub Command13_Click()
Call cargarClientes(ListView7, 1, Text7.Text)
End Sub

Private Sub Command14_Click()
Dim i As Integer
For i = 0 To 7
    If DiaSemanaBsAs(i).Value = True Then Exit For
Next i
Call agregarViajeFijo(DTPicker2.Hour, DTPicker2.Minute, i, MaskEdBox3.Text, 1)
Call cargarViajesFijos(ListView9, i, 1)
End Sub

Private Sub Command15_Click()
AG_CLIENTE.Visible = False
AGENDA.Visible = True
Call cargarClientes(ListView7, Val(numeroPagina.Caption), Text7.Text)
End Sub

Private Sub Command16_Click()
If Text8.Text = vbNullString Then MsgBox "Llene el campo nombre.": Exit Sub
Dim iSexo As Byte
iSexo = IIf(Sexo(0).Value = True, 0, 1)
Call agregarCliente(Text8.Text, Text12.Text, iSexo, Text9.Text, Text10.Text, Combo1.Text, Combo2.Text, Text14.Text, Text29.Text, Text13.Text, Text11.Text, Text15.Text, MensualA.Value)
End Sub

Private Sub Command17_Click()
Call cargarClientesVFC(ListView11, 1, Text16.Text)
lblInformacion(57).Visible = False
lblInformacion(58).Visible = False
ListSalidaPorPersona.Visible = False
ListRegresoPorPersona.Visible = False
End Sub

Private Sub Command18_Click()
MsgBox "En construcion."
End Sub

Private Sub Command19_Click()
MO_CLIENTE.Visible = False
AGENDA.Visible = True
Call cargarClientes(ListView7, Val(numeroPagina.Caption), Text7.Text)
End Sub

Private Sub Command2_Click()
Call agregarParada(Text2.Text, 0)
Call cargarParadas(ListView3, 0)
Text2.Text = vbNullString
End Sub

Private Sub Command20_Click()
''If Combo3.Text = vbNullString Or Combo3.Text = " " Or Combo4.Text = vbNullString Or Combo4.Text = " " Or _
''   Text18.Text = vbNullString Or Text18.Text = " " Or Text17.Text = vbNullString Or Text17.Text = " " Or _
''  Text22.Text = vbNullString Or Text22.Text = " " Then MsgBox "Complete todos los campos.": Exit Sub
Call venderPasajes(lblId.Caption, Combo3.Text, Combo4.Text _
                        , Val(Text18.Text), Text17.Text, Text22.Text, Val(lblciudad.Caption), enEspera.Value)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
If lblciudad.Caption = 0 Then
    Call cargarParadasComboMercedes(Combo4)
Else
    Call cargarParadasComboBsAs(Combo4)
End If
Call cargarClientesCombo(Combo3)
Text17.Text = vbNullString
Text18.Text = vbNullString
Text22.Text = vbNullString
enEspera.Value = False
End Sub

Private Sub Command21_Click()
Call agregarViaje(MonthView1.Value, DTPicker3.Hour, DTPicker3.Minute, MaskEdBox4.Text _
                , IIf(Ciudad(0).Value = True, 0, 1))
Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
End Sub

Private Sub Command22_Click()
Dim checkMercedes, checkBsAs As Integer
checkMercedes = obtenerIndexCheck(ListViajesSalida)
checkBsAs = obtenerIndexCheck(ListViajesRegreso)
If checkBsAs > 0 Or checkMercedes > 0 Then
    IMPRIMIR_VIAJE.Visible = True
    VENTA_PASAJES.Enabled = False
    Text26.Text = vbNullString
    Call cargarChoferesCombo(Combo9)
End If
End Sub

Private Sub Command23_Click()
If ListView15.ListItems.Count > 0 Then
    If ListView15.SelectedItem.Index > 0 Then
        PASAR_OCUPADO.Visible = True
        VENDER_PASAJE.Enabled = False
        Dim i As Integer
        Combo8.Clear
        For i = 0 To Combo4.ListCount - 1
            Combo8.AddItem Combo4.List(i)
        Next i
    End If
End If
End Sub

Private Sub Command24_Click()
If ListView14.ListItems.Count > 0 Then
    If ListView14.SelectedItem.Index > 0 Then
        Call ponerEnEspera(ListView14.SelectedItem.SubItems(1))
        Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
    End If
End If
End Sub

Private Sub Command25_Click()
Call OcultarFrames(VENTA_PASAJES)
VENTA_PASAJES.Enabled = True
End Sub

Private Sub Command26_Click()
Call cambiarCombiViaje(lblIdCambiarCombi, Combo7.Text)
Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
Call OcultarFrames(VENTA_PASAJES)
VENTA_PASAJES.Enabled = True
End Sub

Private Sub Command27_Click()
Dim IdRazon As Integer
If RazonEliminar(1).Value = True Then IdRazon = 1
If RazonEliminar(2).Value = True Then IdRazon = 2
If RazonEliminar(3).Value = True Then IdRazon = 3
Call eliminarPasaje(lblIdEliminar.Caption, lblNombreEliminar.Caption, lblId.Caption, IdRazon, Text23.Text)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub

Private Sub Command28_Click()
EL_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub cargarClientestxt()
Dim Inf, clienpath, cliencantpath, cantclien
Inf = "Informacion"

clienpath = App.Path & "\Recursos\Clientes\"
cliencantpath = App.Path & "\Recursos\Clientes.txt"
cantclien = Val(LeerDato(cliencantpath, Inf, "CantClientes"))
Dim dni, Nombre, paradamercedes, paradabsas, insertEnorme As String
Dim i, iParadabsas, iParadamer As Integer
For i = 1 To cantclien
    Nombre = LeerDato(cliencantpath, Inf, "cliente" & i)
    paradamercedes = LeerDato(clienpath & Nombre & ".txt", Inf, "ParMer")
    paradabsas = LeerDato(clienpath & Nombre & ".txt", Inf, "ParBsAs")
    iParadamer = obtenerIdParadaMercedes(paradamercedes)
    iParadabsas = obtenerIdParadaBsAs(paradabsas)
    dni = LeerDato(clienpath & Nombre & ".txt", Inf, "DNI")
    ''MsgBox nombre & "dni: " & LeerDato(clienpath & nombre & ".txt", Inf, "DNI")
    ''ConexionBD.Execute "insert into clientes(nombre,dni) values ('JUAN " & i & "'," & i & ")"
    If i = 1 Then
        insertEnorme = "insert into clientes(nombre,dni,paradamercedes,paradabsas) values('" & Nombre & "'," & dni & "," & iParadamer & "," & iParadabsas & ")"
    Else
        If (iParadamer > 0 And iParadabsas > 0 And dni <> vbNullString) Then
            insertEnorme = insertEnorme & vbCrLf & _
            "insert into clientes(nombre,dni,paradamercedes,paradabsas) values('" & Nombre & "'," & dni & "," & iParadamer & "," & iParadabsas & ")"
        End If
    End If
Next i
Call GrabarDato(App.Path & "\agregarClientes.txt", Inf, i, insertEnorme)
End Sub

Private Sub Command29_Click()
Call agregarFeriado(MonthView2.Value, Text25.Text)
Call cargarFeriados(ListView17)
Text25.Text = vbNullString
End Sub

Private Sub Command3_Click()
Dim sId, sParada As String
If ListView3.ListItems.Count > 0 Then
    If ListView3.SelectedItem.Index > 1 Then
        Call bajarOrdenParada(ListView3.ListItems(ListView3.SelectedItem.Index).Text)
        'Call cargarParadas(ListView3, 0)
        sId = ListView3.ListItems(ListView3.SelectedItem.Index).Text
        sParada = ListView3.ListItems(ListView3.SelectedItem.Index).SubItems(1)
        
        ListView3.ListItems(ListView3.SelectedItem.Index).Text = ListView3.ListItems(ListView3.SelectedItem.Index - 1).Text
        ListView3.ListItems(ListView3.SelectedItem.Index).SubItems(1) = ListView3.ListItems(ListView3.SelectedItem.Index - 1).SubItems(1)
        
        ListView3.ListItems(ListView3.SelectedItem.Index - 1).Text = sId
        ListView3.ListItems(ListView3.SelectedItem.Index - 1).SubItems(1) = sParada
        
        ListView3.ListItems(ListView3.SelectedItem.Index - 1).Selected = True
    End If
End If
End Sub

Private Sub Command30_Click()
PASAR_OCUPADO.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Command31_Click()
If ListView15.ListItems.Count > 0 Then
    If ListView15.SelectedItem.Index > 0 Then
        If ponerEnOcupado(ListView15.SelectedItem.SubItems(1), Combo8.Text) Then
            Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
            PASAR_OCUPADO.Visible = False
            VENDER_PASAJE.Enabled = True
        End If
    End If
End If
End Sub

Private Sub Command32_Click()
Dim checkMercedes, checkBsAs As Integer
checkMercedes = obtenerIndexCheck(ListViajesSalida)
checkBsAs = obtenerIndexCheck(ListViajesRegreso)
If checkMercedes > 0 And checkBsAs > 0 Then Call ImprimirPlanillaCharterIdaYVuelta(ListViajesSalida.ListItems(checkMercedes).Tag _
                                                                                 , ListViajesSalida.ListItems(checkMercedes).Text _
                                                                                 , ListViajesRegreso.ListItems(checkBsAs).Tag _
                                                                                 , ListViajesRegreso.ListItems(checkBsAs).Text _
                                                                                 , MonthView1.Value _
                                                                                 , Combo9.Text _
                                                                                 , Text26.Text): Exit Sub
If checkMercedes > 0 Then Call ImprimirPlanillaCharterIda(ListViajesSalida.ListItems(checkMercedes).Tag _
                                                        , ListViajesSalida.ListItems(checkMercedes).Text _
                                                        , MonthView1.Value _
                                                        , Combo9.Text _
                                                        , Text26.Text)
If checkBsAs > 0 Then Call ImprimirPlanillaCharterVuelta(ListViajesRegreso.ListItems(checkBsAs).Tag _
                                                         , ListViajesRegreso.ListItems(checkBsAs).Text _
                                                         , MonthView1.Value _
                                                         , Combo9.Text _
                                                         , Text26.Text)

IMPRIMIR_VIAJE.Visible = False
VENTA_PASAJES.Enabled = True
End Sub

Private Sub Command33_Click()
IMPRIMIR_VIAJE.Visible = False
VENTA_PASAJES.Enabled = True
End Sub

Private Sub Command34_Click()
Dim idParada As Integer
idParada = obtenerIdParada(Combo10.Text, lblciudad.Caption)
If idParada = 0 Then MsgBox "Parada incorrecta.": Exit Sub
Call editarPasaje(ListView14.SelectedItem.ListSubItems(1), idParada, Text27.Text)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
ED_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Command35_Click()
Call iniciarSesion(Text28.Text, Text30.Text)
End Sub

Private Sub Command36_Click()
Call cambiarContraseña(Text31.Text, Text24.Text, Text32.Text)
End Sub

Private Sub Command37_Click()
Call agregarUsuario(Text33.Text, Text34.Text)
End Sub

Private Sub Command4_Click()
Call agregarChofer(Text1.Text)
Call cargarChoferes(ListView1)
Text1.Text = vbNullString
End Sub

Private Sub Command5_Click()
Dim sId, sParada As String
If ListView3.ListItems.Count > 0 Then
    If ListView3.SelectedItem.Index > 0 And ListView3.SelectedItem.Index < ListView3.ListItems.Count Then
        'Call subirOrdenParada(ListView3.ListItems(ListView3.SelectedItem.Index).Text)
        sId = ListView3.ListItems(ListView3.SelectedItem.Index).Text
        sParada = ListView3.ListItems(ListView3.SelectedItem.Index).SubItems(1)
        
        ListView3.ListItems(ListView3.SelectedItem.Index).Text = ListView3.ListItems(ListView3.SelectedItem.Index + 1).Text
        ListView3.ListItems(ListView3.SelectedItem.Index).SubItems(1) = ListView3.ListItems(ListView3.SelectedItem.Index + 1).SubItems(1)
        
        ListView3.ListItems(ListView3.SelectedItem.Index + 1).Text = sId
        ListView3.ListItems(ListView3.SelectedItem.Index + 1).SubItems(1) = sParada
        
        ListView3.ListItems(ListView3.SelectedItem.Index + 1).Selected = True
    End If
End If
End Sub

Private Sub Command6_Click()
Dim sId, sParada As String
If ListView4.ListItems.Count > 0 Then
    If ListView4.SelectedItem.Index > 0 And ListView4.SelectedItem.Index < ListView4.ListItems.Count Then
        Call subirOrdenParada(ListView4.ListItems(ListView4.SelectedItem.Index).Text)
        sId = ListView4.ListItems(ListView4.SelectedItem.Index).Text
        sParada = ListView4.ListItems(ListView4.SelectedItem.Index).SubItems(1)
        
        ListView4.ListItems(ListView4.SelectedItem.Index).Text = ListView4.ListItems(ListView4.SelectedItem.Index + 1).Text
        ListView4.ListItems(ListView4.SelectedItem.Index).SubItems(1) = ListView4.ListItems(ListView4.SelectedItem.Index + 1).SubItems(1)
        
        ListView4.ListItems(ListView4.SelectedItem.Index + 1).Text = sId
        ListView4.ListItems(ListView4.SelectedItem.Index + 1).SubItems(1) = sParada
        
        ListView4.ListItems(ListView4.SelectedItem.Index + 1).Selected = True
    End If
End If
End Sub

Private Sub Command7_Click()
Dim sId, sParada As String
If ListView4.ListItems.Count > 0 Then
    If ListView4.SelectedItem.Index > 1 Then
        Call bajarOrdenParada(ListView4.ListItems(ListView4.SelectedItem.Index).Text)
        'Call cargarParadas(ListView4, 1)
        sId = ListView4.ListItems(ListView4.SelectedItem.Index).Text
        sParada = ListView4.ListItems(ListView4.SelectedItem.Index).SubItems(1)
        
        ListView4.ListItems(ListView4.SelectedItem.Index).Text = ListView4.ListItems(ListView4.SelectedItem.Index - 1).Text
        ListView4.ListItems(ListView4.SelectedItem.Index).SubItems(1) = ListView4.ListItems(ListView4.SelectedItem.Index - 1).SubItems(1)
        
        ListView4.ListItems(ListView4.SelectedItem.Index - 1).Text = sId
        ListView4.ListItems(ListView4.SelectedItem.Index - 1).SubItems(1) = sParada
        
        ListView4.ListItems(ListView4.SelectedItem.Index - 1).Selected = True
    End If
End If
End Sub

Private Sub Command8_Click()
Call agregarParada(Text5.Text, 1)
Call cargarParadas(ListView4, 1)
Text5.Text = vbNullString
End Sub

Private Sub Command9_Click()
Call agregarGrupo(Text6.Text)
Call cargarGrupos(ListView5)
Text6.Text = vbNullString
End Sub

Private Sub DiaSemana_Click(Index As Integer)
ListSalidaPorPersona.Visible = True
lblInformacion(57).Visible = True
Call cargarViajesFijosVFC(ListSalidaPorPersona, 0, Index)
Call marcarViajesFijos(ListSalidaPorPersona, ListView11.SelectedItem.Text)
ListRegresoPorPersona.Visible = True
lblInformacion(58).Visible = True
Call cargarViajesFijosVFC(ListRegresoPorPersona, 1, Index)
Call marcarViajesFijos(ListRegresoPorPersona, ListView11.SelectedItem.Text)
End Sub

Private Sub DiaSemanaBsAs_Click(Index As Integer)
If Index > 0 Then
    Frame8.Visible = True
Else
    Frame8.Visible = False
End If
Call cargarViajesFijos(ListView9, Index, 1)
End Sub

Private Sub DiaSemanaMercedes_Click(Index As Integer)
If Index > 0 Then
    Frame7.Visible = True
Else
    Frame7.Visible = False
End If
Call cargarViajesFijos(ListView6, Index, 0)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyEscape And VENDER_PASAJE.Visible Then
    Call Label45_Click
End If
End Sub

Private Sub Label1_Click()
CAMBIAR_CONTRA.Visible = False
End Sub

Private Sub Label10_Click()
PARADA_MERCEDES.Visible = False
End Sub

Private Sub Label12_Click()
PARADA_BSAS.Visible = False
End Sub

Private Sub Label14_Click()
GRUPO.Visible = False
End Sub

Private Sub Label17_Click()
VIAJES_FIJOS_MERCEDES.Visible = False
End Sub

Private Sub Label19_Click()
AGENDA.Visible = False
End Sub

Private Sub Label2_Click()
CHOFER.Visible = False
End Sub

Private Sub Label23_Click()
VIAJES_FIJOS_BSAS.Visible = False
End Sub

Private Sub Label24_Click()
CAMBIOS_VIAJE.Visible = False
VENTA_PASAJES.Enabled = True
End Sub

Private Sub Label25_Click()
ED_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Label3_Click()
AG_USUARIO.Visible = False
End Sub

Private Sub Label4_Click()
COMBI.Visible = False
End Sub

Private Sub Label45_Click()
VENDER_PASAJE.Visible = False
VENTA_PASAJES.Visible = True
Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
End Sub

Private Sub Label68_Click()
HISTORIAL.Visible = False
AGENDA.Visible = True
End Sub

Private Sub Label70_Click()
AG_FERIADO.Visible = False
End Sub

Private Sub ListView1_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView1.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un chofer?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarChofer(ListView1.ListItems(ListView1.SelectedItem.Index).Text)
        Call cargarChoferes(ListView1)
    End If
End If
End Sub

Private Sub ListViajesRegreso_DblClick()
If ListViajesRegreso.ListItems.Count > 0 Then
If ListViajesRegreso.SelectedItem.Index > 0 Then
    Call OcultarFrames(VENDER_PASAJE)
    lblId.Caption = ListViajesRegreso.SelectedItem.Tag
    lblHora.Caption = "Hora: " + ListViajesRegreso.SelectedItem.Text
    lblCapacidad.Caption = ListViajesRegreso.SelectedItem.ListSubItems(2).Text
    lblDestino.Caption = "Destino: Mercedes"
    Call pintarEncabezadoPasaje(32768)
    lblciudad.Caption = 1
    lblDia.Caption = "Dia: " & MonthView1.Value
    Call cargarPasajesViajes(ListView14, ListView15, ListViajesRegreso.SelectedItem.Tag, ListViajesRegreso.SelectedItem.ListSubItems(2).Text)
    Call cargarParadasComboBsAs(Combo4)
    Call cargarClientesCombo(Combo3)
    Text17.Text = vbNullString
    Text18.Text = vbNullString
End If
End If
End Sub

Private Sub ListViajesRegreso_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListViajesRegreso.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar el viaje?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarViaje(ListViajesRegreso.SelectedItem.Tag)
        Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
    End If
End If
End Sub

Private Sub ListView10_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView14_DblClick()
ED_PASAJE.Visible = True
Dim i As Integer
For i = 0 To Combo4.ListCount - 1
    Combo10.AddItem Combo4.List(i)
Next i
Combo10.Text = ListView14.SelectedItem.SubItems(2)
Text27.Text = ListView14.SelectedItem.SubItems(4)
VENDER_PASAJE.Enabled = False
End Sub

Private Sub ListView17_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView17.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar el feriado?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarFeriado(ListView17.SelectedItem.Text)
        Call cargarFeriados(ListView17)
    End If
End If
End Sub

Private Sub ListView1_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView16_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView17_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView2_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView3_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView4_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView5_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView6_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView7_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView7_DblClick()
Call OcultarFrames(MO_CLIENTE)
Call cargarClienteModificar(ListView7.SelectedItem.Text)
End Sub

Private Sub ListViajesSalida_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListViajesSalida_ItemCheck(ByVal Item As MSComctlLib.ListItem)
Dim i As Integer
For i = 1 To ListViajesSalida.ListItems.Count
    If Not Item.Index = i Then
        ListViajesSalida.ListItems(i).Checked = False
    End If
Next i
End Sub

Private Sub ListViajesRegreso_ItemCheck(ByVal Item As MSComctlLib.ListItem)
Dim i As Integer
For i = 1 To ListViajesRegreso.ListItems.Count
    If Not Item.Index = i Then
        ListViajesRegreso.ListItems(i).Checked = False
    End If
Next i
End Sub

Private Sub ListView7_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, y As Single)
      
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListView7.HitTest(x, y)
        If Not Item Is Nothing Then
            Set ListView7.SelectedItem = Item
            PopupMenu mnu_agenda_list
        End If
    End If
End Sub

Private Sub ListViajesSalida_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, y As Single)
      
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListViajesSalida.HitTest(x, y)
        If Not Item Is Nothing Then
            Set ListViajesSalida.SelectedItem = Item
            PopupMenu mnu_cambiar_combi_mercedes
        End If
    End If
End Sub

Private Sub ListViajesRegreso_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, y As Single)
      
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListViajesRegreso.HitTest(x, y)
        If Not Item Is Nothing Then
            Set ListViajesRegreso.SelectedItem = Item
            PopupMenu mnu_cambiar_combi_bsas
        End If
    End If
End Sub

Private Sub ListView14_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, y As Single)
      
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListView14.HitTest(x, y)
        If Not Item Is Nothing Then
            Set ListView14.SelectedItem = Item
            PopupMenu mnu_pasajes_ocupados
        End If
    End If
End Sub

Private Sub ListView15_MouseDown(Button As Integer, _
                                Shift As Integer, _
                                x As Single, y As Single)
      
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListView15.HitTest(x, y)
        If Not Item Is Nothing Then
            Set ListView15.SelectedItem = Item
            PopupMenu mnu_pasajes_espera
        End If
    End If
End Sub

Private Sub ListViajesSalida_DblClick()
If ListViajesSalida.ListItems.Count > 0 Then
If ListViajesSalida.SelectedItem.Index > 0 Then
    Call OcultarFrames(VENDER_PASAJE)
    lblId.Caption = ListViajesSalida.SelectedItem.Tag
    lblHora.Caption = "Hora: " + ListViajesSalida.SelectedItem.Text
    lblCapacidad.Caption = ListViajesSalida.SelectedItem.ListSubItems(2).Text
    lblDestino.Caption = "Destino: Buenos Aires"
    Call pintarEncabezadoPasaje(16711680)
    lblciudad.Caption = 0
    lblDia.Caption = "Dia: " & MonthView1.Value
    Call cargarPasajesViajes(ListView14, ListView15, ListViajesSalida.SelectedItem.Tag, ListViajesSalida.SelectedItem.ListSubItems(2).Text)
    Call cargarParadasComboMercedes(Combo4)
    Call cargarClientesCombo(Combo3)
    Text17.Text = vbNullString
    Text18.Text = vbNullString
End If
End If
End Sub

Private Sub ListView8_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView9_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListViajesRegreso_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView11_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListSalidaPorPersona_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListRegresoPorPersona_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView14_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView15_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView11_Click()
If DiaSemana(0).Value = True Then DiaSemana(0).Value = False
DiaSemana(0).Value = True
End Sub

Private Sub ListSalidaPorPersona_ItemCheck(ByVal Item As MSComctlLib.ListItem)
If Item.Checked Then
    Call agregarViajesFijos(ListView11.SelectedItem.Text, Item.Tag)
Else
    Call quitarViajesFijos(ListView11.SelectedItem.Text, Item.Tag)
End If
End Sub

Private Sub ListRegresoPorPersona_ItemCheck(ByVal Item As MSComctlLib.ListItem)
If Item.Checked Then
    Call agregarViajesFijos(ListView11.SelectedItem.Text, Item.Tag)
Else
    Call quitarViajesFijos(ListView11.SelectedItem.Text, Item.Tag)
End If
End Sub

Private Sub ListView2_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView2.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar una combi?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarCombi(ListView2.ListItems(ListView2.SelectedItem.Index).Text)
        Call cargarCombis(ListView2)
    End If
End If
End Sub

Private Sub ListView3_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView3.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar una parada?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarParada(ListView3.ListItems(ListView3.SelectedItem.Index).Text)
        Call cargarParadas(ListView3, 0)
    End If
End If
End Sub

Private Sub ListView4_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView4.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar una parada?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarParada(ListView4.ListItems(ListView4.SelectedItem.Index).Text)
        Call cargarParadas(ListView4, 1)
    End If
End If
End Sub

Private Sub ListView5_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView5.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un grupo?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarGrupo(ListView5.ListItems(ListView5.SelectedItem.Index).Text)
        Call cargarGrupos(ListView5)
    End If
End If
End Sub

Private Sub ListView6_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView6.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un viaje fijo?", vbYesNo, "Estrella Tour") = vbYes Then
        Dim i As Integer
        For i = 0 To 7
            If DiaSemanaMercedes(i).Value = True Then Exit For
        Next i
        Call eliminarViajeFijo(ListView6.ListItems(ListView6.SelectedItem.Index).Text)
        Call cargarViajesFijos(ListView6, i, 0)
    End If
End If
End Sub

Private Sub ListView7_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView7.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un cliente?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarCliente(ListView7.ListItems(ListView7.SelectedItem.Index).Text)
        Call cargarClientes(ListView7, Val(numeroPagina.Caption), Text7.Text)
    End If
End If
End Sub

Private Sub ListViajesSalida_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListViajesSalida.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un viaje?", vbYesNo, "Estrella Tour") = vbYes Then
        Call eliminarViaje(ListViajesSalida.SelectedItem.Tag)
        Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
    End If
End If
End Sub

Private Sub ListView14_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView14.ListItems.Count > 0 Then
    VENDER_PASAJE.Enabled = False
    EL_PASAJE.Visible = True
    lblIdEliminar.Caption = ListView14.SelectedItem.SubItems(1)
    lblDescripEliminar.Caption = "Borrar a " & ListView14.SelectedItem.SubItems(3) & " del viaje del " & lblDia.Caption & " " & lblHora.Caption
    lblNombreEliminar.Caption = ListView14.SelectedItem.SubItems(3)
    RazonEliminar(1).Value = True
    Text23.Text = vbNullString
End If
End Sub

Private Sub ListView15_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView15.ListItems.Count > 0 Then
    VENDER_PASAJE.Enabled = False
    EL_PASAJE.Visible = True
    lblIdEliminar.Caption = ListView15.SelectedItem.SubItems(1)
    lblDescripEliminar.Caption = "Borrar a " & ListView15.SelectedItem.SubItems(2) & " del viaje del " & lblDia.Caption & " " & lblHora.Caption
    lblNombreEliminar.Caption = ListView15.SelectedItem.SubItems(2)
    RazonEliminar(1).Value = True
    Text23.Text = vbNullString
End If
End Sub

Private Sub ListView9_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView9.ListItems.Count > 0 Then
    If MsgBox("¿Esta seguro que desea eliminar un viaje fijo?", vbYesNo, "Estrella Tour") = vbYes Then
        Dim i As Integer
        For i = 0 To 7
            If DiaSemanaBsAs(i).Value = True Then Exit For
        Next i
        Call eliminarViajeFijo(ListView9.ListItems(ListView9.SelectedItem.Index).Text)
        Call cargarViajesFijos(ListView9, i, 1)
    End If
End If
End Sub

Private Sub mnu_ag_viaje_fijo_cliente_Click()
MsgBox "En construccion."
End Sub

Private Sub mnu_agregar_usuario_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(AG_USUARIO)
Text33.Text = vbNullString
Text34.Text = vbNullString
End Sub

Private Sub mnu_bsas_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(PARADA_BSAS)
Call cargarParadas(ListView4, 1)
End Sub

Private Sub mnu_cambiar_contraseña_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(CAMBIAR_CONTRA)
Text31.Text = vbNullString
Text32.Text = vbNullString
Text24.Text = vbNullString
End Sub

Private Sub mnu_choferes_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(CHOFER)
Call cargarChoferes(ListView1)
End Sub

Private Sub mnu_combis_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(COMBI)
Call cargarCombis(ListView2)
End Sub

Private Sub mnu_desconectarse_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(LOGUEO)
Text28.Text = vbNullString
Text30.Text = vbNullString
IdUsuario_Sistema = -1
Usuario_Sistema = vbNullString
Permisos_Sistema = -1
Logueado = False
Me.Caption = "Desconectado"
mnu_agregar_usuario.Visible = False
End Sub

Private Sub mnu_feriados_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(AG_FERIADO)
Call cargarFeriados(ListView17)
MonthView2.Value = Date
End Sub

Private Sub mnu_grupos_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(GRUPO)
Call cargarGrupos(ListView5)
End Sub

Private Sub mnu_imprimir_clientes_fijos_Click()
Call ImprimirListadoClientesFijos
End Sub

Private Sub mnu_mercedes_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(PARADA_MERCEDES)
Call cargarParadas(ListView3, 0)
End Sub

Private Sub mnu_cambiar_combi_bsas_sub_click()
CA_COMBI.Visible = True
Call cargarCombisCombo(Combo7)
lblIdCambiarCombi.Caption = ListViajesRegreso.SelectedItem.Tag
Combo7.Text = ListViajesRegreso.SelectedItem.SubItems(1)
VENTA_PASAJES.Enabled = False
End Sub

Private Sub mnu_cambios_viaje_bsas_click()
CAMBIOS_VIAJE.Visible = True
Call cargarBajasViaje(ListView8, ListViajesRegreso.SelectedItem.Tag)
Call cargarAltasViaje(ListView10, ListViajesRegreso.SelectedItem.Tag)
lblInfoCambio.Caption = "Cambios en el viaje de las " & ListViajesRegreso.SelectedItem.Text & " del dia " & MonthView1.Value
VENTA_PASAJES.Enabled = False
End Sub

Private Sub mnu_cambios_viaje_mercedes_click()
CAMBIOS_VIAJE.Visible = True
Call cargarBajasViaje(ListView8, ListViajesSalida.SelectedItem.Tag)
Call cargarAltasViaje(ListView10, ListViajesSalida.SelectedItem.Tag)
lblInfoCambio.Caption = "Cambios en el viaje de las " & ListViajesSalida.SelectedItem.Text & " del dia " & MonthView1.Value
VENTA_PASAJES.Enabled = False
End Sub

Private Sub mnu_cambiar_combi_mercedes_sub_click()
CA_COMBI.Visible = True
Call cargarCombisCombo(Combo7)
lblIdCambiarCombi.Caption = ListViajesSalida.SelectedItem.Tag
Combo7.Text = ListViajesSalida.SelectedItem.SubItems(1)
VENTA_PASAJES.Enabled = False
End Sub

Private Sub mnu_pasajes_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(VENTA_PASAJES)
ListViajesSalida.ListItems.Clear
ListViajesRegreso.ListItems.Clear
MonthView1.Value = Date
Call MonthView1_DateClick(Date)
VENTA_PASAJES.Enabled = True
End Sub

Private Sub mnu_ver_agenda_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(AGENDA)
Call cargarClientes(ListView7, 1, "")
End Sub

Private Sub mnu_pintar_pasaje_ocupado_Click()
ColorOcupado.ShowColor
Call pintarPasaje(ListView14.SelectedItem.SubItems(1), ColorOcupado.Color)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub

Private Sub mnu_pintar_pasaje_espera_Click()
ColorEspera.ShowColor
Call pintarPasaje(ListView15.SelectedItem.SubItems(1), ColorEspera.Color)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub

Private Sub mnu_mod_agenda_Click()
Call OcultarFrames(MO_CLIENTE)
Call cargarClienteModificar(ListView7.SelectedItem.Text)
End Sub

Private Sub mnu_ver_historial_Click()
Call OcultarFrames(HISTORIAL)
Razones(0).Value = False
Razones(0).Value = True
End Sub

Private Sub mnu_viajes_fijos_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(AG_VIAJES_FIJOS)
lblInformacion(57).Visible = False
lblInformacion(58).Visible = False
ListSalidaPorPersona.Visible = False
ListRegresoPorPersona.Visible = False
Call cargarClientesVFC(ListView11, 1, "")
End Sub

Private Sub MonthView1_DateClick(ByVal DateClicked As Date)
lblDiaClikeado.Caption = UCase(FormatDateTime(MonthView1.Value, vbLongDate))
If MonthView1.Value >= Date Then Call verificarViajes(MonthView1.Value)
Call cargarViajes(ListViajesSalida, ListViajesRegreso, MonthView1.Value)
End Sub

Private Sub name_fijo_mercedes_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(VIAJES_FIJOS_MERCEDES)
DiaSemanaMercedes(0).Value = True
End Sub

Private Sub nme_Fijos_BsAS_Click()
If Not Logueado Then Exit Sub
Call OcultarFrames(VIAJES_FIJOS_BSAS)
DiaSemanaBsAs(0).Value = True
End Sub

Public Sub AutoCompletar(ComboX As ComboBox, KeyCode As Integer, Shift As Integer)
Dim LenText As Long, ret As Long
     
   'Si los caracteres presionados están entre el 0 y la Z
   If KeyCode >= vbKey0 And KeyCode <= vbKeyNumpad9 Then
     
   ret = SendMessage(ComboX.hwnd, &H14C&, -1, ByVal ComboX.Text)
     
         If ret >= 0 Then
            LenText = Len(ComboX.Text)
            ComboX.ListIndex = ret
            ComboX.Text = ComboX.List(ret)
            ComboX.SelStart = LenText
            ComboX.SelLength = Len(ComboX.Text) - LenText
              
         End If
   End If
End Sub

Private Sub Combo1_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo1, KeyCode, Shift)
End Sub

Private Sub Combo2_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo2, KeyCode, Shift)
End Sub

Private Sub Combo3_KeyUp(KeyCode As Integer, Shift As Integer)
'Call cargarClientesCombo(Combo3, Combo3.Text)
Call AutoCompletar(Combo3, KeyCode, Shift)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Combo4_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo4, KeyCode, Shift)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Combo5_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo5, KeyCode, Shift)
End Sub

Private Sub Combo6_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo6, KeyCode, Shift)
End Sub

Private Sub Combo7_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo7, KeyCode, Shift)
End Sub

Private Sub primerPagina_Click()
Call cargarClientes(ListView7, 1, Text7.Text)
End Sub

Private Sub Razones_Click(Index As Integer)
Call cargarHistorialCliente(1, ListView7.SelectedItem.Text, ListView7.SelectedItem.SubItems(1), ListView7.SelectedItem.SubItems(2), Index)
End Sub

Private Sub siguientePagina_Click()
Call cargarClientes(ListView7, Val(numeroPagina.Caption) + 1, Text7.Text)
End Sub

Private Sub Text17_GotFocus()
Text17.SelStart = Len(Text17.Text)
End Sub

Private Sub Text17_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Text18_GotFocus()
Text18.SelStart = Len(Text18.Text)
End Sub

Private Sub Text18_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Text22_GotFocus()
Text22.SelStart = Len(Text22.Text)
End Sub

Private Sub Text22_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Timer1_Timer()
If ConexionBD.State = adStateClosed Then
    Call conectarBaseDatos
End If
End Sub

Private Sub ultimaPagina_Click()
Call cargarClientes(ListView7, Val(cantidadPaginas.Caption), Text7.Text)
End Sub

Private Sub cSubLV_AfterEdit( _
    ByVal Columna As Integer, _
    Cancel As Boolean, _
    Value As Variant)
        
    If Columna = 4 Then
       If Value = "" Then
          Cancel = True
          cSubLV.SowToolTipText "Error !", "El valor de este campo no puede ser un valor nulo o vacio", TTIconWarning, TTBalloon
       End If
    End If
End Sub

Private Sub cSubLV_beforeEdit(ByVal Columna As Integer, Cancel As Boolean)
    If Not Columna = 4 Then
       Cancel = True
       cSubLV.SowToolTipText "Información", "Esta columna es de solo lectura y no se puede editar", TTIconInfo
    End If
End Sub

Private Sub cSubLV_KeyPress(ByVal Columna As Integer, Cancel As Boolean, KeyAscii As Integer)
    If Columna = 4 Then
       If Not IsNumeric(Chr(KeyAscii)) Then
          Cancel = True
      End If
    End If
End Sub

Private Sub Form_Load()
    Me.Caption = "Desconectado"
    Maximizar Me.hwnd, WS_MAXIMIZEBOX, False
    Dim ScaleFactorX As Single, ScaleFactorY As Single  ' Scaling factors
    ' Size of Form in Pixels at design resolution
    DesignX = 1024
    DesignY = 768
    RePosForm = True   ' Flag for positioning Form
    DoResize = False   ' Flag for Resize Event
    '' Set up the screen values
    Xtwips = Screen.TwipsPerPixelX
    Ytwips = Screen.TwipsPerPixelY
    Ypixels = Screen.Height / Ytwips ' Y Pixel Resolution
    Xpixels = Screen.Width / Xtwips  ' X Pixel Resolution'''

    'Determine scaling factors
    ScaleFactorX = (Xpixels / DesignX)
    ScaleFactorY = (Ypixels / DesignY)
    ScaleMode = 1  ' twips
    'Exit Sub  ' uncomment to see how Form1 looks without resizing
    Resize_For_Resolution ScaleFactorX, ScaleFactorY, Me
    MyForm.Height = Me.Height ' Remember the current size
    MyForm.Width = Me.Width
End Sub

    Private Sub Form_Resize()
    'Dim ScaleFactorX As Single, ScaleFactorY As Single

    'If Not DoResize Then  ' To avoid infinite loop
    '   DoResize = True
    '   Exit Sub
    'End If
    
    'RePosForm = False
    'ScaleFactorX = Me.Width / MyForm.Width   ' How much change?
    'ScaleFactorY = Me.Height / MyForm.Height
    'Resize_For_Resolution ScaleFactorX, ScaleFactorY, Me
    'MyForm.Height = Me.Height ' Remember the current size
    'MyForm.Width = Me.Width
    End Sub


Private Sub Form_Unload(Cancel As Integer)
    Call desconectarBaseDatos
    'Set cSubLV = Nothing
End Sub

