Class {
	#name : 'PhErfC',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhErfC >> initialize [

	super initialize.
	processExpression := 'process = ma.erfc;'
]
