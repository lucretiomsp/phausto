Class {
	#name : 'PhSub',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhSub >> initialize [

	super initialize.
	processExpression := 'process = ma.sub;'
]
