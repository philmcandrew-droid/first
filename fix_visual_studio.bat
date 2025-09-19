@echo off
echo ========================================
echo   Visual Studio Installation Fix
echo ========================================
echo.

echo Attempting multiple installation methods...
echo.

REM Method 1: Try Build Tools (more reliable)
echo Method 1: Trying Visual Studio Build Tools...
if exist "vs_buildtools.exe" (
    echo Running Build Tools installer...
    echo.
    vs_buildtools.exe --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK.19041 --includeRecommended --quiet --wait
    
    if %errorlevel% equ 0 (
        echo ✅ Build Tools installation completed successfully!
        goto :verify
    ) else (
        echo ⚠️ Build Tools installation may have issues, trying next method...
    )
) else (
    echo vs_buildtools.exe not found, downloading...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vs_buildtools.exe' -OutFile 'vs_buildtools.exe'"
    if exist "vs_buildtools.exe" (
        echo Retrying with Build Tools...
        vs_buildtools.exe --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --quiet --wait
    )
)

echo.
echo Method 2: Trying Visual Studio Community (GUI mode)...
if exist "vs_community.exe" (
    echo Opening Visual Studio Community installer in GUI mode...
    echo Please manually select "Desktop development with C++" workload
    echo.
    start vs_community.exe
    echo.
    echo Please complete the installation in the GUI and then press any key...
    pause
) else (
    echo vs_community.exe not found
)

echo.
echo Method 3: Direct download of alternative installer...
echo Downloading fresh Visual Studio installer...
powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vs_community.exe' -OutFile 'vs_community_fresh.exe'"

if exist "vs_community_fresh.exe" (
    echo Trying fresh installer...
    start vs_community_fresh.exe
    echo Please complete the installation and press any key when done...
    pause
)

:verify
echo.
echo Verifying installation...
call verify_installation.bat

echo.
echo ========================================
echo   Troubleshooting Complete
echo ========================================
echo.

if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" (
    echo ✅ Visual Studio Community installed successfully!
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" (
    echo ✅ Visual Studio Build Tools installed successfully!
) else (
    echo ❌ Visual Studio installation may have failed
    echo.
    echo Additional troubleshooting options:
    echo 1. Run Windows Update and restart
    echo 2. Temporarily disable antivirus
    echo 3. Run installer as Administrator
    echo 4. Check Windows Event Viewer for error details
    echo 5. Try installing from Microsoft's website directly
    echo.
    echo Manual download: https://visualstudio.microsoft.com/downloads/
)

pause
