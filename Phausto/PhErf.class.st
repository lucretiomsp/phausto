Class {
	#name : 'PhErf',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhErf >> initialize [
Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.erf;'
]
