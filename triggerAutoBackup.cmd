@echo off

chcp 65001

echo.
choice /C YN /D Y /T 10 /M "Do you want to shutdown computer after AutoBackup? Y or N? (Default Y after 10s)"
if errorlevel 2 goto body
if errorlevel 1 SET toShutDown=true

:body

echo toShutDown="%toShutDown%"

if exist "%~dp0AutoBackup.log" (
	echo del "%~dp0AutoBackup_0.log"
	del "%~dp0AutoBackup_0.log"
	echo ren "%~dp0AutoBackup.log" "AutoBackup_0.log"
	ren "%~dp0AutoBackup.log" "AutoBackup_0.log"
	echo.
)

echo.AutoBackup ...
call "%~dp0AutoBackup.cmd" 2>&1 | "%~dp0utils\tee" "%~dp0AutoBackup.log"
echo.

if "%toShutDown%"=="true" (
	echo.
	choice /C YN /D Y /T 10 /M "Continue to shutdown computer? (Default Y after 10s)"
	if errorlevel 2 goto end
	if errorlevel 1 (
		echo.Shutdown computer ...
		shutdown /s /t 10 /d p:4:1 /c "Shutdown computer after AutoBackup."
	)
)

:end