Attribute VB_Name = "ViajesFijos"
Option Explicit

Public aRecSet As New ADODB.Recordset

Sub agregarViajeFijo(Hora As String, Minuto As String, dia As Integer, Patente As String, Ciudad As Integer)
If Patente = vbNullString Or Patente = "" Then MsgBox "Escriba una patente.": Exit Sub

If Len(Hora) = 1 Then Hora = "0" & Hora
If Len(Minuto) = 1 Then Minuto = "0" & Minuto
Dim Horario As String
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

Horario = Hora & ":" & Minuto

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarViajeFijo"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("hora", adVarChar, adParamInput, 5, Horario)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia_semana", adInteger, adParamInput, , dia)
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


Sub cargarViajesFijos(ListViewX As ListView, dia As Integer, Ciudad As Integer)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarViajesFijos"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("Ciudad", adInteger, adParamInput, , Ciudad)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adInteger, adParamInput, , dia)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)))
        Item.SubItems(1) = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
        Item.SubItems(2) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
        Item.SubItems(3) = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
        Item.SubItems(4) = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
    Next i
End If
aRecSet.Close
End Sub

Sub eliminarViajeFijo(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "eliminarViajeFijo"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ahora", adDate, adParamInput, , Date)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Viaje Eliminado Correctamente."
Else
 MsgBox "Ocurrio un error al eliminar el viaje."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

