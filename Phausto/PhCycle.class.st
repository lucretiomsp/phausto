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
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhCycle >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self input  connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhCycle >> initialize [

	super initialize.
	processExpression := 'process = ba.cycle;'
]

{ #category : 'accessing' }
PhCycle >> input [

	^ input ifNil: [ input := SquareOsc new ]
]

{ #category : 'as yet unclassified' }
PhCycle >> n [

	^ n ifNil: [
		  n := PhHSlider new
			            label: self label , 'N'
			            init: 1
			            min: 1
			            max: 88200
			            step: 1 ]
]
