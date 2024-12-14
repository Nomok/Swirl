@echo off

setlocal
set error=0

@rem set FXCOPTS=/nologo /WX /Ges /Zi /Zpc /Qstrip_reflect /Qstrip_debug
set FXCOPTS=/nologo /WX /Ges /Qstrip_reflect /Qstrip_debug
set FXCOPTSNS=/nologo /Ges /Qstrip_reflect /Qstrip_debug

@rem Insert Location into quotes
set PCFXC=""
if exist %PCFXC% goto continue

set PCFXC=fxc.exe

:continue

@rem *** compile non-premultiplied version
set FXCEXT=fxc

call :CompileShaderHLSL4 "swirl" ps ps_main

@rem *** compile premultiplied version
set FXCEXT=premultiplied.%FXCEXT%

call :CompileShaderHLSL4 "swirl" ps ps_main_pm

echo .
if %error% == 0 (
    echo Shaders compiled ok
	@pause
) else (
    echo There were shader compilation errors!
	@pause
)

endlocal
exit /b

:CompileShader
@rem set fxc=%PCFXC% %1.fx %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /FhCompiled\%1_%3.inc /FdCompiled\%1_%3.pdb /Vn%1_%3
set fxc=%PCFXC% "%~1.fx11" %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /Fo"%~1.%FXCEXT%"
echo.
echo %fxc%
%fxc% || set error=1
exit /b

:CompileShaderSM4
@rem set fxc=%PCFXC% %1.fx %FXCOPTS% /T%2_4_0 /E%3 /FhCompiled\%1_%3.inc /FdCompiled\%1_%3.pdb /Vn%1_%3
set fxc=%PCFXC% "%~1.fx11" %FXCOPTS% /T%2_4_0 /E%3 /Fo"%~1.%FXCEXT%"
echo.
echo %fxc%
%fxc% || set error=1
exit /b

:CompileShaderHLSL
@rem set fxc=%PCFXC% %1.hlsl %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /FhCompiled\%1_%3.inc /FdCompiled\%1_%3.pdb /Vn%1_%3
set fxc=%PCFXC% "%~1.hlsl" %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /Fo"%~1.%FXCEXT%"
echo.
echo %fxc%
%fxc% || set error=1
exit /b

:CompileShaderHLSL4
@rem set fxc=%PCFXC% %1.hlsl %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /FhCompiled\%1_%3.inc /FdCompiled\%1_%3.pdb /Vn%1_%3
set fxc=%PCFXC% "%~1.hlsl" %FXCOPTS% /T%2_4_0 /E%3 /Fo"%~1.%FXCEXT%"
echo.
echo %fxc%
%fxc% || set error=1
exit /b

:CompileShaderHLSL4ns
@rem set fxc=%PCFXC% %1.hlsl %FXCOPTS% /T%2_4_0_level_9_1 /E%3 /FhCompiled\%1_%3.inc /FdCompiled\%1_%3.pdb /Vn%1_%3
set fxc=%PCFXC% "%~1.hlsl" %FXCOPTSNS% /T%2_4_0 /E%3 /Fo"%~1.%FXCEXT%"
echo.
echo %fxc%
%fxc% || set error=1
exit /b
