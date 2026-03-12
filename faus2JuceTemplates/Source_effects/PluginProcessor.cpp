/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"
#include "FaustEffect.h"

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
    return 1;   // NB: some hosts don't cope very well if you tell them there are 0 programs,
                // so this should be at least 1, even if you're not really implementing programs.
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
  fDSP = new mydsp();
  fDSP->init(sampleRate);
  fUI = new MapUI();
  fDSP->buildUserInterface(fUI);
  inputs = new float*[2];
  outputs = new float*[2];
  for (int channel = 0; channel < 2; ++channel){
    inputs[channel] = new float[samplesPerBlock];
    outputs[channel] = new float[samplesPerBlock];
  }
}

void EffectAudioProcessor::releaseResources()
{
    delete fDSP;
    delete fUI;
    for (int channel = 0; channel < 2; ++channel){
        delete[] inputs[channel];
        delete[] outputs[channel];
    }
    delete [] inputs;
    delete [] outputs;
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
    auto totalNumInputChannels  = getTotalNumInputChannels();
    auto totalNumOutputChannels = getTotalNumOutputChannels();

    for (int channel = 0; channel < totalNumInputChannels; ++channel){
      for(int i=0; i<buffer.getNumSamples(); i++){
        inputs[channel][i] = *buffer.getWritePointer(channel,i);
      }
    }

    fDSP->compute(buffer.getNumSamples(),inputs,outputs);
    
    for (int channel = 0; channel < totalNumOutputChannels; ++channel){
      for(int i=0; i<buffer.getNumSamples(); i++){
        *buffer.getWritePointer(channel,i) = outputs[channel][i];
      }
    }
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

void EffectAudioProcessor::setDelay(float delay)
{
  fUI->setParamValue("delay",delay);
}

void EffectAudioProcessor::setFeedback(float feedback)
{
  fUI->setParamValue("feedback",feedback);
}

//==============================================================================
// This creates new instances of the plugin..
AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new EffectAudioProcessor();
}
