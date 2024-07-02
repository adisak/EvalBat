@echo off
REM  "EvalBat" is a helper that lets you evaluate (vbscript) expressions in a batch file
REM  "EvalBat" can be used to add floating point support and complex math support to batch files
REM  Copyright (c) 2020-2022 Adisak Pochanayon
REM  Contact: adisak@gmail.com
REM  See EvalBat_License.txt for details
REM  Currently hosted at https://github.com/adisak/EvalBat

REM -----------------------------------

echo Input: %*
REM call "%~dp0\EvalBat.bat" %*
REM echo Result: %EVALBAT_RESULT%

cscript.exe /nologo //X "%~dp0\EvalBat_vbs.vbs" "%*"
