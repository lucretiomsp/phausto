"
Convenience class to convert seconds to samples at sample rate and use the values as a Box
"
Class {
	#name : 'Sec2Samples',
	#superclass : 'UnitGenerator',
	#instVars : [
		'value'
	],
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
Sec2Samples >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := value connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
Sec2Samples >> initialize [

	super initialize.
	self processExpression: 'process =  ba.sec2samp;' .
	self value: 1
]

{ #category : 'accessing' }
Sec2Samples >> value [

	^ value
]

{ #category : 'accessing' }
Sec2Samples >> value: anObject [

	value := anObject asBox
]
