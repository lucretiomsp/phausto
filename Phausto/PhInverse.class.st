"
Compute the inverse (1/x) of the input signal.
"
Class {
	#name : 'PhInverse',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhInverse >> initialize [

	super initialize.
	processExpression := 'process = ma.inv;'
]
