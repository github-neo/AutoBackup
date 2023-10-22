@echo off

rem ����7-Zip�İ�װ·�����������ʵ������޸�
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"

rem ����Դ�ļ��У�Ĭ��Ϊ��ǰ�ļ���
set "SOURCE_PATH=%CD%"

rem ��鴫�����������
if "%~1"=="" (
    echo �÷�: %0 ѹ����·�� Դ·��
    exit /b 1
)

rem archive name without extension name.
SET "ARCHIVE_PATH=%~1"

rem ����Ƿ��ṩ��Ŀ���ļ��в���
if not "%~2"=="" (
    set "SOURCE_PATH=%~2"
)

echo.
echo "%date% %time% ****** Start sync %ARCHIVE_PATH% ******"
echo "%date% %time% ARCHIVE_PATH=%ARCHIVE_PATH%"
echo "%date% %time% SOURCE_PATH=%SOURCE_PATH%"
echo "%date% %time% TEMP=%TEMP%"
echo.

rem ���ѹ���ļ��Ƿ����
if exist "%ARCHIVE_PATH%" (
	rem ʹ��-uq0x2������ȷ�����ļ���������ȫһ��
	%sevenZipPath% u -uq0x2 -mx9 -ms=off -mmt -bsp2 -w%TEMP% "%ARCHIVE_PATH%" "%SOURCE_PATH%"
) else (
	rem �����µ�ѹ���ļ�
	%sevenZipPath% a -mx9 -ms=off -mmt -bsp2 -w%TEMP% "%ARCHIVE_PATH%" "%SOURCE_PATH%"
)

echo.
echo "%date% %time% ****** Finish sync %ARCHIVE_PATH% ******"
echo.
