Attribute VB_Name = "Viajes"
Option Explicit

Public aRecSet As New ADODB.Recordset

Public Sub verificarViajes(dia As String)
Call verificarViajesBsAs(dia)
Call verificarViajesMercedes(dia)
End Sub

Sub verificarViajesMercedes(dia As String)
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "verificarViajesCreadosMercedes"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adDBTimeStamp, adParamInput, 8, dia)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("diaSemana", adInteger, adParamInput, , Weekday(dia))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Surgio un error con los viajes fijos Mercedes."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub


Sub verificarViajesBsAs(dia As String)
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "verificarViajesCreadosBsAs"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adDBTimeStamp, adParamInput, 8, dia)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("diaSemana", adInteger, adParamInput, , Weekday(dia))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Surgio un error con los viajes fijos Bs As."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub

Public Sub cargarViajes(ListViewMercedes As ListView, ListViewBsAs As ListView, dia As String)
Call cargarViajesMercedes(dia, ListViewMercedes)
Call cargarViajesBsAs(dia, ListViewBsAs)
End Sub

Public Sub cargarViajesMercedes(dia As String, ListViewX As ListView)
    Call cargarViajesCiudad(0, dia, ListViewX)
End Sub


Public Sub cargarViajesCiudad(Ciudad As Integer, dia As String, ListViewX As ListView)
    ListViewX.ListItems.Clear
    Dim i, iAsientos, iPasajesOcupados, iPasajesEspera As Integer
    Dim Registros() As Variant
    Dim cmdCommand As New ADODB.Command
    
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "cargarViajes"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("Ciudad", adInteger, adParamInput, , Ciudad)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adDBTimeStamp, adParamInput, , dia)
    Set aRecSet = cmdCommand.Execute
    If Not aRecSet.EOF Then
        Registros = aRecSet.GetRows()
    
        Dim Item As ListItem
        For i = 0 To UBound(Registros, 2)
            iAsientos = IIf(IsNull(Registros(3, i)), 0, Registros(3, i))
            iPasajesOcupados = iAsientos - IIf(IsNull(Registros(4, i)), 0, Registros(4, i))
            iPasajesEspera = IIf(IsNull(Registros(5, i)), 0, Registros(5, i))
            Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i)))
                Item.SubItems(1) = IIf(IsNull(Registros(2, i)), 0, Registros(2, i))
                Item.SubItems(2) = iAsientos
                Item.SubItems(3) = iPasajesOcupados
                Item.SubItems(4) = iPasajesEspera
                Item.Tag = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
        Next i
    End If
    aRecSet.Close
End Sub

Public Sub cargarViajesBsAs(dia As String, ListViewX As ListView)
    Call cargarViajesCiudad(1, dia, ListViewX)
End Sub

Sub eliminarViaje(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "eliminarViaje"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adBigInt, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Viaje eliminado Correctamente."
Else
 MsgBox "Ocurrio un error al eliminar el viaje."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

Sub agregarViaje(dia As String, Hora As String, Minuto As String, Patente As String, Ciudad As Integer)
If Patente = vbNullString Or Patente = "" Then MsgBox "Escriba una patente.": Exit Sub

If Len(Hora) = 1 Then Hora = "0" & Hora
If Len(Minuto) = 1 Then Minuto = "0" & Minuto
Dim Horario As String
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

Horario = Hora & ":" & Minuto

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarViaje"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("hora", adVarChar, adParamInput, 5, Horario)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adDate, adParamInput, , dia)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("patente", adVarChar, adParamInput, 6, Patente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ciudad", adInteger, adParamInput, , Ciudad)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Viaje agregado Correctamente."
Else
 MsgBox "La patente indicada no esta asignada a ninguna combi."
End If
Set cmdCommand.ActiveConnection = Nothing

End Sub


Public Sub cambiarCombiViaje(IdViaje As String, COMBI As String)
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command
cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "modificarCombiViaje"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idViaje", adBigInt, adParamInput, , IdViaje)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("patente", adVarChar, adParamInput, 6, COMBI)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Combi del viaje modificada correctamente."
Else
 MsgBox "La patente indicada no esta asignada a ninguna combi."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub
