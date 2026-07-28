"
I modulo my first input (a UnitGenerator) by a second input (also another UnitGenerator)
"
Class {
	#name : 'PhModulor',
	#superclass : 'PhBinaryOperation',
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'initialization' }
PhModulor >> initialize [

	super initialize.
	processExpression := 'process = %;'
]
