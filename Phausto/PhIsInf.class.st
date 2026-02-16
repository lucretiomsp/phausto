"
Return non-zero if x is a positive or negative infinity.
"
Class {
	#name : 'PhIsInf',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhIsInf >> initialize [ 

super initialize .
processExpression := 'process = ma.isinf;'
]
