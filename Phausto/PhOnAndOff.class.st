"
The first channel set the output to 1, the second channel to 0.
"
Class {
	#name : 'PhOnAndOff',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input1',
		'input2'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhOnAndOff >> asBox [ 

^ self input1 asBox  , self input2 asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhOnAndOff >> initialize [

	super initialize.
	processExpression := 'process = ba.on_and_off;'.
	input1 := 1.
	input2 := 0
]

{ #category : 'accessing' }
PhOnAndOff >> input1 [ 
^ input1
]

{ #category : 'accessing' }
PhOnAndOff >> input2 [

	^ input2
]
