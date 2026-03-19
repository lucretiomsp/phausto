Class {
	#name : 'DSPTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
DSPTest >> testAsEffectPluginProcessorCpp [

	| dsp filter |
	filter := PhResonLp new
		          frequency: #Cutoff;
		          q: #Resonance.
	dsp := filter stereo asDsp.
	dsp init.
	self assert: (dsp asPluginProcessorCppFor: 'Effect') equals: '/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"
#include "FaustEffect.h"
using namespace juce;

//==============================================================================
EffectAudioProcessor::EffectAudioProcessor()
#ifndef JucePlugin_PreferredChannelConfigurations
     : AudioProcessor (BusesProperties()
                     #if ! JucePlugin_IsMidiEffect
                      #if ! JucePlugin_IsSynth
                       .withInput  ("Input",  AudioChannelSet::stereo(), true)
                      #endif
                       .withOutput ("Output", AudioChannelSet::stereo(), true)
                     #endif
                       )
#endif
{
}

EffectAudioProcessor::~EffectAudioProcessor()
{
}

//==============================================================================
const String EffectAudioProcessor::getName() const
{
    return JucePlugin_Name;
}

bool EffectAudioProcessor::acceptsMidi() const
{
   #if JucePlugin_WantsMidiInput
    return true;
   #else
    return false;
   #endif
}

bool EffectAudioProcessor::producesMidi() const
{
   #if JucePlugin_ProducesMidiOutput
    return true;
   #else
    return false;
   #endif
}

bool EffectAudioProcessor::isMidiEffect() const
{
   #if JucePlugin_IsMidiEffect
    return true;
   #else
    return false;
   #endif
}

double EffectAudioProcessor::getTailLengthSeconds() const
{
    return 0.0;
}

int EffectAudioProcessor::getNumPrograms()
{
    return 1;   // NB: some hosts don''t cope very well if you tell them there are 0 programs,
                // so this should be at least 1, even if you''re not really implementing programs.
}

int EffectAudioProcessor::getCurrentProgram()
{
    return 0;
}

void EffectAudioProcessor::setCurrentProgram (int index)
{
}

const String EffectAudioProcessor::getProgramName (int index)
{
    return {};
}

void EffectAudioProcessor::changeProgramName (int index, const String& newName)
{
}

//==============================================================================
void EffectAudioProcessor::prepareToPlay (double sampleRate, int samplesPerBlock)
{
  fDSP = std::make_unique<mydsp>();
  fDSP->init(sampleRate);
  fUI = std::make_unique<MapUI>();
  fDSP->buildUserInterface(fUI);
  inputs = new float*[2];
  outputs = new float*[2];
  // Allocate buffers
  inputBuffer.setSize(2, samplesPerBlock);
  outputBuffer.setSize(2, samplesPerBlock);
}

void EffectAudioProcessor::releaseResources()
{
    inputBuffer.setSize(0, 0);
    outputBuffer.setSize(0, 0);

    // Optional but safe
    fDSP.reset();
    fUI.reset();
}

#ifndef JucePlugin_PreferredChannelConfigurations
bool EffectAudioProcessor::isBusesLayoutSupported (const BusesLayout& layouts) const
{
  #if JucePlugin_IsMidiEffect
    ignoreUnused (layouts);
    return true;
  #else
    // This is the place where you check if the layout is supported.
    // In this template code we only support mono or stereo.
    if (layouts.getMainOutputChannelSet() != AudioChannelSet::mono()
     && layouts.getMainOutputChannelSet() != AudioChannelSet::stereo())
        return false;

    // This checks if the input layout matches the output layout
   #if ! JucePlugin_IsSynth
    if (layouts.getMainOutputChannelSet() != layouts.getMainInputChannelSet())
        return false;
   #endif

    return true;
  #endif
}
#endif

void EffectAudioProcessor::processBlock (AudioBuffer<float>& buffer, MidiBuffer& midiMessages)
{
    ScopedNoDenormals noDenormals;

    const int numSamples = buffer.getNumSamples();
    const int numChannels = jmin(2, buffer.getNumChannels());

    // Resize buffers if host changes block size (important for VST3)
    if (inputBuffer.getNumSamples() < numSamples)
    {
        inputBuffer.setSize(2, numSamples, false, false, true);
        outputBuffer.setSize(2, numSamples, false, false, true);
    }

    // Copy input
    for (int ch = 0; ch < numChannels; ++ch)
        inputBuffer.copyFrom(ch, 0, buffer, ch, 0, numSamples);

    // Prepare raw pointers for Faust
    float* inputs[2];
    float* outputs[2];

    for (int ch = 0; ch < 2; ++ch)
    {
        inputs[ch]  = inputBuffer.getWritePointer(ch);
        outputs[ch] = outputBuffer.getWritePointer(ch);
    }

    // Process
    if (fDSP)
        fDSP->compute(numSamples, inputs, outputs);

    // Copy back to output
    for (int ch = 0; ch < numChannels; ++ch)
        buffer.copyFrom(ch, 0, outputBuffer, ch, 0, numSamples);

    // Clear extra channels (safety)
    for (int ch = numChannels; ch < buffer.getNumChannels(); ++ch)
        buffer.clear(ch, 0, numSamples);
}

//==============================================================================
bool EffectAudioProcessor::hasEditor() const
{
    return true; // (change this to false if you choose to not supply an editor)
}

AudioProcessorEditor* EffectAudioProcessor::createEditor()
{
    return new EffectAudioProcessorEditor (*this);
}

//==============================================================================
void EffectAudioProcessor::getStateInformation (MemoryBlock& destData)
{
    // You should use this method to store your parameters in the memory block.
    // You could do that either as raw data, or use the XML or ValueTree classes
    // as intermediaries to make it easy to save and load complex data.
}

void EffectAudioProcessor::setStateInformation (const void* data, int sizeInBytes)
{
    // You should use this method to restore your parameters from this memory block,
    // whose contents will have been created by the getStateInformation() call.
}
void EffectAudioProcessor::setCutoff(float cutoff) { fUI->setParamValue("Cutoff",cutoff); }
void EffectAudioProcessor::setResonance(float resonance) { fUI->setParamValue("Resonance",resonance); }

//==============================================================================
// This creates new instances of the plugin..
AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new EffectAudioProcessor();
}'
]

