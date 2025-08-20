Class {
	#name : 'PhSub',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'as yet unclassified' }
PhSub >> initialize [

	Error new signal:
		'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.sub;'
]
