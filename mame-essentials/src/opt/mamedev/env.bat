:: Find root dir
@if not defined MSYS2_ROOT (
    for /f %%i in ("%~dp0\..\..") do @set MSYS2_ROOT=%%~fi
)

:: Add aliases
@doskey /macrofile="%MSYS2_ROOT%\opt\mamedev\aliases"
:: Use "useraliases" for your own custom aliases so they don't get overwritten on a tools reinstall!
@doskey /macrofile="%MSYS2_ROOT%\win32\useralises" 2>nul
@echo Type "aliases" to get a list of DOSKEY aliases.

@set MINGW32=
@set MINGW64=
@set ADD_PATH=
@set PATH=%windir%\System32;%windir%
:: Enhance Path
@if "%CONFIG_ARCHITECTURE%"=="x86" (
	@set MINGW32=/mingw32
	@set PYTHON_EXECUTABLE=/mingw32/bin/python.exe
	@set MINGW=%MSYS2_ROOT%\mingw32
	@set prompt=[MINGW32] $p$g
) else (
	@set MINGW64=/mingw64
	@set PYTHON_EXECUTABLE=/mingw64/bin/python.exe
	@set MINGW=%MSYS2_ROOT%\mingw64
	@set prompt=[MINGW64] $p$g
)
@set MINGW_PATH=%MINGW%\bin

@set PATH=%ADD_PATH%;%MSYS2_ROOT%\opt\mamedev;%MINGW_PATH%;%MSYS2_ROOT%\usr\bin;%PATH%

@if not exist "%MSYS2_ROOT%\home" (
	@bash --login /dev/null
)
