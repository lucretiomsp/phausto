Class {
	#name : 'PhSignum',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhSignum >> initialize [ 

super initialize .
processExpression := 'process = ma.signum;'
]
