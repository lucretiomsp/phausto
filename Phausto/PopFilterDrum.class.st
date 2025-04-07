"
A simple percussion instrument based on a ""popped"" resonant bandpass filter.

Where

freq: the resonance frequency of the instrument in Hz
q: the q of the res filter (typically, 5 is a good value)
gate: the trigger signal (0 or 1)

"
Class {
	#name : 'PopFilterDrum',
	#superclass : 'Synths',
	#instVars : [
		'freq',
		'q',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PopFilterDrum >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  asBox , self q  asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PopFilterDrum >> freq [

	^ freq 
]

{ #category : 'accessing' }
PopFilterDrum >> gate [

	^ gate 
]

{ #category : 'initialization' }
PopFilterDrum >> initialize [

	super initialize.
	processExpression := 'process = sy.popFilterDrum;'.
	freq := PhHSlider new
		        label: self label , 'Note'
		        init: 440
		        min: 20
		        max: 1400
		        step: 0.1.
	gate := PhButton new label: self label , 'Gate'.
	
]
