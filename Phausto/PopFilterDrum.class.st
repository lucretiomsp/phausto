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
		'q'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
PopFilterDrum >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self q asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'accessing' }
PopFilterDrum >> gate [

	^ gate 
]

{ #category : 'initialization' }
PopFilterDrum >> initialize [

	super initialize.
	processExpression := 'process = sy.popFilterDrum;'.


	self controlParameters add: #freq -> (self freq asControlParameterOfWidgetType: #knob description: 'Filter Frequency in Hertz').
	gate := PhButton new label: self label , 'Gate'.
	q := PhHSlider new
		     label: self label , 'Q'
		     init: 5
		     min: 1
		     max: 12
		     step: 0.01
]

{ #category : 'accessing' }
PopFilterDrum >> q [

	^ q
]
