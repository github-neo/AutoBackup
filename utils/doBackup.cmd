@echo off

rem archive name without extension name.
SET ARCHIVE_NAME=%~1

rem source path of backup
SET SOURCE_PATH=%~2

SET "TMP_PATH=%TEMP%"

echo.
echo ****** Start backup %ARCHIVE_NAME% ******
echo "ARCHIVE_NAME=%ARCHIVE_NAME%"
echo "SOURCE_PATH=%SOURCE_PATH%"
echo.

if "%TMP_PATH%"=="" (
    SET "TMP_PATH=%TMP%"
)
echo "TMP_PATH=%TMP_PATH%"

if not "%TMP_PATH%"=="" (
    SET "ARG=-w%TMP_PATH%"
)
echo "ARG=%ARG%"

if exist "%BACKUP_PATH%%ARCHIVE_NAME%.7z" (
	echo del "%BACKUP_PATH%%ARCHIVE_NAME%_0.7z"
	del "%BACKUP_PATH%%ARCHIVE_NAME%_0.7z"
	echo ren "%BACKUP_PATH%%ARCHIVE_NAME%.7z" "%ARCHIVE_NAME%_0.7z"
	ren "%BACKUP_PATH%%ARCHIVE_NAME%.7z" "%ARCHIVE_NAME%_0.7z"
	echo.
	
	echo "Update %ARCHIVE_NAME%"
	echo %EXE_CMD_PATH% u "%BACKUP_PATH%%ARCHIVE_NAME%_0.7z" -u- -uq0x2!"%BACKUP_PATH%%ARCHIVE_NAME%.7z" -mx9 -ms=off -mmt -bsp2 %ARG% "%SOURCE_PATH%"
	%EXE_CMD_PATH% u "%BACKUP_PATH%%ARCHIVE_NAME%_0.7z" -u- -uq0x2!"%BACKUP_PATH%%ARCHIVE_NAME%.7z" -mx9 -ms=off -mmt -bsp2 %ARG% "%SOURCE_PATH%"
) else (
	echo "Create %ARCHIVE_NAME%"
	echo %EXE_CMD_PATH% a "%BACKUP_PATH%%ARCHIVE_NAME%.7z" -mx9 -ms=off -mmt -bsp2 %ARG% "%SOURCE_PATH%"
	%EXE_CMD_PATH% a "%BACKUP_PATH%%ARCHIVE_NAME%.7z" -mx9 -ms=off -mmt -bsp2 %ARG% "%SOURCE_PATH%"
	echo.
)

echo.
echo ****** Finish backup %ARCHIVE_NAME% ******
echo.