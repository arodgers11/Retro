@echo off
setlocal enabledelayedexpansion

if exist Event\bevent.txt (del Event\bevent.txt)
type .\EventColNames.txt >> .\Event\bevent.txt
if exist Event\bevent_def.txt (del Event\bevent_def.txt)
type .\EventDefenseColNames.txt >> .\Event\bevent_def.txt
if exist Event\bevent_off.txt (del Event\bevent_off.txt)
type .\EventOffenseColNames.txt >> .\Event\bevent_off.txt

for /d %%f in (.\*seve) do ( 
  set year=%%~nf
  set year=!year:~0,5!
  for /d %%t in (.\Teams\*) do (
    for /f "tokens=1 delims=-" %%a in ("%%~nt") do (
      if exist %%f\%%a*.ros (
        set s=!year!
        set s=!s:~0,1!
        set /a n=!s!
        if !n! equ 1 (
          if not "%%a" equ "AL" (
            if not "%%a" equ "NL" (
              call :combo %%~nf %%a !year!
            )
          )
        ) else (
          if !n! equ 2 (
            if not "%%a" equ "AL" (
              if not "%%a" equ "NL" (
                call :combo %%~nf %%a !year!
              )
            )
          )
        )
      )
    )
  )
)
cls

rem py .\eventsplit.py
exit /b

:combo
for %%i in (%1\*%2.bevent) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Event\bevent.txt
  )
)

for %%i in (%1\*%2.beventd) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Event\bevent_def.txt
  )
)

for %%i in (%1\*%2.bevento) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Event\bevent_off.txt
  )
)