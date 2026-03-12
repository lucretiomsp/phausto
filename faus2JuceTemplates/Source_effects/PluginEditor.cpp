/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
EffectAudioProcessorEditor::EffectAudioProcessorEditor (EffectAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p)
{
    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (800, 100);
    
    addAndMakeVisible (delaySlider);
    delaySlider.setRange (0.0, 1.0);
    delaySlider.setValue(0.5);
    delaySlider.onValueChange = [this] {
      processor.setDelay(delaySlider.getValue());  
    };
    
    addAndMakeVisible(delayLabel);
    delayLabel.setText ("Delay (s)", dontSendNotification);
    delayLabel.attachToComponent (&delaySlider, true);
    
    addAndMakeVisible (feedbackSlider);
    feedbackSlider.setRange (0.0, 1.0);
    feedbackSlider.setValue(0.5);
    feedbackSlider.onValueChange = [this] {
      processor.setFeedback(feedbackSlider.getValue());  
    };
    
    addAndMakeVisible(feedbackLabel);
    feedbackLabel.setText ("Feedback", dontSendNotification);
    feedbackLabel.attachToComponent (&feedbackSlider, true);    
}

EffectAudioProcessorEditor::~EffectAudioProcessorEditor()
{
}

//==============================================================================
void EffectAudioProcessorEditor::paint (Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void EffectAudioProcessorEditor::resized()
{
  const int sliderLeft = 80;
  delaySlider.setBounds (sliderLeft, 10, getWidth() - sliderLeft - 20, 20);
  feedbackSlider.setBounds (sliderLeft, 40, getWidth() - sliderLeft - 20, 20);
}
