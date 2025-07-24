@echo off
setlocal

REM Check if a file was dragged and dropped
echo Please drag your Undertale data.win file onto this script.
set /p "id=Drag data.win file here: "

REM Save the full path of the data.win file
set "DATAWIN_PATH=%id%"


echo.
REM Optionally, save the path to a file for other scripts to read
echo %DATAWIN_PATH% > datawin_path.txt

echo Undertale data.win path saved:
echo %DATAWIN_PATH%

echo.

pause