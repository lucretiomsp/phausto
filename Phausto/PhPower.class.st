"
Exponentiation where inputL is base and input R is exponent
"
Class {
	#name : 'PhPower',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhPower >> initialize [ 

super initialize .
processExpression := 'process = pow;'
]
