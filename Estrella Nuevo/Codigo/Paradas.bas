Attribute VB_Name = "Paradas"
Option Explicit

Public aRecSet As New ADODB.Recordset

Sub agregarParada(Parada As String, Ciudad As Integer)
If Parada = vbNullString Or Parada = "" Then MsgBox "Escriba una parada.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarParada"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("descripcion", adVarChar, adParamInput, 80, Parada)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ciudad", adInteger, adParamInput, , Ciudad)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Parada agregada Correctamente."
Else
 MsgBox "Ya existe una parada con ese nombre."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub


Sub cargarParadas(ListViewX As ListView, Ciudad As Integer)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarParadas"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("Ciudad", adInteger, adParamInput, , Ciudad)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Next i
End If
aRecSet.Close
End Sub

Sub eliminarParada(Id As String)
If Id = vbNullString Or Id = "" Then Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "eliminarParada"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Parada eliminada Correctamente."
Else
 MsgBox "Ocurrio un error al eliminar la parada."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub

Sub bajarOrdenParada(Id As String)
If Id = vbNullString Or Id = "" Then Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "bajarOrdenParada"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado <> 1) Then
 MsgBox "Ocurrio un error al cambiar el orden de la parada."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub

Sub subirOrdenParada(Id As String)
If Id = vbNullString Or Id = "" Then Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "subirOrdenParada"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado <> 1) Then
 MsgBox "Ocurrio un error al cambiar el orden de la parada."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub

Function obtenerIdParadaMercedes(ByVal Parada As String) As Integer
obtenerIdParadaMercedes = obtenerIdParada(Parada, 0)
End Function

Function obtenerIdParadaBsAs(ByVal Parada As String) As Integer
obtenerIdParadaBsAs = obtenerIdParada(Parada, 1)
End Function

Function obtenerIdParada(Parada As String, Ciudad As Integer) As Integer

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "obtenerIdParada"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ciudad", adInteger, adParamInput, , Ciudad)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("descripcion", adVarChar, adParamInput, 80, Parada)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
obtenerIdParada = cmdCommand("resultado")

End Function

Public Sub cargarParadasComboMercedes(ComboX As ComboBox)
Call cargarParadasCombo(ComboX, 0)
End Sub

Public Sub cargarParadasComboBsAs(ComboX As ComboBox)
Call cargarParadasCombo(ComboX, 1)
End Sub

Public Sub cargarParadasCombo(ComboX As ComboBox, Ciudad As Integer)
ComboX.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarParadas"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("Ciudad", adInteger, adParamInput, , Ciudad)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    For i = 0 To UBound(Registros, 2)
        ComboX.AddItem IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Next i
End If
aRecSet.Close
End Sub
