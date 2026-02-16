"
Takes two input signals: x and n, and multiplies x by 2 to the power n.
"
Class {
	#name : 'PhLdExp',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhLdExp >> initialize [

	Error new signal:
		'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.ldexp;'
]
