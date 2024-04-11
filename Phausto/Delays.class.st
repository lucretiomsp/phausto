"
A collection of delays from Faust delays.lib
"
Class {
	#name : #Delays,
	#superclass : #UnitGenerators,
	#instVars : [
		'maxDelayLength',
		'delayLength',
		'input'
	],
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #accessing }
Delays >> delayLength [

	^ delayLength
]

{ #category : #accessing }
Delays >> delayLength: anObject [

	delayLength := anObject
]

{ #category : #initialization }
Delays >> initialize [

	super initialize.
	maxDelayLength := 44100. "by default, maximum delay length is 1 second at 44100 Hz sample rate"
	delayLength := 4410.
	input := Wire new.
]

{ #category : #accessing }
Delays >> input [

	^ input
]

{ #category : #accessing }
Delays >> input: anObject [

	input := anObject
]

{ #category : #accessing }
Delays >> maxDelayLength [

	^ maxDelayLength
]

{ #category : #accessing }
Delays >> maxDelayLength: anObject [

	maxDelayLength := anObject
]
