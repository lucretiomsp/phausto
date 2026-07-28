"
I divide my second input (a UnitGenerator) to the first input (also another UnitGenerator)
"
Class {
	#name : 'PhSubtractor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhSubtractor >> initialize [

	super initialize.
	processExpression := 'process = ^;'
]
