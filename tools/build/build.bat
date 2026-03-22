@echo off

REM run maps staging
call "%~dp0modular_starfly\modules\starfly_ships\maps.bat"
if errorlevel 1 exit /b %errorlevel%

REM continue with build
"%~dp0\..\bootstrap\node.bat" --experimental-modules "%~dp0\build.js" %*
