@echo off
echo Building Beer Can VST...

REM Check if JUCE is available
if not exist "JUCE" (
    echo ERROR: JUCE framework not found!
    echo Please download JUCE from https://juce.com/get-juce/
    echo and extract it to the JUCE folder in this directory.
    pause
    exit /b 1
)

REM Set up Visual Studio environment
echo Setting up Visual Studio environment...
if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"
) else (
    echo ERROR: Visual Studio not found!
    echo Please install Visual Studio 2022 with C++ development tools.
    echo You can run: install_visual_studio.bat
    pause
    exit /b 1
)

REM Create build directory
if not exist "Build" mkdir Build
cd Build

REM Generate Visual Studio project files
echo Generating Visual Studio project files...
cmake .. -G "Visual Studio 17 2022" -A x64

if %errorlevel% neq 0 (
    echo ERROR: CMake generation failed!
    pause
    exit /b 1
)

REM Build the project
echo Building Release configuration...
cmake --build . --config Release

if %errorlevel% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo Build completed successfully!
echo VST3 plugin should be available in the Build/Release folder.
echo.

REM Optional: Copy to system VST directory
set VST3_DIR="%ProgramFiles%\Common Files\VST3"
if exist %VST3_DIR% (
    echo Do you want to install the plugin to the system VST3 directory?
    echo This will copy the plugin to %VST3_DIR%
    choice /c YN /m "Install to system directory (Y/N)"
    if errorlevel 2 goto :skip_install
    if errorlevel 1 (
        echo Installing plugin...
        xcopy "Release\BeerCanVST_artefacts\Release\VST3\*.vst3" %VST3_DIR% /s /y
        echo Plugin installed successfully!
    )
)

:skip_install
cd ..
echo.
echo Build process complete!
pause
