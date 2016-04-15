Attribute VB_Name = "Imprimir"
Option Explicit
Public aRecSet As New ADODB.Recordset
Function Create_Recordset(RegistrosIzq() As Variant, bEOFizq, RegistrosDer() As Variant, bEOFder, Viaje_doble As Boolean) As ADODB.Recordset
Dim registrosAux As Recordset
Dim iRow, iCol As Long

Dim numero, descripcion, nombre, dni, precio, numeroB, descripcionB, nombreB, dniB, precioB As String
Set registrosAux = New Recordset
    
    registrosAux.Fields.Append "numero", adVarChar, 250
    registrosAux.Fields.Append "descripcion", adVarChar, 250
    registrosAux.Fields.Append "nombre", adVarChar, 250
    registrosAux.Fields.Append "dni", adVarChar, 250
    registrosAux.Fields.Append "precio", adVarChar, 250
    registrosAux.Fields.Append "numeroB", adVarChar, 250
    registrosAux.Fields.Append "descripcionB", adVarChar, 250
    registrosAux.Fields.Append "nombreB", adVarChar, 250
    registrosAux.Fields.Append "dniB", adVarChar, 250
    registrosAux.Fields.Append "precioB", adVarChar, 250
    registrosAux.Open
    
    For iRow = 0 To 18
        registrosAux.AddNew
        registrosAux.Fields(0) = iRow + 1
        registrosAux.Fields(5) = IIf(Viaje_doble, iRow + 1, iRow + 20)
        For iCol = 1 To 4
            If Not bEOFizq Then
                If UBound(RegistrosIzq, 2) >= iRow Then registrosAux.Fields(iCol).Value = IIf(IsNull(RegistrosIzq(iCol - 1, iRow)), vbNullString, RegistrosIzq(iCol - 1, iRow))
            End If
            If Not bEOFder Then
                If UBound(RegistrosDer, 2) >= iRow Then registrosAux.Fields(iCol + 5).Value = IIf(IsNull(RegistrosDer(iCol - 1, iRow)), vbNullString, RegistrosDer(iCol - 1, iRow))
            End If
        Next iCol
    Next iRow
    Set Create_Recordset = registrosAux
    
End Function

Function Armar_Recordset(RegistrosIzq() As Variant, bEOFizq As Boolean) As ADODB.Recordset
    Dim iRow, iCol, limiteSuperior As Integer
    Dim bEOFder As Boolean
    Dim RegistrosDer(0 To 3, 0 To 18) As Variant

    If Not bEOFizq Then
        For iRow = 0 To 37
            If UBound(RegistrosIzq, 2) >= iRow Then
                If iRow >= 19 Then
                    For iCol = 0 To 3
                        RegistrosDer(iCol, iRow - 19) = IIf(IsNull(RegistrosIzq(iCol, iRow)), vbNullString, RegistrosIzq(iCol, iRow))
                    Next iCol
                End If
            End If
        Next iRow
    Else
        bEOFder = True
    End If
    
    Set Armar_Recordset = Create_Recordset(RegistrosIzq, bEOFizq, RegistrosDer, bEOFder, False)
End Function


Public Sub ImprimirPlanillaCharterIdaYVuelta(IdViajeMercedes As String _
                                           , Hora_mercedes As String _
                                           , IdViajeBsAs As String _
                                           , Hora_BsAs As String _
                                           , dia As String _
                                           , CHOFER As String _
                                           , Interno As String)

    Dim registrosImprimir As New ADODB.Recordset
    Dim RegistrosMercedes() As Variant
    Dim RegistrosBsAs() As Variant
    Dim DETALLE As String
    Dim LeftColumna As Integer
    
    RegistrosMercedes = cargarPasajesImprimir(IdViajeMercedes)
    RegistrosBsAs = cargarPasajesImprimir(IdViajeBsAs)
    
   
    ' llamar la función Create_Recordset
    
    Set registrosImprimir = Create_Recordset(RegistrosMercedes, obtenerEOF(IdViajeMercedes), RegistrosBsAs, obtenerEOF(IdViajeBsAs), True)
    If Not registrosImprimir Is Nothing Then
        
       'Indicar en esta variable el nombre de la sección en la que se encuentran los rptTextBox para cada campo
        DETALLE = "detalle"
        
        'Asignarle a los textbox del datareport, los DataField que corresponden a los nombres de encabezados
        With PlanillaCharter
            ' Asignarle al datasource el origen de datos, es decir el recordset que devolvió la función Create_Recordset
            Set .DataSource = registrosImprimir
            
            .Sections("Sección2").Controls.Item("etiqueta11").Caption = "Int: " & Interno
            .Sections("Sección2").Controls.Item("etiqueta12").Caption = "Fecha: " & FormatDateTime(dia, vbLongDate)
            .Sections("Sección2").Controls.Item("etiqueta13").Caption = "Chofer: " & CHOFER
    
    
            .Sections("Sección2").Controls.Item("etiqueta4").Caption = "Horario: " & Hora_mercedes
            .Sections("Sección2").Controls.Item("etiqueta5").Caption = "Horario: " & Hora_BsAs
            .Sections("Sección2").Controls.Item("etiqueta16").Caption = "SALIDA y REGRESO"
            'Cargar y muestrar el informe
            .Show vbModal
            
            ' Liberar los recursos
            If registrosImprimir.State = adStateOpen Then registrosImprimir.Close
            Set registrosImprimir = Nothing
            
        End With
    End If
    Call agregarImpresion(IdViajeMercedes)
    Call agregarImpresion(IdViajeBsAs)
