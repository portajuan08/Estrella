Attribute VB_Name = "Loguear"
Option Explicit

Public Sub iniciarSesion(Nombre As String, contraseña As String)
Dim permisos As Integer
Dim id_user As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "iniciarSesion"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("nombre", adVarChar, adParamInput, 50, Nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("contraseña", adVarChar, adParamInput, 50, contraseña)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("permisos", adInteger, adParamOutput)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id", adInteger, adParamOutput)
cmdCommand.Execute
permisos = cmdCommand("permisos")
id_user = cmdCommand("id")

If (permisos > 0) Then
 Logueado = True
 Inicio.LOGUEO.Visible = False
 Usuario_Sistema = Nombre
 Inicio.Caption = "Usuario: " & Nombre
 Permisos_Sistema = permisos
 IdUsuario_Sistema = id_user
 If Permisos_Sistema = 1 Then Inicio.mnu_agregar_usuario.Visible = True
Else
 MsgBox "Usuario/Contraseña incorrectos."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

Public Sub cambiarContraseña(contra_vieja As String, contra_nueva As String, contra_nueva2 As String)
If contra_nueva <> contra_nueva2 Then MsgBox "Las contraseñas nuevas no coinciden.": Exit Sub
Dim resultado As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "cambiarContra"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("id_user", adInteger, adParamInput, , IdUsuario_Sistema)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("contra_vieja", adVarChar, adParamInput, 50, contra_vieja)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("contra_nueva", adVarChar, adParamInput, 50, contra_nueva)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("resultado", adInteger, adParamOutput)
cmdCommand.Execute
resultado = cmdCommand("resultado")

If (resultado = 1) Then
 MsgBox "Contraseña cambiada con exito."
 Inicio.CAMBIAR_CONTRA.Visible = False
Else
 MsgBox "La contraseña es incorrecta."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub

Public Sub agregarUsuario(Nombre As String, contraseña As String)
Dim result As Integer
Dim cmdCommand As New ADODB.Command

cmdCommand.ActiveConnection = ConexionBD
cmdCommand.CommandType = adCmdStoredProc
cmdCommand.CommandText = "agregarUsuario"
cmdCommand.Parameters.Append cmdCommand.CreateParameter("usuario", adVarChar, adParamInput, 50, Nombre)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("contraseña", adVarChar, adParamInput, 50, contraseña)
cmdCommand.Parameters.Append cmdCommand.CreateParameter("result", adInteger, adParamOutput)
cmdCommand.Execute
result = cmdCommand("result")

If (result = 0) Then
 MsgBox "Usuario agregado correctamente."
Else
 MsgBox "El usuario ya existe."
End If
Set cmdCommand.ActiveConnection = Nothing
End Sub
