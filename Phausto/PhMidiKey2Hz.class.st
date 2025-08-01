"
Converts a MIDI key number to a frequency in Hz (MIDI key 69 = 440 Hz).

##Parameter
**midiNN:** the MIDI key number
"
Class {
	#name : 'PhMidiKey2Hz',
	#superclass : 'PhConversionTool',
	#instVars : [
		'midiNN'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhMidiKey2Hz >> asBox [ 

^ self midiNN asBox connectTo: super asBox 
]

{ #category : 'accessing' }
PhMidiKey2Hz >> initialize [

	super initialize.
	midiNN := 69.
	processExpression := 'process = ba.midikey2hz;'
]

{ #category : 'accessing' }
PhMidiKey2Hz >> midiNN [ 

^ midiNN
]
