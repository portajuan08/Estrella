VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FormularioRegreso 
   Caption         =   "Formulario Regreso"
   ClientHeight    =   10950
   ClientLeft      =   120
   ClientTop       =   -450
   ClientWidth     =   15120
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
   ScaleHeight     =   10950
   ScaleWidth      =   15120
   WindowState     =   2  'Maximized
   Begin VB.Frame PASAR_OCUPADO 
      Caption         =   "Indique la Parada"
      Height          =   2175
      Left            =   5513
      TabIndex        =   36
      Top             =   4388
      Visible         =   0   'False
      Width           =   4095
      Begin VB.ComboBox Combo8 
         Height          =   555
         Left            =   120
         TabIndex        =   39
         Top             =   720
         Width           =   3855
      End
      Begin VB.CommandButton Command31 
         Caption         =   "Aceptar"
         Height          =   435
         Left            =   2160
         TabIndex        =   38
         Top             =   1560
         Width           =   1815
      End
      Begin VB.CommandButton Command30 
         Caption         =   "Cancelar"
         Height          =   435
         Left            =   120
         TabIndex        =   37
         Top             =   1560
         Width           =   1815
      End
   End
   Begin VB.Frame ED_PASAJE 
      Caption         =   "Editar Pasaje"
      Height          =   7695
      Left            =   2693
      TabIndex        =   52
      Top             =   1628
      Visible         =   0   'False
      Width           =   9735
      Begin VB.ComboBox Combo10 
         Height          =   555
         Left            =   240
         TabIndex        =   58
         Top             =   2880
         Width           =   4215
      End
      Begin VB.TextBox Text27 
         Height          =   555
         Left            =   240
         TabIndex        =   57
         Top             =   4320
         Width           =   4215
      End
      Begin VB.CommandButton Command34 
         Caption         =   "Editar"
         Height          =   615
         Left            =   6053
         TabIndex        =   56
         Top             =   6840
         Width           =   3135
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Reserva Pasaje"
         Height          =   435
         Left            =   240
         TabIndex        =   55
         Top             =   5280
         Width           =   3855
      End
      Begin VB.TextBox Text35 
         Height          =   3735
         Left            =   4680
         TabIndex        =   54
         Top             =   2880
         Width           =   4695
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Factura"
         Height          =   435
         Left            =   240
         TabIndex        =   53
         Top             =   6120
         Width           =   3855
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Parada"
         Height          =   495
         Index           =   34
         Left            =   240
         TabIndex        =   63
         Top             =   2160
         Width           =   4215
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Precio"
         Height          =   495
         Index           =   35
         Left            =   240
         TabIndex        =   62
         Top             =   3600
         Width           =   4215
      End
      Begin VB.Label Label25 
         Caption         =   "X"
         Height          =   495
         Left            =   9360
         TabIndex        =   61
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblInfoVenta 
         Caption         =   "El pasaje fue vendido por SISTEMA a las 26/02/2017 15:04"
         Height          =   1215
         Left            =   480
         TabIndex        =   60
         Top             =   720
         Width           =   8895
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Observación"
         Height          =   375
         Index           =   76
         Left            =   4680
         TabIndex        =   59
         Top             =   2160
         Width           =   4935
      End
   End
   Begin VB.Frame EL_PASAJE 
      Caption         =   "Borrar Pasaje"
      Height          =   8055
      Left            =   2933
      TabIndex        =   40
      Top             =   1448
      Visible         =   0   'False
      Width           =   9255
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "No Aviso"
         Height          =   435
         Index           =   1
         Left            =   3000
         TabIndex        =   46
         Top             =   1800
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "Cambio de Horario"
         Height          =   435
         Index           =   2
         Left            =   3000
         TabIndex        =   45
         Top             =   2280
         Width           =   3855
      End
      Begin VB.OptionButton RazonEliminar 
         Caption         =   "Aviso con Tiempo"
         Height          =   435
         Index           =   3
         Left            =   3000
         TabIndex        =   44
         Top             =   2880
         Width           =   4095
      End
      Begin VB.TextBox Text23 
         Height          =   1695
         Left            =   3000
         TabIndex        =   43
         Top             =   3840
         Width           =   5895
      End
      Begin VB.CommandButton Command27 
         Caption         =   "Eliminar"
         Height          =   615
         Left            =   6600
         TabIndex        =   42
         Top             =   6960
         Width           =   2295
      End
      Begin VB.CommandButton Command28 
         Caption         =   "Cancelar"
         Height          =   615
         Left            =   480
         TabIndex        =   41
         Top             =   6960
         Width           =   2295
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Razon"
         Height          =   495
         Index           =   37
         Left            =   360
         TabIndex        =   51
         Top             =   1800
         Width           =   1335
      End
      Begin VB.Label lblInformacion 
         Caption         =   "Observación"
         Height          =   495
         Index           =   38
         Left            =   480
         TabIndex        =   50
         Top             =   3840
         Width           =   2535
      End
      Begin VB.Label lblIdEliminar 
         Height          =   495
         Left            =   480
         TabIndex        =   49
         Top             =   1200
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.Label lblDescripEliminar 
         Height          =   1095
         Left            =   240
         TabIndex        =   48
         Top             =   480
         Width           =   8655
      End
      Begin VB.Label lblNombreEliminar 
         Height          =   495
         Left            =   240
         TabIndex        =   47
         Top             =   3000
         Visible         =   0   'False
         Width           =   1455
      End
   End
   Begin VB.Frame VENDER_PASAJE 
      Caption         =   "Vender Pasaje"
      Height          =   10455
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Visible         =   0   'False
      Width           =   15135
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
         TabIndex        =   8
         Top             =   2160
         Width           =   1935
      End
      Begin MSComDlg.CommonDialog ColorOcupado 
         Left            =   9480
         Top             =   5040
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MSComDlg.CommonDialog ColorEspera 
         Left            =   9480
         Top             =   4320
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MSComctlLib.ListView ListView15 
         Height          =   6495
         Left            =   10005
         TabIndex        =   30
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
      Begin MSComctlLib.ListView ListView14 
         Height          =   6495
         Left            =   120
         TabIndex        =   21
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
         NumItems        =   12
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "N"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Text            =   "F"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "ID"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   3
            Text            =   "Parada"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   4
            Text            =   "Cliente"
            Object.Width           =   7937
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   5
            Text            =   "Pre"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   6
            Text            =   "DNI"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   7
            Text            =   "Celular"
            Object.Width           =   4939
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Text            =   "vendedor"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Text            =   "fecha_venta"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Text            =   "Reserva Pasaje"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Text            =   "Observación"
            Object.Width           =   0
         EndProperty
      End
      Begin VB.CommandButton Command24 
         Caption         =   ">>"
         Height          =   435
         Left            =   9360
         TabIndex        =   6
         Top             =   7200
         Width           =   615
      End
      Begin VB.CommandButton Command23 
         Caption         =   "<<"
         Height          =   435
         Left            =   9360
         TabIndex        =   7
         Top             =   7800
         Width           =   615
      End
      Begin VB.Frame Frame9 
         Caption         =   "Pasajes"
         Height          =   1575
         Left            =   120
         TabIndex        =   9
         Top             =   1440
         Width           =   14895
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
            TabIndex        =   15
            Top             =   840
            Width           =   1935
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
            TabIndex        =   14
            Top             =   840
            Width           =   3615
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
            TabIndex        =   13
            Top             =   840
            Width           =   1695
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
            TabIndex        =   12
            Top             =   840
            Width           =   1215
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
            TabIndex        =   11
            Top             =   840
            Width           =   1455
         End
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
            TabIndex        =   10
            Top             =   720
            Width           =   1935
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Cliente"
            Height          =   375
            Index           =   59
            Left            =   120
            TabIndex        =   20
            Top             =   360
            Width           =   2535
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Parada"
            Height          =   375
            Index           =   60
            Left            =   3840
            TabIndex        =   19
            Top             =   360
            Width           =   1815
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Dni"
            Height          =   375
            Index           =   61
            Left            =   5880
            TabIndex        =   18
            Top             =   360
            Width           =   855
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Precio"
            Height          =   375
            Index           =   62
            Left            =   7680
            TabIndex        =   17
            Top             =   360
            Width           =   1335
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Celular"
            Height          =   375
            Index           =   63
            Left            =   9000
            TabIndex        =   16
            Top             =   360
            Width           =   2055
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Datos Viaje"
         Height          =   855
         Left            =   120
         TabIndex        =   22
         Top             =   600
         Width           =   14895
         Begin VB.Label lblHoraAux 
            Alignment       =   2  'Center
            Caption         =   "22:30 hs"
            Height          =   375
            Left            =   6960
            TabIndex        =   28
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label lblDiaAux 
            Caption         =   "Dia: 99/99/9999"
            Height          =   375
            Left            =   240
            TabIndex        =   25
            Top             =   360
            Width           =   6615
         End
         Begin VB.Label lblDestino 
            Alignment       =   2  'Center
            Caption         =   "Destino: Buenos Aires"
            Height          =   375
            Left            =   10440
            TabIndex        =   24
            Top             =   360
            Width           =   3975
         End
         Begin VB.Label lblCapacidad 
            Caption         =   "100"
            Height          =   375
            Left            =   9360
            TabIndex        =   23
            Top             =   360
            Width           =   975
         End
         Begin VB.Label lblInformacion 
            Caption         =   "Cap:"
            Height          =   375
            Index           =   77
            Left            =   8520
            TabIndex        =   27
            Top             =   360
            Width           =   855
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
            TabIndex        =   26
            Top             =   360
            Visible         =   0   'False
            Width           =   255
         End
         Begin VB.Label lblId 
            Height          =   375
            Left            =   600
            TabIndex        =   29
            Top             =   360
            Visible         =   0   'False
            Width           =   975
         End
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
         TabIndex        =   33
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Lista de Ocupados"
         Height          =   375
         Index           =   65
         Left            =   240
         TabIndex        =   32
         Top             =   3120
         Width           =   9015
      End
      Begin VB.Label lblInformacion 
         Alignment       =   2  'Center
         Caption         =   "Lista de Espera"
         Height          =   375
         Index           =   64
         Left            =   10080
         TabIndex        =   31
         Top             =   3120
         Width           =   4815
      End
   End
   Begin VB.Frame VENTA_PASAJES 
      Caption         =   "Venta de Pasajes"
      Height          =   6495
      Left            =   -67
      TabIndex        =   0
      Top             =   2228
      Visible         =   0   'False
      Width           =   15255
      Begin MSComCtl2.MonthView MonthView1 
         Height          =   4770
         Left            =   240
         TabIndex        =   1
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
         StartOfWeek     =   90505218
         TitleBackColor  =   -2147483646
         TitleForeColor  =   -2147483639
         TrailingForeColor=   -2147483632
         CurrentDate     =   42280
      End
      Begin MSComctlLib.ListView ListViajesRegreso 
         Height          =   4725
         Left            =   6120
         TabIndex        =   2
         Top             =   1320
         Visible         =   0   'False
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   8334
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
      Begin MSComctlLib.ListView ListViajesSalida 
         Height          =   4725
         Left            =   6120
         TabIndex        =   34
         Top             =   1320
         Visible         =   0   'False
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   8334
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
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   240
         TabIndex        =   3
         Top             =   600
         Width           =   5775
      End
      Begin VB.Label lblSalida 
         Alignment       =   2  'Center
         Caption         =   "SALIDA"
         ForeColor       =   &H00FF0000&
         Height          =   375
         Left            =   6240
         TabIndex        =   35
         Top             =   600
         Visible         =   0   'False
         Width           =   8775
      End
      Begin VB.Label lblRegreso 
         Alignment       =   2  'Center
         Caption         =   "REGRESO"
         ForeColor       =   &H00008000&
         Height          =   375
         Left            =   6240
         TabIndex        =   4
         Top             =   600
         Visible         =   0   'False
         Width           =   8775
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
End
Attribute VB_Name = "FormularioRegreso"
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
      
