Class {
	#name : 'PhDivider',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhDivider >> initialize [

	super initialize.
	processExpression := 'process = /;'
]
