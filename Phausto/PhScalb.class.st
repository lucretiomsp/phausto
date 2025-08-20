Class {
	#name : 'PhScalb',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhScalb >> initialize [
Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.scalb;'
]
