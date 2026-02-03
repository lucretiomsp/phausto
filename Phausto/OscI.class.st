"
Interpolated phase sine Wave-Table-Based oscillator.

##Parameters

**freq:** the frequency in Hz
"
Class {
	#name : 'OscI',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
OscI >> initialize [

	super initialize.
	processExpression := 'process = os.osci;'
]