Private tipoCiudad As Integer '0-salida 1-regreso
Private Sub Combo3_GotFocus()
Combo3.SelStart = Len(Combo3.Text)
End Sub

Private Sub Combo3_LostFocus()
Call cargarDatosVentaPasajeroFormularioRegreso(Combo3.Text, lblId)
End Sub

Private Sub Combo3_KeyUp(KeyCode As Integer, Shift As Integer)
'Call cargarClientesCombo(Combo3, Combo3.Text)
Call AutoCompletar(Combo3, KeyCode, Shift)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Combo4_GotFocus()
Combo4.SelStart = Len(Combo4.Text)
End Sub

Private Sub Combo4_KeyUp(KeyCode As Integer, Shift As Integer)
Call AutoCompletar(Combo4, KeyCode, Shift)
If KeyCode = vbKeyF2 Then
    Call Command20_Click
End If
End Sub

Private Sub Command20_Click()
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
        Call ponerEnEspera(ListView14.SelectedItem.SubItems(2))
        Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
    End If
End If
End Sub

Private Sub Command27_Click()
Dim IdRazon As Integer
If RazonEliminar(1).Value = True Then IdRazon = 1
If RazonEliminar(2).Value = True Then IdRazon = 2
If RazonEliminar(3).Value = True Then IdRazon = 3
Call eliminarPasaje(lblIdEliminar.Caption, lblNombreEliminar.Caption, lblId.Caption, IdRazon, Text23.Text, EL_PASAJE, VENDER_PASAJE)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub

