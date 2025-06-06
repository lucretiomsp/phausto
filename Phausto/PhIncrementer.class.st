"
Increment by incrValue at every step.
incrValue is 1 by default.
Useful to be used as a reader for a SoundFile.
equivalent too Faust expression:

incrementer = _~+(1);

or 
incrementer = (_~(_+1))
"
Class {
	#name : 'PhIncrementer',
	#superclass : 'PhBox',
	#instVars : [
		'incrValue'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhIncrementer >> asBox [

	| sum |
	sum := Wire new asBox + self incrValue asBox.

	^ Wire new asBox ~ sum
]

{ #category : 'accessing' }
PhIncrementer >> incrValue [

	^ incrValue
]

{ #category : 'accessing' }
PhIncrementer >> incrValue: anObject [

	incrValue := anObject
]

{ #category : 'initialization' }
PhIncrementer >> initialize [ 

incrValue := 1.
]
