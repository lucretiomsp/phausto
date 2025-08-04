Class {
	#name : 'PhAdder',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'as yet unclassified' }
PhAdder >> initialize [ 

super initialize.
processExpression := 'process = +;'
]
