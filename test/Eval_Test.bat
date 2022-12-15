@echo off
REM  "Multi" is a thread-pool emulation helper library for controlling multi-threaded windows batch [*.BAT] files
REM  Copyright (c) 2020-2022 Adisak Pochanayon
REM  Contact: adisak@gmail.com
REM  See EvalBat_License.txt for details
REM  Currently hosted at https://github.com/adisak/EvalBat

REM -----------------------------------

REM TEST Multi
REM :TestMultithreading
SETLOCAL
SET PATH=%PATH%;..\scripts

call EvalBat_Echo.bat 1 + 2 / 5

echo.
call EvalBat_Echo.bat Abs(1 - 2)

echo.
call EvalBat_Echo.bat Int((100 / 3)*100)/100

REM Now with simple string support, use two single quotes to emulate a double quote
echo.
call EvalBat_Echo.bat UCase(''hello'') + '' world''

ENDLOCAL
goto:EOF
