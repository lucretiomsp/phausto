Class {
	#name : 'PhModulor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhModulor >> initialize [

	super initialize.
	processExpression := 'process = %;'
]
