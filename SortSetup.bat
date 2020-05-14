@echo off

for /r %%f in (*.) do (
  copy %%f %%f.team > nul
)
for /d %%a in (.\*seve) do (
  for /r %%b in (%%a\*.team) do (
    rem echo %%~nb
    call :mkdirs %%b
  )
)
cls
exit /b

:mkdirs
setlocal EnableDelayedExpansion
for /f "tokens=1,3,4 delims=," %%c in (%*) do (
  set name=%%c-%%d %%e
  if not exist ".\Teams\%%c-*" (mkdir ".\Teams\!name!")
  for /d %%f in (.\Teams\%%c-*) do (
    if %%~nxf neq !name! (move "%%f" ".\Teams\!name!" > nul)
  )
)