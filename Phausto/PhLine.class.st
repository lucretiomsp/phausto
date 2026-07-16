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
	#traits : 'PhNSetter',
	#classTraits : 'PhNSetter classTrait',
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

^ self n , self input connectTo: self code asBox 
]

{ #category : 'initialization' }
PhLine >> initialize [

	super initialize.
	processExpression := 'process = ba.line;'.
	  n := PhHSlider new
				       label: self label , 'N'
				       init: 1
				       min: 1
				       max: 88200
				       step: 1 
]

{ #category : 'accessing' }
PhLine >> n [

	^ n 
]
