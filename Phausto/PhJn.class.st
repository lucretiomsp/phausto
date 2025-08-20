Class {
	#name : 'PhJn',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhJn >> initialize [
Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.Jn;'
]