{ #category : 'tests' }
DSPTest >> testAsEffectPluginProcessorEditorCpp [

	| dsp filter |
	filter := PhResonLp new
		          frequency: #Cutoff;
		          q: #Resonance.
	dsp := filter stereo asDsp.
	dsp init.
	self
		assert: (dsp asPluginProcessorEditorCppFor: 'Effect')
		equals: '/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"
using namespace juce;

//==============================================================================
EffectAudioProcessorEditor::EffectAudioProcessorEditor (EffectAudioProcessor& p)
    : AudioProcessorEditor (&p), processor (p)
{
    // Make sure that before the constructor has finished, you''ve set the
    // editor''s size to whatever you need it to be.
    setSize (800, 100);
    
   
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

}
'
]

{ #category : 'tests' }
DSPTest >> testAsEffectPluginProcessorEditorHeader [

	| dsp filter |
	filter := PhResonLp new
		          frequency: #Cutoff;
		          q: #Resonance.
	dsp := filter stereo asDsp.
	dsp init.
	self
		assert: (dsp asPluginProcessorEditorHeaderFor: 'Effect')
		equals: '/*
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
class EffectAudioProcessorEditor  : public AudioProcessorEditor
{
public:
    EffectAudioProcessorEditor (EffectAudioProcessor&);
    ~EffectAudioProcessorEditor();

    //==============================================================================
    void paint (Graphics&) override;
    void resized() override;

private:

    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    EffectAudioProcessor& processor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (EffectAudioProcessorEditor)
};
'
]

{ #category : 'tests' }
DSPTest >> testAsEffectPluginProcessorHeader [

	| dsp filter |
	filter := PhResonLp new
		          frequency: #Cutoff;
		          q: #Resonance.
	dsp := filter stereo asDsp.
	dsp init.
	self assert: (dsp asPluginProcessorHeaderFor: 'Effect') equals: '/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
using namespace juce;

//==============================================================================
/**
*/

class dsp;
class MapUI;

class EffectAudioProcessor  : public AudioProcessor
{
public:
    //==============================================================================
    EffectAudioProcessor();
    ~EffectAudioProcessor();

    //==============================================================================
    void prepareToPlay (double sampleRate, int samplesPerBlock) override;
    void releaseResources() override;

   #ifndef JucePlugin_PreferredChannelConfigurations
    bool isBusesLayoutSupported (const BusesLayout& layouts) const override;
   #endif

    void processBlock (AudioBuffer<float>&, MidiBuffer&) override;

    //==============================================================================
    AudioProcessorEditor* createEditor() override;
    bool hasEditor() const override;

    //==============================================================================
    const String getName() const override;

    bool acceptsMidi() const override;
    bool producesMidi() const override;
    bool isMidiEffect() const override;
    double getTailLengthSeconds() const override;

    //==============================================================================
    int getNumPrograms() override;
    int getCurrentProgram() override;
    void setCurrentProgram (int index) override;
    const String getProgramName (int index) override;
    void changeProgramName (int index, const String& newName) override;

    //==============================================================================
    void getStateInformation (MemoryBlock& destData) override;
    void setStateInformation (const void* data, int sizeInBytes) override;
    void setCutoff(float cutoff);
    void setResonance(float resonance);

private:
    //==============================================================================
    // DSP (RAII safe)
    std::unique_ptr<mydsp> fDSP;
    std::unique_ptr<MapUI> fUI;

    // Internal buffers (safe JUCE containers)
    juce::AudioBuffer<float> inputBuffer;
    juce::AudioBuffer<float> outputBuffer;

    //==============================================================================
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (EffectAudioProcessor)
};

'
]

{ #category : 'tests' }
DSPTest >> testCreateFromString [

	| dsp |
	dsp := DSP create:
		       'import("stdfaust.lib"); process = os.square(440);'. dsp
			       isNull.


	self assert: dsp isNull equals: false
]

{ #category : 'tests' }
DSPTest >> testDSPParameterFromDictionary [

| param dsp |

dsp := SquareOsc new asDsp.
dsp init .
param := DSPParameter fromDictionary: (dsp getUIItemsLabeledDictionary  at: 'SquareOscFreq').
self assert: param label equals: 'SquareOscFreq'.
self assert: param shortName equals: 'SquareOscFreq'.
self assert: param type equals: 'hslider'.
self assert: param initValue equals: 440.
self assert: param  stepValue equals: 1.
self assert: param  minValue equals: 20.
self assert: param  maxValue equals: 4086.

]

{ #category : 'tests' }
DSPTest >> testDSPParameterStoreForSquareOsc [

	| store dsp |
	dsp := SquareOsc new asDsp.
	dsp init.
	store := DSPParameterStore from: dsp.

	self assert: store parameters size equals: 2.
	self assert: store dsp equals: dsp.
]

{ #category : 'tests' }
DSPTest >> testGetUIItemsLabeledDictionary [

| dsp |
dsp := SquareOsc new asDsp.

self assertCollection: dsp getUIItemsLabeledDictionary keys  equals: #('SquareOscuLevel' 'SquareOscFreq')

]

{ #category : 'tests' }
DSPTest >> testNewDSPParameter [

| param |
param := DSPParameter new label: 'TestParam'; shortName: 'TestParam' ; initValue: 0.5 ; minValue: 0; maxValue: 1; stepValue: 0.1; type: 'hslider' .

self assert: param label equals: 'TestParam'.
self assert: param shortName equals: 'TestParam'.
self assert: param type equals: 'hslider'.
self assert: param initValue equals: 0.5.
self assert: param  stepValue equals: 0.1.
self assert: param  minValue equals: 0.
self assert: param  maxValue equals: 1.

]
