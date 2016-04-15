Attribute VB_Name = "Choferes"
Option Explicit
Public aRecSet As New ADODB.Recordset

Sub agregarChofer(nombre As String)
If nombre = vbNullString Or nombre = "" Then MsgBox "Ingrese un nombre.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarChofer"
cmdCommand.CommandTimeout = 120
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 80, nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Chofer Agregado Correctamente."
Else
 MsgBox "Surgio un error el chofer no se pudo agregar."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarChoferes(ListViewX As ListView)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarChoferes"
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem

    For i = 0 To UBound(Registros, 2)
        Set Item = ListViewX.ListItems.Add(, , IIf(IsNull(Registros(0, i)), vbNullString, Registros(0, i)))
            Item.SubItems(1) = IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Next i
End If
aRecSet.Close
End Sub

Sub cargarChoferesCombo(ComboX As ComboBox)
ComboX.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarChoferes"
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()
    For i = 0 To UBound(Registros, 2)
        ComboX.AddItem IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Next i
End If
aRecSet.Close
End Sub

Sub eliminarChofer(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
ConexionBD.Execute "delete Choferes where id = " & Id
End Sub

