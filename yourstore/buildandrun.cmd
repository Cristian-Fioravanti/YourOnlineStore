@echo off
cls
setlocal

rem ------------------------- PORT NUMBER -------------------------
set /a port=8081
rem ---------------------------------------------------------------

rem Close the spring-boot application if is running.
for /f "tokens=5" %%i in ('netstat -ano ^| findstr ":%port%"') DO (
  if not "%%i"=="" (
    taskkill /f /pid %%i
    goto end
  )
)
:end
endlocal

rem Build the application.
rem call mvn clean install

rem Run the application.
call mvn spring-boot:run -pl modules/voila2sample-web

rem end of script