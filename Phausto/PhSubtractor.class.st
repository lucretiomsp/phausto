Class {
	#name : 'PhSubtractor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhSubtractor >> initialize [

	super initialize.
	processExpression := 'process = ^;'
]
