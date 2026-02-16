"
Calculates the natural logorithm of the absolute value of the gamma function of the input signal.


"
Class {
	#name : 'PhLGamma',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLGamma >> initialize [
Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.lgamma;'
]
