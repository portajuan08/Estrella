Attribute VB_Name = "Clientes"
Option Explicit
Public aRecSet As New ADODB.Recordset
Public nombreClientes() As Variant
Sub agregarCliente(Nombre As String, dni As String, Sexo As Byte, _
                   Mail As String, Direccion As String, paradamercedes As String, _
                   paradabsas As String, PrecioMercedes As String, PrecioBsAs As String, _
                   celular As String, Casa As String, observaciones As String, mensual As Byte)

Dim idParadaBsAs, idParadaMercedes As Integer

If Nombre = vbNullString And Nombre = " " Then MsgBox "El nombre no puede quedar vacio.": Exit Sub
If paradamercedes = vbNullString And paradamercedes = " " Then MsgBox "La parada de mercedes no puede quedar vacio.": Exit Sub
If paradabsas = vbNullString And paradabsas = " " Then MsgBox "La parada de buenos aires no puede quedar vacio.": Exit Sub
idParadaMercedes = obtenerIdParadaMercedes(paradamercedes)
idParadaBsAs = obtenerIdParadaBsAs(paradabsas)
If idParadaMercedes = 0 Then MsgBox "La parada de mercedes no existe o es incorrecta.": Exit Sub
If idParadaBsAs = 0 Then MsgBox "La parada de bsas no existe o es incorrecta.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarCliente"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 80, Nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dni", adVarChar, adParamInput, 16, dni)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("sexo", adInteger, adParamInput, , Sexo)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("mail", adVarChar, adParamInput, 80, Mail)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("direccion", adVarChar, adParamInput, 80, Direccion)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("paradaMer", adInteger, adParamInput, , idParadaMercedes)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("paradaBsAs", adInteger, adParamInput, , idParadaBsAs)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("precioMer", adDouble, adParamInput, , Val(PrecioMercedes))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("precioBsAs", adDouble, adParamInput, , Val(PrecioBsAs))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("celular", adVarChar, adParamInput, 18, celular)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("casa", adVarChar, adParamInput, 18, Casa)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("observaciones", adVarChar, adParamInput, 250, observaciones)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("mensual", adInteger, adParamInput, , mensual)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Cliente agregado Correctamente."
 Call limpiarAgregarCliente
Else
 MsgBox "Ya existe un cliente con ese nombre."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub


Sub modificarCliente(Id As String, Nombre As String, dni As String, Sexo As Byte, _
                   Mail As String, Direccion As String, paradamercedes As String, _
                   paradabsas As String, PrecioMercedes As String, PrecioBsAs As String, _
                   celular As String, Casa As String, observaciones As String, mensual As Byte)

Dim idParadaBsAs, idParadaMercedes As Integer

If Nombre = vbNullString And Nombre = " " Then MsgBox "El nombre no puede quedar vacio.": Exit Sub
If paradamercedes = vbNullString And paradamercedes = " " Then MsgBox "La parada de mercedes no puede quedar vacio.": Exit Sub
If paradabsas = vbNullString And paradabsas = " " Then MsgBox "La parada de buenos aires no puede quedar vacio.": Exit Sub
idParadaMercedes = obtenerIdParadaMercedes(paradamercedes)
idParadaBsAs = obtenerIdParadaBsAs(paradabsas)
If idParadaMercedes = 0 Then MsgBox "La parada de mercedes no existe o es incorrecta.": Exit Sub
If idParadaBsAs = 0 Then MsgBox "La parada de bsas no existe o es incorrecta.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "modificarCliente"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamInput, , Id)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 80, Nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dni", adVarChar, adParamInput, 16, dni)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("sexo", adInteger, adParamInput, , Sexo)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("mail", adVarChar, adParamInput, 80, Mail)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("direccion", adVarChar, adParamInput, 80, Direccion)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("paradaMer", adInteger, adParamInput, , idParadaMercedes)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("paradaBsAs", adInteger, adParamInput, , idParadaBsAs)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("precioMer", adDouble, adParamInput, , Val(PrecioMercedes))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("precioBsAs", adDouble, adParamInput, , Val(PrecioBsAs))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("celular", adVarChar, adParamInput, 18, celular)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("casa", adVarChar, adParamInput, 18, Casa)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("observaciones", adVarChar, adParamInput, 250, observaciones)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("mensual", adInteger, adParamInput, , mensual)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 0) Then
 MsgBox "Cliente modificado Correctamente."
 Call limpiarAgregarCliente
Else
 MsgBox "Ya existe un cliente con ese nombre."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarClientes(ListViewX As ListView, numeroPag As Integer, texto As String)
ListViewX.ListItems.Clear
Dim sSelectClientes As String
Dim i, cantidadPag As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

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
            Item.SubItems(2) = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
            Item.SubItems(3) = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
            Item.SubItems(4) = IIf(IsNull(Registros(5, i)), vbNullString, Registros(5, i))
        cantidadPag = Val(IIf(IsNull(Registros(6, i)), 1, Registros(6, i)))
    Next i
    Call actualizarPaginacion(numeroPag, cantidadPag)
Else
    Call actualizarPaginacion(1, 1)
End If
aRecSet.Close
End Sub

Public Sub actualizarPaginacion(numeroPag As Integer, cantidadPag As Integer)

With Inicio
    .primerPagina.Enabled = IIf(numeroPag > 1, True, False)
    .AnteriorPagina.Enabled = IIf(numeroPag > 1, True, False)
    .siguientePagina.Enabled = IIf(numeroPag < cantidadPag, True, False)
    .ultimaPagina.Enabled = IIf(numeroPag < cantidadPag, True, False)
    .numeroPagina.Caption = numeroPag
    .cantidadPaginas.Caption = cantidadPag
