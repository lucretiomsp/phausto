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
	#name : #Incrementer,
	#superclass : #PhBox,
	#instVars : [
		'incrValue'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
Incrementer >> asBox [

	| sum |
	sum := Wire new asBox + self incrValue asBox.

	^ Wire new asBox ~ sum
]

{ #category : #accessing }
Incrementer >> incrValue [

	^ incrValue
]

{ #category : #accessing }
Incrementer >> incrValue: anObject [

	incrValue := anObject
]

{ #category : #initialization }
Incrementer >> initialize [ 

incrValue := 1.
]
