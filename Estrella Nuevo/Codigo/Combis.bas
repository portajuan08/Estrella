Attribute VB_Name = "Combis"
Option Explicit
Public aRecSet As New ADODB.Recordset

Sub agregarCombi(Patente As String, descripcion As String, Asientos As String)
If Patente = vbNullString Or Patente = "" _
Or descripcion = vbNullString Or descripcion = "" _
Or Asientos = vbNullString Or Asientos = "" _
Then MsgBox "Llene todos los campos.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarCombi"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("patente", adVarChar, adParamInput, 6, Patente)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("descripcion", adVarChar, adParamInput, 80, descripcion)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("asientos", adInteger, adParamInput, , Val(Asientos))
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Combi agregada Correctamente."
Else
 MsgBox "Ya existe una combi con esa patente."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarCombis(ListViewX As ListView)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarCombis"
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

Sub eliminarCombi(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
ConexionBD.Execute "update combis set eliminado = 1 where id = " & Id
End Sub

Public Sub cargarCombisCombo(ComboX As ComboBox)
ComboX.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarCombis"
Set aRecSet = cmdCommand.Execute
If Not aRecSet.EOF Then
    Registros = aRecSet.GetRows()

    Dim Item As ListItem

    For i = 0 To UBound(Registros, 2)
        ComboX.AddItem IIf(IsNull(Registros(1, i)), vbNullString, Registros(1, i))
    Next i
End If
aRecSet.Close
End Sub
