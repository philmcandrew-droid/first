@echo off
echo.
echo ========================================
echo   Beer Can VST - Installation Status
echo ========================================
echo.

echo Checking components...
echo.

REM Check JUCE
if exist "JUCE\modules\juce_core" (
    echo ✅ JUCE Framework: INSTALLED
) else (
    echo ❌ JUCE Framework: NOT FOUND
)

REM Check Visual Studio
if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    echo ✅ Visual Studio Community: INSTALLED
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" (
    echo ✅ Visual Studio Build Tools: INSTALLED
) else (
    echo ❌ Visual Studio: NOT INSTALLED
)

REM Check project files
if exist "Source\PluginProcessor.cpp" (
    echo ✅ VST Source Code: READY
) else (
    echo ❌ VST Source Code: MISSING
)

if exist "BeerCanVST.jucer" (
    echo ✅ JUCE Project File: READY
) else (
    echo ❌ JUCE Project File: MISSING
)

echo.
echo ========================================
echo   Available Actions
echo ========================================
echo.

if exist "vs_community.exe" (
    echo 📥 install_visual_studio.bat - Install Visual Studio
)

echo 🔍 verify_installation.bat   - Verify all components
echo 🔨 build.bat                 - Build the VST plugin
echo 📖 README.md                 - Read documentation
echo 📋 VISUAL_STUDIO_SETUP.md   - Visual Studio setup guide

echo.
echo ========================================
echo.

REM Show next recommended action
if not exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    if not exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" (
        echo 🎯 NEXT STEP: Run 'install_visual_studio.bat' to install Visual Studio
        echo.
    )
) else (
    echo 🎯 NEXT STEP: Run 'verify_installation.bat' to test everything
    echo    Then run 'build.bat' to build your VST plugin!
    echo.
)

pause
