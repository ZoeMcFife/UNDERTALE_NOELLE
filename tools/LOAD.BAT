@echo off
setlocal

REM Check if the datawin_path.txt file exists
if not exist datawin_path.txt (
    echo ERROR: Path file datawin_path.txt not found!
    pause
    exit /b 1
)

REM Read the path from the file
set /p DATAWIN_PATH=<datawin_path.txt

REM Get directory from path
for %%I in ("%DATAWIN_PATH%") do set "DATAWIN_DIR=%%~dpI"

REM Check if the directory exists
if not exist "%DATAWIN_DIR%" (
    echo ERROR: The directory in datawin_path.txt is invalid.
    echo Path read: %DATAWIN_PATH%
    pause
    exit /b 1
)

echo The directory in datawin_path.txt is valid:
echo %DATAWIN_PATH%
echo.

echo WARNING: This will overwrite the current data.win file!

pause

set /p answer= Export modded data.win from repo to game? (Y/N)?

if /i "%answer:~,1%" EQU "N" exit /b

if /i "%answer:~,1%" EQU "Y" (
    copy %DATAWIN_PATH% "..\backup\before_load_data.win"

    echo Exporting data.win to %DATAWIN_PATH%
    copy "..\mod-data-win-file\data.win" "%DATAWIN_PATH%"
)

pause