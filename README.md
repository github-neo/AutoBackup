# AutoBackup
AutoBackup scripts for Windows

AutoBackup将使用7-Zip把指定的文件夹或文件压缩打包，生成的压缩包将会放在AutoBackup\backups文件夹中。

## 使用前需准备：
1. 系统中需预先安装好7-Zip软件。7-Zip官网：https://www.7-zip.org/
1. 编辑AutoBackup.cmd文件，检查下列变量并设置正确的值：
	- EXE_CMD_PATH: 系统中7-Zip软件的安装目录下7z.exe的绝对路径。
1. 编辑BackupList.properties文件，自定义要备份的源路径。每行一个路径。可用井号#注释。

## 使用：
1. 执行triggerAutoBackup.cmd。
1. 提示备份完毕是否要关闭计算机。默认为N（否）。无论选什么都会执行备份，区别只是备份完毕后是否关机。
1. 备份过程中的日志会记录在AutoBackup.log文件中。如果该文件已存在，会先把上次的更名为AutoBackup_0.log再生成新的AutoBackup.log文件。更久远的log文件会被删除。
1. AutoBackup将使用7-Zip逐一备份BackupList.properties文件中指定的源路径，每条路径生成一个压缩包放在AutoBackup\backups文件夹中。
1. 如果AutoBackup\backups文件夹已存在同名的压缩包，会先把旧的压缩包更名为*_0.7z再生成新的压缩包。更久远的压缩包会被删除。
