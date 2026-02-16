"
Computes the linearly independent Bessel function of the second kind of order 0 of the input signal.
"
Class {
	#name : 'PhY0',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhY0 >> initialize [

   Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.Y0;'
]
