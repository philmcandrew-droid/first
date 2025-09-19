@echo off
echo Building Beer Can VST (Simplified Method)...
echo.

REM Set up Visual Studio environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat"

echo.
echo Step 1: Building Projucer...
cd JUCE\extras\Projucer\Builds\VisualStudio2022

REM Build Projucer
msbuild Projucer.sln /p:Configuration=Release /p:Platform=x64

if %errorlevel% neq 0 (
    echo ERROR: Failed to build Projucer
    pause
    exit /b 1
)

echo ✅ Projucer built successfully!
echo.

REM Go back to project root
cd ..\..\..\..\..

echo Step 2: Generating Visual Studio project for Beer Can VST...
JUCE\extras\Projucer\Builds\VisualStudio2022\x64\Release\App\Projucer.exe --resave BeerCanVST.jucer

if %errorlevel% neq 0 (
    echo ERROR: Failed to generate project files
    pause
    exit /b 1
)

echo ✅ Project files generated!
echo.

echo Step 3: Building Beer Can VST...
cd Builds\VisualStudio2022

msbuild BeerCanVST.sln /p:Configuration=Release /p:Platform=x64

if %errorlevel% neq 0 (
    echo ERROR: Failed to build VST
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS! Beer Can VST built successfully!
echo.
echo The VST3 plugin is located at:
echo Builds\VisualStudio2022\x64\Release\VST3\Beer Can VST.vst3
echo.
echo To install it for your DAW:
echo 1. Copy the .vst3 file to: C:\Program Files\Common Files\VST3\
echo 2. Restart your DAW and rescan plugins
echo.

cd ..\..
pause
