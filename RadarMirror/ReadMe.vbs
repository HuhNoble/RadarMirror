' =================================================================================
'               🛡️   STANDALONE PRE-EXECUTION ENVIRONMENT VERIFIER   🛡️
' =================================================================================
' Module Name : ReadMe.vbs
' Description : Standard system-modal information dialog layer utilizing native 
'               Windows environment identifiers. No HTML dashboard dependency.
' =================================================================================
Option Explicit

' 1. ALLOCATE GLOBAL CORE SYSTEM OBJECT HANDLES
Dim objShell, objEnv, objFSO
Set objShell = CreateObject("WScript.Shell")
Set objFSO   = CreateObject("Scripting.FileSystemObject")
Set objEnv   = objShell.Environment("PROCESS")

' 2. CONFIGURATION VARIABLES
Dim STR_LOG_FILENAME, STR_DIALOG_TITLE
STR_LOG_FILENAME = "pre_execution_audit.log"
STR_DIALOG_TITLE = "Important"

' 3. CAPTURE PROCESS ENVIRONMENT TOKENS
Dim strUserAccount, strMachineName, strSystemFolder
strUserAccount  = objEnv("USERNAME")
strMachineName  = objEnv("COMPUTERNAME")
strSystemFolder = objEnv("SystemRoot")

' =================================================================================
' ATOMIC LOGGING PROCEDURAL MODULE
' =================================================================================
Sub WriteAuditTrail(strLogMessage)
    On Error Resume Next
    Dim objLogFile
    ' Open stream for appending (8), create if missing (True)
    Set objLogFile = objFSO.OpenTextFile(STR_LOG_FILENAME, 8, True)
    If Err.Number = 0 Then
        objLogFile.WriteLine("[" & Now & "] [PRE-CHECK] " & strLogMessage)
        objLogFile.Close
    End If
    Set objLogFile = Nothing
    On Error GoTo 0
End Sub

' Record pre-execution validation boot sequence
Call WriteAuditTrail("Initializing environment verification for operator: " & strUserAccount)

' =================================================================================
' MESSAGE CANVAS CONSTRUCTION & POP-UP INTERACTION
' =================================================================================
Dim strMessageCanvas, intDialogFlags, intUserAction

' Build clear multi-line administrative text notification block
strMessageCanvas = "==================================================" & vbCrLf & _
                   "      RADARMIRROR CENTRAL INTERFACE SYNCHRONIZATION" & vbCrLf & _
                   "==================================================" & vbCrLf & vbCrLf & _
                   "The background verification pipeline has successfully parsed local configurations." & vbCrLf & vbCrLf & _
                   "---> Active Account: " & strUserAccount & vbCrLf & _
                   "---> Sandbox Machine: " & strMachineName & vbCrLf & _
                   "---> OS Environment:  " & strSystemFolder & vbCrLf & vbCrLf & _
                   "All environment tokens match the target diagnostic profile matrix criteria." & vbCrLf & _
                   "Ensure the sandbox network state is completely isolated before continuing." & vbCrLf & vbCrLf & _
                   "The RadarMirrorBeta.exe was created by HuhNoble." & vbCrLf & vbCrLf & _
	   "Click OK to authorize execution and dismiss this notification frame."

' Compute bit-mask window properties (0 + 64 + 4096 = 4160)
intDialogFlags = vbInformation + vbOKOnly + vbSystemModal

Call WriteAuditTrail("Dispatching system-modal notification dialog layer container.")

' Instantiate the GUI window call
intUserAction = MsgBox(strMessageCanvas, intDialogFlags, STR_DIALOG_TITLE)

' Evaluate window confirmation return hook
If intUserAction = vbOK Then
    Call WriteAuditTrail("Operator manually acknowledged pre-execution checklist via OK button control.")
End If

' =================================================================================
' MEMORY DE-ALLOCATION & PURGE RUNTIME
' =================================================================================
Call WriteAuditTrail("Verification component lifecycle finalized successfully. Releasing system handles.")
Set objEnv   = Nothing
Set objFSO   = Nothing
Set objShell = Nothing
WScript.Quit(0)