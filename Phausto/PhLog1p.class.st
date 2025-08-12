Class {
	#name : 'PhLog1p',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLog1p >> initialize [

	super initialize.
	processExpression := 'process = ma.log1p;'
]
