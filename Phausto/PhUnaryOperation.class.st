"
Super class for Phausto unary operations (just one input).
These operations implemented in the toolkit keep the conversion into PhBoxes before Dsp cobversion
"
Class {
	#name : 'PhUnaryOperation',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'converting' }
PhUnaryOperation >> asBox [

	^ self input asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhUnaryOperation >> initialize [

	super initialize.
	input := 1.
]

{ #category : 'accessing' }
PhUnaryOperation >> input [ 

^ input
]
