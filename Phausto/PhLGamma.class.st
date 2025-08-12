Class {
	#name : 'PhLGamma',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLGamma >> initialize [

	super initialize.
	processExpression := 'process = ma.lgamma;'
]
