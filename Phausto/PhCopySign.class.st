"
Changes the sign of x (first input) to that of y (second input).
"
Class {
	#name : 'PhCopySign',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhCopySign >> initialize [

	super initialize.
	self processExpression: 'process = ma.copysign;'
]
