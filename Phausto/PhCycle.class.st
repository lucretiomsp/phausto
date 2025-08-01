"
Split nonzero input values into n cycles.
Parameter:
n: the number of cycles/output signals
"
Class {
	#name : 'PhCycle',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig',
		'n',
		'input'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
PhCycle >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n asBox , self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhCycle >> initialize [

	super initialize.
	processExpression := 'process = ba.cycle;'.
	input := SquareOsc new.
	n := PhHSlider new
				       label: self label , 'N'
				       init: 1
				       min: 1
				       max: 88200
				       step: 1 
]

{ #category : 'accessing' }
PhCycle >> input [

	^ input 
]

{ #category : 'as yet unclassified' }
PhCycle >> n [

	^ n 
]
