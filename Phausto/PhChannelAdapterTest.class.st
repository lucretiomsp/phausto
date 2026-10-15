Class {
	#name : 'PhChannelAdapterTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhChannelAdapterTest >> testFaustNeverRunsInPlace [
	"Separate Faust buffers for inputs and outputs, never the host buffer twice."

	| adapter |
	adapter := PhChannelAdapter new contents.
	self assert: (adapter includesSubstring: 'const_cast<float**> (faustIn.getArrayOfWritePointers()),').
	self assert: (adapter includesSubstring: 'const_cast<float**> (faustOut.getArrayOfWritePointers()));')
]

{ #category : 'tests' }
PhChannelAdapterTest >> testProcessorCallsTheAdapterApi [
	"Two methods write the two sides; they must agree on prepare and process."

	| cpp adapter |
	cpp := (DSP new name: 'MyApp') asPluginProcessorCppAPVTSFor: PhEffectPluginType new.
	adapter := PhChannelAdapter new contents.
	self assert: (cpp includesSubstring: 'channels.prepare (fDSP.getNumInputs(), fDSP.getNumOutputs(),').
	self assert: (adapter includesSubstring: 'void prepare (int numFaustInputs, int numFaustOutputs,').
	self assert: (cpp includesSubstring: 'channels.process (fDSP, buffer);').
	self assert: (adapter includesSubstring: 'void process (DspType& faust, juce::AudioBuffer<float>& bus)')
]

{ #category : 'tests' }
PhChannelAdapterTest >> testProcessorHoldsTheAdapterItIncludes [

	| header |
	header := (DSP new name: 'MyApp') asPluginProcessorHeaderAPVTSFor: PhEffectPluginType new.
	self assert: (header includesSubstring: '#include "PhaustoChannelAdapter.h"').
	self assert: (header includesSubstring: 'PhaustoChannelAdapter channels;').
	self assert: (PhChannelAdapter new contents includesSubstring: 'class PhaustoChannelAdapter')
]
