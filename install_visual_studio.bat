@echo off
echo Installing Visual Studio Community 2022 with C++ Development Tools...
echo.

echo This will install:
echo - Visual Studio Community 2022 (Free)
echo - C++ Build Tools and Compiler
echo - Windows SDK
echo - CMake Tools
echo - Git for Windows (if not present)
echo.

echo The installation may take 15-30 minutes depending on your internet speed.
echo.

pause

echo Starting Visual Studio Community installer...
echo.

REM Run the installer with C++ development workload
vs_community.exe --add Microsoft.VisualStudio.Workload.NativeDesktop ^
                  --add Microsoft.VisualStudio.Workload.VCTools ^
                  --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
                  --add Microsoft.VisualStudio.Component.Windows10SDK.19041 ^
                  --add Microsoft.VisualStudio.Component.VC.CMake.Project ^
                  --add Microsoft.VisualStudio.Component.Git ^
                  --includeRecommended ^
                  --quiet

if %errorlevel% neq 0 (
    echo.
    echo Installation may have encountered issues.
    echo You can also run the installer manually by double-clicking vs_community.exe
    echo and selecting "Desktop development with C++" workload.
    echo.
    pause
    exit /b 1
)

echo.
echo Visual Studio installation completed!
echo.
echo Please restart your computer to ensure all components are properly configured.
echo After restart, you can build the Beer Can VST by running: build.bat
echo.
pause
