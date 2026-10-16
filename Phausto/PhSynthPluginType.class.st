"
Abstract Strategy for MIDI instruments. Holds what every synth export shares: no input bus, MIDI in, freq/gate/gain driven by notes instead of the _APVTS_, Instrument categories. Subclasses supply the voicing: **PhMonoSynthPluginType** (last-note priority in the processor) and **PhPolySynthPluginType** (Faust's mydsp_poly).
"
Class {
	#name : 'PhSynthPluginType',
	#superclass : 'PhPluginType',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'testing' }
PhSynthPluginType class >> isAbstract [

	^ self == PhSynthPluginType
]

{ #category : 'defaults' }
PhSynthPluginType >> acceptsMidi [ 
^ true
]

{ #category : 'defaults' }
PhSynthPluginType >> auMainType [

	^ 'kAudioUnitType_MusicDevice'
]

{ #category : 'defaults' }
PhSynthPluginType >> busesPropertiesCpp [

	^ 'BusesProperties()
                          .withOutput ("Output", juce::AudioChannelSet::stereo(), true)'
]

{ #category : 'defaults' }
PhSynthPluginType >> excludesControl: aControl [
	"MIDI drives these, so they must not become APVTS parameters."

	^ self synthControlNames includes: (aControl at: #shortname)
]

{ #category : 'defaults' }
PhSynthPluginType >> hasAudioInput [

	^ false
]

{ #category : 'defaults' }
PhSynthPluginType >> isSynth [ 

^ true
]

{ #category : 'defaults' }
PhSynthPluginType >> jucerVstCategory [

	^ 'kPlugCategSynth'
]

{ #category : 'defaults' }
PhSynthPluginType >> maxInputs [
	"No input bus, so an input could only ever hear silence."

	^ 0
]

{ #category : 'defaults' }
PhSynthPluginType >> processBlockMidiCallCpp [

	^ '    handleMidi (midiMessages);'
]

{ #category : 'defaults' }
PhSynthPluginType >> synthControlNames [
	"Faust's standard names, driven by note on and note off."

	^ #( 'freq' 'gate' 'gain' )
]

{ #category : 'defaults' }
PhSynthPluginType >> vst3Category [

	^ 'Instrument'
]
