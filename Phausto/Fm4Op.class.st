"
A simple  FM synthesizer with an arbitrary number of modulators connected as a sequence. fm is a standard Faust function.
"
Class {
	#name : 'Fm4Op',
	#superclass : 'Synths',
	#instVars : [
		'carrier',
		'modulator1',
		'modulator2',
		'modulator3'
	],
	#category : 'Phausto-BoxAPI-Synths',
	#package : 'Phausto',
	#tag : 'BoxAPI-Synths'
}

{ #category : 'converting' }
Fm4Op >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freqs asBox , self indexes asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Fm4Op >> initialize [

	super initialize.
	self processExpression: 'process = sy.fm;'.
	self initializeFreqs .
	self initializeIndexes .
]

{ #category : 'initialization' }
Fm4Op >> initializeOscillators [

| carrierFreq |

carrierFreq := PhHSlider new.

	carrier := SineOsc new.
	modulator1 := SineOsc new
]
