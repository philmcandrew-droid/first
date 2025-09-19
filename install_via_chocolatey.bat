@echo off
echo ========================================
echo   Alternative: Install via Chocolatey
echo ========================================
echo.

echo This method uses Chocolatey package manager to install Visual Studio Build Tools
echo It's often more reliable than direct installers.
echo.

REM Check if Chocolatey is installed
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing Chocolatey package manager...
    echo.
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    
    REM Refresh environment
    call refreshenv.cmd
    
    REM Check again
    where choco >nul 2>nul
    if %errorlevel% neq 0 (
        echo ❌ Chocolatey installation failed
        echo Please install manually from: https://chocolatey.org/install
        pause
        exit /b 1
    )
) else (
    echo ✅ Chocolatey is already installed
)

echo.
echo Installing Visual Studio Build Tools via Chocolatey...
echo This may take 10-20 minutes...
echo.

choco install visualstudio2022buildtools --params "--add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK.19041" -y

if %errorlevel% equ 0 (
    echo ✅ Visual Studio Build Tools installed successfully!
) else (
    echo ❌ Installation failed via Chocolatey
    echo Trying direct installation method...
    call fix_visual_studio.bat
    exit /b %errorlevel%
)

echo.
echo Verifying installation...
call verify_installation.bat

pause