End With

End Sub

Public Sub limpiarAgregarCliente()
With Inicio
    .Text8.Text = vbNullString
    .Text9.Text = vbNullString
    .Text10.Text = vbNullString
    .Text11.Text = vbNullString
    .Text12.Text = vbNullString
    .Text13.Text = vbNullString
    .Text14.Text = "00"
    .Text29.Text = "00"
    .Combo1.Text = vbNullString
    .Combo2.Text = vbNullString
    .Sexo(0).Value = True
    Call cargarParadasComboMercedes(.Combo1)
    Call cargarParadasComboBsAs(.Combo2)
End With

End Sub

Sub eliminarCliente(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
ConexionBD.Execute "delete clientesgrupos where id_cliente = " & Id
ConexionBD.Execute "delete viajesfijosclientes where id_cliente = " & Id
ConexionBD.Execute "delete historialclientes where id_cliente = " & Id
ConexionBD.Execute "delete pasajes where id_cliente = " & Id
ConexionBD.Execute "delete clientes where id = " & Id
End Sub

Public Sub cargarClientesCombo(ComboX As ComboBox)
ComboX.Clear
Dim i As Integer
For i = 0 To UBound(nombreClientes, 2)
        ComboX.AddItem nombreClientes(0, i)
Next i
End Sub

Public Sub cargarNombresCliente()
Dim sSelectClientes As String
Dim i As Integer

Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarClientes"
Set aRecSet = cmdCommand.Execute

If Not aRecSet.EOF Then
    nombreClientes = aRecSet.GetRows()
Else
    ReDim nombreClientes(0 To 0, 0 To 0)
End If
aRecSet.Close
End Sub

Sub cargarDatosVentaPasajero(NombreCliente As String, IdViaje As String)
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarDatosVentaPasajero"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 80, NombreCliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("viaje", adBigInt, adParamInput, , IdViaje)

Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Inicio.Combo4.Text = IIf(IsNull(Registros(3, i)), vbNullString, Registros(3, i))
    Inicio.Text17 = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Inicio.Text18 = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
    Inicio.Text22 = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
Else
    Inicio.Combo4.Text = vbNullString
    Inicio.Text17.Text = vbNullString
    Inicio.Text18.Text = vbNullString
    Inicio.Text22.Text = vbNullString
End If

aRecSet.Close
    
End Sub

Public Function obtener_id_cliente(nombre_cliente As String, descripcion_parada As String _
                                  , precio As Double, dni As String, celular As String, Ciudad As Integer) As Integer


Dim resultado, nuevo As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
If Ciudad = 1 Then
    cmdCommand.CommandText = "verificarExistenciaClienteBuenosAires"
Else
    cmdCommand.CommandText = "verificarExistenciaClienteMercedes"
End If
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre_cliente", adVarChar, adParamInput, 80, nombre_cliente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("descripcion_parada", adVarChar, adParamInput, 50, descripcion_parada)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("precio", adDouble, adParamInput, , precio)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dni", adVarChar, adParamInput, 50, dni)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("celular", adVarChar, adParamInput, 18, celular)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nuevo", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")
nuevo = cmdCommand("nuevo")
If nuevo = 1 Then
    Dim limiteSuperior As Integer
    limiteSuperior = UBound(nombreClientes, 2) + 1
    ReDim Preserve nombreClientes(0 To 0, 0 To limiteSuperior)
    nombreClientes(0, limiteSuperior) = nombre_cliente
End If

obtener_id_cliente = resultado
Set cmdCommand.ActiveConnection = Nothing

End Function

Public Sub cargarClienteModificar(IdCliente As String)
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarClienteModificar"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adInteger, adParamInput, , IdCliente)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    
    Dim iSexo As Integer
    Dim bSexo As Boolean, bMensual As Boolean
    With Inicio
        Call cargarParadasComboMercedes(.Combo5)
        Call cargarParadasComboBsAs(.Combo6)
        .lblIdModificar = IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i))
        .MaskEdBox5.Text = IIf(IsNull(Registros(2, i)), vbNullString, Registros(2, i))
        .MaskEdBox6.Text = IIf(IsNull(Registros(4, i)), vbNullString, Registros(4, i))
        .MaskEdBox7.Text = IIf(IsNull(Registros(5, i)), vbNullString, Registros(5, i))
        .Combo5.Text = IIf(IsNull(Registros(6, i)), vbNullString, Registros(6, i))
        .Combo6.Text = IIf(IsNull(Registros(7, i)), vbNullString, Registros(7, i))
        .Text20.Text = IIf(IsNull(Registros(9, i)), vbNullString, Registros(9, i))
        .Text21.Text = IIf(IsNull(Registros(8, i)), vbNullString, Registros(8, i))
        .MaskEdBox8.Text = IIf(IsNull(Registros(10, i)), vbNullString, Registros(10, i))
        .MaskEdBox9.Text = IIf(IsNull(Registros(11, i)), vbNullString, Registros(11, i))
        .MaskEdBox10.Text = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
        .Text19.Text = IIf(IsNull(Registros(12, i)), vbNullString, Registros(12, i))
        bSexo = IIf(IsNull(Registros(3, i)), False, Registros(3, i))
        iSexo = IIf(bSexo, 1, 0)
        .SexoM(iSexo).Value = True
        bMensual = IIf(IsNull(Registros(13, i)), False, Registros(13, i))
        .MensualM.Value = IIf(bMensual, 1, 0)
        
    End With
End If
aRecSet.Close
End Sub
