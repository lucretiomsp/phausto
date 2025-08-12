Class {
	#name : 'PhHypothenuse',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhHypothenuse >> initialize [

	super initialize.
	processExpression := 'process = ma.hypot;'
]
