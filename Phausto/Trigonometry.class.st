"
Collection of trigonomertric UnitGenerators at audio rate
"
Class {
	#name : 'Trigonometry',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'converting' }
Trigonometry >> asBox [

	| intermediateBox finalBox |
	self code traceCr.
	intermediateBox := super asBox.
	intermediateBox getHandle asInteger traceCr.
	intermediateBox traceCr.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Trigonometry >> initialize [

| faustFunctionName |
faustFunctionName := (self class name findBetweenSubstrings: ' ' ) first asLowercase .
	super initialize.
	processExpression :='process = aa.' , faustFunctionName , ';'.
	
	
]

{ #category : 'accessing' }
Trigonometry >> input [

	^ input ifNil: [ input := 1 asBox ]
]

{ #category : 'connecting' }
Trigonometry >> input: aPhBox [

input := aPhBox 


]

{ #category : 'connecting' }
Trigonometry >> patchedWith: aPhBox [

self input: aPhBox
]
