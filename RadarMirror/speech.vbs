' =================================================================================
'               🗣️   STABLE SYNCHRONOUS TEXT-TO-SPEECH INTERFACE   🗣️
' =================================================================================
' Module Name : speech.vbs
' Description : Bare-minimum audio script engine using direct SAPI routing.
'               Synchronous execution ensures the sound plays on restricted environments.
' =================================================================================
Option Explicit

Dim objVoice
On Error Resume Next

' Instantiate the core Windows voice delivery module
Set objVoice = CreateObject("SAPI.SpVoice")

' Check if the system audio engine initialized successfully
If Err.Number = 0 Then
    ' Flag 0 = Synchronous Mode. Windows forces the script to wait until it finishes speaking.
    objVoice.Speak "Radar Mirror initialization checks are complete. Please click O K on the window prompt.", 0
End If

' Release system memory handles cleanly
Set objVoice = Nothing
WScript.Quit(0)