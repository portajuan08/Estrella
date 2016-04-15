Attribute VB_Name = "Impresiones"
Option Explicit

Public aRecSet As New ADODB.Recordset

Sub agregarImpresion(id_viaje As String)

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarImpresion"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarBajasViaje(ListViewX As ListView, id_viaje As String)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "bajasViaje"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
            Item.SubItems(2) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
            Item.SubItems(3) = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
    Next i
End If
aRecSet.Close
End Sub

Sub cargarAltasViaje(ListViewX As ListView, id_viaje As String)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "altasViaje"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
            Item.SubItems(2) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
            Item.SubItems(3) = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
    Next i
End If
aRecSet.Close
End Sub
