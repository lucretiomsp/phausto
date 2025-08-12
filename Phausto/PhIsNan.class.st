Class {
	#name : 'PhIsNan',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhIsNan >> initialize [ 

super initialize .
processExpression := 'process = isnan;'
]
