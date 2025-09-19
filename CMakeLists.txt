cmake_minimum_required(VERSION 3.15)

project(BeerCanVST VERSION 1.0.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find JUCE
find_package(PkgConfig REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Add JUCE
add_subdirectory(JUCE)

# Create the plugin target
juce_add_plugin(BeerCanVST
    COMPANY_NAME "Your Company"
    BUNDLE_ID "com.yourcompany.beercanvst"
    
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT FALSE
    NEEDS_MIDI_OUTPUT FALSE
    IS_MIDI_EFFECT FALSE
    EDITOR_WANTS_KEYBOARD_FOCUS FALSE
    
    COPY_PLUGIN_AFTER_BUILD TRUE
    PLUGIN_MANUFACTURER_CODE Manu
    PLUGIN_CODE BcVs
    
    FORMATS AU VST3 Standalone
    
    PRODUCT_NAME "Beer Can VST"
    DESCRIPTION "Multi-effect VST with Chorus, Reverb, and Delay"
)

# Add source files
target_sources(BeerCanVST
    PRIVATE
        Source/PluginEditor.cpp
        Source/PluginProcessor.cpp
        Source/AudioEffects.cpp
)

# Set compile definitions
target_compile_definitions(BeerCanVST
    PUBLIC
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0
        JUCE_VST3_CAN_REPLACE_VST2=0
)

# Link libraries
target_link_libraries(BeerCanVST
    PRIVATE
        juce::juce_audio_utils
        juce::juce_audio_processors
        juce::juce_dsp
        juce::juce_gui_extra
    PUBLIC
        juce::juce_recommended_config_flags
        juce::juce_recommended_lto_flags
        juce::juce_recommended_warning_flags
)

# Set output directory
set_target_properties(BeerCanVST PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
)
