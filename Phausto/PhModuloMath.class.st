"
Modulus operation using the (x%y+y)%y formula to ensures the result is always non-negative, even if x is negative.

##Paarameters
**inputL: the numerator (x);
**inputR:** the denominator (y);
"
Class {
	#name : 'PhModuloMath',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhModuloMath >> initalize [ 


super initialize .
processExpression := 'process =ma.modulo;'.
]
