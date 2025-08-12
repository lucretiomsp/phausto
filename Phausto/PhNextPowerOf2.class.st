"
Gives the next power of 2 of its input.

## Parameter
**input:** anInteger 
"
Class {
	#name : 'PhNextPowerOf2',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhNextPowerOf2 >> initialize [

	super initialize.
	processExpression := 'process = ma.np2'
]
