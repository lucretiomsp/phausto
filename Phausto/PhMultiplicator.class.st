Class {
	#name : 'PhMultiplicator',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhMultiplicator >> initialize [

	super initialize.
	processExpression := 'process = *;'
]
