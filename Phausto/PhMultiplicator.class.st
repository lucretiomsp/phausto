Class {
	#name : 'PhMultiplicator',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhMultiplicator >> initialize [

	super initialize.
	processExpression := 'process = *;'
]
