"
Computes the euclidian distance of the two input signals sqrt(xx+yy) without undue overflow or underflow.
"
Class {
	#name : 'PhHypothenuse',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhHypothenuse >> initialize [

	super initialize.
	processExpression := 'process = ma.hypot;'
]
