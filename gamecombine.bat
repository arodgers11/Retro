@echo off
setlocal enabledelayedexpansion

if exist Game\bgame.txt (del Game\bgame.txt)
type .\GameColNames.txt >> .\Game\bgame.txt
if exist Game\bgame_env.txt (del Game\bgame_env.txt)
type .\GameEnvColNames.txt >> .\Game\bgame_env.txt
if exist Game\bgame_p.txt (del Game\bgame_p.txt)
type .\GamePlayerColNames.txt >> .\Game\bgame_p.txt

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

rem py .\gamesplit.py
cls

exit /b

:combo
for %%i in (%1\*%2.bgame) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Game\bgame.txt
  )
)

for %%i in (%1\*%2.bgamep) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Game\bgame_p.txt
  )
)

for %%i in (%1\*%2.bgameenv) do (
  if exist %1\%2*.ros (
    rem echo %%~ni
    type %%i >> .\Game\bgame_env.txt
  )
)