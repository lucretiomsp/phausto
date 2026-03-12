/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"
using namespace juce;
//==============================================================================
/**
*/
class MonoSynthAudioProcessorEditor  : public AudioProcessorEditor
{
public:
    MonoSynthAudioProcessorEditor (MonoSynthAudioProcessor&);
    ~MonoSynthAudioProcessorEditor();

    //==============================================================================
    void paint (Graphics&) override;
    void resized() override;

private:
    Slider frequencySlider;
    Slider gainSlider;
    Slider cutoffSlider;
    ToggleButton onOffButton;
    
    Label frequencyLabel;
    Label gainLabel;
    Label cutoffLabel;
    Label onOffLabel;
  
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    MonoSynthAudioProcessor& processor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MonoSynthAudioProcessorEditor)
};
