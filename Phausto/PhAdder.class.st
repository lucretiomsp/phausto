Class {
	#name : 'PhAdder',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhAdder >> initialize [ 

super initialize.
processExpression := 'process = +;'
]
