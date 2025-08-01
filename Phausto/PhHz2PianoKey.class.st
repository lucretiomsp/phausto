"
Converts a frequency in Hz to a MIDI key number (440 Hz = MIDI key 69).

##Parameter

**freq:** frequency  in Hertz
"
Class {
	#name : 'PhHz2PianoKey',
	#superclass : 'PhConversionTool',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhHz2PianoKey >> asBox [

	self freq asBox connectTo: super asBox
]

{ #category : 'converting' }
PhHz2PianoKey >> freq [ 

^ freq
]

{ #category : 'initialization' }
PhHz2PianoKey >> initialize [

	super initialize.
	freq := 440.
	processExpression := 'process = ba.hz2pianokey;'
]
