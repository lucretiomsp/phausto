Class {
	#name : 'PhMultiplicator',
	#superclass : 'PhBinaryOperation',
	#traits : 'PhInputSetter',
	#classTraits : 'PhInputSetter classTrait',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhMultiplicator >> initialize [

	super initialize.
	processExpression := 'process = *;'
]
