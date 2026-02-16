"
Indicator function for zero-crossing: it returns 1 if a zero-crossing occurs, 0 otherwis
"
Class {
	#name : 'PhZeroCrossing',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhZeroCrossing >> initialize [ 

super initialize .
processExpression := 'process = ma.zc;'
]
