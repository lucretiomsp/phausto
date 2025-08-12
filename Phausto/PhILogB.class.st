Class {
	#name : 'PhILogB',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhILogB >> initialize [

	super initialize.
	processExpression := 'process = ma.ilogb;'
]
