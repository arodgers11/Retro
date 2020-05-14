@echo off
setlocal EnableDelayedExpansion
FOR %%a IN (*.eva *.evn *.eve) DO (
SET t=%%~na
SET s=!t:~0,4!
bgame -y !s! -f 0,10-11,33-44 %%a >%%~na.bgame
bgame -y !s! -f 0,1-9,18,26,28,30,32 %%a >%%~na.bgameenv
bgame -y !s! -f 0,46-81 %%a >%%~na.bgamep
)