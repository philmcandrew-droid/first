# Visual Studio Installation Troubleshooting

## Common Issues and Solutions

### Issue: vs_community.exe won't run or gives error

This is a common problem with several possible solutions:

## Solution 1: Use Build Tools Instead (Recommended)

The Build Tools installer is often more reliable:

```batch
# Run this - Build Tools installer should now be open
start vs_buildtools.exe
```

**In the installer GUI:**
1. Select **"C++ build tools"** workload
2. Make sure these are checked:
   - MSVC v143 - VS 2022 C++ x64/x86 build tools
   - Windows 10/11 SDK (latest version)
   - CMake tools for Visual Studio
3. Click **Install**

## Solution 2: Run Our Fix Script

```batch
fix_visual_studio.bat
```

This tries multiple installation methods automatically.

## Solution 3: Use Chocolatey Package Manager

```batch
install_via_chocolatey.bat
```

This uses a package manager which is often more reliable.

## Solution 4: Manual Download

If all else fails, download directly from Microsoft:

1. Go to: https://visualstudio.microsoft.com/downloads/
2. Download **Visual Studio Community 2022** (free)
3. Run the installer
4. Select **"Desktop development with C++"** workload
5. Install

## Solution 5: Common Fixes

### Run as Administrator
```batch
# Right-click Command Prompt → "Run as Administrator"
vs_community.exe
```

### Disable Antivirus Temporarily
- Some antivirus software blocks Visual Studio installers
- Temporarily disable and retry

### Check Windows Updates
- Install all Windows updates
- Restart and retry

### Clear Temp Files
```batch
# Clean temporary files
del /q /f %TEMP%\*.*
```

### Check System Requirements
- Windows 10 version 1909 or later
- 4GB RAM minimum
- 3GB+ free disk space

## Alternative: Minimal Installation

If you just need the compiler without the full IDE:

### Option A: Windows SDK Only
1. Download **Windows SDK** from Microsoft
2. This includes the MSVC compiler

### Option B: MSYS2 with MinGW
```batch
# Install MSYS2 (alternative compiler)
# Download from: https://www.msys2.org/
```

## Verification Commands

After any installation, test with:

```batch
# Test our verification script
verify_installation.bat

# Or manually test:
cl
cmake --version
```

## If Nothing Works

### Last Resort Options:

1. **Use Online Compiler**
   - Use online C++ compilers for testing
   - GitHub Codespaces
   - Replit

2. **Use Different Computer**
   - Try installation on another Windows machine
   - Use virtual machine

3. **Contact Support**
   - Microsoft Visual Studio support
   - JUCE community forums

## Error Codes Reference

| Error | Meaning | Solution |
|-------|---------|----------|
| 0x80070005 | Access denied | Run as Administrator |
| 0x80072F8F | Time/date wrong | Check system clock |
| 0x80240017 | Update needed | Install Windows updates |
| 0x80070643 | .NET issue | Install .NET Framework |

## Environment Variables

After successful installation, these should be set:

```batch
# Check these paths exist:
echo %VSINSTALLDIR%
echo %VCINSTALLDIR%
echo %WindowsSDKDir%
```

## Build Without Visual Studio

If Visual Studio won't install, you can use alternative compilers:

### MinGW-w64
```batch
# Download from: https://www.mingw-w64.org/
# Or via MSYS2: https://www.msys2.org/
```

### Clang/LLVM
```batch
# Download from: https://llvm.org/releases/
```

Then modify our CMakeLists.txt to use the alternative compiler.

---

**Need more help?** Run `installation_status.bat` to see current status and next steps.
