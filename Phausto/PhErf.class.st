Class {
	#name : 'PhErf',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhErf >> initialize [

	super initialize.
	processExpression := 'process = ma.erf'
]
