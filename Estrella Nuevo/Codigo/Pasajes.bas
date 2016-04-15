Attribute VB_Name = "Pasajes"
Option Explicit

Public aRecSet As New ADODB.Recordset


Public Sub cargarPasajesViajes(ListViewTitular As ListView, ListViewSuplentes As ListView _
                              , IdViaje As String, Capacidad As Integer)
    ListViewTitular.ListItems.Clear
    ListViewSuplentes.ListItems.Clear
    Dim sSelectPasajes, sCiudad As String
    Dim i, iAsientos, iPasajes, iEspera, numeroTit As Long, numeroSup As Long
    Dim enEspera As Boolean
    Dim Registros() As Variant
    Dim cmdCommand As New ADODB.Command
    
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "cargarPasajesViaje"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("idViaje", adBigInt, adParamInput, , IdViaje)
    Set aRecSet = cmdCommand.Execute
    If Not aRecSet.EOF Then
        Registros = aRecSet.GetRows()
        numeroTit = 0
        numeroSup = 0
        Dim Item As ListItem
        For i = 0 To UBound(Registros, 2)
            If Not Registros(1, i) Then
                numeroTit = numeroTit + 1
                
                Set Item = ListViewTitular.ListItems.Add(, , numeroTit)
                Item.SubItems(1) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
                Item.SubItems(2) = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
                Item.SubItems(3) = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
                Item.SubItems(5) = IIf(IsNull(Registros(5, i)), vbNullString, Registros(5, i))
                Item.SubItems(4) = IIf(IsNull(Registros(7, i)), vbNullString, Registros(7, i))
                Item.SubItems(6) = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
                Call ListView_ColorearLinea(ListViewTitular, numeroTit, IIf(IsNull(Registros(8, i)), 0, Registros(8, i)))
            Else
                numeroSup = numeroSup + 1
                Set Item = ListViewSuplentes.ListItems.Add(, , numeroSup)
                Item.SubItems(1) = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
                Item.SubItems(2) = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
                Item.SubItems(3) = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
                Call ListView_ColorearLinea(ListViewSuplentes, numeroSup, IIf(IsNull(Registros(8, i)), 0, Registros(8, i)))
            End If
        Next i
    End If
    aRecSet.Close
End Sub

Public Sub venderPasajes(id_viaje As String, nombre_cliente As String, descripcion_parada As String _
                        , precio As Double, dni As String, celular As String, Ciudad As Integer, enEspera As Boolean)

Dim id_cliente, resultado, id_parada As Integer
id_parada = obtenerIdParada(descripcion_parada, Ciudad)
id_cliente = obtener_id_cliente(nombre_cliente, descripcion_parada, precio, dni, celular, Ciudad)
If id_cliente = 0 Or id_parada = 0 Then
    MsgBox "Ocurrio un error al querer crear el nuevo cliente o modificar los datos."
Else
        Dim cmdCommand As New ADODB.Command
    
        cmdCommand.ActiveConnection = ConexionBD
        cmdCommand.CommandType = adCmdStoredProc
        cmdCommand.CommandText = "venderPasaje"
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_cliente", adInteger, adParamInput, , id_cliente)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("precio", adDouble, adParamInput, , precio)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_parada", adInteger, adParamInput, , id_parada)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("enEspera", adBoolean, adParamInput, , enEspera)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_usuario", adInteger, adParamInput, , IdUsuario_Sistema)
        cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
        cmdCommand.Execute
        resultado = cmdCommand("resultado")
        
        If (resultado = 1) Then
            MsgBox "Pasaje vendido Correctamente."
        ElseIf resultado = -1 Then
            If MsgBox("El cliente ya tiene un pasaje ese dia a las " & horaPasajeComprado(Str(id_cliente), id_viaje) & " ¿Desea cambiarlo?", vbYesNo) = vbYes Then
                Call cambiarPasaje(id_viaje, id_cliente, id_parada, precio)
            End If
        Else
            MsgBox "Ocurrio un error al vender el pasaje."
        End If
        Set cmdCommand.ActiveConnection = Nothing
    
End If
End Sub

Public Sub cambiarPasaje(id_viaje As String, ByVal id_cliente As Integer _
                        , id_parada As Integer, precio As Double)


    Dim cmdCommand As New ADODB.Command
    Dim resultado As Integer
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "cambiarPasaje"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_cliente", adInteger, adParamInput, , id_cliente)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("precio", adDouble, adParamInput, , precio)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_parada", adInteger, adParamInput, , id_parada)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_usuario", adInteger, adParamInput, , IdUsuario_Sistema)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
    cmdCommand.Execute
    resultado = cmdCommand("resultado")
    
    If (resultado = 1) Then
        MsgBox "Pasaje cambiado Correctamente."
    ElseIf resultado = -1 Then
        MsgBox "No hay lugar en la combi para cambiar este pasaje."
    Else
        MsgBox "Ocurrio un error al cambiar el pasaje."
    End If
    Set cmdCommand.ActiveConnection = Nothing

