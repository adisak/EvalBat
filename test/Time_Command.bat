@echo off
REM  "EvalBat" is a helper that lets you evaluate (vbscript) expressions in a batch file
REM  Copyright (c) 2020-2023 Adisak Pochanayon
REM  Contact: adisak@gmail.com
REM  See EvalBat_License.txt for details
REM  Currently hosted at https://github.com/adisak/EvalBat

REM -----------------------------------

REM TEST script to Time a command
SETLOCAL
SET PATH=%PATH%;..\scripts

call :TestEBTimer

ENDLOCAL
goto:EOF

REM -----------------------------------
REM Subroutines
:BeginEBTimer
call EvalBat.bat Now
set %~1EBTimeBegin=%EVALBAT_RESULT%
goto:EOF

:EndEBTimer
call EvalBat.bat Now
set %~1EBTimeEnd=%EVALBAT_RESULT%
goto:EOF

:EvalEBTimer
SETLOCAL EnableDelayedExpansion
set TIMESTART=!%~1EBTimeBegin!
if "%~2"=="" (
	set TIMEEND=!%~1EBTimeEnd!
) else (
	set TIMEEND=!%~2EBTimeEnd!
)
ENDLOCAL & call EvalBat.bat DateDiff(''s'',cDate(''%TIMESTART%''),cDate(''%TIMEEND%''))
SETLOCAL
echo %EVALBAT_RESULT% seconds
call EvalBat.bat %EVALBAT_RESULT%/60
echo %EVALBAT_RESULT% minutes
ENDLOCAL
goto:EOF

REM -----------------------------------

:TestEBTimer
SETLOCAL

echo Time (10 seconds)

call :BeginEBTimer
timeout /T 10 /NOBREAK >NUL
call :EndEBTimer
call :EvalEBTimer

echo Time {T1} (5 seconds)

call :BeginEBTimer T1
timeout /T 5 /NOBREAK >NUL
call :EndEBTimer T1
call :EvalEBTimer T1

echo Total Time
call :EvalEBTimer "" T1

ENDLOCAL
goto:EOF

REM -----------------------------------
