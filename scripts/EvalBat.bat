@echo off
REM  "EvalBat" is a helper that lets you evaluate (vbscript) expressions in a batch file
REM  "EvalBat" can be used to add floating point support and complex math support to batch files
REM  Copyright (c) 2020-2021 Adisak Pochanayon
REM  Contact: adisak@gmail.com
REM  See EvalBat_License.txt for details
REM  Currently hosted at https://github.com/adisak/EvalBat

REM -----------------------------------

REM :EvalBat
REM Parameters: (VBS) Expression to evaluate
REM Returns: EVALBAT_RESULT - result of evaluating input expression

REM Uncommenting this line can be useful for debugging
REM SET EVALBAT_VERBOSE=1
if ""=="%EVALBAT_VERBOSE%" GOTO :SkipShowInputExpression
	ECHO Evaluating: %*
:SkipShowInputExpression

SET EVALBAT_RESULT=

REM cscript.exe /nologo "%~dp0\EvalBat_vbs.vbs" "%*"
for /f "usebackq" %%t in (`cscript.exe /nologo "%~dp0\EvalBat_vbs.vbs" "%*"`) do (
	SET EVALBAT_RESULT=%%t
)
REM echo Result: %EVALBAT_RESULT%
