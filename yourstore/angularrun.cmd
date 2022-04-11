@echo off
cls
setlocal

rem ------------------------- PORT NUMBER -------------------------
set /a port=4200
rem ---------------------------------------------------------------

rem Close the angular application if is running.
for /f "tokens=5" %%i in ('netstat -ano ^| findstr ":%port%"') DO (
  if not "%%i"=="" (
    taskkill /f /pid %%i
    goto end
  )
)
:end

pushd %cd%
cd modules/voila2sample-angular2
if not exist node_modules (call npm install)
start /b /wait ng serve --aot=false --progress=true --host=localhost --port=%port% --open=true
endlocal
popd

rem end of script