"
Saturators, are effect that distort the input signal
"
Class {
	#name : 'Saturators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-BoxAPI-Effects',
	#package : 'Phausto',
	#tag : 'BoxAPI-Effects'
}

{ #category : 'accessing' }
Saturators >> input [

	^ input ifNil: [ input := 0 ]
]

{ #category : 'accessing' }
Saturators >> input: aPhBox [

	input := aPhBox
]

{ #category : 'connecting' }
Saturators >> patchedWith: aPhBox [

self input: aPhBox
]
