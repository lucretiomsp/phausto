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
class EffectAudioProcessorEditor  : public AudioProcessorEditor
{
public:
    EffectAudioProcessorEditor (EffectAudioProcessor&);
    ~EffectAudioProcessorEditor();

    //==============================================================================
    void paint (Graphics&) override;
    void resized() override;

private:
    Slider delaySlider;
    Slider feedbackSlider;
    
    Label delayLabel;
    Label feedbackLabel;
  
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    EffectAudioProcessor& processor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (EffectAudioProcessorEditor)
};
