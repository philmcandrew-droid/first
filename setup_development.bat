@echo off
echo Setting up Beer Can VST Development Environment...
echo.

REM Check if JUCE directory exists
if exist "JUCE" (
    echo JUCE directory found.
) else (
    echo JUCE directory not found. Please follow these steps:
    echo.
    echo 1. Download JUCE from: https://juce.com/get-juce/
    echo 2. Extract the JUCE framework to a folder named "JUCE" in this directory
    echo 3. Run this script again
    echo.
    pause
    exit /b 1
)

REM Check for Visual Studio
echo Checking for Visual Studio...
where cl >nul 2>nul
if %errorlevel% neq 0 (
    echo Visual Studio C++ compiler not found in PATH.
    echo Please install Visual Studio 2019 or later with C++ development tools.
    echo After installation, run this script from a "Developer Command Prompt"
    echo.
    pause
    exit /b 1
) else (
    echo Visual Studio C++ compiler found.
)

REM Check for CMake
echo Checking for CMake...
where cmake >nul 2>nul
if %errorlevel% neq 0 (
    echo CMake not found in PATH.
    echo Please download and install CMake from: https://cmake.org/download/
    echo Make sure to add CMake to your system PATH during installation.
    echo.
    pause
    exit /b 1
) else (
    echo CMake found.
)

REM Create necessary directories
echo Creating project directories...
if not exist "Build" mkdir Build
if not exist "Resources" mkdir Resources
if not exist "Documentation" mkdir Documentation

echo.
echo Development environment setup complete!
echo.
echo Next steps:
echo 1. Open the project in your IDE or text editor
echo 2. Run 'build.bat' to build the plugin
echo 3. Test the plugin in your DAW
echo.
echo For Visual Studio users:
echo - You can generate a Visual Studio solution by running:
echo   cd Build
echo   cmake .. -G "Visual Studio 17 2022" -A x64
echo   Then open BeerCanVST.sln
echo.
pause
