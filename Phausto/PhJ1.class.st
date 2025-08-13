Class {
	#name : 'PhJ1',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhJ1 >> initialize [

	super initialize.
	processExpression := 'process = ma.J1;'
]
