"
Wave-Table-Based Sine wave oscillator.
"
Class {
	#name : 'OscCos',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
OscCos >> initialize [

	super initialize.
	processExpression := 'process =os.osccos;'
]
