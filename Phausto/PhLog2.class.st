Class {
	#name : 'PhLog2',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhLog2 >> initialize [

	super initialize.
	processExpression := 'process = ma.log2;'
]
