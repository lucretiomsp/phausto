Class {
	#name : 'PhCubeRoot',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhCubeRoot >> initialize [

	super initialize.
	processExpression := 'process = ma.cbrt;'
]
