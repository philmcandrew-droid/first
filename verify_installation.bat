@echo off
echo Verifying Visual Studio C++ Installation...
echo.

REM Check if Visual Studio is installed
if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    echo ✅ Visual Studio Community 2022 found
) else (
    if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" (
        echo ✅ Visual Studio Build Tools 2022 found
    ) else (
        echo ❌ Visual Studio not found
        echo Please complete the Visual Studio installation first.
        pause
        exit /b 1
    )
)

REM Set up VS environment and test compiler
echo Setting up Visual Studio environment...

REM Try Community edition first
if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" >nul 2>&1
) else (
    REM Try Build Tools edition
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" >nul 2>&1
)

echo Testing C++ compiler...
cl >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ C++ compiler (cl.exe) is working
) else (
    echo ❌ C++ compiler not found or not working
    echo Make sure Visual Studio C++ tools are properly installed
    pause
    exit /b 1
)

echo Testing CMake...
cmake --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ CMake is available
) else (
    echo ⚠️  CMake not found in PATH
    echo CMake might be installed with Visual Studio but not in PATH
)

echo.
echo Testing JUCE framework...
if exist "JUCE\modules\juce_core" (
    echo ✅ JUCE framework is properly installed
) else (
    echo ❌ JUCE framework not found
    echo Please ensure JUCE is extracted to the JUCE folder
    pause
    exit /b 1
)

echo.
echo 🎉 All components verified successfully!
echo.
echo Your development environment is ready for building the Beer Can VST!
echo.
echo Next steps:
echo 1. Run 'build.bat' to build the VST plugin
echo 2. The plugin will be built to the Build folder
echo 3. Install the .vst3 file to your DAW's plugin directory
echo.
pause
