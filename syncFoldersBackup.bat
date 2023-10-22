@echo off
setlocal enabledelayedexpansion

rem ����7-Zip�İ�װ·�����������ʵ������޸�
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"

rem ����Դ�ļ��У�Ĭ��Ϊ��ǰ�ļ���
set "sourceFolder=%CD%"

rem ����Ŀ���ļ��У�Ĭ��Ϊ��ǰ�ļ���
set "targetFolder=%CD%"

rem ����Ƿ��ṩ��Դ�ļ��в���
if not "%~1"=="" (
    set "sourceFolder=%~1"
)

rem ����Ƿ��ṩ��Ŀ���ļ��в���
if not "%~2"=="" (
    set "targetFolder=%~2"
)

echo.
echo "%date% %time% ****** Start sync folders in %sourceFolder% ******"
echo "%date% %time% sourceFolder=%sourceFolder%"
echo "%date% %time% targetFolder=%targetFolder%"
echo.

rem ����Դ�ļ����µ�ÿ�����ļ���
for /d %%i in ("%sourceFolder%\*") do (
    rem ����ѹ���ļ���·������ŵ�Ŀ���ļ�����
    set "zipFilePath=!targetFolder!\%%~nxi.7z"
	
	call syncFolderBackup.bat "!zipFilePath!" "%%i"
)

echo �������ļ��е�ѹ�����Ѹ��»򴴽���ɣ��Ѵ����Ŀ���ļ����¡�
echo.
echo "%date% %time% ****** Finish sync folders in %sourceFolder% ******"
echo.
pause
