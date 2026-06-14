@echo off
:: =================================================================================
::               🛡️   RADARMIRROR INTEGRATED PIPELINE   🛡️
:: =================================================================================
:: Module Name : launch_pipeline.bat
:: Description : Enforces execution serialization for speech.vbs and ReadMe.vbs
::               but explicitly terminates before initializing the main binary.
:: =================================================================================
title RadarMirror Integrated Pipeline

echo =================================================================
echo    [SIMULATION MODE] Initializing Stage Verification...
echo =================================================================
echo.

:: 1. VERIFY COMPONENT DEPENDENCIES EXIST IN THE ACTIVE DIRECTORY
if not exist "ReadMe.vbs" (
    color 0C
    echo [CRITICAL ERROR] Visual interface component 'ReadMe.vbs' was not found!
    echo Ensure ReadMe.vbs is placed in this exact folder.
    echo.
    pause
    exit /b 1
)

if not exist "speech.vbs" (
    color 0C
    echo [CRITICAL ERROR] Audio engine component 'speech.vbs' was not found!
    echo Ensure speech.vbs is placed in this exact folder.
    echo.
    pause
    exit /b 1
)

:: 2. MULTI-THREAD AUDIO RUNTIME DEPLOYMENT
echo [%TIME%] [STAGE 1] Triggering asynchronous environmental voice synthesis...
start wscript.exe "speech.vbs"

:: 3. DISPATCH VISUAL INTERFACE LOCK LAYER
echo [%TIME%] [STAGE 2] Launching system-modal notification overlay canvas...
echo [SYSTEM STATUS] Pipeline processing is frozen until operator acknowledges dialogue frame.
echo.

:: The /wait flag freezes this batch line completely until ReadMe.vbs is closed.
wscript.exe "ReadMe.vbs" /wait

:: 4. PIPELINE TERMINATION GATEWAY (SAFE DISCONNECT)
echo [%TIME%] [STAGE 3] Validation checklist cleared by human operator.
echo.
echo =================================================================
echo   [SAFE MODE] Pre-execution tests complete. 
echo   'RadarMirrorBeta.exe' was intentionally bypassed.
echo =================================================================
echo.
timeout 5
exit /b 0