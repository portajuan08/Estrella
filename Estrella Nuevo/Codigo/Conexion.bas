Attribute VB_Name = "Conexion"
Option Explicit

Public ConexionBD As New ADODB.Connection
Public aRecSet As New ADODB.Recordset

Public IpBD As String
Public PuertoBD As String
Public UsuarioBD As String
Public PasswordBD As String
Public IdUsuario_Sistema As Integer
Public Usuario_Sistema As String
Public Permisos_Sistema As Integer
Public Logueado As Boolean
Sub conectarBaseDatos()
Call ObtenerDatosConexion
ConexionBD.Open "Provider=SQLNCLI; " & _
             "Initial Catalog=EstrellaTour; " & _
             "Data Source=" & IpBD & "," & PuertoBD & "; " & _
             "persist security info=True;" & _
             "User Id=" & UsuarioBD & ";" & _
           "Password=" & PasswordBD & ";"
    
    

'"integrated security=True; " & _
'ConexionBD.Open "Provider=SQLOLEDB;Data Source=" & IpBD & "," & PuertoBD & ";Initial " & _
'                "Catalog=EstrellaTour;User ID=" & UsuarioBD & ";Password=" & PasswordBD & ";"
''"Data Source=(local)\SQLEXPRESS; " &
End Sub

Sub desconectarBaseDatos()
ConexionBD.Close
End Sub

Public Sub ObtenerDatosConexion()
Dim fso
Dim rutaArchivo As String
rutaArchivo = App.Path & "\DatosConexion.txt"
Set fso = CreateObject("Scripting.FileSystemObject")

If Not (fso.FileExists(rutaArchivo)) Then
    Call GrabarDato(rutaArchivo, "informacion", "ip", "127.0.0.1")
    Call GrabarDato(rutaArchivo, "informacion", "puerto", "1433")
    Call GrabarDato(rutaArchivo, "informacion", "usuario", "juan")
    Call GrabarDato(rutaArchivo, "informacion", "password", "juan")
    MsgBox "Falta archivo con datos de conexion, se acaba de crear en la carpeta del programa, completar con los datos correctos."
End If

IpBD = LeerDato(rutaArchivo, "informacion", "ip")
PuertoBD = LeerDato(rutaArchivo, "informacion", "puerto")
UsuarioBD = LeerDato(rutaArchivo, "informacion", "usuario")
PasswordBD = LeerDato(rutaArchivo, "informacion", "password")

End Sub

