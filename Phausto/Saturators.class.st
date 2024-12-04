"
Saturators, are effect that distort the input signal
"
Class {
	#name : 'Saturators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Saturators >> input [

	^ input ifNil: [ input := 1 asBox ]
]

{ #category : 'accessing' }
Saturators >> input: aPhBox [

	input := aPhBox
]

{ #category : 'connecting' }
Saturators >> patchedWith: aPhBox [

self input: aPhBox
]