Private Sub Command28_Click()
EL_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Command30_Click()
PASAR_OCUPADO.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Command31_Click()
If ListView15.ListItems.Count > 0 Then
    If ListView15.SelectedItem.Index > 0 Then
        If ponerEnOcupado(ListView15.SelectedItem.SubItems(1), Combo8.Text, lblciudad.Caption) Then
            Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
            PASAR_OCUPADO.Visible = False
            VENDER_PASAJE.Enabled = True
        End If
    End If
End If
End Sub

Private Sub Command34_Click()
Dim idParada As Integer
idParada = obtenerIdParada(Combo10.Text, lblciudad.Caption)
If idParada = 0 Then MsgBox "Parada incorrecta.": Exit Sub
Call editarPasaje(ListView14.SelectedItem.ListSubItems(2), idParada, Text27.Text, Check1.Value, Check2.Value, Text35.Text)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
ED_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Form_Load()
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

Private Sub Label25_Click()
ED_PASAJE.Visible = False
VENDER_PASAJE.Enabled = True
End Sub

Private Sub Label45_Click()
VENDER_PASAJE.Visible = False
VENTA_PASAJES.Visible = True
Call cargarViajesBsAs(MonthView1.Value, ListViajesRegreso)
End Sub

Private Sub ListViajesRegreso_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListViajesRegreso_DblClick()
If ListViajesRegreso.ListItems.Count > 0 Then
If ListViajesRegreso.SelectedItem.Index > 0 Then
    Call OcultarFramesRegreso(VENDER_PASAJE)
    lblId.Caption = ListViajesRegreso.SelectedItem.Tag
    lblHoraAux.Caption = ListViajesRegreso.SelectedItem.Text + " hs"
    lblCapacidad.Caption = ListViajesRegreso.SelectedItem.ListSubItems(2).Text
    lblDestino.Caption = "Destino: Mercedes"
    Call pintarEncabezadoPasajeFormularioRegreso(32768)
    lblciudad.Caption = 1
    lblDiaAux.Caption = UCase(FormatDateTime(MonthView1.Value, vbLongDate))
    Call cargarPasajesViajes(ListView14, ListView15, ListViajesRegreso.SelectedItem.Tag, ListViajesRegreso.SelectedItem.ListSubItems(2).Text)
    Call cargarParadasComboBsAs(Combo4)
    Call cargarClientesCombo(Combo3)
    Text17.Text = vbNullString
    Text18.Text = vbNullString
