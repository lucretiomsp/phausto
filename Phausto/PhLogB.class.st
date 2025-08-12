Class {
	#name : 'PhLogB',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLogB >> initialize [

	super initialize.
	processExpression := 'process = ma.logb;'
]
