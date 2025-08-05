Class {
	#name : 'PhModulor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhModulor >> initialize [

	super initialize.
	processExpression := 'process = %;'
]
