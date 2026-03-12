/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
PolySynthAudioProcessorEditor::PolySynthAudioProcessorEditor (PolySynthAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p), keyboardComponent (keyboardState, MidiKeyboardComponent::horizontalKeyboard)
{
  setSize (800, 150);
    
  addAndMakeVisible (keyboardComponent);
  keyboardState.addListener (this);
    
  addAndMakeVisible (cutoffSlider);
  cutoffSlider.setRange (50.0, 10000.0);
  cutoffSlider.setValue(5000.0);
  cutoffSlider.onValueChange = [this] { 
    processor.setCutoff(cutoffSlider.getValue()); 
  };
    
  addAndMakeVisible(cutoffLabel);
  cutoffLabel.setText ("Cutoff", dontSendNotification);
  cutoffLabel.attachToComponent (&cutoffSlider, true);
}

PolySynthAudioProcessorEditor::~PolySynthAudioProcessorEditor()
{
  keyboardState.removeListener(this);
}

void PolySynthAudioProcessorEditor::handleIncomingMidiMessage (MidiInput* source, const MidiMessage& message) {}

void PolySynthAudioProcessorEditor::handleNoteOn (MidiKeyboardState*, int midiChannel, int midiNoteNumber, float velocity)
{
  processor.keyOn(midiNoteNumber,int(127*velocity));
}

void PolySynthAudioProcessorEditor::handleNoteOff (MidiKeyboardState*, int midiChannel, int midiNoteNumber, float /*velocity*/)
{
  processor.keyOff(midiNoteNumber);
}

//==============================================================================
void PolySynthAudioProcessorEditor::paint (Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (ResizableWindow::backgroundColourId));
}

void PolySynthAudioProcessorEditor::resized()
{
  const int sliderLeft = 80;
  keyboardComponent.setBounds (10,10,getWidth()-30,100);
  cutoffSlider.setBounds (sliderLeft, 120, getWidth() - sliderLeft - 20, 20);
}
