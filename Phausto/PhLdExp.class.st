Class {
	#name : 'PhLdExp',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhLdExp >> initialize [

	super initialize.
	processExpression := 'process = ma.ldexp;'
]
