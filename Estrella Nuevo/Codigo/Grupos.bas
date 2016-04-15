Attribute VB_Name = "Grupos"
Option Explicit
Public aRecSet As New ADODB.Recordset

Sub agregarGrupo(nombre As String)
If nombre = vbNullString Or nombre = "" Then MsgBox "Ingrese un nombre.": Exit Sub

Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarGrupo"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 80, nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Grupo Agregado Correctamente."
Else
 MsgBox "Surgio un error el grupo no se pudo agregar."
End If
Set cmdCommand.ActiveConnection = Nothing


End Sub

Sub cargarGrupos(ListViewX As ListView)
ListViewX.ListItems.Clear
Dim i As Integer
Dim Registros() As Variant
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cargarGrupos"
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

Sub eliminarGrupo(Id As String)
If Id = vbNullString Or Id = "" Or Id = " " Then Exit Sub
ConexionBD.Execute "delete ClientesGrupos where id_grupo = " & Id
ConexionBD.Execute "delete Grupos where id = " & Id
End Sub

