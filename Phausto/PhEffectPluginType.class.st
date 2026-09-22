"
Audio effect plugin type. Stereo input and output, no MIDI. All Faust leaf controls become APVTS parameters. The processor constructor uses withInput + withOutput buses. No MIDI handling in processBlock.
"
Class {
	#name : 'PhEffectPluginType',
	#superclass : 'PhPluginType',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'accessing' }
PhEffectPluginType >> acceptsMidi [
	^ false
]

{ #category : 'accessing' }
PhEffectPluginType >> auMainType [
	^ 'kAudioUnitType_Effect'
]

{ #category : 'defaults' }
PhEffectPluginType >> busesPropertiesCpp [ 
	^ 'BusesProperties()
                          .withInput  ("Input",  juce::AudioChannelSet::stereo(), true)
                          .withOutput ("Output", juce::AudioChannelSet::stereo(), true)'

]

{ #category : 'accessing' }
PhEffectPluginType >> hasAudioInput [
	^ true
]

{ #category : 'accessing' }
PhEffectPluginType >> isSynth [
	^ false
]

{ #category : 'accessing' }
PhEffectPluginType >> jucerVstCategory [
	^ 'kPlugCategEffect'
]

{ #category : 'defaults' }
PhEffectPluginType >> midiMembersCpp [
"Extra private member declarations for MIDI state."
    ^ ''
]

{ #category : 'defaults' }
PhEffectPluginType >> processBlockMidiCallCpp [
	 "The MIDI handling call inside processBlock, before compute. Empty for effects."
    ^ ''
]

{ #category : 'accessing' }
PhEffectPluginType >> typeName [
	^ 'Effect'
]

{ #category : 'accessing' }
PhEffectPluginType >> vst3Category [
	^ 'Fx'
]