End If
End If
End Sub

Private Sub ListViajesSalida_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListViajesSalida_DblClick()
If ListViajesSalida.ListItems.Count > 0 Then
If ListViajesSalida.SelectedItem.Index > 0 Then
    Call OcultarFrames(VENDER_PASAJE)
    lblId.Caption = ListViajesSalida.SelectedItem.Tag
    lblHoraAux.Caption = ListViajesSalida.SelectedItem.Text + " hs"
    lblCapacidad.Caption = ListViajesSalida.SelectedItem.ListSubItems(2).Text
    lblDestino.Caption = "Destino: Buenos Aires"
    Call pintarEncabezadoPasajeFormularioRegreso(16711680)
    lblciudad.Caption = 0
    lblDiaAux.Caption = UCase(FormatDateTime(MonthView1.Value, vbLongDate))
    Call cargarPasajesViajes(ListView14, ListView15, ListViajesSalida.SelectedItem.Tag, ListViajesSalida.SelectedItem.ListSubItems(2).Text)
    Call cargarParadasComboMercedes(Combo4)
    Call cargarClientesCombo(Combo3)
    Text17.Text = vbNullString
    Text18.Text = vbNullString
End If
End If
End Sub

Private Sub ListView14_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView14_DblClick()
ED_PASAJE.Visible = True
Dim i As Integer
For i = 0 To Combo4.ListCount - 1
    Combo10.AddItem Combo4.List(i)
