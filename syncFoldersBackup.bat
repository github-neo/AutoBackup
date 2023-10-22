@echo off
setlocal enabledelayedexpansion

rem 设置7-Zip的安装路径，根据你的实际情况修改
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"

rem 设置源文件夹，默认为当前文件夹
set "sourceFolder=%CD%"

rem 设置目标文件夹，默认为当前文件夹
set "targetFolder=%CD%"

rem 检查是否提供了源文件夹参数
if not "%~1"=="" (
    set "sourceFolder=%~1"
)

rem 检查是否提供了目标文件夹参数
if not "%~2"=="" (
    set "targetFolder=%~2"
)

echo.
echo "%date% %time% ****** Start sync folders in %sourceFolder% ******"
echo "%date% %time% sourceFolder=%sourceFolder%"
echo "%date% %time% targetFolder=%targetFolder%"
echo.

rem 遍历源文件夹下的每个子文件夹
for /d %%i in ("%sourceFolder%\*") do (
    rem 构建压缩文件的路径，存放到目标文件夹下
    set "zipFilePath=!targetFolder!\%%~nxi.7z"
	
	call syncFolderBackup.bat "!zipFilePath!" "%%i"
)

echo 所有子文件夹的压缩包已更新或创建完成，已存放在目标文件夹下。
echo.
echo "%date% %time% ****** Finish sync folders in %sourceFolder% ******"
echo.
pause
