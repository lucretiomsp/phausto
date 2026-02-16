"
Computes the linearly independent Bessel function of the second kind of order n of the input signal.
"
Class {
	#name : 'PhYn',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhYn >> initialize [

	super initialize.
	processExpression := 'process = ma.Yn;'
]
