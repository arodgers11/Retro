@ECHO OFF
FOR /d /r %%a IN ( .\*eve ) DO (
  COPY b*.exe %%a >nul
  COPY b*.bat %%a >nul
)
FOR /d %%f IN (.\*eve) DO (
  cd %%f
  call bevent.bat
  call bgame.bat
  rem call box.bat
  cd ..
)

echo Starting EventCombine
call .\eventcombine.bat

echo Starting GameCombine
call .\gamecombine.bat

echo Starting SortSetup
call SortSetup.bat

echo Starting Sort
call .\Sort.bat

echo Starting SortPost
call .\SortPost.bat

echo Complete
echo Starting Access

start "" "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE" "D:\Code\Retro\bgame.accdb" /x makedirs
start "" "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE" "D:\Code\Retro\bevent.accdb" /x makedirs
start "" "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE" "D:\Code\Retro\bevent_offense.accdb" /x makedirs
start "" "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE" "D:\Code\Retro\bevent_defense.accdb" /x makedirs

exit