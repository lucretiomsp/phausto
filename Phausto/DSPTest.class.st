Class {
	#name : 'DSPTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
DSPTest >> testAsEffectPluginProcessor [

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
    MapUI* fUI;
    dsp* fDSP;
    float **inputs;
    float **outputs;
  
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
