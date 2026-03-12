s/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
MonoSynthAudioProcessorEditor::MonoSynthAudioProcessorEditor (MonoSynthAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p)
{
  setSize (800, 130);
  
  addAndMakeVisible (frequencySlider);
  frequencySlider.setRange (50.0, 5000.0);
  frequencySlider.setSkewFactorFromMidPoint (500.0);
  frequencySlider.setValue(300);
  frequencySlider.onValueChange = [this] {
    processor.setFreq(frequencySlider.getValue());  
  };

  addAndMakeVisible(frequencyLabel);
  frequencyLabel.setText ("Frequency", dontSendNotification);
  frequencyLabel.attachToComponent (&frequencySlider, true);
    
  addAndMakeVisible (gainSlider);
  gainSlider.setRange (0.0, 1.0);
  gainSlider.setValue(0.5);
  gainSlider.onValueChange = [this] { 
    processor.setGain(gainSlider.getValue()); 
  };
    
  addAndMakeVisible(gainLabel);
  gainLabel.setText ("Gain", dontSendNotification);
  gainLabel.attachToComponent (&gainSlider, true);
    
  addAndMakeVisible (cutoffSlider);
  cutoffSlider.setRange (50.0, 10000.0);
  cutoffSlider.setValue(5000.0);
  cutoffSlider.onValueChange = [this] { 
    processor.setCutoff(cutoffSlider.getValue()); 
  };
    
  addAndMakeVisible(cutoffLabel);
  cutoffLabel.setText ("Cutoff", dontSendNotification);
  cutoffLabel.attachToComponent (&cutoffSlider, true);
  
  addAndMakeVisible(onOffButton);
  onOffButton.onClick = [this] { 
    processor.setGate(onOffButton.getToggleState());
  };
    
  addAndMakeVisible(onOffLabel);
  onOffLabel.setText ("On/Off", dontSendNotification);
  onOffLabel.attachToComponent (&onOffButton, true);
}

MonoSynthAudioProcessorEditor::~MonoSynthAudioProcessorEditor()
{
}

//==============================================================================
void MonoSynthAudioProcessorEditor::paint (Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void MonoSynthAudioProcessorEditor::resized()
{
  const int sliderLeft = 80;
  frequencySlider.setBounds (sliderLeft, 10, getWidth() - sliderLeft - 20, 20);
  gainSlider.setBounds (sliderLeft, 40, getWidth() - sliderLeft - 20, 20);
  cutoffSlider.setBounds (sliderLeft, 70, getWidth() - sliderLeft - 20, 20);
  onOffButton.setBounds (sliderLeft, 100, getWidth() - sliderLeft - 20, 20);
}
