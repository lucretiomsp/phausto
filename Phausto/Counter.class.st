"
Starts counting 0, 1, 2, 3..., and raise the current integer value at each upfront of the trigger.

Parameter:
trig: the trigger signal, each upfront will move the counter to the next integer
"
Class {
	#name : 'Counter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
Counter >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := trig connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Counter >> initialize [

	super initialize.
	processExpression := 'process = ba.counter;'
]

{ #category : 'accessing' }
Counter >> trig [

	^ trig ifNil: [ trig := PhButton new label: self label , 'Gate' ]
]
