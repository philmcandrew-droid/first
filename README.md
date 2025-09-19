# Beer Can VST

A unique multi-effect VST plugin featuring chorus, reverb, and delay effects with a distinctive beer can-themed user interface.

## Features

### Audio Effects
- **Chorus**: Rate, Depth, Feedback, and Mix controls
- **Reverb**: Room Size, Damping, Wet/Dry Level, and Width controls  
- **Delay**: Time, Feedback, and Mix controls

### Interface Controls
- **Volume Fader**: Master output level control
- **Pan Knob**: Left/Right/Center panning
- **Mute Button**: Mute the entire plugin output
- **Bypass Button**: Bypass all effects
- **Routing Options**: Series, Parallel, or Custom effect routing

### Design
- Beer can-inspired metallic background with gradient styling
- Custom knobs and faders with gold/silver color scheme
- Intuitive layout with clearly labeled effect sections

## System Requirements

### Development Requirements
- **Operating System**: Windows 10/11
- **IDE**: Visual Studio 2019 or later
- **Framework**: JUCE 7.0.5 or later
- **C++ Standard**: C++17 or later
- **CMake**: 3.15 or later

### Runtime Requirements
- **Windows**: Windows 10/11 (64-bit)
- **Plugin Formats**: VST3, AU, Standalone
- **DAW Compatibility**: Any Windows-based DAW supporting VST3

## Installation

### For Users
1. Download the latest release from the releases page
2. Run the installer or copy the `.vst3` file to your VST3 plugins directory:
   - Default location: `C:\Program Files\Common Files\VST3\`
3. Restart your DAW and scan for new plugins
4. The plugin will appear as "Beer Can VST" in your effects list

### For Developers

#### Prerequisites
1. Download and install [JUCE Framework](https://juce.com/get-juce/)
2. Extract JUCE to a `JUCE` folder in the project root directory
3. Install Visual Studio 2019 or later with C++ development tools
4. Install CMake 3.15 or later

#### Building from Source
1. Clone or download this repository
2. Open a command prompt in the project directory
3. Run the build script:
   ```batch
   build.bat
   ```
4. The built plugin will be in the `Build/Release` folder

#### Manual Build Steps
1. Create a `Build` directory: `mkdir Build && cd Build`
2. Generate project files: `cmake .. -G "Visual Studio 17 2022" -A x64`
3. Build the project: `cmake --build . --config Release`

## Usage

1. Load the plugin in your DAW as an insert effect
2. Adjust the effect parameters using the knobs:
   - **Chorus Section**: Control modulation rate, depth, feedback, and wet/dry mix
   - **Reverb Section**: Adjust room characteristics and reverb levels
   - **Delay Section**: Set delay time, feedback amount, and wet/dry mix
3. Use the volume fader and pan knob for output control
4. Toggle Mute or Bypass as needed
5. Select routing mode from the dropdown (Series/Parallel/Custom)

## Technical Details

### Audio Processing
- **Sample Rate Support**: 44.1kHz to 192kHz
- **Bit Depth**: 32-bit floating point processing
- **Latency**: Near-zero latency processing
- **Channel Support**: Mono and Stereo

### Effect Algorithms
- **Chorus**: LFO-modulated delay line with feedback
- **Reverb**: High-quality algorithmic reverb using JUCE's Reverb class
- **Delay**: Digital delay line with feedback control

### Parameter Ranges
- **Volume**: 0.0 to 1.0 (0 to 100%)
- **Pan**: -1.0 to 1.0 (Left to Right)
- **Chorus Rate**: 0.1Hz to 10.0Hz
- **Chorus Depth**: 0.0 to 1.0
- **Delay Time**: 0.0s to 2.0s
- **Feedback**: 0.0 to 0.95 (0% to 95%)

## Project Structure

```
Beer Can VST/
├── Source/
│   ├── PluginProcessor.h/.cpp    # Main audio processing
│   ├── PluginEditor.h/.cpp       # User interface
│   └── AudioEffects.h/.cpp       # Effect implementations
├── Resources/
│   └── (Background images and assets)
├── Build/
│   └── (Generated build files)
├── Documentation/
│   └── (Additional documentation)
├── BeerCanVST.jucer             # JUCE project file
├── CMakeLists.txt               # CMake build configuration
├── build.bat                    # Windows build script
└── README.md                    # This file
```

## Development Notes

### Adding New Effects
1. Add effect parameters to `PluginProcessor.h` enum
2. Implement effect processing in `AudioEffects.cpp`
3. Add UI controls in `PluginEditor.cpp`
4. Update parameter layout in `createParameterLayout()`

### Customizing the UI
- Modify colors and styling in `PluginEditor.cpp`
- Add background images to the `Resources` folder
- Update the `paint()` method for custom graphics

### Building for Different Platforms
- The current configuration targets Windows x64
- For other platforms, modify CMakeLists.txt accordingly
- JUCE supports macOS, Linux, and iOS/Android with appropriate configuration

## Troubleshooting

### Build Issues
- Ensure JUCE is properly extracted to the `JUCE` folder
- Check that Visual Studio C++ tools are installed
- Verify CMake is in your system PATH

### Plugin Not Loading
- Check that the plugin is in the correct VST3 directory
- Ensure your DAW supports VST3 plugins
- Try rescanning plugins in your DAW

### Audio Issues
- Check sample rate compatibility with your DAW
- Ensure proper audio buffer sizes are set
- Verify input/output channel configuration

## License

This project is provided as-is for educational and development purposes. Please ensure you have appropriate licenses for JUCE if using commercially.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Support

For issues and questions:
- Check the troubleshooting section above
- Review JUCE documentation for framework-specific issues
- Submit issues through the project's issue tracker

---

*Beer Can VST - Bringing unique audio effects with style!*
