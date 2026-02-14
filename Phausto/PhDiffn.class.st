"
Negated first-order difference.
"
Class {
	#name : 'PhDiffn',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhDiffn >> initialize [ 

super initialize .
processExpression := 'process = ma.diffn;'
]
