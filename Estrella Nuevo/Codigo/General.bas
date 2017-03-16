Attribute VB_Name = "General"
Option Explicit

Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpdefault As String, ByVal lpreturnedstring As String, ByVal nsize As Long, ByVal lpfilename As String) As Long
Public Declare Function writeprivateprofilestring Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpString As String, ByVal lpfilename As String) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" ( _
    ByVal hwnd As Long, _
    ByVal wMsg As Long, _
    ByVal wParam As Long, _
    lParam As Any) As Long

Sub Main()
Inicio.Show
Inicio.lblEstado = "Conectado a la Base de datos."
Call conectarBaseDatos
End Sub


Sub OcultarFrames(FrameX As Frame)
With Inicio
    .CHOFER.Visible = False
    .COMBI.Visible = False
    .PARADA_MERCEDES.Visible = False
    .PARADA_BSAS.Visible = False
    .VIAJES_FIJOS_MERCEDES.Visible = False
    .VIAJES_FIJOS_BSAS.Visible = False
    .AGENDA.Visible = False
    .VENTA_PASAJES.Visible = False
    .AG_CLIENTE.Visible = False
    .AG_VIAJES_FIJOS.Visible = False
    .VENDER_PASAJE.Visible = False
    .MO_CLIENTE.Visible = False
    .CA_COMBI.Visible = False
    .EL_PASAJE.Visible = False
    .HISTORIAL.Visible = False
    .AG_FERIADO.Visible = False
    .PASAR_OCUPADO.Visible = False
    .IMPRIMIR_VIAJE.Visible = False
    .CAMBIOS_VIAJE.Visible = False
    .ED_PASAJE.Visible = False
    .LOGUEO.Visible = False
    .CAMBIAR_CONTRA.Visible = False
    .AG_USUARIO.Visible = False
End With
FrameX.Visible = True
FrameX.Enabled = True
End Sub

Sub OcultarFramesRegreso(FrameX As Frame)
With FormularioRegreso
    .VENTA_PASAJES.Visible = False
    .VENDER_PASAJE.Visible = False
    .PASAR_OCUPADO.Visible = False
    .EL_PASAJE.Visible = False
    .ED_PASAJE.Visible = False
End With
FrameX.Visible = True
FrameX.Enabled = True
End Sub

Function obtenerNombreDia(dia As String) As String
If dia = 1 Then
    obtenerNombreDia = "Domingo"
ElseIf dia = 2 Then
    obtenerNombreDia = "Lunes"
ElseIf dia = 3 Then
    obtenerNombreDia = "Martes"
ElseIf dia = 4 Then
    obtenerNombreDia = "Miercoles"
ElseIf dia = 5 Then
    obtenerNombreDia = "Jueves"
ElseIf dia = 6 Then
    obtenerNombreDia = "Viernes"
ElseIf dia = 7 Then
    obtenerNombreDia = "Sabado"
End If
End Function

Function obtenerIndexCheck(ListViewX As ListView) As Integer
obtenerIndexCheck = 0
Dim i As Integer
For i = 1 To ListViewX.ListItems.Count
    If ListViewX.ListItems(i).Checked = True Then obtenerIndexCheck = i: Exit For
Next i
End Function


'Function de GetVar (Read Data).
Function LeerDato(ByVal file As String, ByVal Main As String, ByVal Var As String, Optional EmptySpaces As Long = 1024) As String
 
Dim sSpaces As String
Dim szReturn As String
 
szReturn = ""
sSpaces = Space$(EmptySpaces)
GetPrivateProfileString Main, Var, szReturn, sSpaces, EmptySpaces, file
LeerDato = RTrim$(sSpaces)
LeerDato = Left$(LeerDato, Len(LeerDato) - 1)
 
End Function
 
'Sub de WriteVar (Enter/Write Data).
Sub GrabarDato(ByVal file As String, ByVal Main As String, ByVal Var As String, ByVal Value As String)
 
writeprivateprofilestring Main, Var, Value, file
   
End Sub

Public Function ObtenerIndexRazon() As Integer
Dim i As Integer
ObtenerIndexRazon = 0
For i = 0 To Inicio.Razones.UBound
    If Inicio.Razones(i).Value = True Then ObtenerIndexRazon = i: Exit Function
Next i
End Function

Public Sub ListView_ColorearLinea(LaLista As ListView, Linea As Long, Color As Long)
Dim X As Integer

'Verifico si la linea que quiere modificar existe
If Linea > LaLista.ListItems.Count Then
    Exit Sub
End If

'modifico el color de la primer columna
LaLista.ListItems(Linea).ForeColor = Color

'modifico el color de las demas columnas
For X = 1 To LaLista.ColumnHeaders.Count - 1
    'verifico que el subitem tenga algo escrito, por que si no tiene nada tira
    'error de "subindice fuera de intervalo"
    If Trim(LaLista.SelectedItem.SubItems(X) <> "") Then
        LaLista.ListItems(Linea).ListSubItems(X).ForeColor = Color
    End If
Next X

'actualizo el list para que se vean los cambios
LaLista.Refresh
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
