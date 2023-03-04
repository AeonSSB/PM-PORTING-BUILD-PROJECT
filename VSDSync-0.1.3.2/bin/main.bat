:: ============================================================================
:: Virtual SD card main script
:: ============================================================================
@echo off
cls

cd /d %~dp0

set MIN_EXEC_TIME=3

call settings.bat

set PURGE_COMMAND=
if %PURGE%==1 (
    set PURGE_COMMAND=/PURGE
)

call mount.bat || goto error

ROBOCOPY "%BUILD_DIR:\=\\%" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\." ^
    /E ^
    /NS ^
    /NP ^
    /NJH ^
    %PURGE_COMMAND%
IF %ERRORLEVEL% GEQ 8 goto error

timeout /t %MIN_EXEC_TIME% /nobreak > NUL

call unmount.bat || goto error

if %AUTO_LAUNCH%==1 (
    start /realtime "" "%DOLPHIN_PATH%" --exec "%BUILD_DIR%\boot.elf" --batch
)

if %SHOW_RESULTS%==1 (
    pause
)

goto :eof

:error
color 0c
pause > NUL 2> NUL
color
goto :eof