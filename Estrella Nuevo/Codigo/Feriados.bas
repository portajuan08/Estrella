Attribute VB_Name = "Feriados"
Option Explicit
Public aRecSet As New ADODB.Recordset

Sub agregarFeriado(dia As String, descripcion As String)

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarFeriado"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("dia", adDBTimeStamp, adParamInput, 8, dia)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("descripcion", adVarChar, adParamInput, 80, descripcion)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Feriado Agregado Correctamente."
Else
 MsgBox "Surgio un error el feriado no se pudo agregar."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarFeriados(ListViewX As ListView)
ListViewX.ListItems.Clear
Dim I As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarFeriados"
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem

    For I = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, I)), vbNullString, Registros(0, I)))

        Item.SubItems(1) = IIf(IsNull(Registros(1, I)), vbNullString, Registros(1, I))
        Item.SubItems(2) = IIf(IsNull(Registros(2, I)), vbNullString, Registros(2, I))
    Next I
End If
aRecSet.Close
End Sub

Sub eliminarFeriado(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
ConexionBD.Execute "delete feriados where id = " & Id
End Sub


