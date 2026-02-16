"
Invert the sign (-x) of a signal.
"
Class {
	#name : 'PhNeg',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhNeg >> initialize [

	super initialize.
	processExpression := 'process = ma.neg;'
]

{ #category : 'accessing' }
PhNeg >> input [ 
^ input
]
