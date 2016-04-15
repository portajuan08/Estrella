Attribute VB_Name = "BloquearMaximizar"
Option Explicit
  
' DEclaraciones de funciones de api
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  
' verifica si una ventana de windows está visible
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
  
  
' para los estilos
Private Declare Function GetWindowLong Lib "user32" _
                                Alias "GetWindowLongA" _
                                (ByVal hwnd As Long, _
                                ByVal nIndex As Long) _
                                As Long
                                  
Private Declare Function SetWindowLong Lib "user32" _
                                Alias "SetWindowLongA" _
                                (ByVal hwnd As Long, _
                                ByVal nIndex As Long, _
                                ByVal dwNewLong As Long) _
                                As Long
                                  
' para redibujar y refrescar la ventana
Private Declare Function SetWindowPos Lib "user32" _
                                (ByVal hwnd As Long, _
                                ByVal hWndInsertAfter As Long, _
                                ByVal x As Long, _
                                ByVal y As Long, _
                                ByVal cx As Long, _
                                ByVal cy As Long, _
                                ByVal wFlags As Long) _
                                As Long
  
' constante ( Flag ) para el botón de maximizar
Public Const WS_MAXIMIZEBOX = &H10000
  
' constante para la función api GetWindowLong
Private Const GWL_STYLE = (-16)
  
' constantes para la función api SetWindowPos
Private Const SWP_FRAMECHANGED = &H20
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOACTIVATE = &H10
  
Const FLAG As Long = SWP_NOACTIVATE Or SWP_FRAMECHANGED _
                     Or SWP_NOSIZE Or SWP_NOMOVE
  
  
  
  
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Función que cambia el estilo Ade la ventana, en este caso _
 deshabilita y habilita el botón de maximizar
   
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   
Public Sub Maximizar(ByVal Hwnd_Ventana As Long, _
                     ByVal Flags As Long, _
                     Optional ByVal Accion As Boolean = True)
      
    Dim ret        As Long
      
    ' Obtiene el estilo actual
    ret = GetWindowLong(Hwnd_Ventana, GWL_STYLE)
      
    ' asigna los flags al estilo actual dependiendo de la acción
    If Accion Then
        ret = ret Or Flags
    Else
        ret = ret And Not Flags
    End If
      
    ' aplica el nuevo estilo
    SetWindowLong Hwnd_Ventana, GWL_STYLE, ret
      
    ' si la ventana está visible ...
    If IsWindowVisible(Hwnd_Ventana) Then
          
        ' Es necesario ya que si no solo se verá el camio si se repinta la ventana
        SetWindowPos Hwnd_Ventana, 0, 0, 0, 0, 0, FLAG
    End If
End Sub

