"
Sine Wave-Table-Based oscillator based on the _cos_ mathematical function.
"
Class {
	#name : 'OscCosM',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
OscCosM >> initialize [

	super initialize.
	processExpression := 'process =os.m_osccos;'
]
