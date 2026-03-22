@echo off
setlocal enabledelayedexpansion

REM if this module isn't enabled, just bail out here (no error)
findstr /x "#define STARFLY13_MODULE_STARFLY_SHIPS_ENABLED" code\__DEFINES\__starfly.dm >nul || exit /b 0

REM define some useful stuff
set "dest_maps=_maps"
set "modules_root=modular_starfly\modules"
set "starfly_maps=%modules_root%\starfly_ships\_maps"
set "STARFLY_MAPS_DIR=.staging\_maps"

REM if _maps doesn't exist, bail with error
if not exist "%dest_maps%\" (
    echo ERROR: %dest_maps% not found 1>&2
    exit /b 1
)

REM clean staging dir
if exist "%STARFLY_MAPS_DIR%" rmdir /s /q "%STARFLY_MAPS_DIR%"
mkdir "%STARFLY_MAPS_DIR%" || exit /b 1

REM copy base maps
echo Copying: %dest_maps% -> %STARFLY_MAPS_DIR%\
xcopy "%dest_maps%\*" "%STARFLY_MAPS_DIR%\" /e /i /y >nul || exit /b 1

REM merge module maps (except starfly_ships)
for /d %%M in ("%modules_root%\*") do (
    if /i not "%%~nxM"=="starfly_ships" (
        if exist "%%M\_maps\" (
            echo Merging: %%M\_maps -> %STARFLY_MAPS_DIR%\
            xcopy "%%M\_maps\*" "%STARFLY_MAPS_DIR%\" /e /i /y >nul || exit /b 1
        )
    )
)

REM remove maps specified by starfly_ships
if exist "%starfly_maps%\" (
    pushd "%starfly_maps%"
    for /r %%F in (*) do (
        set "rel=%%F"
        set "rel=!rel:%cd%\=!"
        echo Removing: %STARFLY_MAPS_DIR%\!rel!
        if exist "%STARFLY_MAPS_DIR%\!rel!" (
            del /f /q "%STARFLY_MAPS_DIR%\!rel!" >nul 2>&1
        )
    )
    popd
)

endlocal
