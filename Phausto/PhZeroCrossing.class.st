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
