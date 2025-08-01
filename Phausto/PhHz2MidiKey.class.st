"
Converts a frequency in Hz to a MIDI key number (440 Hz = MIDI key 69).

##Parameter

**freq:** frequency  in Hertz
"
Class {
	#name : 'PhHz2MidiKey',
	#superclass : 'PhConversionTool',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhHz2MidiKey >> asBox [ 

self freq asBox connectTo: super asBox 
]

{ #category : 'accessing' }
PhHz2MidiKey >> freq [ 
^ freq
]

{ #category : 'accessing' }
PhHz2MidiKey >> initialize [

	super initialize.
	freq := 440.
	processExpression := 'process = ba.hz2midikey;'
]
