@echo off
setlocal EnableDelayedExpansion
FOR %%a IN (*.eva *.evn *.eve) DO (
SET t=%%~na
SET s=!t:~0,4!
box -y !s! -vn %%a >%%~na.box
)