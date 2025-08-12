Class {
	#name : 'PhExpM1',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhExpM1 >> initialize [

	super initialize.
	processExpression := 'process = ma.expm1'
]
