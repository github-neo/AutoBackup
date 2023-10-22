@echo off

rem 设置7-Zip的安装路径，根据你的实际情况修改
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"

rem 设置源文件夹，默认为当前文件夹
set "SOURCE_PATH=%CD%"

rem 检查传入参数的数量
if "%~1"=="" (
    echo 用法: %0 压缩包路径 源路径
    exit /b 1
)

rem archive name without extension name.
SET "ARCHIVE_PATH=%~1"

rem 检查是否提供了目标文件夹参数
if not "%~2"=="" (
    set "SOURCE_PATH=%~2"
)

echo.
echo "%date% %time% ****** Start sync %ARCHIVE_PATH% ******"
echo "%date% %time% ARCHIVE_PATH=%ARCHIVE_PATH%"
echo "%date% %time% SOURCE_PATH=%SOURCE_PATH%"
echo "%date% %time% TEMP=%TEMP%"
echo.

rem 检查压缩文件是否存在
if exist "%ARCHIVE_PATH%" (
	rem 使用-uq0x2参数以确保与文件夹内容完全一致
	%sevenZipPath% u -uq0x2 -mx9 -ms=off -mmt -bsp2 -w%TEMP% "%ARCHIVE_PATH%" "%SOURCE_PATH%"
) else (
	rem 创建新的压缩文件
	%sevenZipPath% a -mx9 -ms=off -mmt -bsp2 -w%TEMP% "%ARCHIVE_PATH%" "%SOURCE_PATH%"
)

echo.
echo "%date% %time% ****** Finish sync %ARCHIVE_PATH% ******"
echo.
