/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"
#include "FaustSynth.h"

//==============================================================================
PolySynthAudioProcessor::PolySynthAudioProcessor()
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

PolySynthAudioProcessor::~PolySynthAudioProcessor()
{
}

//==============================================================================
const String PolySynthAudioProcessor::getName() const
{
    return JucePlugin_Name;
}

bool PolySynthAudioProcessor::acceptsMidi() const
{
   #if JucePlugin_WantsMidiInput
    return true;
   #else
    return false;
   #endif
}

bool PolySynthAudioProcessor::producesMidi() const
{
   #if JucePlugin_ProducesMidiOutput
    return true;
   #else
    return false;
   #endif
}

bool PolySynthAudioProcessor::isMidiEffect() const
{
   #if JucePlugin_IsMidiEffect
    return true;
   #else
    return false;
   #endif
}

double PolySynthAudioProcessor::getTailLengthSeconds() const
{
    return 0.0;
}

int PolySynthAudioProcessor::getNumPrograms()
{
    return 1;   // NB: some hosts don't cope very well if you tell them there are 0 programs,
                // so this should be at least 1, even if you're not really implementing programs.
}

int PolySynthAudioProcessor::getCurrentProgram()
{
    return 0;
}

void PolySynthAudioProcessor::setCurrentProgram (int index)
{
}

const String PolySynthAudioProcessor::getProgramName (int index)
{
    return {};
}

void PolySynthAudioProcessor::changeProgramName (int index, const String& newName)
{
}

//==============================================================================
void PolySynthAudioProcessor::prepareToPlay (double sampleRate, int samplesPerBlock)
{
    driver =  new dummyaudio(sampleRate,samplesPerBlock);
    faustObject = new FaustPolyEngine(NULL,driver,NULL);
    outputs = new float*[2];
    for (int channel = 0; channel < 2; ++channel){
        outputs[channel] = new float[samplesPerBlock];
    }
}

void PolySynthAudioProcessor::releaseResources()
{
    for (int channel = 0; channel < 2; ++channel){
        delete[] outputs[channel];
    }
    delete [] outputs;
    //delete faustObject;
    delete driver;
}

#ifndef JucePlugin_PreferredChannelConfigurations
bool PolySynthAudioProcessor::isBusesLayoutSupported (const BusesLayout& layouts) const
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

void PolySynthAudioProcessor::processBlock (AudioBuffer<float>& buffer, MidiBuffer& midiMessages)
{
    ScopedNoDenormals noDenormals;
    auto totalNumInputChannels  = getTotalNumInputChannels();
    auto totalNumOutputChannels = getTotalNumOutputChannels();

    faustObject->compute(buffer.getNumSamples(),NULL,outputs);
    
    for (int channel = 0; channel < totalNumOutputChannels; ++channel){
      for(int i=0; i<buffer.getNumSamples(); i++){
        *buffer.getWritePointer(channel,i) = outputs[channel][i];
      }
    }
}

//==============================================================================
bool PolySynthAudioProcessor::hasEditor() const
{
    return true; // (change this to false if you choose to not supply an editor)
}

AudioProcessorEditor* PolySynthAudioProcessor::createEditor()
{
    return new PolySynthAudioProcessorEditor (*this);
}

//==============================================================================
void PolySynthAudioProcessor::getStateInformation (MemoryBlock& destData)
{
    // You should use this method to store your parameters in the memory block.
    // You could do that either as raw data, or use the XML or ValueTree classes
    // as intermediaries to make it easy to save and load complex data.
}

void PolySynthAudioProcessor::setStateInformation (const void* data, int sizeInBytes)
{
    // You should use this method to restore your parameters from this memory block,
    // whose contents will have been created by the getStateInformation() call.
}

void PolySynthAudioProcessor::keyOn(int pitch, int velocity)
{
  faustObject->keyOn(pitch,velocity);
}

void PolySynthAudioProcessor::keyOff(int pitch)
{
  faustObject->keyOff(pitch);
}

void PolySynthAudioProcessor::setCutoff(float cutoff)
{
  faustObject->setParamValue("cutoff",cutoff);
}

//==============================================================================
// This creates new instances of the plugin..
AudioProcessor* JUCE_CALLTYPE createPluginFilter()
{
    return new PolySynthAudioProcessor();
}
