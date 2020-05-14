@echo off
setlocal enabledelayedexpansion

for /r %%f in (*.) do (
  for /f "tokens=1,3,4 delims=," %%l in (%%f) do (
    set team=%%l-%%m %%n
    if "%%m" EQU "American League" (
      if not exist ".\Teams\AS-All_Star" (
        mkdir ".\Teams\AS-All_Star"
      )
    )
    if "%%m" EQU "National League" (
      if not exist ".\Teams\AS-All_Star" (
        mkdir ".\Teams\AS-All_Star"
      )
    )
    if "%%m" NEQ "National League" (
      if "%%m" NEQ "American League" (
        if not exist ".\Teams\%%l-*" (
          mkdir ".\Teams\!team!"
        )
      )
    )
  )
)


for /r %%f in (*.box *.beven* *.bgam*) do (   
   set s=%%~nf
   set str=!s:~4!
   rem echo %%~nf
   call :file !str! %%f
)
cls
exit /b

:file
@echo off
if "%1" NEQ "AS." (
  for /d %%i in (Teams\%1-*) do (
    copy %2 ".\%%i\%~nx2" > nul
  )
)
if "%1" EQU "AS." (
  copy %2 ".\Teams\AS-All_Star\%~nx2" > nul
)