Next i
Combo10.Text = ListView14.SelectedItem.SubItems(3)
Text27.Text = ListView14.SelectedItem.SubItems(5)
lblInfoVenta.Caption = "El pasaje fue vendido por " & ListView14.SelectedItem.SubItems(8) & " a las " & ListView14.SelectedItem.SubItems(9)
Check1.Value = IIf(ListView14.SelectedItem.SubItems(10) = "SI", 1, 0)
Check2.Value = IIf(ListView14.SelectedItem.SubItems(1) = "S", 1, 0)
Text35.Text = ListView14.SelectedItem.SubItems(11)
VENDER_PASAJE.Enabled = False
End Sub

Private Sub ListView14_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView14.ListItems.Count > 0 Then
    VENDER_PASAJE.Enabled = False
    EL_PASAJE.Visible = True
    lblIdEliminar.Caption = ListView14.SelectedItem.SubItems(2)
    lblDescripEliminar.Caption = "Borrar a " & ListView14.SelectedItem.SubItems(4) & " del viaje del " & lblDiaAux.Caption & " a las " & lblHoraAux.Caption
    lblNombreEliminar.Caption = ListView14.SelectedItem.SubItems(4)
    RazonEliminar(1).Value = True
    Text23.Text = vbNullString
End If
End Sub

Private Sub ListView14_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListView14.HitTest(X, Y)
        If Not Item Is Nothing Then
            Set ListView14.SelectedItem = Item
            PopupMenu mnu_pasajes_ocupados
        End If
    End If
End Sub

Private Sub ListView15_BeforeLabelEdit(Cancel As Integer)
Cancel = True
End Sub

Private Sub ListView15_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And ListView15.ListItems.Count > 0 Then
    VENDER_PASAJE.Enabled = False
    EL_PASAJE.Visible = True
    lblIdEliminar.Caption = ListView15.SelectedItem.SubItems(1)
    lblDescripEliminar.Caption = "Borrar a " & ListView15.SelectedItem.SubItems(2) & " del viaje del " & lblDiaAux.Caption & " a las " & lblHoraAux.Caption
    lblNombreEliminar.Caption = ListView15.SelectedItem.SubItems(2)
    RazonEliminar(1).Value = True
    Text23.Text = vbNullString
End If
End Sub

Private Sub ListView15_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'variable para el item seleccionado
    Dim Item As ListItem
    ' verifica que se presionó el botón derecho
    If Button = vbRightButton Then
        Set Item = ListView15.HitTest(X, Y)
        If Not Item Is Nothing Then
            Set ListView15.SelectedItem = Item
            PopupMenu mnu_pasajes_espera
        End If
    End If
End Sub

Private Sub MonthView1_DateClick(ByVal DateClicked As Date)
lblDiaClikeado.Caption = UCase(FormatDateTime(MonthView1.Value, vbLongDate))
If MonthView1.Value >= Date Then Call verificarViajes(MonthView1.Value)
If tipoCiudad = 0 Then
    Call cargarViajesMercedes(MonthView1.Value, ListViajesSalida)
Else
    Call cargarViajesBsAs(MonthView1.Value, ListViajesRegreso)
End If
End Sub

Public Sub SeleccionarDiaRegreso(ByVal DateCliked As Date)
tipoCiudad = 1
ListViajesRegreso.Visible = True
lblRegreso.Visible = True
ListViajesSalida.Visible = False
lblSalida.Visible = False
Call MonthView1_DateClick(DateCliked)
End Sub

Public Sub SeleccionarDiaSalida(ByVal DateCliked As Date)
tipoCiudad = 0
ListViajesRegreso.Visible = False
lblRegreso.Visible = False
ListViajesSalida.Visible = True
lblSalida.Visible = True
Call MonthView1_DateClick(DateCliked)
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

Private Sub mnu_pintar_pasaje_ocupado_Click()
ColorOcupado.ShowColor
Call pintarPasaje(ListView14.SelectedItem.SubItems(2), ColorOcupado.Color)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub

Private Sub mnu_pintar_pasaje_espera_Click()
ColorEspera.ShowColor
Call pintarPasaje(ListView15.SelectedItem.SubItems(1), ColorEspera.Color)
Call cargarPasajesViajes(ListView14, ListView15, lblId.Caption, lblCapacidad.Caption)
End Sub
