@echo off
color 0A
echo Cleaning system junk files...

:: Clear Temp files
del /s /f /q %temp%\*.*
rd /s /q %temp%
mkdir %temp%

:: Clear Windows Temp
del /s /f /q C:\Windows\Temp\*.*
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

:: Flush DNS
ipconfig /flushdns

:: Clear Prefetch
del /s /f /q C:\Windows\Prefetch\*.*

echo Optimizing system...

:: Stop unnecessary services (optional)
net stop "SysMain"
net stop "DiagTrack"

:: Disk Cleanup
cleanmgr /sagerun:1

:: Check disk errors
chkdsk /f

echo Done! Restart your system for best performance.
pause