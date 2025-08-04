"
Super class for Phausto binary operations.
These operations implemented in the toolkit keep the conversion into PhBoxes before Dsp cobversion
"
Class {
	#name : 'PhBinaryOperation',
	#superclass : 'UnitGenerator',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhBinaryOperation >> asBox [ 

^ self inputL asBox , self inputR asBox connectTo: super asBox
]

{ #category : 'as yet unclassified' }
PhBinaryOperation >> initialize [

	super initialize.
	inputL := 1.
	inputR := 1
]

{ #category : 'as yet unclassified' }
PhBinaryOperation >> inputL [

^ inputL
]

{ #category : 'as yet unclassified' }
PhBinaryOperation >> inputR [

^ inputR
]
