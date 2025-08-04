Class {
	#name : 'PhSubtractor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhSubtractor >> initialize [

	super initialize.
	processExpression := 'process = -;'
]
