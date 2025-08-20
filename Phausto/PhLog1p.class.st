Class {
	#name : 'PhLog1p',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLog1p >> initialize [

	Error new signal:
		'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	processExpression := 'process = ma.log1p;'
]
