/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

//==============================================================================
/**
*/
class PolySynthAudioProcessorEditor  : public AudioProcessorEditor,private MidiInputCallback, private MidiKeyboardStateListener
{
public:
    PolySynthAudioProcessorEditor (PolySynthAudioProcessor&);
    ~PolySynthAudioProcessorEditor();

    //==============================================================================
    void paint (Graphics&) override;
    void resized() override;

private:
    void handleNoteOn (MidiKeyboardState*, int midiChannel, int midiNoteNumber, float velocity) override;
    void handleNoteOff (MidiKeyboardState*, int midiChannel, int midiNoteNumber, float /*velocity*/) override;
    void handleIncomingMidiMessage (MidiInput* source, const MidiMessage& message) override;

    MidiKeyboardState keyboardState;   
    MidiKeyboardComponent keyboardComponent; 
    
    Slider cutoffSlider;
    Label cutoffLabel;
  
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    PolySynthAudioProcessor& processor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (PolySynthAudioProcessorEditor)
};
