Attribute VB_Name = "ViajesFijosClientes"
Option Explicit

Public aRecSet As New ADODB.Recordset
Sub cargarClientesVFC(ListViewX As ListView, numeroPag As Integer, texto As String)
ListViewX.ListItems.Clear
Dim sSelectClientes As String
Dim i, cantidadPag As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command
Dim rs As New ADODB.Recordset

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "paginasClientes"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("PaginaNumero", adInteger, adParamInput, , numeroPag)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("NombreFiltro", adVarChar, adParamInput, 40, texto)
Set aRecSet = cmdCommand.Execute

cantidadPag = 1
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    
    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
        cantidadPag = Val(IIf(IsNull(Registros(6, i)), 0, Registros(6, i)))
    Next i
    Call actualizarPaginacion(numeroPag, cantidadPag)
Else
    Call actualizarPaginacion(1, 1)
End If
aRecSet.Close
End Sub

Public Sub actualizarPaginacion(numeroPag As Integer, cantidadPag As Integer)

With Inicio
    .botonPaginar(0).Enabled = IIf(numeroPag > 1, True, False)
    .botonPaginar(1).Enabled = IIf(numeroPag > 1, True, False)
    .botonPaginar(2).Enabled = IIf(numeroPag < cantidadPag, True, False)
    .botonPaginar(3).Enabled = IIf(numeroPag < cantidadPag, True, False)
    .lblPaginaFijos.Caption = numeroPag
    .lblCantidadPaginasFijos.Caption = cantidadPag
End With

End Sub

Sub cargarViajesFijosVFC(ListViewX As ListView, Ciudad As Integer, dia As Integer)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarViajesFijosClientes"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("Ciudad", adInteger, adParamInput, , Ciudad)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adInteger, adParamInput, , dia)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
            Item.Tag = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
    Next i
End If
aRecSet.Close
End Sub

Sub marcarViajesFijos(ListViewX As ListView, id_cliente As String)

Dim i, k As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "marcarViajesFijosClientes"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idCliente", adInteger, adParamInput, , id_cliente)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem
    For i = 0 To UBound(Registros, 2)
        For k = 1 To ListViewX.ListItems.Count
            If ListViewX.ListItems(k).Tag = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)) Then
                ListViewX.ListItems(k).Checked = True
            End If
        Next k
    Next i
End If
aRecSet.Close
End Sub

Sub agregarViajesFijos(id_cliente As String, id_horario As String)

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarClienteAViajeFijo"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idCliente", adInteger, adParamInput, , id_cliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idViajeFijo", adInteger, adParamInput, , id_horario)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ahora", adDate, adParamInput, , Date)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Ocurrio un error al asignar el viaje fijo a este cliente."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

Sub quitarViajesFijos(id_cliente As String, id_horario As String)

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "eliminarClienteAViajeFijo"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idCliente", adInteger, adParamInput, , id_cliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idViajeFijo", adInteger, adParamInput, , id_horario)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("ahora", adDate, adParamInput, , Date)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Ocurrio un error al eliminar el viaje fijo a este cliente."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

