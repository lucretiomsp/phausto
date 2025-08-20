Class {
	#name : 'PhLogB',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLogB >> initialize [

	Error new signal:
		'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.logb;'
]
