Class {
	#name : 'PhY1',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhY1 >> initialize [

	super initialize.
	processExpression := 'process = ma.Y1'
]
