"
Sine Wave-Table-Based oscillator based on the _sin_ mathematical function.
"
Class {
	#name : 'OscSinM',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
OscSinM >> initialize [

	super initialize.
	processExpression := 'process =os.m_oscsin;'
]
