@echo off
setlocal EnableDelayedExpansion
FOR %%a IN (*.eva *.evn *.eve) DO (
SET t=%%~na
SET s=!t:~0,4!
bevent -y !s! -f 0,1-9,26-28,96 %%a >%%~na.bevent
bevent -y !s! -f 0,10-11,29-37,58-61,96 %%a >%%~na.bevento
bevent -y !s! -f 0,14-15,40-45,51,96 %%a >%%~na.beventd
)
0,1-11,14-15,26-37,40-45,51,58-61,96