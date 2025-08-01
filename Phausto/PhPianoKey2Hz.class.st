"
Converts a MIDI key number to a frequency in Hz (MIDI key 69 = 440 Hz).

##Parameter
**midiNN:** the MIDI key number
"
Class {
	#name : 'PhPianoKey2Hz',
	#superclass : 'PhConversionTool',
	#instVars : [
		'midiNN'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhPianoKey2Hz >> asBox [

	^ self midiNN asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhPianoKey2Hz >> initialize [

	super initialize.
	midiNN := 69.
	processExpression := 'process = ba.pianokey2hz;'
]

{ #category : 'accessing' }
PhPianoKey2Hz >> midiNN [ 

^ midiNN 
]
