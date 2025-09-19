# Visual Studio C++ Setup Guide

## Automatic Installation (Recommended)

Run the provided installation script:
```batch
install_visual_studio.bat
```

This will automatically install Visual Studio Community 2022 with all required C++ development tools.

## Manual Installation

If you prefer to install manually or the automatic installation doesn't work:

### Step 1: Launch the Installer
1. Double-click `vs_community.exe` in this directory
2. The Visual Studio Installer will open

### Step 2: Select Workload
1. In the installer, select the **"Desktop development with C++"** workload
2. This will automatically select the necessary components

### Step 3: Additional Components (Recommended)
Make sure these components are selected:
- **MSVC v143 - VS 2022 C++ x64/x86 build tools**
- **Windows 11 SDK** (or Windows 10 SDK)
- **CMake tools for Visual Studio**
- **Git for Windows** (if not already installed)

### Step 4: Install
1. Click the **"Install"** button
2. Wait for the installation to complete (15-30 minutes)
3. Restart your computer when prompted

## Verification

After installation and restart, verify the setup:

### Option 1: Run the verification script
```batch
setup_development.bat
```

### Option 2: Manual verification
1. Open Command Prompt
2. Type: `cl`
3. You should see Microsoft C++ compiler information

### Option 3: Test build
```batch
build.bat
```

## Troubleshooting

### "cl is not recognized"
- Make sure you're running from a **Developer Command Prompt**
- Or run: `"C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"`

### Installation fails
- Run installer as Administrator
- Ensure you have enough disk space (minimum 3GB)
- Check your internet connection

### Build errors
- Ensure Windows SDK is installed
- Verify JUCE framework is in the correct location
- Check that all required Visual Studio components are installed

## Alternative: Build Tools Only

If you only need the compiler without the full IDE:

1. Download **Build Tools for Visual Studio 2022** instead
2. Select **"C++ build tools"** workload
3. Install and restart

## Next Steps

Once Visual Studio is installed:

1. **Build the VST Plugin**:
   ```batch
   build.bat
   ```

2. **Open in Visual Studio** (optional):
   ```batch
   cd Build
   cmake .. -G "Visual Studio 17 2022" -A x64
   start BeerCanVST.sln
   ```

3. **Install the Plugin**:
   - The built VST3 will be in `Build/Release/BeerCanVST_artefacts/Release/VST3/`
   - Copy to: `C:\Program Files\Common Files\VST3\`

## System Requirements

- **OS**: Windows 10 version 1909 or later
- **RAM**: 4GB minimum, 8GB recommended
- **Disk Space**: 3GB for minimal install, 5GB+ recommended
- **Internet**: Required for download and installation

---

*After completing this setup, your Beer Can VST development environment will be fully ready!*
