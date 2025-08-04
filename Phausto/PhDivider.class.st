Class {
	#name : 'PhDivider',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhDivider >> initialize [

	super initialize.
	processExpression := 'process = /;'
]
