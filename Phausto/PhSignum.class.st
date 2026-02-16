"
The signum function signum(x) is defined as -1 for x<0, 0 for x==0, and 1 for x>0.
"
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
