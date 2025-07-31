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
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
Counter >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self trig asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Counter >> initialize [

	super initialize.
	processExpression := 'process = ba.counter;'.
	trig := PhButton new label: self label , 'Gate' .
]

{ #category : 'as yet unclassified' }
Counter >> trig [

	^ trig 
]
