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

REM Check if the file exists at the stored path
if not exist "%DATAWIN_PATH%" (
    echo ERROR: The path stored in datawin_path.txt is invalid or the file does not exist.
    echo Path read: %DATAWIN_PATH%
    pause
    exit /b 1
)

echo The path to data.win is valid:
echo %DATAWIN_PATH%

echo. 

set /p answer= Import modded file to github repo? (Y/N)?

if /i "%answer:~,1%" EQU "N" exit /b

if /i "%answer:~,1%" EQU "Y" (
    copy "..\mod-data-win-file\data.win" "..\backup\before_save_data.win"

    echo Importing %DATAWIN_PATH%
    copy "%DATAWIN_PATH%" "..\mod-data-win-file\data.win"
)

pause