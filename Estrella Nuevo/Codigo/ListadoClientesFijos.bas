Attribute VB_Name = "ListadoClientesFijos"
Option Explicit

Public Sub ImprimirListadoClientesFijos()

    Dim DETALLE As String
    Dim LeftColumna As Integer

    Dim registrosImprimir As New ADODB.Recordset
    
    Set registrosImprimir = cargarClientesFijos()
   
    ' llamar la función Create_Recordset
    If Not registrosImprimir Is Nothing Then
        
       'Indicar en esta variable el nombre de la sección en la que se encuentran los rptTextBox para cada campo
        DETALLE = "detalle"
        
        'Asignarle a los textbox del datareport, los DataField que corresponden a los nombres de encabezados
        With ListadosClientesFijos
            ' Asignarle al datasource el origen de datos, es decir el recordset que devolvió la función Create_Recordset
            Set .DataSource = registrosImprimir
            'Cargar y muestrar el informe
            .Show vbModal
            
            ' Liberar los recursos
            registrosImprimir.Close
            Set registrosImprimir = Nothing
            
        End With
    End If
End Sub

Private Function cargarClientesFijos() As ADODB.Recordset
Dim cmdCommand As New ADODB.Command
cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarListadoClientesFijos"
Set cargarClientesFijos = cmdCommand.Execute


End Function

