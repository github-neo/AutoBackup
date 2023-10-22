@echo off

rem Set UTF-8
rem chcp 65001

SET BACKUP_PATH=%~dp0backups\
SET BAT_PATH="%~dp0utils\doBackup.cmd"
SET EXE_CMD_PATH="C:\Program Files\7-Zip\7z"

echo "BACKUP_PATH=%BACKUP_PATH%"
echo "BAT_PATH=%BAT_PATH%"
echo "EXE_CMD_PATH=%EXE_CMD_PATH%"
echo.

echo ====== Start AutoBackup. ======
echo.

for /f "eol=# tokens=1,2 delims==" %%i in (BackupList.properties) do echo.call %BAT_PATH% "%%i" "%%j" && call %BAT_PATH% "%%i" "%%j" && echo.

echo ====== Finish AutoBackup. ======