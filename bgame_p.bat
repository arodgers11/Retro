@echo off
setlocal EnableDelayedExpansion
FOR %%a IN (*.eva *.evn *.eve) DO (
SET t=%%~na
SET s=!t:~0,4!
bgame -y !s! -f 0,46-81 %%a >%%~na.bgamep
)