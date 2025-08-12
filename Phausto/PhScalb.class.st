Class {
	#name : 'PhScalb',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhScalb >> initialize [

	super initialize.
	processExpression := 'process = ma.scalb'
]
