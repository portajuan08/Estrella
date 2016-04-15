Attribute VB_Name = "HistorialCliente"
Option Explicit

Public aRecSet As New ADODB.Recordset
Sub cargarHistorialCliente(numeroPag As Integer, id_cliente As String, nombre_cliente As String, dni_cliente As String, id_razon As Integer)
With Inicio
.ListView16.ListItems.Clear
Dim i, cantidadPag As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command
Dim rs As New ADODB.Recordset

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "paginasHistorialClientes"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("PaginaNumero", adInteger, adParamInput, , numeroPag)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_cliente", adInteger, adParamInput, , id_cliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_razon", adInteger, adParamInput, , id_razon)
Set aRecSet = cmdCommand.Execute


Dim Item As ListItem

.NOMBRE_HISTORIAL.Caption = "Nombre : " & nombre_cliente
.DNI_HISTORIAL.Caption = "DNI : " & dni_cliente
cantidadPag = 1
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    For i = 0 To UBound(Registros, 2)
        Set Item = .ListView16.ListItems.Add(, , IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
            Item.SubItems(2) = IIf(IIf(IsNull(Registros(3, i)), 0, Registros(3, i)) = 0, "SALIDA", "REGRESO")
            Item.SubItems(3) = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
            Item.SubItems(4) = IIf(IsNull(Registros(5, i)), vbNullString, Registros(5, i))
            Item.SubItems(5) = IIf(IsNull(Registros(6, i)), vbNullString, Registros(6, i))
        cantidadPag = Val(IIf(IsNull(Registros(7, i)), 0, Registros(7, i)))
    Next i
    Call actualizarPaginacionHistorial(numeroPag, cantidadPag)
Else
    Call actualizarPaginacionHistorial(1, 1)
End If
aRecSet.Close

End With
End Sub

Public Sub actualizarPaginacionHistorial(numeroPag As Integer, cantidadPag As Integer)

With Inicio
    .botonPaginar(4).Enabled = IIf(numeroPag > 1, True, False)
    .botonPaginar(5).Enabled = IIf(numeroPag > 1, True, False)
    .botonPaginar(6).Enabled = IIf(numeroPag < cantidadPag, True, False)
    .botonPaginar(7).Enabled = IIf(numeroPag < cantidadPag, True, False)
    .lblPaginaHistorial.Caption = numeroPag
    .lblCantidadPaginaHistorial.Caption = cantidadPag
End With

End Sub
