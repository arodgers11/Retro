@echo off
setlocal EnableDelayedExpansion

for /r %%f in (.\posteve\*.) do (
set y=%%~nf
set year=!y:~4!
  if not exist ".\Post\!year!" (
    mkdir ".\Post\!year!"
  )
)
if exist ".\Post\BAK" (rmdir ".\Post\BAK")

for %%f in (.\posteve\*.beven* .\posteve\*.bgam* .\posteve\*.box) do (
  set s=%%~nf
  set str=!s:~4!
  set year=!s:~0,4!
  if not exist ".\Post\!year!\!str!" (mkdir ".\Post\!year!\!str!")
  rem echo %%~nf
  copy %%f ".\Post\!year!\!str!" > nul
)
cls
exit /b