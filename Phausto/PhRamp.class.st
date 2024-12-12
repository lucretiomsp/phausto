"
A linear ramp with a slope of '(+/-)1/n' samples to reach the next target value.

Parameter
n: number of samples to increment/decrement the value by one
"
Class {
	#name : 'PhRamp',
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
PhRamp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhRamp >> initialize [

	super initialize.
	processExpression := 'process = ba.ramp;'
]

{ #category : 'as yet unclassified' }
PhRamp >> input [

	^ input ifNil: [
		  input := PhHSlider new
			           label: self label , 'Input'
			           init: 5000
			           min: 20
			           max: 18000
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
PhRamp >> n [

	^ n ifNil: [
		  n := PhHSlider new
			            label: self label , 'N'
			            init: 1
			            min: 1
			            max: 88200
			            step: 1 ]
]