End Sub


Public Sub ImprimirPlanillaCharterUnicoSentido(IdViaje As String _
                                    , Hora As String _
                                    , dia As String _
                                    , CHOFER As String _
                                    , Interno As String _
                                    , Tipo_Viaje As String)

    Dim Registros() As Variant
    Dim registrosImprimir As New ADODB.Recordset
    Dim DETALLE, sSelectPasajes As String
    ' llamar la función Create_Recordset
    Registros = cargarPasajesImprimir(IdViaje)
    Set registrosImprimir = Armar_Recordset(Registros, obtenerEOF(IdViaje))
    If Not registrosImprimir Is Nothing Then
        
       'Indicar en esta variable el nombre de la sección en la que se encuentran los rptTextBox para cada campo
        DETALLE = "detalle"
        
        'Asignarle a los textbox del datareport, los DataField que corresponden a los nombres de encabezados
        With PlanillaCharter
            ' Asignarle al datasource el origen de datos, es decir el recordset que devolvió la función Create_Recordset
            Set .DataSource = registrosImprimir
            
            .Sections("Sección2").Controls.Item("etiqueta11").Caption = "Int: " & Interno
            .Sections("Sección2").Controls.Item("etiqueta12").Caption = "Fecha: " & FormatDateTime(dia, vbLongDate)
            .Sections("Sección2").Controls.Item("etiqueta13").Caption = "Chofer: " & CHOFER
    
    
            .Sections("Sección2").Controls.Item("etiqueta4").Caption = "Horario: " & Hora
            .Sections("Sección2").Controls.Item("etiqueta5").Caption = ""
            .Sections("Sección2").Controls.Item("etiqueta16").Caption = Tipo_Viaje
            'Cargar y muestrar el informe
            .Show vbModal
            
            ' Liberar los recursos
            If registrosImprimir.State = adStateOpen Then registrosImprimir.Close
            Set registrosImprimir = Nothing
            
        End With
    End If
End Sub

Public Sub ImprimirPlanillaCharterIda(IdViajeMercedes As String _
                                    , Hora_mercedes As String _
                                    , dia As String _
                                    , CHOFER As String _
                                    , Interno As String)
Call ImprimirPlanillaCharterUnicoSentido(IdViajeMercedes, Hora_mercedes, dia, CHOFER, Interno, "SALIDA")
Call agregarImpresion(IdViajeMercedes)
End Sub


Public Sub ImprimirPlanillaCharterVuelta(IdViajeBsAs As String _
                                       , Hora_BsAs As String _
                                       , dia As String _
                                       , CHOFER As String _
                                       , Interno As String)

Call ImprimirPlanillaCharterUnicoSentido(IdViajeBsAs, Hora_BsAs, dia, CHOFER, Interno, "REGRESO")
Call agregarImpresion(IdViajeBsAs)
End Sub

Public Function cargarPasajesImprimir(IdViaje As String) As Variant()
Dim i As Integer
Dim cmdCommand As New ADODB.Command
cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarPasajesImprimir"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("IdViaje", adInteger, adParamInput, , IdViaje)
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    cargarPasajesImprimir = aRecSet.GetRows
End If
End Function


Public Function obtenerEOF(IdViaje As String) As Boolean
Dim i As Integer
Dim cmdCommand As New ADODB.Command
cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarPasajesImprimir"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("IdViaje", adInteger, adParamInput, , IdViaje)
Set aRecSet = cmdCommand.Execute
obtenerEOF = aRecSet.EOF
End Function
