@echo off
REM  "EvalBat" is a helper that lets you evaluate (vbscript) expressions in a batch file
REM  "EvalBat" can be used to add floating point support and complex math support to batch files
REM  Copyright (c) 2020-2022 Adisak Pochanayon
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
	ECHO EvalBat Evaluating: %*
:SkipShowInputExpression

SET EVALBAT_RESULT=

REM Uncomment the following line to debug (//X == execute in debugger)
REM cscript.exe /nologo //X "%~dp0\EvalBat_vbs.vbs" "%*"

REM Evaluate Expression and Get Result
for /f "tokens=* usebackq" %%t in (`cscript.exe /nologo "%~dp0\EvalBat_vbs.vbs" "%*"`) do (
	SET EVALBAT_RESULT=%%t
)

if ""=="%EVALBAT_VERBOSE%" GOTO :SkipShowResult
echo EvalBat Result: %EVALBAT_RESULT%
:SkipShowResult