End Sub

Private Function horaPasajeComprado(id_cliente As String, id_viaje As String) As String
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "getHoraPasajeComprado"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idViaje", adBigInt, adParamInput, , id_viaje)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idCliente  ", adInteger, adParamInput, , id_cliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("hora", adVarChar, adParamOutput, 5)
cmdCommand.Execute
horaPasajeComprado = cmdCommand("hora")
End Function

Private Function horaPasajeCompradoAux(id_pasaje As String) As String
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "getHoraPasajeCompradoAux"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("idpasaje", adBigInt, adParamInput, , id_pasaje)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("hora", adVarChar, adParamOutput, 5)
cmdCommand.Execute
horaPasajeCompradoAux = cmdCommand("hora")
End Function

Public Sub eliminarPasaje(idPasaje As String, nombre_cliente As String, id_viaje As String, id_razon As Integer, observaciones As String)
If idPasaje = vbNullString Or idPasaje = "" Or idPasaje = " " Then Exit Sub
Dim cmdCommand As New ADODB.Command
Dim resultado As Integer
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "eliminarPasaje"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_pasaje", adBigInt, adParamInput, , idPasaje)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre_cliente", adVarChar, adParamInput, 80, nombre_cliente)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_viaje", adBigInt, adParamInput, , id_viaje)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_empleado", adInteger, adParamInput, , IdUsuario_Sistema)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_razon", adInteger, adParamInput, , id_razon)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("observaciones", adVarChar, adParamInput, 200, observaciones)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
    cmdCommand.Execute
    resultado = cmdCommand("resultado")
    
    If (resultado = 1) Then
        MsgBox "Pasaje Eliminado Correctamente."
        Inicio.EL_PASAJE.Visible = False
        Inicio.VENDER_PASAJE.Enabled = True
    Else
        MsgBox "Ocurrio un error al eliminar el pasaje."
    End If
    Set cmdCommand.ActiveConnection = Nothing
End Sub

Public Sub ponerEnEspera(idPasaje As String)
If idPasaje = vbNullString Or idPasaje = "" Or idPasaje = " " Then Exit Sub
ConexionBD.Execute "update pasajes set en_espera = 1, id_parada = null where id = " & idPasaje
End Sub

Public Function ponerEnOcupado(idPasaje As String, descripcion_parada As String) As Boolean
If idPasaje = vbNullString Or idPasaje = "" Or idPasaje = " " Then Exit Function
Dim idParada As Integer
idParada = obtenerIdParada(descripcion_parada, Inicio.lblciudad.Caption)
If idParada > 0 Then
    Dim cmdCommand As New ADODB.Command
    Dim resultado As Integer
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "ponerEnOcupado"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_pasaje", adBigInt, adParamInput, , idPasaje)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_parada", adInteger, adParamInput, , idParada)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
    cmdCommand.Execute
    resultado = cmdCommand("resultado")
    
    If (resultado <> 1) Then
        MsgBox "El cliente ya tiene un pasaje ese dia a las " & horaPasajeCompradoAux(idPasaje)
    End If
        
Else
    MsgBox "La parada seleccionada es incorrecta."
End If
ponerEnOcupado = idParada > 0
End Function

Public Function pintarEncabezadoPasaje(Color As Long)
With Inicio
    .Frame2.ForeColor = Color
    .Label39.ForeColor = Color
    .Label40.ForeColor = Color
    .lblId.ForeColor = Color
    .lblCapacidad.ForeColor = Color
    .lblDia.ForeColor = Color
    .lblHora.ForeColor = Color
    .lblDestino.ForeColor = Color
    .VENDER_PASAJE.ForeColor = Color
End With
End Function


Public Sub editarPasaje(idPasaje As String, idParada As Integer, precio As String)
ConexionBD.Execute "update pasajes set precio = " & precio & " ,id_parada = " & idParada & " where id = " & idPasaje
End Sub


Public Sub pintarPasaje(idPasaje As String, Color As Long)
    Dim cmdCommand As New ADODB.Command
    Dim resultado As Integer
    cmdCommand.ActiveConnection = ConexionBD
    cmdCommand.CommandType = adCmdStoredProc
    cmdCommand.CommandText = "pintarPasaje"
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_pasaje", adBigInt, adParamInput, , idPasaje)
    cmdCommand.Parameters.Append cmdCommand.CreateParameter("color", adBigInt, adParamInput, , Color)
    cmdCommand.Execute
    Set cmdCommand.ActiveConnection = Nothing
End Sub
