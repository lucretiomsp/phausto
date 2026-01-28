"
A ramp interpolator that generates a linear transition to reach a target value:

the interpolation process restarts each time a new and distinct input value is received
it utilizes 'n' samples to achieve the transition to the target value
after reaching the target value, the output value is maintained.

Parameter:
n: number of samples to reach the new target received at its input

"
Class {
	#name : 'PhLine',
	#superclass : 'PhBasics',
	#instVars : [
		'trig',
		'n'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhLine >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhLine >> initialize [

	super initialize.
	processExpression := 'process = ba.line;'
]

{ #category : 'as yet unclassified' }
PhLine >> n [

	^ n ifNil: [
		  n := PhHSlider new
			            label: self label , 'N'
			            init: 1
			            min: 1
			            max: 88200
			            step: 1 ]
]
