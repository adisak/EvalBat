REM  "EvalBat" is a helper that lets you evaluate (vbscript) expressions in a batch file
REM  "EvalBat" can be used to add floating point support and complex math support to batch files
REM  Copyright (c) 2020-2021 Adisak Pochanayon
REM  Contact: adisak@gmail.com
REM  See EvalBat_License.txt for details
REM  Currently hosted at https://github.com/adisak/EvalBat

REM -----------------------------------

Set objArgs = WScript.Arguments
If objArgs.Count > 1 Then
	allArgs = objArgs(0)
	For i = 1 to (objArgs.Count-1)
		allArgs = allArgs + " " + objArgs(i)
	Next
	wscript.echo eval(allArgs)
ElseIf 1 = objArgs.Count Then
	wscript.echo eval(objArgs(0))
Else
	wscript.echo "0"
End If

Wscript.Quit

REM -----------------------------------
REM Expand the functions supported
REM Additional Helpful Functions

REM Pi = π
Function Pi()
	REM Pi = System.Math.Pi
	Pi = 4 * Atn(1) 
End Function

REM Comparison Helpers LT <, LE <=, GT >, GE >=
REM Returns (-1) for TRUE and (0) for FALSE
REM You can't use < and > in BAT files because they do file redirection
Function CmpLT(A,B)
	CmpLT = (A < B)
End Function
Function CmpLE(A,B)
	CmpLE = (A <= B)
End Function
Function CmpGT(A,B)
	CmpGT = (A > B)
End Function
Function CmpGE(A,B)
	CmpGE = (A >= B)
End Function

REM Power Functions ^
REM You can't use ^ in BAT files because it's an escape character
Function Pow(A,B)
	Pow = A ^ B
End Function

REM Logarithm to base N	LogN(X) = Log(X) / Log(N)
Function LogN(X,N)
	LogN = Log(X) / Log(N)
End Function
REM Exponential in base N	ExpN(X) = Exp(X * Log(N))
Function ExpN(X,N)
	ExpN = Exp(X * Log(N))
End Function


REM -----------------------------------
REM Expand the functions supported
REM Derived math functions from Microsoft online VBS documentation
REM https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/derived-math-functions

REM Secant	Sec(X) = 1 / Cos(X)
Function Sec(X)
  Sec = 1 / Cos(X)
End Function
REM Cosecant	Cosec(X) = 1 / Sin(X)
Function Cosec(X)
	Cosec = 1 / Sin(X)
End Function
REM Cotangent	Cotan(X) = 1 / Tan(X)
Function Cotan(X)
	Cotan = 1 / Tan(X)
End Function
REM Inverse Sine	Arcsin(X) = Atn(X / Sqr(-X * X + 1))
Function Arcsin(X)
	Arcsin = Atn(X / Sqr(-X * X + 1))
End Function
REM Inverse Cosine	Arccos(X) = Atn(-X / Sqr(-X * X + 1)) + 2 * Atn(1)
Function Arccos(X)
	Arccos = Atn(-X / Sqr(-X * X + 1)) + 2 * Atn(1)
End Function
REM Inverse Secant	Arcsec(X) = Atn(X / Sqr(X * X - 1)) + Sgn((X) - 1) * (2 * Atn(1))
Function Arcsec(X)
	Arcsec = Atn(X / Sqr(X * X - 1)) + Sgn((X) - 1) * (2 * Atn(1))
End Function
REM Inverse Cosecant	Arccosec(X) = Atn(X / Sqr(X * X - 1)) + (Sgn(X) - 1) * (2 * Atn(1))
Function Arccosec(X)
	Arccosec = Atn(X / Sqr(X * X - 1)) + (Sgn(X) - 1) * (2 * Atn(1))
End Function
REM Inverse Cotangent	Arccotan(X) = Atn(X) + 2 * Atn(1)
Function Arccotan(X)
	Arccotan = Atn(X) + 2 * Atn(1)
End Function
REM Hyperbolic Sine	HSin(X) = (Exp(X) - Exp(-X)) / 2
Function HSin(X)
	HSin = (Exp(X) - Exp(-X)) / 2
End Function
REM Hyperbolic Cosine	HCos(X) = (Exp(X) + Exp(-X)) / 2
Function HCos(X)
	HCos = (Exp(X) + Exp(-X)) / 2
End Function
REM Hyperbolic Tangent	HTan(X) = (Exp(X) - Exp(-X)) / (Exp(X) + Exp(-X))
Function HTan(X)
	HTan = (Exp(X) - Exp(-X)) / (Exp(X) + Exp(-X))
End Function
REM Hyperbolic Secant	HSec(X) = 2 / (Exp(X) + Exp(-X))
Function HSec(X)
	HSec = 2 / (Exp(X) + Exp(-X))
End Function
REM Hyperbolic Cosecant	HCosec(X) = 2 / (Exp(X) - Exp(-X))
Function HCosec(X)
	HCosec(X) = 2 / (Exp(X) - Exp(-X))
End Function
REM Hyperbolic Cotangent	HCotan(X) = (Exp(X) + Exp(-X)) / (Exp(X) - Exp(-X))
Function HCotan(X)
	HCotan = (Exp(X) + Exp(-X)) / (Exp(X) - Exp(-X))
End Function
REM Inverse Hyperbolic Sine	HArcsin(X) = Log(X + Sqr(X * X + 1))
Function HArcsin(X)
	HArcsin = Log(X + Sqr(X * X + 1))
End Function
REM Inverse Hyperbolic Cosine	HArccos(X) = Log(X + Sqr(X * X - 1))
Function HArccos(X)
	HArccos = Log(X + Sqr(X * X - 1))
End Function
REM Inverse Hyperbolic Tangent	HArctan(X) = Log((1 + X) / (1 - X)) / 2
Function HArctan(X)
	HArctan = Log((1 + X) / (1 - X)) / 2
End Function
REM Inverse Hyperbolic Secant	HArcsec(X) = Log((Sqr(-X * X + 1) + 1) / X)
Function HArcsec(X)
	HArcsec = Log((Sqr(-X * X + 1) + 1) / X)
End Function
REM Inverse Hyperbolic Cosecant	HArccosec(X) = Log((Sgn(X) * Sqr(X * X + 1) + 1) / X)
Function HArccosec(X)
	HArccosec = Log((Sgn(X) * Sqr(X * X + 1) + 1) / X)
End Function
REM Inverse Hyperbolic Cotangent	HArccotan(X) = Log((X + 1) / (X - 1)) / 2
Function HArccotan(X)
	HArccotan = Log((X + 1) / (X - 1)) / 2
End Function

REM -----------------------------------

